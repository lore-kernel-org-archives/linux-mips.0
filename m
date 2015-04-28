Received: from mailapp01.imgtec.com ([195.59.15.196]:64134 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007495AbbD1TxnDrSX9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 21:53:43 +0200
Subject: [PATCH] MIPS64: R6: R2 emulation bugfix
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Tue, 28 Apr 2015 12:53:35 -0700
Message-ID: <20150428195335.11229.4516.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, macro@linux-mips.org, markos.chandras@imgtec.com, ralf@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150428195335.mcuKRaF9hyjrRN52MM6CgblNaxoXtRjzSUxllgXyKxU@z>

Error recovery pointers for fixups was improperly set as ".word"
which is unsuitable for MIPS64.

Replaced by __stringify(PTR)

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/kernel/mips-r2-to-r6-emul.c |  104 +++++++++++++++++----------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
index f2977f00911b..c6f079f8f3dc 100644
--- a/arch/mips/kernel/mips-r2-to-r6-emul.c
+++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
@@ -1250,10 +1250,10 @@ fpu_emul:
 			"	j	10b\n"
 			"	.previous\n"
 			"	.section	__ex_table,\"a\"\n"
-			"	.word	1b,8b\n"
-			"	.word	2b,8b\n"
-			"	.word	3b,8b\n"
-			"	.word	4b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
 			"	.previous\n"
 			"	.set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1325,10 +1325,10 @@ fpu_emul:
 			"	j	10b\n"
 			"       .previous\n"
 			"	.section	__ex_table,\"a\"\n"
-			"	.word	1b,8b\n"
-			"	.word	2b,8b\n"
-			"	.word	3b,8b\n"
-			"	.word	4b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
 			"	.previous\n"
 			"	.set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1396,10 +1396,10 @@ fpu_emul:
 			"	j	9b\n"
 			"	.previous\n"
 			"	.section        __ex_table,\"a\"\n"
-			"	.word	1b,8b\n"
-			"	.word	2b,8b\n"
-			"	.word	3b,8b\n"
-			"	.word	4b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
 			"	.previous\n"
 			"	.set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1466,10 +1466,10 @@ fpu_emul:
 			"	j	9b\n"
 			"	.previous\n"
 			"	.section        __ex_table,\"a\"\n"
-			"	.word	1b,8b\n"
-			"	.word	2b,8b\n"
-			"	.word	3b,8b\n"
-			"	.word	4b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
 			"	.previous\n"
 			"	.set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1581,14 +1581,14 @@ fpu_emul:
 			"	j	9b\n"
 			"	.previous\n"
 			"	.section        __ex_table,\"a\"\n"
-			"	.word	1b,8b\n"
-			"	.word	2b,8b\n"
-			"	.word	3b,8b\n"
-			"	.word	4b,8b\n"
-			"	.word	5b,8b\n"
-			"	.word	6b,8b\n"
-			"	.word	7b,8b\n"
-			"	.word	0b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
+			__stringify(PTR) " 5b,8b\n"
+			__stringify(PTR) " 6b,8b\n"
+			__stringify(PTR) " 7b,8b\n"
+			__stringify(PTR) " 0b,8b\n"
 			"	.previous\n"
 			"	.set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1700,14 +1700,14 @@ fpu_emul:
 			"	j      9b\n"
 			"	.previous\n"
 			"	.section        __ex_table,\"a\"\n"
-			"	.word  1b,8b\n"
-			"	.word  2b,8b\n"
-			"	.word  3b,8b\n"
-			"	.word  4b,8b\n"
-			"	.word  5b,8b\n"
-			"	.word  6b,8b\n"
-			"	.word  7b,8b\n"
-			"	.word  0b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
+			__stringify(PTR) " 5b,8b\n"
+			__stringify(PTR) " 6b,8b\n"
+			__stringify(PTR) " 7b,8b\n"
+			__stringify(PTR) " 0b,8b\n"
 			"	.previous\n"
 			"	.set    pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1819,14 +1819,14 @@ fpu_emul:
 			"	j	9b\n"
 			"	.previous\n"
 			"	.section        __ex_table,\"a\"\n"
-			"	.word	1b,8b\n"
-			"	.word	2b,8b\n"
-			"	.word	3b,8b\n"
-			"	.word	4b,8b\n"
-			"	.word	5b,8b\n"
-			"	.word	6b,8b\n"
-			"	.word	7b,8b\n"
-			"	.word	0b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
+			__stringify(PTR) " 5b,8b\n"
+			__stringify(PTR) " 6b,8b\n"
+			__stringify(PTR) " 7b,8b\n"
+			__stringify(PTR) " 0b,8b\n"
 			"	.previous\n"
 			"	.set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1937,14 +1937,14 @@ fpu_emul:
 			"       j	9b\n"
 			"       .previous\n"
 			"       .section        __ex_table,\"a\"\n"
-			"       .word	1b,8b\n"
-			"       .word	2b,8b\n"
-			"       .word	3b,8b\n"
-			"       .word	4b,8b\n"
-			"       .word	5b,8b\n"
-			"       .word	6b,8b\n"
-			"       .word	7b,8b\n"
-			"       .word	0b,8b\n"
+			__stringify(PTR) " 1b,8b\n"
+			__stringify(PTR) " 2b,8b\n"
+			__stringify(PTR) " 3b,8b\n"
+			__stringify(PTR) " 4b,8b\n"
+			__stringify(PTR) " 5b,8b\n"
+			__stringify(PTR) " 6b,8b\n"
+			__stringify(PTR) " 7b,8b\n"
+			__stringify(PTR) " 0b,8b\n"
 			"       .previous\n"
 			"       .set	pop\n"
 			: "+&r"(rt), "=&r"(rs),
@@ -1999,7 +1999,7 @@ fpu_emul:
 			"j	2b\n"
 			".previous\n"
 			".section        __ex_table,\"a\"\n"
-			".word  1b, 3b\n"
+			__stringify(PTR) " 1b,3b\n"
 			".previous\n"
 			: "=&r"(res), "+&r"(err)
 			: "r"(vaddr), "i"(SIGSEGV)
@@ -2057,7 +2057,7 @@ fpu_emul:
 			"j	2b\n"
 			".previous\n"
 			".section        __ex_table,\"a\"\n"
-			".word	1b, 3b\n"
+			__stringify(PTR) " 1b,3b\n"
 			".previous\n"
 			: "+&r"(res), "+&r"(err)
 			: "r"(vaddr), "i"(SIGSEGV));
@@ -2118,7 +2118,7 @@ fpu_emul:
 			"j	2b\n"
 			".previous\n"
 			".section        __ex_table,\"a\"\n"
-			".word  1b, 3b\n"
+			__stringify(PTR) " 1b,3b\n"
 			".previous\n"
 			: "=&r"(res), "+&r"(err)
 			: "r"(vaddr), "i"(SIGSEGV)
@@ -2181,7 +2181,7 @@ fpu_emul:
 			"j	2b\n"
 			".previous\n"
 			".section        __ex_table,\"a\"\n"
-			".word	1b, 3b\n"
+			__stringify(PTR) " 1b,3b\n"
 			".previous\n"
 			: "+&r"(res), "+&r"(err)
 			: "r"(vaddr), "i"(SIGSEGV));
