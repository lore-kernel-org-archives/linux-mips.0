Received: from relay1.mentorg.com ([192.94.38.131]:54535 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013682AbaKOWJoc7IZP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 15 Nov 2014 23:09:44 +0100
Date: Sat, 15 Nov 2014 22:09:31 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH 6/7] MIPS: Apply `.insn' to fixup labels throughout
In-Reply-To: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk>
Message-ID: <alpine.DEB.1.10.1411152139430.2881@tp.orcam.me.uk>
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
Message-ID: <20141115220931.rtxuea6T5EVH1E9IfIVIte-sdLZQhogTj2IGVFG6TLc@z>

Fix the issue with the ISA bit being lost in fixups that jump to labels 
placed just before a section switch.  Such a switch leads to the ISA bit 
being lost, because GAS concludes there is no code that follows and 
therefore the label refers to data.  Use the `.insn' pseudo-op to 
convince the tool this is not the case.

This lack of label annotation leads to microMIPS compilation errors 
like:

mips-linux-gnu-ld: arch/mips/built-in.o: .fixup+0x3b8: Unsupported jump between ISA modes; consider recompiling with interlinking enabled.
mips-linux-gnu-ld: final link failed: Bad value

Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
---
Hi,

 I see someone has just fixed this issue in one place, so I had to 
regenerate the change I originally made against 3.17, but I really fail 
to see why not to fix it throughout at once.

 Please apply,

  Maciej

linux-umips-fixup-insn.diff
Index: linux-3.18-rc4-malta/arch/mips/include/asm/futex.h
===================================================================
--- linux-3.18-rc4-malta.orig/arch/mips/include/asm/futex.h	2014-11-15 05:56:06.000000000 +0000
+++ linux-3.18-rc4-malta/arch/mips/include/asm/futex.h	2014-11-15 00:26:50.261902695 +0000
@@ -33,6 +33,7 @@
 		"	beqzl	$1, 1b				\n"	\
 		__WEAK_LLSC_MB						\
 		"3:						\n"	\
+		"	.insn					\n"	\
 		"	.set	pop				\n"	\
 		"	.set	mips0				\n"	\
 		"	.section .fixup,\"ax\"			\n"	\
@@ -61,6 +62,7 @@
 		"	beqz	$1, 1b				\n"	\
 		__WEAK_LLSC_MB						\
 		"3:						\n"	\
+		"	.insn					\n"	\
 		"	.set	pop				\n"	\
 		"	.set	mips0				\n"	\
 		"	.section .fixup,\"ax\"			\n"	\
@@ -162,6 +164,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval,
 		"	beqzl	$1, 1b					\n"
 		__WEAK_LLSC_MB
 		"3:							\n"
+		"	.insn						\n"
 		"	.set	pop					\n"
 		"	.section .fixup,\"ax\"				\n"
 		"4:	li	%0, %6					\n"
@@ -190,6 +193,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval,
 		"	beqz	$1, 1b					\n"
 		__WEAK_LLSC_MB
 		"3:							\n"
+		"	.insn						\n"
 		"	.set	pop					\n"
 		"	.section .fixup,\"ax\"				\n"
 		"4:	li	%0, %6					\n"
Index: linux-3.18-rc4-malta/arch/mips/include/asm/paccess.h
===================================================================
--- linux-3.18-rc4-malta.orig/arch/mips/include/asm/paccess.h	2013-05-23 16:08:04.000000000 +0100
+++ linux-3.18-rc4-malta/arch/mips/include/asm/paccess.h	2014-11-15 05:56:52.451903033 +0000
@@ -56,6 +56,7 @@ struct __large_pstruct { unsigned long b
 	"1:\t" insn "\t%1,%2\n\t"					\
 	"move\t%0,$0\n"							\
 	"2:\n\t"							\
+	".insn\n\t"							\
 	".section\t.fixup,\"ax\"\n"					\
 	"3:\tli\t%0,%3\n\t"						\
 	"move\t%1,$0\n\t"						\
@@ -94,6 +95,7 @@ extern void __get_dbe_unknown(void);
 	"1:\t" insn "\t%1,%2\n\t"					\
 	"move\t%0,$0\n"							\
 	"2:\n\t"							\
+	".insn\n\t"							\
 	".section\t.fixup,\"ax\"\n"					\
 	"3:\tli\t%0,%3\n\t"						\
 	"j\t2b\n\t"							\
Index: linux-3.18-rc4-malta/arch/mips/kernel/syscall.c
===================================================================
--- linux-3.18-rc4-malta.orig/arch/mips/kernel/syscall.c	2014-11-14 03:29:49.000000000 +0000
+++ linux-3.18-rc4-malta/arch/mips/kernel/syscall.c	2014-11-15 05:56:52.451903033 +0000
@@ -117,6 +117,7 @@ static inline int mips_atomic_set(unsign
 		"2:	sc	%[tmp], (%[addr])			\n"
 		"	beqzl	%[tmp], 1b				\n"
 		"3:							\n"
+		"	.insn						\n"
 		"	.section .fixup,\"ax\"				\n"
 		"4:	li	%[err], %[efault]			\n"
 		"	j	3b					\n"
@@ -142,6 +143,7 @@ static inline int mips_atomic_set(unsign
 		"2:	sc	%[tmp], (%[addr])			\n"
 		"	bnez	%[tmp], 4f				\n"
 		"3:							\n"
+		"	.insn						\n"
 		"	.subsection 2					\n"
 		"4:	b	1b					\n"
 		"	.previous					\n"
