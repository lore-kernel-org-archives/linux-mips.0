Received: from mailapp01.imgtec.com ([195.59.15.196]:53545 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012305AbbA3MKfKTY-x (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 13:10:35 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 566023197B15D
        for <linux-mips@linux-mips.org>; Fri, 30 Jan 2015 12:10:27 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 02/10] MIPS: assume at as source/dest of MSA copy/insert instructions
Date: Fri, 30 Jan 2015 12:09:31 +0000
Message-ID: <1422619779-9940-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1422619779-9940-1-git-send-email-paul.burton@imgtec.com>
References: <1422619779-9940-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150130120931.9Nk3zmOLUkuvwaNjiot17LPLd2ODUeZNWqSGom5JAjI@z>

Assuming at ($1) as the source or destination register of copy or
insert instructions:

  - Simplifies the macros providing those instructions for toolchains
    without MSA support.

  - Avoids an unnecessary move instruction when at is used as the source
    or destination register anyway.

  - Is sufficient for the uses to be introduced in the kernel by a
    subsequent patch.

Note that due to a patch ordering snafu on my part this also fixes the
currently broken build with MSA support enabled. The build has been
broken since commit c9017757c532 "MIPS: init upper 64b of vector
registers when MSA is first used", which this patch should have
preceeded.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
Changes in v2:
  - Rebase atop v3.19-rc6.
---
 arch/mips/include/asm/asmmacro.h | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index a4a5ec8..34f9757 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -225,35 +225,35 @@
 	.set	pop
 	.endm
 
-	.macro	copy_u_w	rd, ws, n
+	.macro	copy_u_w	ws, n
 	.set	push
 	.set	mips32r2
 	.set	msa
-	copy_u.w \rd, $w\ws[\n]
+	copy_u.w $1, $w\ws[\n]
 	.set	pop
 	.endm
 
-	.macro	copy_u_d	rd, ws, n
+	.macro	copy_u_d	ws, n
 	.set	push
 	.set	mips64r2
 	.set	msa
-	copy_u.d \rd, $w\ws[\n]
+	copy_u.d $1, $w\ws[\n]
 	.set	pop
 	.endm
 
-	.macro	insert_w	wd, n, rs
+	.macro	insert_w	wd, n
 	.set	push
 	.set	mips32r2
 	.set	msa
-	insert.w $w\wd[\n], \rs
+	insert.w $w\wd[\n], $1
 	.set	pop
 	.endm
 
-	.macro	insert_d	wd, n, rs
+	.macro	insert_d	wd, n
 	.set	push
 	.set	mips64r2
 	.set	msa
-	insert.d $w\wd[\n], \rs
+	insert.d $w\wd[\n], $1
 	.set	pop
 	.endm
 #else
@@ -318,40 +318,36 @@
 	.set	pop
 	.endm
 
-	.macro	copy_u_w	rd, ws, n
+	.macro	copy_u_w	ws, n
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
 	.insn
 	.word	COPY_UW_MSA_INSN | (\n << 16) | (\ws << 11)
-	move	\rd, $1
 	.set	pop
 	.endm
 
-	.macro	copy_u_d	rd, ws, n
+	.macro	copy_u_d	ws, n
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
 	.insn
 	.word	COPY_UD_MSA_INSN | (\n << 16) | (\ws << 11)
-	move	\rd, $1
 	.set	pop
 	.endm
 
-	.macro	insert_w	wd, n, rs
+	.macro	insert_w	wd, n
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
-	move	$1, \rs
 	.word	INSERT_W_MSA_INSN | (\n << 16) | (\wd << 6)
 	.set	pop
 	.endm
 
-	.macro	insert_d	wd, n, rs
+	.macro	insert_d	wd, n
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
-	move	$1, \rs
 	.word	INSERT_D_MSA_INSN | (\n << 16) | (\wd << 6)
 	.set	pop
 	.endm
-- 
2.2.2
