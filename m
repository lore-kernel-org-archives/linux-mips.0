Received: from mailapp01.imgtec.com ([195.59.15.196]:42692 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993900AbdBBMFAf1Fzv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Feb 2017 13:05:00 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 2/30] MIPS: Export pgd/pmd symbols for KVM
Date: Thu, 2 Feb 2017 12:04:15 +0000
Message-ID: <c19a41d8afbd11e79d4d122db273673bedceeef4.1486036366.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.e37f86dece46fc3ed00a075d68119cab361cda8e.1486036366.git-series.james.hogan@imgtec.com>
References: <cover.e37f86dece46fc3ed00a075d68119cab361cda8e.1486036366.git-series.james.hogan@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, kvm@vger.kernel.org
Message-ID: <20170202120415.4i03TFFIjIfq1iB_MGC7hkopSes3tdi0KHNzUnujQO4@z>

Export pmd_init(), invalid_pmd_table and tlbmiss_handler_setup_pgd to
GPL kernel modules so that MIPS KVM can use the inline page table
management functions and switch between page tables:

- pmd_init() will be used directly by KVM to initialise newly allocated
  pmd tables with invalid lower level table pointers.

- invalid_pmd_table is used by pud_present(), pud_none(), and
  pud_clear(), which KVM will use to test and clear pud entries.

- tlbmiss_handler_setup_pgd() will be called by KVM entry code to switch
  to the appropriate GVA page tables.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Acked-by: Ralf Baechle <ralf@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
Changes in v2:
- Don't bother exporting pgd_init(), as it was used by pgd_alloc() which
  is moved out of the headers and exported itself now.
---
 arch/mips/mm/init.c       | 1 +
 arch/mips/mm/pgtable-64.c | 2 ++
 arch/mips/mm/tlbex.c      | 5 ++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index e86ebcf5c071..653569bc0da7 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -538,5 +538,6 @@ unsigned long pgd_current[NR_CPUS];
 pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
 #ifndef __PAGETABLE_PMD_FOLDED
 pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
+EXPORT_SYMBOL_GPL(invalid_pmd_table);
 #endif
 pte_t invalid_pte_table[PTRS_PER_PTE] __page_aligned_bss;
diff --git a/arch/mips/mm/pgtable-64.c b/arch/mips/mm/pgtable-64.c
index ce4473e7c0d2..0ae7b28b4db5 100644
--- a/arch/mips/mm/pgtable-64.c
+++ b/arch/mips/mm/pgtable-64.c
@@ -6,6 +6,7 @@
  * Copyright (C) 1999, 2000 by Silicon Graphics
  * Copyright (C) 2003 by Ralf Baechle
  */
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <asm/fixmap.h>
@@ -60,6 +61,7 @@ void pmd_init(unsigned long addr, unsigned long pagetable)
 		p[-1] = pagetable;
 	} while (p != end);
 }
+EXPORT_SYMBOL_GPL(pmd_init);
 #endif
 
 pmd_t mk_pmd(struct page *page, pgprot_t prot)
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 55ce39606cb8..dc7bb1506103 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/bug.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/smp.h>
@@ -1536,7 +1537,9 @@ static void build_loongson3_tlb_refill_handler(void)
 extern u32 handle_tlbl[], handle_tlbl_end[];
 extern u32 handle_tlbs[], handle_tlbs_end[];
 extern u32 handle_tlbm[], handle_tlbm_end[];
-extern u32 tlbmiss_handler_setup_pgd_start[], tlbmiss_handler_setup_pgd[];
+extern u32 tlbmiss_handler_setup_pgd_start[];
+extern u32 tlbmiss_handler_setup_pgd[];
+EXPORT_SYMBOL_GPL(tlbmiss_handler_setup_pgd);
 extern u32 tlbmiss_handler_setup_pgd_end[];
 
 static void build_setup_pgd(void)
-- 
git-series 0.8.10
