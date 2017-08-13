Received: from mailapp01.imgtec.com ([195.59.15.196]:65350 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993906AbdHMEjx5wPZd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:39:53 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 08/38] irqchip: mips-gic: Simplify shared interrupt pending/mask reads
Date: Sat, 12 Aug 2017 21:36:16 -0700
Message-ID: <20170813043646.25821-9-paul.burton@imgtec.com>
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
Message-ID: <20170813043616.fp_3mEQWcGbnhQH7dsgqcmLVzGmnoRJPdrvmlJmqNtU@z>

Simplify the reads of the bitmaps indicating pending & masked interrupts
in gic_handle_shared_int() using the __ioread32_copy() &
__ioread64_copy() helper functions.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c   | 29 +++++++++++------------------
 include/linux/irqchip/mips-gic.h |  6 ------
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 1a572a6511cf..01ab6fbdb700 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -225,31 +225,24 @@ int gic_get_usm_range(struct resource *gic_usm_res)
 
 static void gic_handle_shared_int(bool chained)
 {
-	unsigned int i, intr, virq, gic_reg_step = mips_cm_is64 ? 8 : 4;
+	unsigned int intr, virq;
 	unsigned long *pcpu_mask;
-	unsigned long pending_reg, intrmask_reg;
 	DECLARE_BITMAP(pending, GIC_MAX_INTRS);
 	DECLARE_BITMAP(intrmask, GIC_MAX_INTRS);
 
 	/* Get per-cpu bitmaps */
 	pcpu_mask = pcpu_masks[smp_processor_id()].pcpu_mask;
 
-	pending_reg = GIC_REG(SHARED, GIC_SH_PEND);
-	intrmask_reg = GIC_REG(SHARED, GIC_SH_MASK);
-
-	for (i = 0; i < BITS_TO_LONGS(gic_shared_intrs); i++) {
-		pending[i] = gic_read(pending_reg);
-		intrmask[i] = gic_read(intrmask_reg);
-		pending_reg += gic_reg_step;
-		intrmask_reg += gic_reg_step;
-
-		if (!IS_ENABLED(CONFIG_64BIT) || mips_cm_is64)
-			continue;
-
-		pending[i] |= (u64)gic_read(pending_reg) << 32;
-		intrmask[i] |= (u64)gic_read(intrmask_reg) << 32;
-		pending_reg += gic_reg_step;
-		intrmask_reg += gic_reg_step;
+	if (mips_cm_is64) {
+		__ioread64_copy(pending, addr_gic_pend(),
+				DIV_ROUND_UP(gic_shared_intrs, 64));
+		__ioread64_copy(intrmask, addr_gic_mask(),
+				DIV_ROUND_UP(gic_shared_intrs, 64));
+	} else {
+		__ioread32_copy(pending, addr_gic_pend(),
+				DIV_ROUND_UP(gic_shared_intrs, 32));
+		__ioread32_copy(intrmask, addr_gic_mask(),
+				DIV_ROUND_UP(gic_shared_intrs, 32));
 	}
 
 	bitmap_and(pending, pending, intrmask, gic_shared_intrs);
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index 29453bdc06e2..835e25506660 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -68,12 +68,6 @@
 #define GIC_SH_RMASK_OFS		0x0300
 #define GIC_SH_SMASK_OFS		0x0380
 
-/* Global Interrupt Mask Register (RO) - Bit Set == Interrupt enabled */
-#define GIC_SH_MASK_OFS			0x0400
-
-/* Pending Global Interrupts (RO) */
-#define GIC_SH_PEND_OFS			0x0480
-
 /* Maps Interrupt X to a Pin */
 #define GIC_SH_INTR_MAP_TO_PIN_BASE_OFS 0x0500
 #define GIC_SH_MAP_TO_PIN(intr)		(4 * (intr))
-- 
2.14.0
