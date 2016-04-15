Received: from mailapp01.imgtec.com ([195.59.15.196]:55920 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026636AbcDOJHq0pI8c (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Apr 2016 11:07:46 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 4/4] MIPS: Fix MSA assembly warnings
Date: Fri, 15 Apr 2016 10:07:26 +0100
Message-ID: <1460711246-4394-5-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1460711246-4394-1-git-send-email-james.hogan@imgtec.com>
References: <1460711246-4394-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160415090726.hmik9S0HDKh_k9ydGEyXDDJKlQXWjtESHxH6DKKROc4@z>

Building an MSA capable kernel with a toolchain that supports MSA
produces warnings such as this:

arch/mips/kernel/r4k_fpu.S:229: Warning: the `msa' extension requires 64-bit FPRs

This is due to ".set msa" without ".set fp=64" in the non doubleword MSA
load/store macros, since MSA requires the 64-bit FPU registers (FR=1).
Add the missing fp=64 in these macros to silence the warnings.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/asmmacro.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 637fccab5604..6741673c92ca 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -235,6 +235,7 @@
 	.macro	ld_b	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	ld.b	$w\wd, \off(\base)
 	.set	pop
@@ -243,6 +244,7 @@
 	.macro	ld_h	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	ld.h	$w\wd, \off(\base)
 	.set	pop
@@ -251,6 +253,7 @@
 	.macro	ld_w	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	ld.w	$w\wd, \off(\base)
 	.set	pop
@@ -268,6 +271,7 @@
 	.macro	st_b	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	st.b	$w\wd, \off(\base)
 	.set	pop
@@ -276,6 +280,7 @@
 	.macro	st_h	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	st.h	$w\wd, \off(\base)
 	.set	pop
@@ -284,6 +289,7 @@
 	.macro	st_w	wd, off, base
 	.set	push
 	.set	mips32r2
+	.set	fp=64
 	.set	msa
 	st.w	$w\wd, \off(\base)
 	.set	pop
-- 
2.4.10
