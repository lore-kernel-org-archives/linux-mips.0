Received: from mailapp01.imgtec.com ([195.59.15.196]:36056 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992180AbcIGMhWiC9gq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Sep 2016 14:37:22 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2] MIPS: vDSO: Fix Malta EVA mapping to vDSO page structs
Date: Wed, 7 Sep 2016 13:37:01 +0100
Message-ID: <5601d622dd9cedec225461192fde5715d7c5b97e.1473251752.git-series.james.hogan@imgtec.com>
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
Message-ID: <20160907123701.hkeDLHtiJVHopJb18pDSgtQq7u4nhEHFykW1HjvQihI@z>

The page structures associated with the vDSO pages in the kernel image
are calculated using virt_to_page(), which uses __pa() under the hood to
find the pfn associated with the virtual address. The vDSO data pointers
however point to kernel symbols, so __pa_symbol() should really be used
instead.

Since there is no equivalent to virt_to_page() which uses __pa_symbol(),
fix init_vdso_image() to work directly with pfns, calculated with
__phys_to_pfn(__pa_symbol(...)).

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
Changes in v2:
- Switch to __phys_to_pfn() added in v4.3, since PHYS_PFN() was only
  added in v4.5 and we need this backported as far as v4.4.
---
 arch/mips/kernel/vdso.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 9abe447a4b48..f9dbfb14af33 100644
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
+	data_pfn = __phys_to_pfn(__pa_symbol(image->data));
+	for (i = 0; i < num_pages; i++)
+		image->mapping.pages[i] = pfn_to_page(data_pfn + i);
 }
 
 static int __init init_vdso(void)
-- 
git-series 0.8.10
