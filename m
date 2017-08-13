Received: from mailapp01.imgtec.com ([195.59.15.196]:53604 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993929AbdHMEpkDdDSd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:45:40 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 27/38] irqchip: mips-gic: Remove gic_present
Date: Sat, 12 Aug 2017 21:36:35 -0700
Message-ID: <20170813043646.25821-28-paul.burton@imgtec.com>
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
Message-ID: <20170813043635.V4MBWySFu48lqJlYlYKRyHIijixZioGESGlZtHdeJqs@z>

Nothing uses the global gic_present variable anymore; mips_gic_present()
should be used instead. Remove the dead code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c   | 2 --
 include/linux/irqchip/mips-gic.h | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 75877c793c4f..5e1966777ab7 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -39,7 +39,6 @@
 #define GIC_SHARED_TO_HWIRQ(x)	(GIC_SHARED_HWIRQ_BASE + (x))
 #define GIC_HWIRQ_TO_SHARED(x)	((x) - GIC_SHARED_HWIRQ_BASE)
 
-unsigned int gic_present;
 void __iomem *mips_gic_base;
 
 struct gic_pcpu_mask {
@@ -781,7 +780,6 @@ static int __init gic_of_init(struct device_node *node,
 		/* Ensure GIC region is enabled before trying to access it */
 		__sync();
 	}
-	gic_present = true;
 
 	__gic_init(gic_base, gic_len, cpu_vec, 0, node);
 
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index 63c5f87034c9..113010c8dd8b 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -17,16 +17,10 @@
 
 #ifdef CONFIG_MIPS_GIC
 
-extern unsigned int gic_present;
-
 extern int gic_get_c0_compare_int(void);
 extern int gic_get_c0_perfcount_int(void);
 extern int gic_get_c0_fdc_int(void);
 
-#else /* CONFIG_MIPS_GIC */
-
-#define gic_present	0
-
 #endif /* CONFIG_MIPS_GIC */
 
 #endif /* __LINUX_IRQCHIP_MIPS_GIC_H */
-- 
2.14.0
