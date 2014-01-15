Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:18586 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825884AbaAOTGlMuGBu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Jan 2014 20:06:41 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH mips-for-linux-next] MIPS: check for -mfix-cn63xxp1 compiler option
Date: Wed, 15 Jan 2014 11:06:24 -0800
Message-ID: <1389812784-30085-1-git-send-email-florian@openwrt.org>
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
Cc: ralf@linux-mips.org, blogic@openwrt.org, david.daney@cavium.com, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140115190624.fmot5y9qCkE65GuGCxfsOW_AAfEU4zYzPGZcuUizeRk@z>

Attempting to build for Cavium Octeon with an unpatched or old
toolchain will fail due to the -mfix-cn63xxp1 option being unrecognized.
Call cc-option on this option to make sure we can safely use it.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 873a0ca..f372b84 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -155,7 +155,7 @@ cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += $(call cc-option,-march=octeon) -Wa,--trap
 ifeq (,$(findstring march=octeon, $(cflags-$(CONFIG_CPU_CAVIUM_OCTEON))))
 cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += -Wa,-march=octeon
 endif
-cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
+cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,$(call cc-option,-mfix-cn63xxp1)
 cflags-$(CONFIG_CPU_BMIPS)	+= -march=mips32 -Wa,-mips32 -Wa,--trap
 
 cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
-- 
1.8.3.2
