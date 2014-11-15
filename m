Received: from relay1.mentorg.com ([192.94.38.131]:54453 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013740AbaKOWHbhqfOF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 15 Nov 2014 23:07:31 +0100
Date: Sat, 15 Nov 2014 22:07:21 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH 2/7] MIPS: mm: Only build one microassembler that is
 suitable
In-Reply-To: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk>
Message-ID: <alpine.DEB.1.10.1411140205400.2881@tp.orcam.me.uk>
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
Message-ID: <20141115220721.LoYZnRoxkT2FR_XC3srRHAHll3LS2nyRUR0-aSuDltU@z>

The microMIPS microassembler is only suitable for configurations where
the kernel itself is built to microMIPS machine code and not where only
user microMIPS software is supported.  The former is controlled with the
CPU_MICROMIPS configuration setting, whereas SYS_SUPPORTS_MICROMIPS is
used for the latter.

Not only that, but with a given microMIPS vs standard MIPS kernel 
configuration only one microassembler is needed, that matches the ISA 
selected -- CP0.Config3.ISAOnExc is mandatory on microMIPS processors, 
so there is never a need to mix microMIPS and standard MIPS code.

Consequently build only the microassembler that matches the ISA selected 
for the kernel.

Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
---
linux-mips-uasm-micromips.diff
Index: linux-3.17-stable-malta/arch/mips/mm/Makefile
===================================================================
--- linux-3.17-stable-malta.orig/arch/mips/mm/Makefile	2014-11-14 19:44:22.000000000 +0000
+++ linux-3.17-stable-malta/arch/mips/mm/Makefile	2014-11-14 19:44:52.031933464 +0000
@@ -4,7 +4,13 @@
 
 obj-y				+= cache.o dma-default.o extable.o fault.o \
 				   gup.o init.o mmap.o page.o page-funcs.o \
-				   tlbex.o tlbex-fault.o tlb-funcs.o uasm-mips.o
+				   tlbex.o tlbex-fault.o tlb-funcs.o
+
+ifdef CONFIG_CPU_MICROMIPS
+obj-y				+= uasm-micromips.o
+else
+obj-y				+= uasm-mips.o
+endif
 
 obj-$(CONFIG_32BIT)		+= ioremap.o pgtable-32.o
 obj-$(CONFIG_64BIT)		+= pgtable-64.o
@@ -22,5 +28,3 @@ obj-$(CONFIG_IP22_CPU_SCACHE)	+= sc-ip22
 obj-$(CONFIG_R5000_CPU_SCACHE)	+= sc-r5k.o
 obj-$(CONFIG_RM7000_CPU_SCACHE) += sc-rm7k.o
 obj-$(CONFIG_MIPS_CPU_SCACHE)	+= sc-mips.o
-
-obj-$(CONFIG_SYS_SUPPORTS_MICROMIPS) += uasm-micromips.o
