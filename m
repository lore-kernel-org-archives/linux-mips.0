Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:50674 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992364AbdJaQniI6G6A (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 17:43:38 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2 4/8] irqchip: mips-gic: Configure EIC when CPUs come online
Date: Tue, 31 Oct 2017 09:41:47 -0700
Message-ID: <20171031164151.6357-5-paul.burton@mips.com>
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
Message-ID: <20171031164147.Po1RrMLv8VEc709LiZ_ymbH0mZphsA_-PnIb3Dw88Z0@z>

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

Changes in v2: None

 drivers/irqchip/irq-mips-gic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index bd732b256f67..b1320ccb9f94 100644
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
