Received: from mailapp01.imgtec.com ([195.59.15.196]:24651 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010433AbbGPMY3wJtHY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Jul 2015 14:24:29 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] drivers: irqchip: irq-mips-gic: Print some GIC setup information to aid debugging
Date: Thu, 16 Jul 2015 13:24:11 +0100
Message-ID: <1437049451-4096-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Message-ID: <20150716122411.urZLyZUVDigXRt-tdybfzLb1c02p-IMuOJA3fSnf4N0@z>

Print total number of GIC IRQs and those allocated for IPIs in case we
are routing IPIs via GIC. Since this is not critical information we use
pr_debug() so it won't spam the normal bootlog.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 drivers/irqchip/irq-mips-gic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 7fbbe8787660..4d83da8fe854 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -797,6 +797,21 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.xlate = gic_irq_domain_xlate,
 };
 
+static void __init gic_print_status(void)
+{
+	int i;
+
+	pr_debug("GIC IRQS:%d\n", gic_shared_intrs);
+	if (config_enabled(CONFIG_MIPS_GIC_IPI)) {
+		for (i = 0; i < nr_cpu_ids; i++) {
+			pr_debug("GIC call IPI:%d (CPU%d)\n",
+				 gic_call_int_base + i, i);
+			pr_debug("GIC resched IPI:%d (CPU%d)\n",
+				 gic_resched_int_base + i, i);
+		}
+	}
+}
+
 static void __init __gic_init(unsigned long gic_base_addr,
 			      unsigned long gic_addrspace_size,
 			      unsigned int cpu_vec, unsigned int irqbase,
@@ -859,6 +874,8 @@ static void __init __gic_init(unsigned long gic_base_addr,
 	gic_basic_init();
 
 	gic_ipi_init();
+
+	gic_print_status();
 }
 
 void __init gic_init(unsigned long gic_base_addr,
-- 
2.4.5
