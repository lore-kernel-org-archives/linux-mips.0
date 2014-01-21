Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:63463 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6826484AbaAUSCAABBLH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Jan 2014 19:02:00 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 1/2] MIPS: add MIPS_L1_CACHE_SHIFT_2
Date: Tue, 21 Jan 2014 10:01:33 -0800
Message-ID: <1390327294-2618-1-git-send-email-florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <florian@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org, blogic@openwrt.org, macro@linux-mips.org, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140121180133.xoqWjV_XvkzLRF2K1jtwpMYeXvW7UZ4PHCuIJQ77Dc4@z>

Some older machines such as the DECStation use a L1 data-cache shift of
2 (value of 4), add a Kconfig symbol for this value so they can express
this requirement.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 arch/mips/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 03d0ed3..9ab4239 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1098,6 +1098,9 @@ config FW_SNIPROM
 config BOOT_ELF32
 	bool
 
+config MIPS_L1_CACHE_SHIFT_2
+	bool
+
 config MIPS_L1_CACHE_SHIFT_4
 	bool
 
@@ -1112,6 +1115,7 @@ config MIPS_L1_CACHE_SHIFT_7
 
 config MIPS_L1_CACHE_SHIFT
 	int
+	default "2" if MIPS_L1_CACHE_SHIFT_2
 	default "4" if MIPS_L1_CACHE_SHIFT_4
 	default "5" if MIPS_L1_CACHE_SHIFT_5
 	default "6" if MIPS_L1_CACHE_SHIFT_6
-- 
1.8.3.2
