Received: from mailapp01.imgtec.com ([195.59.15.196]:57609 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993876AbdBNOhWXG9oI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Feb 2017 15:37:22 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 3/4] MIPS: uasm: Constify insn_table
Date: Tue, 14 Feb 2017 14:37:07 +0000
Message-ID: <1487083028-19724-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1487083028-19724-1-git-send-email-matt.redfearn@imgtec.com>
References: <1487083028-19724-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20170214143707.1aQnAwZUpGDQjVap_-1VAR6rPiBoJorpOs_lPPif2RI@z>

The insn_table is an array of constant structures and as such should be
declared const.

This change saves 1088 bytes of kernel text at the expense of 64 bytes
of kernel data on a pistachio_defconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
7187103	1772760	 470224	9430087	 8fe447	vmlinux
After:
   text	   data	    bss	    dec	    hex	filename
7186015	1772824	 470224	9429063	 8fe047	vmlinux

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/mm/uasm-mips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/uasm-mips.c b/arch/mips/mm/uasm-mips.c
index 763d3f1edb8a..17a7fc4dae8d 100644
--- a/arch/mips/mm/uasm-mips.c
+++ b/arch/mips/mm/uasm-mips.c
@@ -48,7 +48,7 @@
 
 #include "uasm.c"
 
-static struct insn insn_table[] = {
+static const struct insn insn_table[] = {
 	{ insn_addiu, M(addiu_op, 0, 0, 0, 0, 0), RS | RT | SIMM },
 	{ insn_addu, M(spec_op, 0, 0, 0, 0, addu_op), RS | RT | RD },
 	{ insn_andi, M(andi_op, 0, 0, 0, 0, 0), RS | RT | UIMM },
@@ -195,7 +195,7 @@ static inline u32 build_jimm(u32 arg)
  */
 static void build_insn(u32 **buf, enum opcode opc, ...)
 {
-	struct insn *ip = NULL;
+	const struct insn *ip = NULL;
 	unsigned int i;
 	va_list ap;
 	u32 op;
-- 
2.7.4
