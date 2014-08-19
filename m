Received: from elvis.franken.de ([193.175.24.41]:60698 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6855209AbaHSUBYDBuwA (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Aug 2014 22:01:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] SGI-IP28: select correct L1_CACHE_SHIFT
Message-ID: <20140819200007.C75831D26C@solo.franken.de>
Date: Tue, 19 Aug 2014 22:00:07 +0200 (CEST)
Return-Path: <tsbogend@alpha.franken.de>
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
Cc: ralf@linux-mips.org
Message-ID: <20140819200007.rCY5Af43UGsYrlzQBCesScV0SG1hlBHSogTFTt_ZCOs@z>

IP28 has 128 byte cache lines.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---

 arch/mips/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 748126a..01c0389 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -546,6 +546,7 @@ config SGI_IP28
 	# select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
+	select MIPS_L1_CACHE_SHIFT_7
       help
         This is the SGI Indigo2 with R10000 processor.  To compile a Linux
         kernel that runs on these, say Y here.
