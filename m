Received: from localhost.localdomain ([127.0.0.1]:36574 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012925AbbHSVKOhx7ph (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Aug 2015 23:10:14 +0200
Date: Wed, 19 Aug 2015 23:10:12 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: MIPS: ath79: Use the common clk API
Message-ID: <20150819211012.GA23307@linux-mips.org>
References: <1429446604-15403-1-git-send-email-albeu@free.fr>
 <1429446604-15403-6-git-send-email-albeu@free.fr>
 <55C745B7.3040002@hauke-m.de>
 <20150819210330.GO3612@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150819210330.GO3612@linux-mips.org>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: stable@vger.kernel.org
Cc: Alban Bedel <albeu@free.fr>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@linux-mips.org, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Wolfram Sang <wsa@the-dreams.de>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-kernel@vger.kernel.org
Message-ID: <20150819211012.VHZXMA_sE4JKkytDa90rQTWQfIKR1QHDZ0BbZ6fp2IY@z>

From: Alban Bedel <albeu@free.fr>

Make the code simpler and open the way for device tree clocks.

[ralf@linux-mips.org: Resolved conflict with 2a552da6 (MIPS/IRQCHIP: Move
irq_chip from arch/mips to drivers/irqchip.)]

In 4.1 this also fixes the following build error:

ERROR: "clk_set_rate" [drivers/usb/phy/phy-generic.ko] undefined!
ERROR: "clk_round_rate" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "clk_set_rate" [drivers/media/v4l2-core/videodev.ko] undefined!

Signed-off-by: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org
Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Qais Yousef <qais.yousef@imgtec.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Gabor Juhos <juhosg@openwrt.org>
Cc: linux-kernel@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/9774/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
Upstream commit 411520af8ec9456886359b42628e583ac58e7e44

 arch/mips/Kconfig       |  1 +
 arch/mips/ath79/clock.c | 29 ++---------------------------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1c053e2..11cdbac 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -123,6 +123,7 @@ config ATH79
 	select CSRC_R4K
 	select DMA_NONCOHERENT
 	select HAVE_CLK
+	select COMMON_CLK
 	select CLKDEV_LOOKUP
 	select IRQ_CPU
 	select MIPS_MACHINE
diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 26479f4..d59009d 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 
 #include <asm/div64.h>
 
@@ -28,21 +29,15 @@
 #define AR724X_BASE_FREQ	5000000
 #define AR913X_BASE_FREQ	5000000
 
-struct clk {
-	unsigned long rate;
-};
-
 static void __init ath79_add_sys_clkdev(const char *id, unsigned long rate)
 {
 	struct clk *clk;
 	int err;
 
-	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+	clk = clk_register_fixed_rate(NULL, id, NULL, CLK_IS_ROOT, rate);
 	if (!clk)
 		panic("failed to allocate %s clock structure", id);
 
-	clk->rate = rate;
-
 	err = clk_register_clkdev(clk, id, NULL);
 	if (err)
 		panic("unable to register %s clock device", id);
@@ -468,23 +463,3 @@ ath79_get_sys_clk_rate(const char *id)
 
 	return rate;
 }
-
-/*
- * Linux clock API
- */
-int clk_enable(struct clk *clk)
-{
-	return 0;
-}
-EXPORT_SYMBOL(clk_enable);
-
-void clk_disable(struct clk *clk)
-{
-}
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	return clk->rate;
-}
-EXPORT_SYMBOL(clk_get_rate);
