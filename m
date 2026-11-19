Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101338;
	b=kmCLWS6LnEvySX6XhQK1G6kQuC0DDVzapj0AcsNO48vPLxJ4grC0m/YXpZtzYIfNZqkb
	 AEBUqGdYPfHHm2Djc4Wrw+/4AKK4fqPssSBNz4/QCqXfGXE/fTAF6POp+2/oOL/IxgRwZ
	 wlF6sU+IGmkC4nWBhIrztzAK/UJOUKBRQAvakT/7eamzBWCUZjHdYdfj/gZVXdOpHj+V0
	 JGP89fKI22eji4aUBZi5UhiNXPZc0IQM5S4NajEuONYhKYpKA6Apa7qyVa30E2mzoI1bZ
	 LV/sZnXXtXsRJE2KBnSFf6O31gIlSx7fyQ1b9szjI3Tn93AKtXZ4kljBjnQ8HsXTuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101338;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=i2GzEcfojg35eLu9fwG+rXcXBdIHA+y+JtfGhwa3unI=;
	b=yJQs5cSvJvugK9sPJxJ3Zk1pHs2PDlCFsScoy5Becu1kvIhKLucL5IiH1dRi46ij9dSM
	 ZU/aA62B0KCrVrkp4YiBA1k/0mMYKTUj5Zj+vgKGEjbT2hQSrO+eSFQCRU2Wo2xHz/LX4
	 u3hXQ9xys5SmdmrJfybrgCj/agqlT+0YqPviCV/ro2X5fS1C89YQd5CipRPb3pLyQ4cD4
	 28Q2qhjsXNcqEz/21THkkDWuJgaWOwIDBdM6gHMu5WsQFGfzsezWVMcQDWfEHvzMKwudY
	 KtZEWRtg7x1WAFY1QEgCMh987mahWLnbPPgvqduDXYt/pPg2LA8Ah9oke6zV5E9+x+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BIrdkgKD;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3572606A337
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 15:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3572606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BIrdkgKD
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261119151531euoutp02119092ab07196ed58aa361bbff2a0571~peyZi92Mz1776417764euoutp02J
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 15:15:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261119151531euoutp02119092ab07196ed58aa361bbff2a0571~peyZi92Mz1776417764euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795101331;
	bh=i2GzEcfojg35eLu9fwG+rXcXBdIHA+y+JtfGhwa3unI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIrdkgKDiOzg9gHz4gH3o71RswsACtDyyokIFJgAIiruK/ScIGGn7gw5PQAGO+dYd
	 j2Y1eSwXX7PVJfXnlE2FWNMCbk0pazaE4DXokrXPcBNeGsmiDB5DJ4rV3qaHJ6rw3H
	 YxhTaqceAru36Pwk1j9ExkFbqa6gMFxKBICN4n8s=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f~peyZMkmrr3078730787eucas1p1T;
	Thu, 19 Nov 2026 15:15:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151530eusmtip19c24465bd0b31b833b21629651ac1c4e~peyYclo922049720497eusmtip14;
	Thu, 19 Nov 2026 15:15:30 +0000 (GMT)
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
Subject: [PATCH v3 4/8] powerpc/mm: skip kmap for lowmem pages in
 __dma_sync_page()
Date: Thu, 19 Nov 2026 16:15:12 +0100
Message-ID: <20261119151520.2383226-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119151520.2383226-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f
X-EPHeader: CA
X-CMS-RootMailID: 20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f
References: <20261119151520.2383226-1-m.szyprowski@samsung.com>
	<CGME20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f@eucas1p1.samsung.com>

With CONFIG_HIGHMEM enabled, __dma_sync_page() unconditionally goes
through __dma_sync_page_highmem(), which disables interrupts and
kmaps the buffer one page at a time. This adds needless per-page
overhead to every streaming DMA sync on such kernels.

Use the per-page kmap path only when the buffer reaches into highmem
and do a single __dma_sync() on the linear mapping otherwise.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/powerpc/mm/dma-noncoherent.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 30260b5d146d..3ce7dfc213d9 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -96,12 +96,16 @@ static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned offset = paddr & ~PAGE_MASK;
 
+	if (!size)
+		return;
+
 #ifdef CONFIG_HIGHMEM
-	__dma_sync_page_highmem(page, offset, size, dir);
-#else
-	unsigned long start = (unsigned long)page_address(page) + offset;
-	__dma_sync((void *)start, size, dir);
+	if (PageHighMem(pfn_to_page(PHYS_PFN(paddr + size - 1)))) {
+		__dma_sync_page_highmem(page, offset, size, dir);
+		return;
+	}
 #endif
+	__dma_sync(page_address(page) + offset, size, dir);
 }
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-- 
2.43.0

