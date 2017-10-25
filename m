Received: from 5pmail.ess.barracuda.com ([64.235.154.203]:51723 "EHLO
        5pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991978AbdJYXi367KsS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Oct 2017 01:38:29 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 4/8] irqchip: mips-gic: Configure EIC when CPUs come online
Date: Wed, 25 Oct 2017 16:37:26 -0700
Message-ID: <20171025233730.22225-5-paul.burton@mips.com>
In-Reply-To: <20171025233730.22225-1-paul.burton@mips.com>
References: <20171025233730.22225-1-paul.burton@mips.com>
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
Message-ID: <20171025233726.QRSLX6OFuk03_D98zf2tbXItqxeyWzwzNG0pn-nn8zg@z>

Rather than configuring EIC mode for all CPUs during boot, configure it
locally on each when they come online. This will become important with
multi-cluster support, since clusters may be powered on & off (for
example via hotplug) and would lose the EIC configuration when powered
off.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 2a31949d09ce..95daa96d8b52 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -655,6 +655,10 @@ static const struct irq_domain_ops gic_ipi_domain_ops = {
 
 static int gic_cpu_startup(unsigned int cpu)
 {
+	/* Enable or disable EIC */
+	change_gic_vl_ctl(GIC_VX_CTL_EIC,
+			  cpu_has_veic ? GIC_VX_CTL_EIC : 0);
+
 	/* Clear all local IRQ masks (ie. disable all local interrupts) */
 	write_gic_vl_rmask(~0);
 
@@ -667,7 +671,7 @@ static int gic_cpu_startup(unsigned int cpu)
 static int __init gic_of_init(struct device_node *node,
 			      struct device_node *parent)
 {
-	unsigned int cpu_vec, i, gicconfig, cpu, v[2];
+	unsigned int cpu_vec, i, gicconfig, v[2];
 	unsigned long reserved;
 	phys_addr_t gic_base;
 	struct resource res;
@@ -722,12 +726,6 @@ static int __init gic_of_init(struct device_node *node,
 	gic_vpes = gic_vpes + 1;
 
 	if (cpu_has_veic) {
-		/* Set EIC mode for all VPEs */
-		for_each_present_cpu(cpu) {
-			write_gic_vl_other(mips_cm_vp_id(cpu));
-			write_gic_vo_ctl(GIC_VX_CTL_EIC);
-		}
-
 		/* Always use vector 1 in EIC mode */
 		gic_cpu_pin = 0;
 		timer_cpu_pin = gic_cpu_pin;
-- 
2.14.3
