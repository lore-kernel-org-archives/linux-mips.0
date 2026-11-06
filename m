Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005827;
	b=gj79xtncmKpk7Iyc7ddevjiSqB7aijPAi5PkEPeVgHWmxOmSgoBDcvxr5MH3PiNTvAWQ
	 0GeJPOTIKUCXWtDvNXXVbFbw3AryBwgd3p9yItveMmjsylOwwz6aT7cb4DgCMi5mosQfE
	 gkJLP8cinxxsXl7cRb7kNncRyQbnPBNC0QQ/YOtICC+hnlne8TfXy03z5JJeL8DKxNUn2
	 L/bOugnnInRRy9iBmp/vmB0lf9MwoC5n1pWbOYexGIXOoCpKkNa+YwnC0RxQ5kDsk11le
	 jkQt2JUO+SYRGb1787H1zp65r9MoVR6afR1ptwhe5j4LV1QPfp5oVnZjfd85FSRq8gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005827;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=sqRiL704sMluKdRvVQ4zewuJOHUjmkrlRuUBPJbDhvE=;
	b=UKzOptLLloKjTkzgnJ1Zp7VBLaLP5tnvetluihg15Bmii9aaYJnnjsT5Wp3bwrdp29Ld
	 jL5ttsM1nm1gtj3boCPvFRWehuxlY8Ej4SzCrd/v36dR3z6ki5GLKS8K5PPcmnyfCqKwa
	 8nKph5db9xc+PqjW//LqcdUy/JJBBR0vUdBPG+2MwJ2ujaPf2+KRfgAK3sFIFCsNQCQVt
	 I2DMkQowqCzMqdmYyt4r06wZJgzaY82DZZESbp8zw1Y8fQMBDUKcAOKYssRnrrDRJeO5g
	 dKDK1z8XJe7msoszycZMusOC94qNuVP34Flz6lonAYTrLUo7fb1oXOgFWnSDHyLnqiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="j/fgjsYG";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7F606D806
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A7F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=j/fgjsYG
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225652euoutp02dfb3066fe983adc487c6d2805aed00f9~llsgjq_zX0400204002euoutp02J
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106225652euoutp02dfb3066fe983adc487c6d2805aed00f9~llsgjq_zX0400204002euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005812;
	bh=sqRiL704sMluKdRvVQ4zewuJOHUjmkrlRuUBPJbDhvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/fgjsYG25Dr8LLRjgDua2IIhxtYzvZkR0LFi+LTfCvj5vAmxos71iwGw0kfjGqyE
	 e8UVGKPVyvvN2U6FKuxh3oJVx3lYKgnRIYgI5iQIj35Mz2EwcE71zQdxTaonViWWaD
	 S4BJ11hM+nDIiGdDfmzKXMblqF6kURWqVRsYXjkk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225651eucas1p2d038403b190875c1dd698da959eefbd3~llsfi4ujJ1972019720eucas1p21;
	Fri,  6 Nov 2026 22:56:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225651eusmtip2199876749caa2da8966a40ca82a8889d~llsezs8wl2228922289eusmtip2T;
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
Subject: [PATCH/RFC 4/7] powerpc/mm: handle highmem pages in
 arch_dma_prep_coherent()
Date: Fri,  6 Nov 2026 23:56:24 +0100
Message-ID: <20261106225628.215319-5-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261106225651eucas1p2d038403b190875c1dd698da959eefbd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225651eucas1p2d038403b190875c1dd698da959eefbd3
X-EPHeader: CA
X-CMS-RootMailID: 20261106225651eucas1p2d038403b190875c1dd698da959eefbd3
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225651eucas1p2d038403b190875c1dd698da959eefbd3@eucas1p2.samsung.com>

arch_dma_prep_coherent() performs the cache maintenance on the address
returned by page_address(). On 32-bit powerpc with CONFIG_HIGHMEM that
is NULL for a highmem page which is not kmapped, so the flush would
operate on the wrong virtual range and leave the dirty lines of the
buffer in place.

The generic DMA code may pass highmem pages to this hook:
dma_direct_alloc() handles a highmem page returned by
dma_alloc_contiguous() by forcing the remap path, which calls
arch_dma_prep_coherent() on that page before creating the uncached
mapping. This cannot happen on powerpc today only because it does not
select HAVE_DMA_CONTIGUOUS, so dma-direct never gets a highmem page
there, but nothing in the hook's contract rules it out.

Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
one at a time. Without CONFIG_HIGHMEM it does the same
flush_dcache_range() on the linear mapping as before.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/powerpc/mm/dma-noncoherent.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 30260b5d146d..e646256365d5 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -118,7 +118,5 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	unsigned long kaddr = (unsigned long)page_address(page);
-
-	flush_dcache_range(kaddr, kaddr + size);
+	__dma_sync_page(page_to_phys(page), size, DMA_BIDIRECTIONAL);
 }
-- 
2.43.0

