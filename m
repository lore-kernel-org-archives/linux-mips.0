Received: from elvis.franken.de ([193.175.24.41]:51334 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6816906AbaDGWW6Hgabg (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 8 Apr 2014 00:22:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] remove USE_GENERIC_EARLY_PRINTK_8250 for SNI_RM
Message-ID: <20140407222226.C58981BB731@solo.franken.de>
Date: Tue,  8 Apr 2014 00:22:26 +0200 (CEST)
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
Message-ID: <20140407222226.g1Zg5X_jaNYJhiJPJvDYpvvUQDbi2zMdnAjkXQcsylg@z>

SNI RM code has its own EARLY_PRINTK support no need for some generic 8250
stuff.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---

 arch/mips/Kconfig |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b0e89cd..9f6ba47 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -674,7 +674,6 @@ config SNI_RM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select USE_GENERIC_EARLY_PRINTK_8250
 	help
 	  The SNI RM200/300/400 are MIPS-based machines manufactured by
 	  Siemens Nixdorf Informationssysteme (SNI), parent company of Pyramid
