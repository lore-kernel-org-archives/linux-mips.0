Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005814;
	b=Dr5R/4iDgyq76k/YP85xGYNOZzNbk9yhn9rcChtenQqawhvfBkFr1i1BvN0XfG8T1cMY
	 FsvU06D0K+3xArnKHkMkGiwRPeF1ezU3l+lRauADRV/Uk08EeAcn5lJMbV1LqqNumDpJ+
	 LSu7AzQq1d9w7kKJuUhBDAmBqROXs9uGfsJp52eefkp67Qvh7PsdJRwPR3fs6cB6eVdWE
	 dTLoJPjovTqpfchA4Ff5K0GC4DGZcTc/2KuvIOmLrxJMRCJA5cqPv3n0UqymBLgXvT7sx
	 oTLSjFtfoPcH3PAUubsxmMeFMjz3XgSunHo76yFgfGXr+bdXiL9ymnVhGjWIF9xmgKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005814;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=lTLmtK31hw/UKLvDWxom2CDHYzIzwP+MZGBxJv6sbMg=;
	b=epX+cq6BSifPPluWuHRL/aa8ToOgdXjbR8ZX80lJW8hYiXYyZcrzQSKgSRb0uyi/CfAd
	 4CW38xemlpv3uMsXVPNoFUyyRlp3MeLaDI6rjglf+V3O5QrEVZ5nt56kLTqrwjPqG95wu
	 2ai/lP9BAr1LtrEOC8M3/CFkZfQKt9UYE/eC6AEKAOhBW6pFeC06HLVL5iLRJ8liMwIsE
	 6TTvEWtWF8GE9IsBQmpTLM2A9Zu7yn+5O1BD/YoQPrX6KNZQ6ZQVdibKNp+hHTEBAXoEm
	 mpyi1iD07OrXF6Taav47kq6EmND9wdp43yU8rt6r4ZvVOeOtTTDQAzK0CgM2FotyoJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=VNsZdypM;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92940606A33D
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92940606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=VNsZdypM
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225652euoutp01fa36edc247d2681a1cb39de03b2804f6~llsfxAXFJ1319313193euoutp01J
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106225652euoutp01fa36edc247d2681a1cb39de03b2804f6~llsfxAXFJ1319313193euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005812;
	bh=lTLmtK31hw/UKLvDWxom2CDHYzIzwP+MZGBxJv6sbMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNsZdypMr+ufFm2i3vAU+MGahJRXL9LYBLbKw3WKAuDAvyWhI5fopN7/I/5jj+AeV
	 WMmU+yT7SeGv0gJK1JYZ83Rqm/CR+upiruhZCpTAA3ULioyfKXQr6dtcmwZDqcykuQ
	 gkt6FAlj+l7Q5ZRAFP38wKXc1arLL6BqizvJ3ZA0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106225650eucas1p1efb74e6071ef81de13ca8e1e67d83655~llseuRzt30802808028eucas1p1f;
	Fri,  6 Nov 2026 22:56:50 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225650eusmtip261d7fce2c0cc1b8258450c34970e6753~llsd_z2Wy2228922289eusmtip2S;
	Fri,  6 Nov 2026 22:56:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH/RFC 3/7] MIPS: mm: handle highmem pages in
 arch_dma_prep_coherent()
Date: Fri,  6 Nov 2026 23:56:23 +0100
Message-ID: <20261106225628.215319-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106225628.215319-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261106225650eucas1p1efb74e6071ef81de13ca8e1e67d83655
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225650eucas1p1efb74e6071ef81de13ca8e1e67d83655
X-EPHeader: CA
X-CMS-RootMailID: 20261106225650eucas1p1efb74e6071ef81de13ca8e1e67d83655
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225650eucas1p1efb74e6071ef81de13ca8e1e67d83655@eucas1p1.samsung.com>

arch_dma_prep_coherent() performs the cache maintenance on the address
returned by page_address(). On 32-bit MIPS with CONFIG_HIGHMEM the kernel
uses HASHED_PAGE_VIRTUAL, so page_address() returns NULL for a highmem
page that is not kmapped, and dma_cache_wback_inv() then operates on
the virtual range starting at 0 instead of the buffer, leaving any dirty
cache lines of the buffer in place.

Highmem pages do reach this function: dma_alloc_contiguous() can return
a highmem CMA page, which dma_direct_alloc() handles by forcing the remap
path and calling arch_dma_prep_coherent() on that page before creating
the uncached mapping. Since commit f5ff79fddf0e ("dma-mapping: remove
CONFIG_DMA_REMAP") this path is available on all MMU architectures,
including MIPS, which previously rejected highmem CMA pages.

Fix this by reusing dma_sync_phys(), which already handles highmem pages
by mapping them one page at a time with kmap_atomic(). For lowmem pages
it does a single dma_cache_wback_inv() over the whole range, so the
behaviour is unchanged there.

Fixes: f5ff79fddf0e ("dma-mapping: remove CONFIG_DMA_REMAP")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/mips/mm/dma-noncoherent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 30ef3e247eb7..d8e5bc85bb3b 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -44,11 +44,6 @@ static inline bool cpu_needs_post_dma_flush(void)
 	}
 }
 
-void arch_dma_prep_coherent(struct page *page, size_t size)
-{
-	dma_cache_wback_inv((unsigned long)page_address(page), size);
-}
-
 void *arch_dma_set_uncached(void *addr, size_t size)
 {
 	return (void *)(__pa(addr) + UNCAC_BASE);
@@ -127,6 +122,11 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 	dma_sync_phys(paddr, size, dir, true);
 }
 
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	dma_sync_phys(page_to_phys(page), size, DMA_BIDIRECTIONAL, true);
+}
+
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
-- 
2.43.0

