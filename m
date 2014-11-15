Received: from relay1.mentorg.com ([192.94.38.131]:54485 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013726AbaKOWIeWKEZH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 15 Nov 2014 23:08:34 +0100
Date: Sat, 15 Nov 2014 22:08:23 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH 4/7] MIPS: Kconfig: Only allow 32-bit microMIPS builds
In-Reply-To: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk>
Message-ID: <alpine.DEB.1.10.1411152105480.2881@tp.orcam.me.uk>
References: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20141115220823.28OtKkxfL8LeRkunG3zskhuUUwAD0vIv8fVJDF7BcjQ@z>

Only allow 32-bit microMIPS builds, we're not ready yet for 64-bit 
microMIPS support.

QEMU does have support for the 64-bit microMIPS ISA and with minor 
tweaks it is possible to have a 64-bit processor emulated there that 
runs microMIPS code, so despite the lack of actual 64-bit microMIPS 
hardware there is a way to run 64-bit microMIPS Linux, but it can all be 
considered early development and we are not there yet.  Userland tools 
are lacking too, e.g. GCC produces bad code:

{standard input}: Assembler messages:
{standard input}:380: Warning: wrong size instruction in a 16-bit branch delay slot

And our build fails early on, so disable the configuration, for the sake 
of automatic random config checkers if nothing else.  Whoever needs to 
experiment with 64-bit microMIPS support can revert this change easily.

Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
---
linux-umips-32bit.diff
Index: linux-3.18-rc4-malta/arch/mips/Kconfig
===================================================================
--- linux-3.18-rc4-malta.orig/arch/mips/Kconfig	2014-11-15 05:55:56.441902868 +0000
+++ linux-3.18-rc4-malta/arch/mips/Kconfig	2014-11-15 05:56:01.941907996 +0000
@@ -2115,7 +2115,7 @@ config CPU_HAS_SMARTMIPS
 	  here.
 
 config CPU_MICROMIPS
-	depends on SYS_SUPPORTS_MICROMIPS
+	depends on 32BIT && SYS_SUPPORTS_MICROMIPS
 	bool "Build kernel using microMIPS ISA"
 	help
 	  When this option is enabled the kernel will be built using the
