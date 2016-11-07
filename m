Received: from mailapp01.imgtec.com ([195.59.15.196]:57348 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991986AbcKGLPkOdTyd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:15:40 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/10] MIPS: Export _save_fp & _save_msa alongside their definitions
Date: Mon, 7 Nov 2016 11:14:10 +0000
Message-ID: <20161107111417.11486-5-paul.burton@imgtec.com>
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
Message-ID: <20161107111410.7aj_zin-ulNkcFxXUZDI7ZZ2LnoTVoWi1aPLDjKMueY@z>

Now that EXPORT_SYMBOL can be used from assembly source, move the
EXPORT_SYMBOL invocations for _save_fp & _save_msa to be alongside their
definitions.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/mips_ksyms.c   | 8 --------
 arch/mips/kernel/r2300_switch.S | 2 ++
 arch/mips/kernel/r4k_switch.S   | 3 +++
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/mips_ksyms.c b/arch/mips/kernel/mips_ksyms.c
index e2b6ab7..84f169b 100644
--- a/arch/mips/kernel/mips_ksyms.c
+++ b/arch/mips/kernel/mips_ksyms.c
@@ -35,14 +35,6 @@ extern long __strnlen_user_nocheck_asm(const char *s);
 extern long __strnlen_user_asm(const char *s);
 
 /*
- * Core architecture code
- */
-EXPORT_SYMBOL_GPL(_save_fp);
-#ifdef CONFIG_CPU_HAS_MSA
-EXPORT_SYMBOL_GPL(_save_msa);
-#endif
-
-/*
  * String functions
  */
 EXPORT_SYMBOL(memset);
diff --git a/arch/mips/kernel/r2300_switch.S b/arch/mips/kernel/r2300_switch.S
index ac27ef7..1049eea 100644
--- a/arch/mips/kernel/r2300_switch.S
+++ b/arch/mips/kernel/r2300_switch.S
@@ -12,6 +12,7 @@
  */
 #include <asm/asm.h>
 #include <asm/cachectl.h>
+#include <asm/export.h>
 #include <asm/fpregdef.h>
 #include <asm/mipsregs.h>
 #include <asm/asm-offsets.h>
@@ -72,6 +73,7 @@ LEAF(resume)
  * Save a thread's fp context.
  */
 LEAF(_save_fp)
+EXPORT_SYMBOL(_save_fp)
 	fpu_save_single a0, t1			# clobbers t1
 	jr	ra
 	END(_save_fp)
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 2f0a3b2..7585778 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -12,6 +12,7 @@
  */
 #include <asm/asm.h>
 #include <asm/cachectl.h>
+#include <asm/export.h>
 #include <asm/fpregdef.h>
 #include <asm/mipsregs.h>
 #include <asm/asm-offsets.h>
@@ -75,6 +76,7 @@
  * Save a thread's fp context.
  */
 LEAF(_save_fp)
+EXPORT_SYMBOL(_save_fp)
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2) || \
 		defined(CONFIG_CPU_MIPS32_R6)
 	mfc0	t0, CP0_STATUS
@@ -101,6 +103,7 @@ LEAF(_restore_fp)
  * Save a thread's MSA vector context.
  */
 LEAF(_save_msa)
+EXPORT_SYMBOL(_save_msa)
 	msa_save_all	a0
 	jr	ra
 	END(_save_msa)
-- 
2.10.2
