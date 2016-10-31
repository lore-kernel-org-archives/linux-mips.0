Received: from mailapp01.imgtec.com ([195.59.15.196]:42883 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992991AbcJaQ1yuHhN1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 31 Oct 2016 17:27:54 +0100
Date: Mon, 31 Oct 2016 16:27:40 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 4/4] MIPS: Correct MIPS I FP sigcontext layout
In-Reply-To: <alpine.DEB.2.00.1610310319010.31859@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1610310417500.31859@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1610310319010.31859@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20161031162740.n98MSmhkTdcuJZLs3H3VoRRneJN4o-F0zOhrZ9X3wbg@z>

Complement commit 80cbfad79096 ("MIPS: Correct MIPS I FP context 
layout") and correct the way Floating Point General registers are stored
in a signal context with MIPS I hardware.

Use the S.D and L.D assembly macros to have pairs of SWC1 instructions 
and pairs of LWC1 instructions produced, respectively, in an arrangement 
which makes the memory representation of floating-point data passed 
compatible with that used by hardware SDC1 and LDC1 instructions, where 
available, regardless of the hardware endianness used.  This matches the 
layout used by r4k_fpu.S, ensuring run-time compatibility for MIPS I 
software across all o32 hardware platforms.

Define an EX2 macro to handle exceptions from both hardware instructions 
implicitly produced from S.D and L.D assembly macros.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-mips-isa1-sig-fp-context.patch
Index: linux-sfr-test/arch/mips/kernel/r2300_fpu.S
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/r2300_fpu.S	2016-10-22 02:38:03.979547000 +0100
+++ linux-sfr-test/arch/mips/kernel/r2300_fpu.S	2016-10-22 02:41:53.059507000 +0100
@@ -24,6 +24,13 @@
 	PTR	9b,fault;					\
 	.previous
 
+#define EX2(a,b)						\
+9:	a,##b;							\
+	.section __ex_table,"a";				\
+	PTR	9b,bad_stack;					\
+	PTR	9b+4,bad_stack;					\
+	.previous
+
 	.set	noreorder
 	.set	mips1
 
@@ -40,38 +47,22 @@ LEAF(_save_fp_context)
 	SET_HARDFLOAT
 	li	v0, 0					# assume success
 	cfc1	t1, fcr31
-	EX(swc1 $f0, 0(a0))
-	EX(swc1 $f1, 8(a0))
-	EX(swc1 $f2, 16(a0))
-	EX(swc1 $f3, 24(a0))
-	EX(swc1 $f4, 32(a0))
-	EX(swc1 $f5, 40(a0))
-	EX(swc1 $f6, 48(a0))
-	EX(swc1 $f7, 56(a0))
-	EX(swc1 $f8, 64(a0))
-	EX(swc1 $f9, 72(a0))
-	EX(swc1 $f10, 80(a0))
-	EX(swc1 $f11, 88(a0))
-	EX(swc1 $f12, 96(a0))
-	EX(swc1 $f13, 104(a0))
-	EX(swc1 $f14, 112(a0))
-	EX(swc1 $f15, 120(a0))
-	EX(swc1 $f16, 128(a0))
-	EX(swc1 $f17, 136(a0))
-	EX(swc1 $f18, 144(a0))
-	EX(swc1 $f19, 152(a0))
-	EX(swc1 $f20, 160(a0))
-	EX(swc1 $f21, 168(a0))
-	EX(swc1 $f22, 176(a0))
-	EX(swc1 $f23, 184(a0))
-	EX(swc1 $f24, 192(a0))
-	EX(swc1 $f25, 200(a0))
-	EX(swc1 $f26, 208(a0))
-	EX(swc1 $f27, 216(a0))
-	EX(swc1 $f28, 224(a0))
-	EX(swc1 $f29, 232(a0))
-	EX(swc1 $f30, 240(a0))
-	EX(swc1 $f31, 248(a0))
+	EX2(s.d $f0, 0(a0))
+	EX2(s.d $f2, 16(a0))
+	EX2(s.d $f4, 32(a0))
+	EX2(s.d $f6, 48(a0))
+	EX2(s.d $f8, 64(a0))
+	EX2(s.d $f10, 80(a0))
+	EX2(s.d $f12, 96(a0))
+	EX2(s.d $f14, 112(a0))
+	EX2(s.d $f16, 128(a0))
+	EX2(s.d $f18, 144(a0))
+	EX2(s.d $f20, 160(a0))
+	EX2(s.d $f22, 176(a0))
+	EX2(s.d $f24, 192(a0))
+	EX2(s.d $f26, 208(a0))
+	EX2(s.d $f28, 224(a0))
+	EX2(s.d $f30, 240(a0))
 	jr	ra
 	 EX(sw	t1, (a1))
 	.set	pop
@@ -90,38 +81,22 @@ LEAF(_restore_fp_context)
 	SET_HARDFLOAT
 	li	v0, 0					# assume success
 	EX(lw t0, (a1))
-	EX(lwc1 $f0, 0(a0))
-	EX(lwc1 $f1, 8(a0))
-	EX(lwc1 $f2, 16(a0))
-	EX(lwc1 $f3, 24(a0))
-	EX(lwc1 $f4, 32(a0))
-	EX(lwc1 $f5, 40(a0))
-	EX(lwc1 $f6, 48(a0))
-	EX(lwc1 $f7, 56(a0))
-	EX(lwc1 $f8, 64(a0))
-	EX(lwc1 $f9, 72(a0))
-	EX(lwc1 $f10, 80(a0))
-	EX(lwc1 $f11, 88(a0))
-	EX(lwc1 $f12, 96(a0))
-	EX(lwc1 $f13, 104(a0))
-	EX(lwc1 $f14, 112(a0))
-	EX(lwc1 $f15, 120(a0))
-	EX(lwc1 $f16, 128(a0))
-	EX(lwc1 $f17, 136(a0))
-	EX(lwc1 $f18, 144(a0))
-	EX(lwc1 $f19, 152(a0))
-	EX(lwc1 $f20, 160(a0))
-	EX(lwc1 $f21, 168(a0))
-	EX(lwc1 $f22, 176(a0))
-	EX(lwc1 $f23, 184(a0))
-	EX(lwc1 $f24, 192(a0))
-	EX(lwc1 $f25, 200(a0))
-	EX(lwc1 $f26, 208(a0))
-	EX(lwc1 $f27, 216(a0))
-	EX(lwc1 $f28, 224(a0))
-	EX(lwc1 $f29, 232(a0))
-	EX(lwc1 $f30, 240(a0))
-	EX(lwc1 $f31, 248(a0))
+	EX2(l.d $f0, 0(a0))
+	EX2(l.d $f2, 16(a0))
+	EX2(l.d $f4, 32(a0))
+	EX2(l.d $f6, 48(a0))
+	EX2(l.d $f8, 64(a0))
+	EX2(l.d $f10, 80(a0))
+	EX2(l.d $f12, 96(a0))
+	EX2(l.d $f14, 112(a0))
+	EX2(l.d $f16, 128(a0))
+	EX2(l.d $f18, 144(a0))
+	EX2(l.d $f20, 160(a0))
+	EX2(l.d $f22, 176(a0))
+	EX2(l.d $f24, 192(a0))
+	EX2(l.d $f26, 208(a0))
+	EX2(l.d $f28, 224(a0))
+	EX2(l.d $f30, 240(a0))
 	jr	ra
 	 ctc1	t0, fcr31
 	.set	pop
