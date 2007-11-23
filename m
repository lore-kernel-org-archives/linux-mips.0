Received: from elvis.franken.de ([193.175.24.41]:6375 "EHLO elvis.franken.de")
	by ftp.linux-mips.org with ESMTP id S20029540AbXKWTzR (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 23 Nov 2007 19:55:17 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Fri, 23 Nov 2007 20:41:55 +0100
Subject: [PATCH] IP22: Fix modules for 64bit kernels by using a CKSEG2 MAP_BASE
Message-ID: <20071123195152.B86B0C2E30@solo.franken.de>
Return-Path: <tsbogend@alpha.franken.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Message-ID: <20071123194155.6Yh1gEGoPzDMdmHO4ivNXMyOGsjgOgXh5MSVx2CdQFQ@z>


Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 include/asm-mips/mach-ip22/spaces.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/asm-mips/mach-ip22/spaces.h b/include/asm-mips/mach-ip22/spaces.h
index 7f9fa6f..8264d0a 100644
--- a/include/asm-mips/mach-ip22/spaces.h
+++ b/include/asm-mips/mach-ip22/spaces.h
@@ -18,7 +18,7 @@
 #define CAC_BASE		0xffffffff80000000
 #define IO_BASE			0xffffffffa0000000
 #define UNCAC_BASE		0xffffffffa0000000
-#define MAP_BASE		0xc000000000000000
+#define MAP_BASE		0xffffffffc0000000
 
 #endif /* CONFIG_64BIT */
 
-- 
1.4.4.4
