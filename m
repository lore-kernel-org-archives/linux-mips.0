Received: from mailapp01.imgtec.com ([195.59.15.196]:34557 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992029AbcKGLQIUmOVd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:16:08 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 06/10] MIPS: Export invalid_pte_table alongside its definition
Date: Mon, 7 Nov 2016 11:14:12 +0000
Message-ID: <20161107111417.11486-7-paul.burton@imgtec.com>
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
Message-ID: <20161107111412.55GEhCnovm7l5g24PBcG5eXznHcoL05CxsZyx1_9PuE@z>

It's unclear to me why this wasn't always the case, but move the
EXPORT_SYMBOL invocation for invalid_pte_table to be alongside its
definition.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/mips_ksyms.c | 2 --
 arch/mips/mm/init.c           | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mips_ksyms.c b/arch/mips/kernel/mips_ksyms.c
index d12d243..ed571bc 100644
--- a/arch/mips/kernel/mips_ksyms.c
+++ b/arch/mips/kernel/mips_ksyms.c
@@ -78,5 +78,3 @@ EXPORT_SYMBOL(__csum_partial_copy_kernel);
 EXPORT_SYMBOL(__csum_partial_copy_to_user);
 EXPORT_SYMBOL(__csum_partial_copy_from_user);
 #endif
-
-EXPORT_SYMBOL(invalid_pte_table);
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 3a6edec..e827521 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -30,6 +30,7 @@
 #include <linux/hardirq.h>
 #include <linux/gfp.h>
 #include <linux/kcore.h>
+#include <linux/export.h>
 
 #include <asm/asm-offsets.h>
 #include <asm/bootinfo.h>
@@ -540,3 +541,4 @@ pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
 pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
 #endif
 pte_t invalid_pte_table[PTRS_PER_PTE] __page_aligned_bss;
+EXPORT_SYMBOL(invalid_pte_table);
-- 
2.10.2
