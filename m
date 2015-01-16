Received: from mailapp01.imgtec.com ([195.59.15.196]:28454 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010724AbbAPKxTkIDMy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:19 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C070463F76A24
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:11 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 39/70] MIPS: lib: memset: Add MIPS R6 support
Date: Fri, 16 Jan 2015 10:49:18 +0000
Message-ID: <1421405389-15512-40-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104918.d68GAaY0g0fATRgjoDHht6pDwXGYXahbX5-bSZIVMXc@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

MIPS R6 dropped the unaligned load and store instructions so
we need to re-write this part of the code for R6 to store
one byte at a time.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/lib/memset.S | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index c8fe6b1968fb..d542650d4fb7 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -111,6 +111,7 @@
 	.set		at
 #endif
 
+#ifndef CONFIG_CPU_MIPSR6
 	R10KCBARRIER(0(ra))
 #ifdef __MIPSEB__
 	EX(LONG_S_L, a1, (a0), .Lfirst_fixup\@)	/* make word/dword aligned */
@@ -120,6 +121,30 @@
 	PTR_SUBU	a0, t0			/* long align ptr */
 	PTR_ADDU	a2, t0			/* correct size */
 
+#else /* CONFIG_CPU_MIPSR6 */
+#define STORE_BYTE(N)				\
+	EX(sb, a1, N(a0), .Lbyte_fixup\@);	\
+	beqz		t0, 0f;			\
+	PTR_ADDU	t0, 1;
+
+	PTR_ADDU	a2, t0			/* correct size */
+	PTR_ADDU	t0, 1
+	STORE_BYTE(0)
+	STORE_BYTE(1)
+#if LONGSIZE == 4
+	EX(sb, a1, 2(a0), .Lbyte_fixup\@)
+#else
+	STORE_BYTE(2)
+	STORE_BYTE(3)
+	STORE_BYTE(4)
+	STORE_BYTE(5)
+	EX(sb, a1, 6(a0), .Lbyte_fixup\@)
+#endif
+0:
+	ori		a0, STORMASK
+	xori		a0, STORMASK
+	PTR_ADDIU	a0, STORSIZE
+#endif /* CONFIG_CPU_MIPS_R6 */
 1:	ori		t1, a2, 0x3f		/* # of full blocks */
 	xori		t1, 0x3f
 	beqz		t1, .Lmemset_partial\@	/* no block to fill */
@@ -159,6 +184,7 @@
 	andi		a2, STORMASK		/* At most one long to go */
 
 	beqz		a2, 1f
+#ifndef CONFIG_CPU_MIPSR6
 	PTR_ADDU	a0, a2			/* What's left */
 	R10KCBARRIER(0(ra))
 #ifdef __MIPSEB__
@@ -166,6 +192,22 @@
 #else
 	EX(LONG_S_L, a1, -1(a0), .Llast_fixup\@)
 #endif
+#else
+	PTR_SUBU	t0, $0, a2
+	PTR_ADDIU	t0, 1
+	STORE_BYTE(0)
+	STORE_BYTE(1)
+#if LONGSIZE == 4
+	EX(sb, a1, 2(a0), .Lbyte_fixup\@)
+#else
+	STORE_BYTE(2)
+	STORE_BYTE(3)
+	STORE_BYTE(4)
+	STORE_BYTE(5)
+	EX(sb, a1, 6(a0), .Lbyte_fixup\@)
+#endif
+0:
+#endif
 1:	jr		ra
 	move		a2, zero
 
@@ -186,6 +228,11 @@
 	.hidden __memset
 	.endif
 
+.Lbyte_fixup\@:
+	PTR_SUBU	a2, $0, t0
+	jr		ra
+	 PTR_ADDIU	a2, 1
+
 .Lfirst_fixup\@:
 	jr	ra
 	nop
-- 
2.2.1
