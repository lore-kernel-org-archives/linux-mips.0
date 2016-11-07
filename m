Received: from mailapp01.imgtec.com ([195.59.15.196]:2883 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991986AbcKGLsdrmXks (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:48:33 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 05/10] MIPS: Export _mcount alongside its definition
Date: Mon, 7 Nov 2016 11:48:04 +0000
Message-ID: <20161107114804.22409-1-paul.burton@imgtec.com>
In-Reply-To: <20161107111417.11486-6-paul.burton@imgtec.com>
References: <20161107111417.11486-6-paul.burton@imgtec.com>
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
Message-ID: <20161107114804.2G2ItVdUPgk9w7TGl0edl5qUOpS7ByaZoGVz3mY6Ec8@z>

Now that EXPORT_SYMBOL can be used from assembly source, move the
EXPORT_SYMBOL invocation for _mcount to be alongside its definition.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v2:
- Inlcude asm/export.h

 arch/mips/kernel/mcount.S     | 3 +++
 arch/mips/kernel/mips_ksyms.c | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
index 2f7c734..f2ee7e1 100644
--- a/arch/mips/kernel/mcount.S
+++ b/arch/mips/kernel/mcount.S
@@ -10,6 +10,7 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
+#include <asm/export.h>
 #include <asm/regdef.h>
 #include <asm/stackframe.h>
 #include <asm/ftrace.h>
@@ -66,6 +67,7 @@
 NESTED(ftrace_caller, PT_SIZE, ra)
 	.globl _mcount
 _mcount:
+EXPORT_SYMBOL(_mcount)
 	b	ftrace_stub
 #ifdef CONFIG_32BIT
 	 addiu sp,sp,8
@@ -114,6 +116,7 @@ ftrace_stub:
 #else	/* ! CONFIG_DYNAMIC_FTRACE */
 
 NESTED(_mcount, PT_SIZE, ra)
+EXPORT_SYMBOL(_mcount)
 	PTR_LA	t1, ftrace_stub
 	PTR_L	t2, ftrace_trace_function /* Prepare t2 for (1) */
 	bne	t1, t2, static_trace
diff --git a/arch/mips/kernel/mips_ksyms.c b/arch/mips/kernel/mips_ksyms.c
index 84f169b..d12d243 100644
--- a/arch/mips/kernel/mips_ksyms.c
+++ b/arch/mips/kernel/mips_ksyms.c
@@ -80,7 +80,3 @@ EXPORT_SYMBOL(__csum_partial_copy_from_user);
 #endif
 
 EXPORT_SYMBOL(invalid_pte_table);
-#ifdef CONFIG_FUNCTION_TRACER
-/* _mcount is defined in arch/mips/kernel/mcount.S */
-EXPORT_SYMBOL(_mcount);
-#endif
-- 
2.10.2
