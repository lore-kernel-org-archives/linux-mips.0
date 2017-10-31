Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:36500 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992325AbdJaQnQvh1iA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 17:43:16 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2 3/8] irqchip: mips-gic: Mask local interrupts when CPUs come online
Date: Tue, 31 Oct 2017 09:41:46 -0700
Message-ID: <20171031164151.6357-4-paul.burton@mips.com>
In-Reply-To: <20171031164151.6357-1-paul.burton@mips.com>
References: <867evc5cc9.fsf@arm.com>
 <20171031164151.6357-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20171031164146.RG94bva1E5r3iL_lmliSteh7EHURQuukUX_l6MlsKxo@z>

We currently walk through the range 0..gic_vpes-1, expecting these
values all to be valid Linux CPU numbers to provide to mips_cm_vp_id(),
and masking all routable local interrupts during boot. This approach has
a few drawbacks:

 - In multi-cluster systems we won't have access to all CPU's GIC local
   registers when the driver is probed, since clusters (and their GICs)
   may be powered down at this point & only brought online later.

 - In multi-cluster systems we may power down clusters at runtime, for
   example if we offline all CPUs within it via hotplug, and the
   cluster's GIC may lose state. We therefore need to reinitialise it
   when powering back up, which this approach does not take into
   account.

 - The range 0..gic_vpes-1 may not all be valid Linux CPU numbers, for
   example if we run a kernel configured to support fewer CPUs than the
   system it is running on actually has. In this case we'll get garbage
   values from mips_cm_vp_id() as we read past the end of the cpu_data
   array.

Fix this and simplify the code somewhat by writing an all-bits-set
value to the VP-local reset mask register when a CPU is brought online,
before any local interrupts are configured for it. This removes the need
for us to access all CPUs during driver probe, removing all of the
problems described above.

In the name of simplicity we drop the checks for routability of
interrupts and simply clear the mask bits for all interrupts. Bits for
non-routable local interrupts will have no effect so there's no point
performing extra work to avoid modifying them.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

Changes in v2: None

 drivers/irqchip/irq-mips-gic.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 60f644279803..bd732b256f67 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -655,6 +655,9 @@ static const struct irq_domain_ops gic_ipi_domain_ops = {
 
 static int gic_cpu_startup(unsigned int cpu)
 {
+	/* Clear all local IRQ masks (ie. disable all local interrupts) */
+	write_gic_vl_rmask(~0);
+
 	/* Invoke irq_cpu_online callbacks to enable desired interrupts */
 	irq_cpu_online();
 
@@ -664,7 +667,7 @@ static int gic_cpu_startup(unsigned int cpu)
 static int __init gic_of_init(struct device_node *node,
 			      struct device_node *parent)
 {
-	unsigned int cpu_vec, i, j, gicconfig, cpu, v[2];
+	unsigned int cpu_vec, i, gicconfig, cpu, v[2];
 	unsigned long reserved;
 	phys_addr_t gic_base;
 	struct resource res;
@@ -797,15 +800,6 @@ static int __init gic_of_init(struct device_node *node,
 		write_gic_rmask(i);
 	}
 
-	for (i = 0; i < gic_vpes; i++) {
-		write_gic_vl_other(mips_cm_vp_id(i));
-		for (j = 0; j < GIC_NUM_LOCAL_INTRS; j++) {
-			if (!gic_local_irq_is_routable(j))
-				continue;
-			write_gic_vo_rmask(BIT(j));
-		}
-	}
-
 	return cpuhp_setup_state(CPUHP_AP_IRQ_MIPS_GIC_STARTING,
 				 "irqchip/mips/gic:starting",
 				 gic_cpu_startup, NULL);
-- 
2.14.3
