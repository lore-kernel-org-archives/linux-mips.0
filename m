Received: from mailapp01.imgtec.com ([195.59.15.196]:23370 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993898AbdHMEk3ivWed (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:40:29 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 10/38] irqchip: mips-gic: Drop gic_(re)set_mask() functions
Date: Sat, 12 Aug 2017 21:36:18 -0700
Message-ID: <20170813043646.25821-11-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043618.DZR_QqyRLZyaFvoRwV3tkSbHD-odjY86HR6iRaD_Jo4@z>

The gic_set_mask() & gic_reset_mask() functions are now no more
convenient to call than the write_gic_smask() or write_gic_rmask()
accessor functions. Remove the layer of abstraction.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c   | 18 +++---------------
 include/linux/irqchip/mips-gic.h |  4 ----
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 8ed4a997554d..f3fd32c8aa1e 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -92,18 +92,6 @@ static inline void gic_update_bits(unsigned int reg, unsigned long mask,
 	gic_write(reg, regval);
 }
 
-static inline void gic_reset_mask(unsigned int intr)
-{
-	gic_write(GIC_REG(SHARED, GIC_SH_RMASK) + GIC_INTR_OFS(intr),
-		  1ul << GIC_INTR_BIT(intr));
-}
-
-static inline void gic_set_mask(unsigned int intr)
-{
-	gic_write(GIC_REG(SHARED, GIC_SH_SMASK) + GIC_INTR_OFS(intr),
-		  1ul << GIC_INTR_BIT(intr));
-}
-
 static inline void gic_set_polarity(unsigned int intr, unsigned int pol)
 {
 	gic_update_bits(GIC_REG(SHARED, GIC_SH_SET_POLARITY) +
@@ -260,12 +248,12 @@ static void gic_handle_shared_int(bool chained)
 
 static void gic_mask_irq(struct irq_data *d)
 {
-	gic_reset_mask(GIC_HWIRQ_TO_SHARED(d->hwirq));
+	write_gic_rmask(BIT(GIC_HWIRQ_TO_SHARED(d->hwirq)));
 }
 
 static void gic_unmask_irq(struct irq_data *d)
 {
-	gic_set_mask(GIC_HWIRQ_TO_SHARED(d->hwirq));
+	write_gic_smask(BIT(GIC_HWIRQ_TO_SHARED(d->hwirq)));
 }
 
 static void gic_ack_irq(struct irq_data *d)
@@ -478,7 +466,7 @@ static void __init gic_basic_init(void)
 	for (i = 0; i < gic_shared_intrs; i++) {
 		gic_set_polarity(i, GIC_POL_POS);
 		gic_set_trigger(i, GIC_TRIG_LEVEL);
-		gic_reset_mask(i);
+		write_gic_rmask(BIT(i));
 	}
 
 	for (i = 0; i < gic_vpes; i++) {
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index 1342b17b6812..8160cc8b677d 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -64,10 +64,6 @@
 /* Set/Clear corresponding bit in Edge Detect Register */
 #define GIC_SH_WEDGE_OFS		0x0280
 
-/* Mask manipulation */
-#define GIC_SH_RMASK_OFS		0x0300
-#define GIC_SH_SMASK_OFS		0x0380
-
 /* Maps Interrupt X to a Pin */
 #define GIC_SH_INTR_MAP_TO_PIN_BASE_OFS 0x0500
 #define GIC_SH_MAP_TO_PIN(intr)		(4 * (intr))
-- 
2.14.0
