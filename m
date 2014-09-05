Received: from mailapp01.imgtec.com ([195.59.15.196]:6909 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025890AbaIEBEFYR5KR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 5 Sep 2014 03:04:05 +0200
Subject: [PATCH 2/3] MIPS: PTE bit positions slightly changed to prepare a
        more simple swap/file presentation
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Thu, 4 Sep 2014 18:03:55 -0700
Message-ID: <20140905010355.15448.20937.stgit@linux-yegoshin>
In-Reply-To: <20140905010124.15448.53707.stgit@linux-yegoshin>
References: <20140905010124.15448.53707.stgit@linux-yegoshin>
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
To: linux-mips@linux-mips.org, hauke@hauke-m.de, yanh@lemote.com, zajec5@gmail.com, ralf@linux-mips.org, alex.smith@imgtec.com, taohl@lemote.com, chenhc@lemote.com
Message-ID: <20140905010355.xAuMv8qm_AqF6GU0ra-S_BMFER5LdP3ul0bUhs1PRJA@z>

Bit _PAGE_MODIFIED (= _PAGE_FILE) in PTE is moved close to _PAGE_PRESENT.
It allows a more compact bit grouping of V,G and F,P - PTE File entry uses
all available bits besides V/G/F and P to keep page offset in file.

This grouping is needed for subsequent bugfix patch of invalid overlapping
_PAGE_FILE, _PAGE_VALID etc bits with other bits used for file offset.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/pgtable-bits.h |   74 +++++++++++++++++-----------------
 1 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index 4183771..d47be80 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -55,16 +55,15 @@
  */
 #define _PAGE_PRESENT_SHIFT	6
 #define _PAGE_PRESENT		(1 << _PAGE_PRESENT_SHIFT)
-#define _PAGE_READ_SHIFT	7
+#define _PAGE_MODIFIED_SHIFT	7
+#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
+#define _PAGE_FILE		(1 << _PAGE_MODIFIED_SHIFT)
+#define _PAGE_READ_SHIFT	8
 #define _PAGE_READ		(1 << _PAGE_READ_SHIFT)
-#define _PAGE_WRITE_SHIFT	8
+#define _PAGE_WRITE_SHIFT	9
 #define _PAGE_WRITE		(1 << _PAGE_WRITE_SHIFT)
-#define _PAGE_ACCESSED_SHIFT	9
+#define _PAGE_ACCESSED_SHIFT	10
 #define _PAGE_ACCESSED		(1 << _PAGE_ACCESSED_SHIFT)
-#define _PAGE_MODIFIED_SHIFT	10
-#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
-
-#define _PAGE_FILE		(1 << 10)
 
 #elif defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 
@@ -75,16 +74,16 @@
  */
 #define _PAGE_PRESENT_SHIFT	0
 #define _PAGE_PRESENT		(1 <<  _PAGE_PRESENT_SHIFT)
-#define _PAGE_READ_SHIFT	1
+#define _PAGE_MODIFIED_SHIFT	1
+#define _PAGE_MODIFIED		(1 <<  _PAGE_MODIFIED_SHIFT)
+#define _PAGE_FILE_SHIFT	1
+#define _PAGE_FILE		(1 <<  _PAGE_FILE_SHIFT)
+#define _PAGE_READ_SHIFT	2
 #define _PAGE_READ		(1 <<  _PAGE_READ_SHIFT)
-#define _PAGE_WRITE_SHIFT	2
+#define _PAGE_WRITE_SHIFT	3
 #define _PAGE_WRITE		(1 <<  _PAGE_WRITE_SHIFT)
-#define _PAGE_ACCESSED_SHIFT	3
+#define _PAGE_ACCESSED_SHIFT	4
 #define _PAGE_ACCESSED		(1 <<  _PAGE_ACCESSED_SHIFT)
-#define _PAGE_MODIFIED_SHIFT	4
-#define _PAGE_MODIFIED		(1 <<  _PAGE_MODIFIED_SHIFT)
-#define _PAGE_FILE_SHIFT	4
-#define _PAGE_FILE		(1 <<  _PAGE_FILE_SHIFT)
 
 /*
  * And these are the hardware TLB bits
@@ -120,22 +119,23 @@
  */
 #define _PAGE_PRESENT_SHIFT	(0)
 #define _PAGE_PRESENT		(1 << _PAGE_PRESENT_SHIFT)
-#define _PAGE_READ_SHIFT	(cpu_has_rixi ? _PAGE_PRESENT_SHIFT : _PAGE_PRESENT_SHIFT + 1)
+#define _PAGE_MODIFIED_SHIFT	(_PAGE_PRESENT_SHIFT + 1)
+#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
+#define _PAGE_FILE		(_PAGE_MODIFIED)
+#define _PAGE_READ_SHIFT	\
+		(cpu_has_rixi ? _PAGE_MODIFIED_SHIFT : _PAGE_MODIFIED_SHIFT + 1)
 #define _PAGE_READ ({BUG_ON(cpu_has_rixi); 1 << _PAGE_READ_SHIFT; })
 #define _PAGE_WRITE_SHIFT	(_PAGE_READ_SHIFT + 1)
 #define _PAGE_WRITE		(1 << _PAGE_WRITE_SHIFT)
 #define _PAGE_ACCESSED_SHIFT	(_PAGE_WRITE_SHIFT + 1)
 #define _PAGE_ACCESSED		(1 << _PAGE_ACCESSED_SHIFT)
-#define _PAGE_MODIFIED_SHIFT	(_PAGE_ACCESSED_SHIFT + 1)
-#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
-#define _PAGE_FILE		(_PAGE_MODIFIED)
 
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 /* huge tlb page */
-#define _PAGE_HUGE_SHIFT	(_PAGE_MODIFIED_SHIFT + 1)
+#define _PAGE_HUGE_SHIFT	(_PAGE_ACCESSED_SHIFT + 1)
 #define _PAGE_HUGE		(1 << _PAGE_HUGE_SHIFT)
 #else
-#define _PAGE_HUGE_SHIFT	(_PAGE_MODIFIED_SHIFT)
+#define _PAGE_HUGE_SHIFT	(_PAGE_ACCESSED_SHIFT)
 #define _PAGE_HUGE		({BUG(); 1; })	/* Dummy value */
 #endif
 
@@ -165,7 +165,7 @@
 #ifdef CONFIG_64BIT
 
 /*
- * Low bits are: CCC D V G RI XI [S H] M A W R P
+ * Low bits are: CCC D V G RI XI [S H] A W R M(=F) P
  * TLB refill will do a ROTR 7/9 (in case of cpu_has_rixi),
  * or SRL/DSRL 7/9 to strip low bits.
  * PFN size in high bits is 49 or 51 bit --> 512TB or 4*512TB for 4KB pages
@@ -173,6 +173,11 @@
 
 #define _PAGE_PRESENT_SHIFT	(0)
 #define _PAGE_PRESENT		(1 << _PAGE_PRESENT_SHIFT)
+/* implemented in software */
+#define _PAGE_MODIFIED_SHIFT	(_PAGE_PRESENT_SHIFT + 1)
+#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
+/* set:pagecache unset:swap */
+#define _PAGE_FILE		(_PAGE_MODIFIED)
 /* implemented in software, should be unused if cpu_has_rixi. */
 #define _PAGE_READ_SHIFT	(_PAGE_PRESENT_SHIFT + 1)
 #define _PAGE_READ		(1 << _PAGE_READ_SHIFT)
@@ -182,20 +187,15 @@
 /* implemented in software */
 #define _PAGE_ACCESSED_SHIFT	(_PAGE_WRITE_SHIFT + 1)
 #define _PAGE_ACCESSED		(1 << _PAGE_ACCESSED_SHIFT)
-/* implemented in software */
-#define _PAGE_MODIFIED_SHIFT	(_PAGE_ACCESSED_SHIFT + 1)
-#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
-/* set:pagecache unset:swap */
-#define _PAGE_FILE		(_PAGE_MODIFIED)
 
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 /* huge tlb page */
-#define _PAGE_HUGE_SHIFT	(_PAGE_MODIFIED_SHIFT + 1)
+#define _PAGE_HUGE_SHIFT	(_PAGE_ACCESSED_SHIFT + 1)
 #define _PAGE_HUGE		(1 << _PAGE_HUGE_SHIFT)
 #define _PAGE_SPLITTING_SHIFT	(_PAGE_HUGE_SHIFT + 1)
 #define _PAGE_SPLITTING		(1 << _PAGE_SPLITTING_SHIFT)
 #else
-#define _PAGE_HUGE_SHIFT	(_PAGE_MODIFIED_SHIFT)
+#define _PAGE_HUGE_SHIFT	(_PAGE_ACCESSED_SHIFT)
 #define _PAGE_HUGE		({BUG(); 1; })	/* Dummy value */
 #define _PAGE_SPLITTING_SHIFT	(_PAGE_HUGE_SHIFT)
 #define _PAGE_SPLITTING		({BUG(); 1; })	/* Dummy value */
@@ -213,28 +213,28 @@
 
 /*
  * No HUGE page support
- * Low bits are: CCC D V G RI(=R) XI M A W P
+ * Low bits are: CCC D V G RI(=R) XI A W M(=F) P
  * TLB refill will do a ROTR 6 (in case of cpu_has_rixi),
  * or SRL 6 to strip low bits.
- * All 20 bits PFN are preserved in high bits (4GB in 4KB pages)
+ * All 20 bits PFN are preserved in high bits (4GB with 4KB pages)
  */
 
 #define _PAGE_PRESENT_SHIFT	(0)
 #define _PAGE_PRESENT		(1 << _PAGE_PRESENT_SHIFT)
 /* implemented in software */
-#define _PAGE_WRITE_SHIFT	(_PAGE_PRESENT_SHIFT + 1)
+#define _PAGE_MODIFIED_SHIFT	(_PAGE_PRESENT_SHIFT + 1)
+#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
+/* set:pagecache unset:swap */
+#define _PAGE_FILE		(_PAGE_MODIFIED)
+/* implemented in software */
+#define _PAGE_WRITE_SHIFT	(_PAGE_MODIFIED_SHIFT + 1)
 #define _PAGE_WRITE		(1 << _PAGE_WRITE_SHIFT)
 /* implemented in software */
 #define _PAGE_ACCESSED_SHIFT	(_PAGE_WRITE_SHIFT + 1)
 #define _PAGE_ACCESSED		(1 << _PAGE_ACCESSED_SHIFT)
-/* implemented in software */
-#define _PAGE_MODIFIED_SHIFT	(_PAGE_ACCESSED_SHIFT + 1)
-#define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
-/* set:pagecache unset:swap */
-#define _PAGE_FILE		(_PAGE_MODIFIED)
 
 /* huge tlb page dummies */
-#define _PAGE_HUGE_SHIFT	(_PAGE_MODIFIED_SHIFT)
+#define _PAGE_HUGE_SHIFT	(_PAGE_ACCESSED_SHIFT)
 #define _PAGE_HUGE		({BUG(); 1; })	/* Dummy value */
 #define _PAGE_SPLITTING_SHIFT	(_PAGE_HUGE_SHIFT)
 #define _PAGE_SPLITTING		({BUG(); 1; })	/* Dummy value */
