Received: from mailapp01.imgtec.com ([195.59.15.196]:21797 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993866AbdHMEktM7tcd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:40:49 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 11/38] irqchip: mips-gic: Remove gic_set_polarity()
Date: Sat, 12 Aug 2017 21:36:19 -0700
Message-ID: <20170813043646.25821-12-paul.burton@imgtec.com>
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
Message-ID: <20170813043619.TQDK6fXvyI0wlwJMeMHSQFpxYSMGKjB9CLECLhbLMsE@z>

Remove the gic_set_polarity() function in favour of using the new
change_gic_pol() accessor function which provides equivalent
functionality.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c   | 17 +++++------------
 include/linux/irqchip/mips-gic.h |  5 -----
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f3fd32c8aa1e..3d9f264dcda0 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -92,13 +92,6 @@ static inline void gic_update_bits(unsigned int reg, unsigned long mask,
 	gic_write(reg, regval);
 }
 
-static inline void gic_set_polarity(unsigned int intr, unsigned int pol)
-{
-	gic_update_bits(GIC_REG(SHARED, GIC_SH_SET_POLARITY) +
-			GIC_INTR_OFS(intr), 1ul << GIC_INTR_BIT(intr),
-			(unsigned long)pol << GIC_INTR_BIT(intr));
-}
-
 static inline void gic_set_trigger(unsigned int intr, unsigned int trig)
 {
 	gic_update_bits(GIC_REG(SHARED, GIC_SH_SET_TRIGGER) +
@@ -272,13 +265,13 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
 	spin_lock_irqsave(&gic_lock, flags);
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
-		gic_set_polarity(irq, GIC_POL_NEG);
+		change_gic_pol(irq, GIC_POL_FALLING_EDGE);
 		gic_set_trigger(irq, GIC_TRIG_EDGE);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = true;
 		break;
 	case IRQ_TYPE_EDGE_RISING:
-		gic_set_polarity(irq, GIC_POL_POS);
+		change_gic_pol(irq, GIC_POL_RISING_EDGE);
 		gic_set_trigger(irq, GIC_TRIG_EDGE);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = true;
@@ -290,14 +283,14 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
 		is_edge = true;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		gic_set_polarity(irq, GIC_POL_NEG);
+		change_gic_pol(irq, GIC_POL_ACTIVE_LOW);
 		gic_set_trigger(irq, GIC_TRIG_LEVEL);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = false;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 	default:
-		gic_set_polarity(irq, GIC_POL_POS);
+		change_gic_pol(irq, GIC_POL_ACTIVE_HIGH);
 		gic_set_trigger(irq, GIC_TRIG_LEVEL);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = false;
@@ -464,7 +457,7 @@ static void __init gic_basic_init(void)
 
 	/* Setup defaults */
 	for (i = 0; i < gic_shared_intrs; i++) {
-		gic_set_polarity(i, GIC_POL_POS);
+		change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
 		gic_set_trigger(i, GIC_TRIG_LEVEL);
 		write_gic_rmask(BIT(i));
 	}
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index 8160cc8b677d..960e49a64e7a 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -14,8 +14,6 @@
 #define GIC_MAX_INTRS			256
 
 /* Constants */
-#define GIC_POL_POS			1
-#define GIC_POL_NEG			0
 #define GIC_TRIG_EDGE			1
 #define GIC_TRIG_LEVEL			0
 #define GIC_TRIG_DUAL_ENABLE		1
@@ -52,9 +50,6 @@
 })
 #define GIC_INTR_BIT(intr)		((intr) % (mips_cm_is64 ? 64 : 32))
 
-/* Polarity : Reset Value is always 0 */
-#define GIC_SH_SET_POLARITY_OFS		0x0100
-
 /* Triggering : Reset Value is always 0 */
 #define GIC_SH_SET_TRIGGER_OFS		0x0180
 
-- 
2.14.0
