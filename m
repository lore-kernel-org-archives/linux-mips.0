Received: from mailapp01.imgtec.com ([195.59.15.196]:40709 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009507AbaIXJqnTeRF8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Sep 2014 11:46:43 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id CEDD6F02D25FF
        for <linux-mips@linux-mips.org>; Wed, 24 Sep 2014 10:46:34 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/11] MIPS: remove MSA macro recursion
Date: Wed, 24 Sep 2014 10:45:34 +0100
Message-ID: <1411551942-11153-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140924094534.dWoyn2E6JJ0mWRZUhFsRBVbY3RU9fKW-18WWcohcifk@z>

Recursive macros made the code more concise & worked great for the
case where the toolchain doesn't support MSA. However, with toolchains
which do support MSA they lead to build failures such as:

  arch/mips/kernel/r4k_switch.S: Assembler messages:
  arch/mips/kernel/r4k_switch.S:148: Error: invalid operands `insert.w $w(0+1)[2],$1'
  arch/mips/kernel/r4k_switch.S:148: Error: invalid operands `insert.w $w(0+1)[3],$1'
  arch/mips/kernel/r4k_switch.S:148: Error: invalid operands `insert.w $w((0+1)+1)[2],$1'
  arch/mips/kernel/r4k_switch.S:148: Error: invalid operands `insert.w $w((0+1)+1)[3],$1'
  ...

Drop the recursion from msa_init_all_upper invoking the msa_init_upper
macro explicitly for each vector register.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/asmmacro.h | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 7e4aaeb..62c4af9 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -425,9 +425,6 @@
 	insert_w \wd, 2
 	insert_w \wd, 3
 #endif
-	.if	31-\wd
-	msa_init_upper	(\wd+1)
-	.endif
 	.endm
 
 	.macro	msa_init_all_upper
@@ -435,6 +432,37 @@
 	.set	noat
 	not	$1, zero
 	msa_init_upper	0
+	msa_init_upper	1
+	msa_init_upper	2
+	msa_init_upper	3
+	msa_init_upper	4
+	msa_init_upper	5
+	msa_init_upper	6
+	msa_init_upper	7
+	msa_init_upper	8
+	msa_init_upper	9
+	msa_init_upper	10
+	msa_init_upper	11
+	msa_init_upper	12
+	msa_init_upper	13
+	msa_init_upper	14
+	msa_init_upper	15
+	msa_init_upper	16
+	msa_init_upper	17
+	msa_init_upper	18
+	msa_init_upper	19
+	msa_init_upper	20
+	msa_init_upper	21
+	msa_init_upper	22
+	msa_init_upper	23
+	msa_init_upper	24
+	msa_init_upper	25
+	msa_init_upper	26
+	msa_init_upper	27
+	msa_init_upper	28
+	msa_init_upper	29
+	msa_init_upper	30
+	msa_init_upper	31
 	.set	pop
 	.endm
 
-- 
2.0.4
