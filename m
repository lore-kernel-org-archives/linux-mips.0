Received: from mail-pf0-f194.google.com ([209.85.192.194]:34814 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992466AbcHIIWuW7mIG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Aug 2016 10:22:50 +0200
From: Keguang Zhang <keguang.zhang@gmail.com>
Subject: [PATCH V1] MIPS: Loongson1B: Provide DMA filter callbacks via platform data
Date: Tue,  9 Aug 2016 16:22:25 +0800
Message-Id: <1470730945-24456-1-git-send-email-keguang.zhang@gmail.com>
Return-Path: <keguang.zhang@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Kelvin Cheung <keguang.zhang@gmail.com>

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch provides DMA filter callbacks via platform data
to make NAND driver independent of single DMA engine driver.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

---
v1:
   Fix the build error
---
 arch/mips/include/asm/mach-loongson32/dma.h  | 4 ++++
 arch/mips/include/asm/mach-loongson32/nand.h | 3 +--
 arch/mips/loongson32/ls1b/board.c            | 3 +++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson32/dma.h b/arch/mips/include/asm/mach-loongson32/dma.h
index ad1dec7..d3ae391 100644
--- a/arch/mips/include/asm/mach-loongson32/dma.h
+++ b/arch/mips/include/asm/mach-loongson32/dma.h
@@ -12,6 +12,8 @@
 #ifndef __ASM_MACH_LOONGSON32_DMA_H
 #define __ASM_MACH_LOONGSON32_DMA_H
 
+#include <linux/dmaengine.h>
+
 #define LS1X_DMA_CHANNEL0	0
 #define LS1X_DMA_CHANNEL1	1
 #define LS1X_DMA_CHANNEL2	2
@@ -22,4 +24,6 @@ struct plat_ls1x_dma {
 
 extern struct plat_ls1x_dma ls1b_dma_pdata;
 
+bool ls1x_dma_filter(struct dma_chan *chan, void *param);
+
 #endif /* __ASM_MACH_LOONGSON32_DMA_H */
diff --git a/arch/mips/include/asm/mach-loongson32/nand.h b/arch/mips/include/asm/mach-loongson32/nand.h
index e274912..a1f8704 100644
--- a/arch/mips/include/asm/mach-loongson32/nand.h
+++ b/arch/mips/include/asm/mach-loongson32/nand.h
@@ -21,10 +21,9 @@ struct plat_ls1x_nand {
 
 	int hold_cycle;
 	int wait_cycle;
+	bool (*dma_filter)(struct dma_chan *chan, void *param);
 };
 
 extern struct plat_ls1x_nand ls1b_nand_pdata;
 
-bool ls1x_dma_filter_fn(struct dma_chan *chan, void *param);
-
 #endif /* __ASM_MACH_LOONGSON32_NAND_H */
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 38a1d40..dac1cbb 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -38,6 +38,9 @@ struct plat_ls1x_nand ls1x_nand_pdata = {
 	.nr_parts	= ARRAY_SIZE(ls1x_nand_parts),
 	.hold_cycle	= 0x2,
 	.wait_cycle	= 0xc,
+#ifdef CONFIG_LOONGSON1_DMA
+	.dma_filter	= ls1x_dma_filter,
+#endif
 };
 
 static const struct gpio_led ls1x_gpio_leds[] __initconst = {
-- 
1.9.1
