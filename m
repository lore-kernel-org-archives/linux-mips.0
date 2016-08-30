Received: from mailapp01.imgtec.com ([195.59.15.196]:48509 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992247AbcH3RcTi7MX0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 30 Aug 2016 19:32:19 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 08/26] MIPS: dma-default: Don't check hw_coherentio if device is non-coherent
Date: Tue, 30 Aug 2016 18:29:11 +0100
Message-ID: <20160830172929.16948-9-paul.burton@imgtec.com>
In-Reply-To: <20160830172929.16948-1-paul.burton@imgtec.com>
References: <20160830172929.16948-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Qais Yousef <qais.yousef@imgtec.com>, linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, James Hogan <james.hogan@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>, Alex Smith <alex.smith@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20160830172911.BQRY7RbgqdG2l3PkCcFyhVssEEi2peyMBzGmX_uCVaA@z>

There are no cases where plat_device_is_coherent() will return zero
whilst hw_coherentio is non-zero, and acting any differently in such a
case doesn't make much sense - if a device is non-coherent with the CPU
caches then access to memory "coherent" with DMA must be uncached. Clean
up the nonsensical case.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/mm/dma-default.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
index a9c1e94..6540355 100644
--- a/arch/mips/mm/dma-default.c
+++ b/arch/mips/mm/dma-default.c
@@ -161,8 +161,7 @@ static void *mips_dma_alloc_coherent(struct device *dev, size_t size,
 	*dma_handle = plat_map_dma_mem(dev, ret, size);
 	if (!plat_device_is_coherent(dev)) {
 		dma_cache_wback_inv((unsigned long) ret, size);
-		if (!hw_coherentio)
-			ret = UNCAC_ADDR(ret);
+		ret = UNCAC_ADDR(ret);
 	}
 
 	return ret;
@@ -190,7 +189,7 @@ static void mips_dma_free_coherent(struct device *dev, size_t size, void *vaddr,
 
 	plat_unmap_dma_mem(dev, dma_handle, size, DMA_BIDIRECTIONAL);
 
-	if (!plat_device_is_coherent(dev) && !hw_coherentio)
+	if (!plat_device_is_coherent(dev))
 		addr = CAC_ADDR(addr);
 
 	page = virt_to_page((void *) addr);
@@ -210,7 +209,7 @@ static int mips_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 	unsigned long pfn;
 	int ret = -ENXIO;
 
-	if (!plat_device_is_coherent(dev) && !hw_coherentio)
+	if (!plat_device_is_coherent(dev))
 		addr = CAC_ADDR(addr);
 
 	pfn = page_to_pfn(virt_to_page((void *)addr));
-- 
2.9.3
