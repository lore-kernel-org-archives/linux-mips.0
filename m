Received: from mailapp01.imgtec.com ([195.59.15.196]:41145 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008725AbbDPKGLJJGVY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Apr 2015 12:06:11 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D4A441F72D02C
        for <linux-mips@linux-mips.org>; Thu, 16 Apr 2015 11:06:04 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: asmmacro: Ensure 64-bit FP registers are used with MSA
Date: Thu, 16 Apr 2015 11:05:59 +0100
Message-ID: <1429178759-20562-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150416100559.sUVwnBYTCBXdxouTZeUzCk5SmpnsfzFjlf3a90lZrws@z>

This silences warnings like the following one when building with the
latest binutils:

arch/mips/kernel/genex.S: Assembler messages:
arch/mips/kernel/genex.S:438: Warning: the `msa' extension requires 64-bit FPRs

Cc: James Hogan <james.hogan@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/asmmacro.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 6156ac8c4cfb..76317a70200d 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -211,9 +211,13 @@
 	.endm
 
 #ifdef TOOLCHAIN_SUPPORTS_MSA
+/* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
+#undef fp
+
 	.macro	_cfcmsa	rd, cs
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	cfcmsa	\rd, $\cs
 	.set	pop
@@ -222,6 +226,7 @@
 	.macro	_ctcmsa	cd, rs
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	ctcmsa	$\cd, \rs
 	.set	pop
@@ -230,6 +235,7 @@
 	.macro	ld_d	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	ld.d	$w\wd, \off(\base)
 	.set	pop
@@ -238,6 +244,7 @@
 	.macro	st_d	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	st.d	$w\wd, \off(\base)
 	.set	pop
@@ -246,6 +253,7 @@
 	.macro	copy_u_w	ws, n
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	copy_u.w $1, $w\ws[\n]
 	.set	pop
@@ -254,6 +262,7 @@
 	.macro	copy_u_d	ws, n
 	.set	push
 	.set	mips64r2
+	.set	fp=64
 	.set	msa
 	copy_u.d $1, $w\ws[\n]
 	.set	pop
@@ -262,6 +271,7 @@
 	.macro	insert_w	wd, n
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	insert.w $w\wd[\n], $1
 	.set	pop
@@ -270,6 +280,7 @@
 	.macro	insert_d	wd, n
 	.set	push
 	.set	mips64r2
+	.set	fp=64
 	.set	msa
 	insert.d $w\wd[\n], $1
 	.set	pop
-- 
2.3.4
