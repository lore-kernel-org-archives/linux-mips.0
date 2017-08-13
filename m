Received: from mailapp01.imgtec.com ([195.59.15.196]:13120 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993907AbdHMElJMz9Xd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:41:09 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 12/38] irqchip: mips-gic: Remove gic_set_trigger()
Date: Sat, 12 Aug 2017 21:36:20 -0700
Message-ID: <20170813043646.25821-13-paul.burton@imgtec.com>
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
Message-ID: <20170813043620.ad3GAiwmxbSyDEp4HcC-MW7PljA6KUXxneK22L5h72Y@z>

Remove the gic_set_trigger() function in favour of using the new
change_gic_trig() accessor function which provides equivalent
functionality.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c   | 19 ++++++-------------
 include/linux/irqchip/mips-gic.h |  5 -----
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 3d9f264dcda0..960d393ca8d1 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -92,13 +92,6 @@ static inline void gic_update_bits(unsigned int reg, unsigned long mask,
 	gic_write(reg, regval);
 }
 
-static inline void gic_set_trigger(unsigned int intr, unsigned int trig)
-{
-	gic_update_bits(GIC_REG(SHARED, GIC_SH_SET_TRIGGER) +
-			GIC_INTR_OFS(intr), 1ul << GIC_INTR_BIT(intr),
-			(unsigned long)trig << GIC_INTR_BIT(intr));
-}
-
 static inline void gic_set_dual_edge(unsigned int intr, unsigned int dual)
 {
 	gic_update_bits(GIC_REG(SHARED, GIC_SH_SET_DUAL) + GIC_INTR_OFS(intr),
@@ -266,32 +259,32 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
 		change_gic_pol(irq, GIC_POL_FALLING_EDGE);
-		gic_set_trigger(irq, GIC_TRIG_EDGE);
+		change_gic_trig(irq, GIC_TRIG_EDGE);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = true;
 		break;
 	case IRQ_TYPE_EDGE_RISING:
 		change_gic_pol(irq, GIC_POL_RISING_EDGE);
-		gic_set_trigger(irq, GIC_TRIG_EDGE);
+		change_gic_trig(irq, GIC_TRIG_EDGE);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = true;
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
 		/* polarity is irrelevant in this case */
-		gic_set_trigger(irq, GIC_TRIG_EDGE);
+		change_gic_trig(irq, GIC_TRIG_EDGE);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_ENABLE);
 		is_edge = true;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		change_gic_pol(irq, GIC_POL_ACTIVE_LOW);
-		gic_set_trigger(irq, GIC_TRIG_LEVEL);
+		change_gic_trig(irq, GIC_TRIG_LEVEL);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = false;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 	default:
 		change_gic_pol(irq, GIC_POL_ACTIVE_HIGH);
-		gic_set_trigger(irq, GIC_TRIG_LEVEL);
+		change_gic_trig(irq, GIC_TRIG_LEVEL);
 		gic_set_dual_edge(irq, GIC_TRIG_DUAL_DISABLE);
 		is_edge = false;
 		break;
@@ -458,7 +451,7 @@ static void __init gic_basic_init(void)
 	/* Setup defaults */
 	for (i = 0; i < gic_shared_intrs; i++) {
 		change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
-		gic_set_trigger(i, GIC_TRIG_LEVEL);
+		change_gic_trig(i, GIC_TRIG_LEVEL);
 		write_gic_rmask(BIT(i));
 	}
 
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index 960e49a64e7a..2e9f0c43d425 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -14,8 +14,6 @@
 #define GIC_MAX_INTRS			256
 
 /* Constants */
-#define GIC_TRIG_EDGE			1
-#define GIC_TRIG_LEVEL			0
 #define GIC_TRIG_DUAL_ENABLE		1
 #define GIC_TRIG_DUAL_DISABLE		0
 
@@ -50,9 +48,6 @@
 })
 #define GIC_INTR_BIT(intr)		((intr) % (mips_cm_is64 ? 64 : 32))
 
-/* Triggering : Reset Value is always 0 */
-#define GIC_SH_SET_TRIGGER_OFS		0x0180
-
 /* Dual edge triggering : Reset Value is always 0 */
 #define GIC_SH_SET_DUAL_OFS		0x0200
 
-- 
2.14.0
