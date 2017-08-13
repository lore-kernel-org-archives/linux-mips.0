Received: from mailapp01.imgtec.com ([195.59.15.196]:36625 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993898AbdHMEjRHckpd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:39:17 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 06/38] irqchip: mips-gic: Remove gic_read_local_vp_id()
Date: Sat, 12 Aug 2017 21:36:14 -0700
Message-ID: <20170813043646.25821-7-paul.burton@imgtec.com>
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
Message-ID: <20170813043614.BRLDlLv6rTnOYqOetmudDcgUF4hVC6GiiMgrTDyvEWU@z>

Nothing needs gic_read_local_vp_id() any longer, so remove the dead
code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c   |  8 --------
 include/linux/irqchip/mips-gic.h | 17 -----------------
 2 files changed, 25 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index e49d48438626..1a572a6511cf 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -138,14 +138,6 @@ static inline void gic_map_to_vpe(unsigned int intr, unsigned int vpe)
 		  GIC_SH_MAP_TO_VPE_REG_BIT(vpe));
 }
 
-unsigned gic_read_local_vp_id(void)
-{
-	unsigned long ident;
-
-	ident = gic_read(GIC_REG(VPE_LOCAL, GIC_VP_IDENT));
-	return ident & GIC_VP_IDENT_VCNUM_MSK;
-}
-
 static bool gic_local_irq_is_routable(int intr)
 {
 	u32 vpe_ctl;
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index c9e1c993cf5b..29453bdc06e2 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -98,7 +98,6 @@
 #define GIC_VPE_SWINT0_MAP_OFS		0x0054
 #define GIC_VPE_SWINT1_MAP_OFS		0x0058
 #define GIC_VPE_OTHER_ADDR_OFS		0x0080
-#define GIC_VP_IDENT_OFS		0x0088
 #define GIC_VPE_WD_CONFIG0_OFS		0x0090
 #define GIC_VPE_WD_COUNT0_OFS		0x0094
 #define GIC_VPE_WD_INITIAL0_OFS		0x0098
@@ -197,10 +196,6 @@
 #define GIC_VPE_SMASK_FDC_SHF		6
 #define GIC_VPE_SMASK_FDC_MSK		(MSK(1) << GIC_VPE_SMASK_FDC_SHF)
 
-/* GIC_VP_IDENT fields */
-#define GIC_VP_IDENT_VCNUM_SHF		0
-#define GIC_VP_IDENT_VCNUM_MSK		(MSK(6) << GIC_VP_IDENT_VCNUM_SHF)
-
 /* GIC nomenclature for Core Interrupt Pins. */
 #define GIC_CPU_INT0		0 /* Core Interrupt 2 */
 #define GIC_CPU_INT1		1 /* .		      */
@@ -260,16 +255,4 @@ static inline int gic_get_usm_range(struct resource *gic_usm_res)
 
 #endif /* CONFIG_MIPS_GIC */
 
-/**
- * gic_read_local_vp_id() - read the local VPs VCNUM
- *
- * Read the VCNUM of the local VP from the GIC_VP_IDENT register and
- * return it to the caller. This ID should be used to refer to the VP
- * via the GICs VP-other region, or when calculating an offset to a
- * bit representing the VP in interrupt masks.
- *
- * Return: The VCNUM value for the local VP.
- */
-extern unsigned gic_read_local_vp_id(void);
-
 #endif /* __LINUX_IRQCHIP_MIPS_GIC_H */
-- 
2.14.0
