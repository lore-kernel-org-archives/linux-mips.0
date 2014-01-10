Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:35586 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6870582AbaAJUfyXvis4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jan 2014 21:35:54 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 2/3] MIPS: update MIPS_L1_CACHE_SHIFT based on MIPS_L1_CACHE_SHIFT_<N>
Date: Fri, 10 Jan 2014 12:35:13 -0800
Message-ID: <1389386114-31834-3-git-send-email-florian@openwrt.org>
In-Reply-To: <1389386114-31834-1-git-send-email-florian@openwrt.org>
References: <1389386114-31834-1-git-send-email-florian@openwrt.org>
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
Cc: ralf@linux-mips.org, blogic@openwrt.org, jogo@openwrt.org, mbizon@freebox.fr, cernekee@gmail.com, dgcbueu@gmail.com, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140110203513.rRuXpqiXkzWlfVyXfx56tV5J5ThYcb2KHNMk3AlFtHE@z>

All platforms that require a special MIPS_L1_CACHE_SHIFT value have been
updated, such that we can now make MIPS_L1_CACHE_SHIFT default to the
appropriate integer value based on the select MIPS_L1_CACHE_SHIFT_<N>
variable.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 arch/mips/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 753c5a3..123f7c0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1106,10 +1106,10 @@ config MIPS_L1_CACHE_SHIFT_7
 
 config MIPS_L1_CACHE_SHIFT
 	int
-	default "4" if MACH_DECSTATION || MIKROTIK_RB532 || PMC_MSP4200_EVAL || SOC_RT288X
-	default "6" if MIPS_CPU_SCACHE
-	default "7" if SGI_IP22 || SGI_IP27 || SGI_IP28 || SNI_RM || CPU_CAVIUM_OCTEON
-	default "5"
+	default "4" if MIPS_L1_CACHE_SHIFT_4
+	default "6" if MIPS_L1_CACHE_SHIFT_6
+	default "7" if MIPS_L1_CACHE_SHIFT_7
+	default "5" if MIPS_L1_CACHE_SHIFT_5
 
 config HAVE_STD_PC_SERIAL_PORT
 	bool
-- 
1.8.3.2
