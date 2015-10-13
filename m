Received: from mailapp01.imgtec.com ([195.59.15.196]:61031 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009449AbbJMKRBXsD0s (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:17:01 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 09/14] MIPS: add support for generic SMP IPI support
Date: Tue, 13 Oct 2015 11:16:17 +0100
Message-ID: <1444731382-19313-10-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151013101617.lFwamnQKO_jvnFJlxyJHd8kjhpC3Uw5UsYiNaZ3PQ24@z>

Use the new generic IPI layer to provide generic SMP IPI support if the irqchip
supports it.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/kernel/smp.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index bd4385a8e6e8..6cbadfd17439 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -39,6 +39,7 @@
 #include <asm/processor.h>
 #include <asm/idle.h>
 #include <asm/r4k-timer.h>
+#include <asm/mips-cpc.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/setup.h>
@@ -79,6 +80,11 @@ static cpumask_t cpu_core_setup_map;
 
 cpumask_t cpu_coherent_mask;
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+static struct irq_desc *call_desc;
+static struct irq_desc *sched_desc;
+#endif
+
 static inline void set_cpu_sibling_map(int cpu)
 {
 	int i;
@@ -145,6 +151,117 @@ void register_smp_ops(struct plat_smp_ops *ops)
 	mp_ops = ops;
 }
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+void generic_smp_send_ipi_single(int cpu, unsigned int action)
+{
+	generic_smp_send_ipi_mask(cpumask_of(cpu), action);
+}
+
+void generic_smp_send_ipi_mask(const struct cpumask *mask, unsigned int action)
+{
+	unsigned long flags;
+	unsigned int core;
+	int cpu;
+	struct ipi_mask ipi_mask;
+
+	ipi_mask.cpumask = ((struct cpumask *)mask)->bits;
+	ipi_mask.nbits = NR_CPUS;
+	ipi_mask.global = true;
+
+	local_irq_save(flags);
+
+	switch (action) {
+	case SMP_CALL_FUNCTION:
+		__irq_desc_send_ipi(call_desc, &ipi_mask);
+		break;
+
+	case SMP_RESCHEDULE_YOURSELF:
+		__irq_desc_send_ipi(sched_desc, &ipi_mask);
+		break;
+
+	default:
+		BUG();
+	}
+
+	if (mips_cpc_present() && (core != current_cpu_data.core)) {
+		for_each_cpu(cpu, mask) {
+			core = cpu_data[cpu].core;
+			while (!cpumask_test_cpu(cpu, &cpu_coherent_mask)) {
+				mips_cpc_lock_other(core);
+				write_cpc_co_cmd(CPC_Cx_CMD_PWRUP);
+				mips_cpc_unlock_other();
+			}
+		}
+	}
+
+	local_irq_restore(flags);
+}
+
+
+static irqreturn_t ipi_resched_interrupt(int irq, void *dev_id)
+{
+	scheduler_ipi();
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
+{
+	smp_call_function_interrupt();
+
+	return IRQ_HANDLED;
+}
+
+static struct irqaction irq_resched = {
+	.handler	= ipi_resched_interrupt,
+	.flags		= IRQF_PERCPU,
+	.name		= "IPI resched"
+};
+
+static struct irqaction irq_call = {
+	.handler	= ipi_call_interrupt,
+	.flags		= IRQF_PERCPU,
+	.name		= "IPI call"
+};
+
+static __init void smp_ipi_init_one(unsigned int virq,
+				    struct irqaction *action)
+{
+	int ret;
+
+	irq_set_handler(virq, handle_percpu_irq);
+	ret = setup_irq(virq, action);
+	BUG_ON(ret);
+}
+
+static int __init generic_smp_ipi_init(void)
+{
+	unsigned int call_virq, sched_virq;
+	struct ipi_mask ipi_mask;
+	int cpu;
+
+	ipi_mask.cpumask = ((struct cpumask *)cpu_possible_mask)->bits;
+	ipi_mask.nbits = NR_CPUS;
+
+	call_virq = irq_reserve_ipi(NULL, &ipi_mask);
+	BUG_ON(!call_virq);
+
+	sched_virq = irq_reserve_ipi(NULL, &ipi_mask);
+	BUG_ON(!sched_virq);
+
+	for_each_cpu(cpu, cpu_possible_mask) {
+		smp_ipi_init_one(call_virq + cpu, &irq_call);
+		smp_ipi_init_one(sched_virq + cpu, &irq_resched);
+	}
+
+	call_desc = irq_to_desc(call_virq);
+	sched_desc = irq_to_desc(sched_virq);
+
+	return 0;
+}
+early_initcall(generic_smp_ipi_init);
+#endif
+
 /*
  * First C code run on the secondary CPUs after being started up by
  * the master.
-- 
2.1.0
