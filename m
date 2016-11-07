Received: from mailapp01.imgtec.com ([195.59.15.196]:5151 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991984AbcKGLPZ4ayyd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:15:25 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/10] MIPS: End asm function prologue macros with .insn
Date: Mon, 7 Nov 2016 11:14:09 +0000
Message-ID: <20161107111417.11486-4-paul.burton@imgtec.com>
In-Reply-To: <20161107111417.11486-1-paul.burton@imgtec.com>
References: <20161107111417.11486-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161107111409.wLDQ5lrNFsfnIeCe4nHDfEu_yeZShppc2ZbTWQnD4wk@z>

When building a kernel targeting a microMIPS ISA, recent GNU linkers
will fail the link if they cannot determine that the target of a branch
or jump is microMIPS code, with errors such as the following:

    mips-img-linux-gnu-ld: arch/mips/built-in.o: .text+0x542c:
    Unsupported jump between ISA modes; consider recompiling with
    interlinking enabled.
    mips-img-linux-gnu-ld: final link failed: Bad value

or:

    ./arch/mips/include/asm/uaccess.h:1017: warning: JALX to a
    non-word-aligned address

Placing anything other than an instruction at the start of a function
written in assembly appears to trigger such errors. In order to prepare
for allowing us to follow function prologue macros with an EXPORT_SYMBOL
invocation, end the prologue macros (LEAD, NESTED & FEXPORT) with a
.insn directive. This ensures that the start of the function is marked
as code, which always makes sense for functions & safely prevents us
from hitting the link errors described above.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/asm.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 7c26b28..859cf70 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -54,7 +54,8 @@
 		.align	2;				\
 		.type	symbol, @function;		\
 		.ent	symbol, 0;			\
-symbol:		.frame	sp, 0, ra
+symbol:		.frame	sp, 0, ra;			\
+		.insn
 
 /*
  * NESTED - declare nested routine entry point
@@ -63,8 +64,9 @@ symbol:		.frame	sp, 0, ra
 		.globl	symbol;				\
 		.align	2;				\
 		.type	symbol, @function;		\
-		.ent	symbol, 0;			 \
-symbol:		.frame	sp, framesize, rpc
+		.ent	symbol, 0;			\
+symbol:		.frame	sp, framesize, rpc;		\
+		.insn
 
 /*
  * END - mark end of function
@@ -86,7 +88,7 @@ symbol:		.frame	sp, framesize, rpc
 #define FEXPORT(symbol)					\
 		.globl	symbol;				\
 		.type	symbol, @function;		\
-symbol:
+symbol:		.insn
 
 /*
  * ABS - export absolute symbol
-- 
2.10.2
