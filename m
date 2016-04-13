Received: from mail-pf0-f174.google.com ([209.85.192.174]:33669 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026500AbcDMSUC3lcD5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 Apr 2016 20:20:02 +0200
Received: by mail-pf0-f174.google.com with SMTP id 184so37555060pff.0
        for <linux-mips@linux-mips.org>; Wed, 13 Apr 2016 11:20:02 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] bus: brcmstb_gisb: Rework dependencies
Date: Wed, 13 Apr 2016 11:17:48 -0700
Message-ID: <1460571469-20201-1-git-send-email-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@linux-mips.org, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Punit Agrawal <punit.agrawal@arm.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, "open list:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20160413181748.sDCj540LufsFqt5xNotg1fOzABqUrPv-w0S3ul1D10I@z>

Do not have the machine Kconfig entry point need to select
BRCMSTB_GISB_ARB, instead, just let it be default ARCH_BRCMSTB which is
a better way to deal with this. While at it, also make it default
BMIPS_GENERIC so the legacy MIPS-based STB platforms can benefit from
the same thing.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/mach-bcm/Kconfig | 1 -
 drivers/bus/Kconfig       | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 7ef121472cdd..af10ff27a2ed 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -173,7 +173,6 @@ config ARCH_BRCMSTB
 	select ARM_GIC
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
-	select BRCMSTB_GISB_ARB
 	select BRCMSTB_L2_IRQ
 	select BCM7120_L2_IRQ
 	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index d4a3a3133da5..85c66e5028c1 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -58,6 +58,8 @@ config ARM_CCN
 config BRCMSTB_GISB_ARB
 	bool "Broadcom STB GISB bus arbiter"
 	depends on ARM || MIPS
+	default ARCH_BRCMSTB
+	default BMIPS_GENERIC
 	help
 	  Driver for the Broadcom Set Top Box System-on-a-chip internal bus
 	  arbiter. This driver provides timeout and target abort error handling
-- 
2.1.0
