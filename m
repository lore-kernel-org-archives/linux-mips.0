Received: from mailapp01.imgtec.com ([195.59.15.196]:8020 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010205AbbJMKRCsIQ7s (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:17:02 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 10/14] MIPS: make smp CMP, CPS and MT use the new generic IPI functions
Date: Tue, 13 Oct 2015 11:16:18 +0100
Message-ID: <1444731382-19313-11-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151013101618.gFslA5EyR9IG2YnAos9KrsfbwQhFD3ncbAkE6kYtq54@z>

Only the SMP variants that use GIC were converted as it's the only irqchip that
will have the support for generic IPI for now which will be introduced in
the following patches.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/include/asm/smp-ops.h | 5 +++--
 arch/mips/kernel/smp-cmp.c      | 4 ++--
 arch/mips/kernel/smp-cps.c      | 4 ++--
 arch/mips/kernel/smp-mt.c       | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/smp-ops.h b/arch/mips/include/asm/smp-ops.h
index 6ba1fb8b11e2..5e83aec0a14c 100644
--- a/arch/mips/include/asm/smp-ops.h
+++ b/arch/mips/include/asm/smp-ops.h
@@ -44,8 +44,9 @@ static inline void plat_smp_setup(void)
 	mp_ops->smp_setup();
 }
 
-extern void gic_send_ipi_single(int cpu, unsigned int action);
-extern void gic_send_ipi_mask(const struct cpumask *mask, unsigned int action);
+extern void generic_smp_send_ipi_single(int cpu, unsigned int action);
+extern void generic_smp_send_ipi_mask(const struct cpumask *mask,
+				      unsigned int action);
 
 #else /* !CONFIG_SMP */
 
diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
index d5e0f949dc48..a70080500e04 100644
--- a/arch/mips/kernel/smp-cmp.c
+++ b/arch/mips/kernel/smp-cmp.c
@@ -149,8 +149,8 @@ void __init cmp_prepare_cpus(unsigned int max_cpus)
 }
 
 struct plat_smp_ops cmp_smp_ops = {
-	.send_ipi_single	= gic_send_ipi_single,
-	.send_ipi_mask		= gic_send_ipi_mask,
+	.send_ipi_single	= generic_smp_send_ipi_single,
+	.send_ipi_mask		= generic_smp_send_ipi_mask,
 	.init_secondary		= cmp_init_secondary,
 	.smp_finish		= cmp_smp_finish,
 	.boot_secondary		= cmp_boot_secondary,
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index c88937745b4e..dd6834564ecb 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -444,8 +444,8 @@ static struct plat_smp_ops cps_smp_ops = {
 	.boot_secondary		= cps_boot_secondary,
 	.init_secondary		= cps_init_secondary,
 	.smp_finish		= cps_smp_finish,
-	.send_ipi_single	= gic_send_ipi_single,
-	.send_ipi_mask		= gic_send_ipi_mask,
+	.send_ipi_single	= generic_smp_send_ipi_single,
+	.send_ipi_mask		= generic_smp_send_ipi_mask,
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_disable		= cps_cpu_disable,
 	.cpu_die		= cps_cpu_die,
diff --git a/arch/mips/kernel/smp-mt.c b/arch/mips/kernel/smp-mt.c
index 86311a164ef1..33793abe5a20 100644
--- a/arch/mips/kernel/smp-mt.c
+++ b/arch/mips/kernel/smp-mt.c
@@ -121,7 +121,7 @@ static void vsmp_send_ipi_single(int cpu, unsigned int action)
 
 #ifdef CONFIG_MIPS_GIC
 	if (gic_present) {
-		gic_send_ipi_single(cpu, action);
+		generic_smp_send_ipi_single(cpu, action);
 		return;
 	}
 #endif
-- 
2.1.0
