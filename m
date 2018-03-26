Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:54429 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992096AbeCZSMPXojRr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Mar 2018 20:12:15 +0200
Date: Mon, 26 Mar 2018 19:11:51 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH] MIPS: Make the default for PHYSICAL_START always 64-bit
Message-ID: <alpine.DEB.2.00.1803240129140.2163@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Maxim Uvarov <muvarov@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20180326181151.C3zzj7kzjYm1_oNQj-sntslk9z79l7KbuQljfJJxFmE@z>

Make the default for PHYSICAL_START always 64-bit, ensuring that a 
correct sign-extended value is used if a 32-bit image is loaded by a 
64-bit system, and matching how the load address is set in platform 
Makefile fragments (arch/mips/*/Platform) in the absence of the 
PHYSICAL_START configuration option.

Of course PHYSICAL_START itself is a misnomer as the load address is 
virtual rather than physical (or otherwise sign-extension would not 
apply).

Signed-off-by: Maciej W. Rozycki <macro@mips.com>
Fixes: 7aa1c8f47e7e ("MIPS: kdump: Add support")
Cc: stable@vger.kernel.org # 3.8+
---
Hi James,

 As discussed in the context of commit 27c524d17430 ("MIPS: Use the entry 
point from the ELF file header").  This may require verifying by someone 
who actually uses this feature.  I have cc-ed Maxim, the original author, 
in case he has anything to add.

 I'm not sure if we want to do anything about the physical vs virtual load
address confusion.

 Please consider.

  Maciej
---
 arch/mips/Kconfig |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

linux-mips-physical-start.diff
Index: linux-jhogan-test/arch/mips/Kconfig
===================================================================
--- linux-jhogan-test.orig/arch/mips/Kconfig	2018-03-21 17:22:12.000000000 +0000
+++ linux-jhogan-test/arch/mips/Kconfig	2018-03-23 09:19:25.049100000 +0000
@@ -2849,8 +2849,7 @@ config CRASH_DUMP
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
-	default "0xffffffff84000000" if 64BIT
-	default "0x84000000" if 32BIT
+	default "0xffffffff84000000"
 	depends on CRASH_DUMP
 	help
 	  This gives the CKSEG0 or KSEG0 address where the kernel is loaded.
