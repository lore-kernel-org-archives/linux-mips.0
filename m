Received: from mailapp01.imgtec.com ([195.59.15.196]:38786 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991942AbcIAMFD5nkPK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Sep 2016 14:05:03 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: vDSO: Fix Malta EVA mapping to vDSO page structs
Date: Thu, 1 Sep 2016 13:04:25 +0100
Message-ID: <49347b5b8c218600ffddb91e651274af476fe6e6.1472731205.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160901120425.GX79qtw_KozaTnSyBxCjtaPKkh-NlU_IHIRAPBoUwhU@z>

The page structures associated with the vDSO pages in the kernel image
are calculated using virt_to_page(), which uses __pa() under the hood to
find the pfn associated with the virtual address. The vDSO data pointers
however point to kernel symbols, so __pa_symbol() should really be used
instead.

Since there is no equivalent to virt_to_page() which uses __pa_symbol(),
fix init_vdso_image() to work directly with pfns, calculated with
PHYS_PFN(__pa_symbol(...)).

This issue broke the Malta Enhanced Virtual Addressing (EVA)
configuration which has a non-default implementation of __pa_symbol().
This is because it uses a physical alias so that the kernel executes
from KSeg0 (VA 0x80000000 -> PA 0x00000000), while RAM is provided to
the kernel in the KUSeg range (VA 0x00000000 -> PA 0x80000000) which
uses the same underlying RAM.

Since there are no page structures associated with the low physical
address region, some arbitrary kernel memory would be interpreted as a
page structure for the vDSO pages and badness ensues.

Fixes: ebb5e78cc634 ("MIPS: Initial implementation of a VDSO")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 4.4.x-
---
 arch/mips/kernel/vdso.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 9abe447a4b48..e4a8d8846eac 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -39,16 +39,16 @@ static struct vm_special_mapping vdso_vvar_mapping = {
 static void __init init_vdso_image(struct mips_vdso_image *image)
 {
 	unsigned long num_pages, i;
+	unsigned long data_pfn;
 
 	BUG_ON(!PAGE_ALIGNED(image->data));
 	BUG_ON(!PAGE_ALIGNED(image->size));
 
 	num_pages = image->size / PAGE_SIZE;
 
-	for (i = 0; i < num_pages; i++) {
-		image->mapping.pages[i] =
-			virt_to_page(image->data + (i * PAGE_SIZE));
-	}
+	data_pfn = PHYS_PFN(__pa_symbol(image->data));
+	for (i = 0; i < num_pages; i++)
+		image->mapping.pages[i] = pfn_to_page(data_pfn + i);
 }
 
 static int __init init_vdso(void)
-- 
git-series 0.8.10
