Received: from mail-by2nam03on0085.outbound.protection.outlook.com ([104.47.42.85]:1314
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992897AbcHPGXMC6yy9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 16 Aug 2016 08:23:12 +0200
From: Alex Belits <alex.belits@cavium.com>
Subject: [PATCH 2/3] mips: 48bit: A part of 48 bit virtual address space support. Formatting and comment changes.
Date: Mon, 15 Aug 2016 23:22:55 -0700
Message-ID: <1471328576-16758-3-git-send-email-alex.belits@cavium.com>
In-Reply-To: <1471328576-16758-1-git-send-email-alex.belits@cavium.com>
References: <1471328576-16758-1-git-send-email-alex.belits@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Alex.Belits@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: alex.belits@cavium.com
Cc: David Saney <ddaney@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160816062255.MoDaiQ1rufEmgTrVG6856SV_cW2oHs8L6Jpgpn8wWyk@z>

This is a set of patches to add 48-bit virtual address space support on 
MIPS to the kernel 3.10. It includes a port of existing patch for page 
size 16k and 64k, plus support for 4-level page table for the rest of 
the supported page sizes.

Cc: David Saney <ddaney@caviumnetworks.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org

Signed-off-by: Alex Belits <alex.belits@cavium.com>
---
 arch/mips/include/asm/pgtable-64.h | 14 +++++++-------
 arch/mips/include/asm/processor.h  |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index a86bb73..e9805ad 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -45,7 +45,7 @@
 
 /* PGDIR_SHIFT determines what a third-level page table entry can map */
 #ifdef __PAGETABLE_PMD_FOLDED
-#define PGDIR_SHIFT	(PAGE_SHIFT + PAGE_SHIFT + PTE_ORDER - 3)
+#define PGDIR_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT + PTE_ORDER - 3))
 #else
 
 /* PMD_SHIFT determines the size of the area a second-level page table can map */
@@ -60,7 +60,7 @@
 #define PGDIR_MASK	(~(PGDIR_SIZE-1))
 
 /*
- * For 4kB page size we use a 3 level page tree and an 8kB pud, which
+ * For 4kB page size we use a 3 level page tree and an 8kB pgd, which
  * permits us mapping 40 bits of virtual address space.
  *
  * We used to implement 41 bits by having an order 1 pmd level but that seemed
@@ -70,8 +70,8 @@
  * 8TB of address space.  Alternatively a 33-bit / 8GB organization using
  * two levels would be easy to implement.
  *
- * For 16kB page size we use a 2 level page tree which permits a total of
- * 36 bits of virtual address space.  We could add a third level but it seems
+ * For 16kB page size we use a 3 level page tree which permits a total of
+ * 47 bits of virtual address space.  We could add a third level but it seems
  * like at the moment there's no need for this.
  *
  * For 64kB page size we use a 2 level page table tree for a total of 42 bits
@@ -91,9 +91,9 @@
 #endif
 #ifdef CONFIG_PAGE_SIZE_16KB
 #ifdef CONFIG_MIPS_VA_BITS_48
-#define PGD_ORDER               1
+#define PGD_ORDER		1
 #else
-#define PGD_ORDER               0
+#define PGD_ORDER		0
 #endif
 #define PUD_ORDER		aieeee_attempt_to_allocate_pud
 #define PMD_ORDER		0
@@ -122,7 +122,7 @@
 #endif
 #define PTRS_PER_PTE	((PAGE_SIZE << PTE_ORDER) / sizeof(pte_t))
 
-#define USER_PTRS_PER_PGD       ((TASK_SIZE64 / PGDIR_SIZE)?(TASK_SIZE64 / PGDIR_SIZE):1)
+#define USER_PTRS_PER_PGD	((TASK_SIZE64 / PGDIR_SIZE) ? (TASK_SIZE64 / PGDIR_SIZE) : 1)
 #define FIRST_USER_ADDRESS	0UL
 
 /*
diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index fc1c0af..083a56f 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -72,7 +72,7 @@ extern unsigned int vced_count, vcei_count;
  */
 #define TASK_SIZE32	0x7fff8000UL
 #ifdef CONFIG_MIPS_VA_BITS_48
-#define TASK_SIZE64     (0x1UL << ((cpu_data[0].vmbits>48)?48:cpu_data[0].vmbits))
+#define TASK_SIZE64	(0x1UL << ((cpu_data[0].vmbits > 48) ? 48 : cpu_data[0].vmbits))
 #else
 #define TASK_SIZE64     0x10000000000UL
 #endif
-- 
2.8.1
