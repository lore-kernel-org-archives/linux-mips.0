Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304131;
	b=gPNDir8lN/63AbgO2Pj/zB+Yd33zZ92TREeb+a5nbnT02JEnMoeCvP6ZPX6sXF4xMsUd
	 Yt0Km1dbL2aHOt7YdPD07SIXdavBjXs1wNFGwFW9Ame7cRZ+RyWOp1h+T2ZHOZPaVsfWQ
	 197tI2wRoir3ocYJr5L6drN7/OMpLKVNbrXUQzKdJZnwI/6SuvvE0VtkwOd1btcmm5J6I
	 mP4ix2LVema1kJl/NGzRHDw5gKc2DIGc8fZoXJxRYIUki6ls3McyZusR59NSLVPyuHKJV
	 deu2BrApbGYH+JyjYfcu5JounbwcqPcbgcV0KFRPuQ41QtVee7DOljGQ1odaJJ37pxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304131;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=3WfehI9fQijRo2A/YkZKLEEsknJgbPS4DyEKhXbP7KQ=;
	b=4E7GtuLddWJRKxtOEZCxtJbzxnBaNd1MX4wGloEpfWlOvWfxkebiCgasPTocboYk6eC4
	 GUFytMCIy9dpfcEHXD9Tp3xKhkaueecsqqgxmLp0Uo2dSmGOp1Ll+B7onMvEDW95wxAyL
	 pSmjiAptjf2IUY0agBYLHPpNzFHkXpzaw5agC1O7E9p+GhYNIGLRD3nbuMIJvYs19eDQ+
	 H+kUw3Jj3uU+Ii4UsnoKCHnHsY+kPO+XxRHIQgBWhhOFIszZcVN2aalo+maj0bNhUWmZs
	 glRzdkq4772eA5kFUgNCERAz1rLc55XmbGfo900vIfJMsLNIed/Fjj+uK44e1hcFRUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=t5H7erzo;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634A606A339
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7634A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=t5H7erzo
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261110094847euoutp025e48076f1ad63ea15f4ab915ba31b685~mphjrT9zl2814928149euoutp02e
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 09:48:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261110094847euoutp025e48076f1ad63ea15f4ab915ba31b685~mphjrT9zl2814928149euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794304127;
	bh=3WfehI9fQijRo2A/YkZKLEEsknJgbPS4DyEKhXbP7KQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=t5H7erzotTjNcdaOkmaz3M4aA0Bqymkk4HSUDa58RSqUxDGN6OQYsxVyl1jgVDKGD
	 bLjcVFp9RRWjiC9Fcd+zIkUM6TTLjMXbv3wVY4MDaONJLRjuve1I7MrmM00BC+kuY9
	 Ah8MaNnhV/y3AztJNjfW33hOf5Z0Whnj6YtDNxQA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261110094846eucas1p140d5ebfe71b47d4e4b5e2162ba051c51~mphjEO8nd1080110801eucas1p1W;
	Tue, 10 Nov 2026 09:48:46 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261110094846eusmtip14801004a391e04a621db015af3a4d45a~mphiUYlbM3235732357eusmtip1b;
	Tue, 10 Nov 2026 09:48:46 +0000 (GMT)
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
Subject: [PATCH v2 0/7] dma-mapping: DMA_ATTR_NO_KERNEL_MAPPING related
 fixes
Date: Tue, 10 Nov 2026 10:48:20 +0100
Message-ID: <20261110094830.2081847-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261110094846eucas1p140d5ebfe71b47d4e4b5e2162ba051c51
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261110094846eucas1p140d5ebfe71b47d4e4b5e2162ba051c51
X-EPHeader: CA
X-CMS-RootMailID: 20261110094846eucas1p140d5ebfe71b47d4e4b5e2162ba051c51
References: <CGME20261110094846eucas1p140d5ebfe71b47d4e4b5e2162ba051c51@eucas1p1.samsung.com>

Hi All,

arch_dma_prep_coherent() is called by the generic DMA code on pages
which may be located in highmem: dma_direct_alloc() forces the remap
path for a highmem page returned from CMA and calls this hook on it
before creating the uncached mapping. However, the hook has never been
documented and some implementations assume that the page has a kernel
linear mapping. This issue affects MIPS, xtensa and PowerPC. It gets
fixed by patches #2-#4.

xtensa also only invalidates the cache, which discards the zeroes
written by the dma_direct_alloc(). Patch #1 switches it to a
writeback+invalidate.

Patch #5 documents that arch_dma_prep_coherent() must write back dirty
lines and must accept highmem pages. With that in place, patch #6 drops
the PageHighMem() check in dma_direct_alloc_no_mapping(), which so far
skipped cache maintenance for highmem CMA pages allocated with
DMA_ATTR_NO_KERNEL_MAPPING.

Patch #7 makes dma_direct_alloc_no_mapping() always return zeroed
memory, like all other dma_alloc_* paths. Passing __GFP_ZERO is not
enough there, because CMA ignores.

The analysis and the patchset was prepared with the help of an LLM. The
code compiles fine, but it has not been runtime tested on any of the
affected architectures yet. Testing on real hardware would be
appreciated. I've reviewed the resulting changes.

I plan to merge this via my dma-mapping tree, so I would like to get
acks from xtensa, MIPS and PowerPC arch maintainers.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:
v2:
- fixed minor issues in comments and patch descriptions pointed by sashiko
- dropped RFC annotation

v1: https://lore.kernel.org/all/20261106225628.215319-1-m.szyprowski@samsung.com/


Patch summary:

Marek Szyprowski (7):
  xtensa: write back dirty lines in arch_dma_prep_coherent()
  xtensa: handle highmem pages in arch_dma_prep_coherent()
  MIPS: mm: handle highmem pages in arch_dma_prep_coherent()
  powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
  dma-mapping: document that arch_dma_prep_coherent() must handle
    highmem
  dma-direct: do not skip cache maintenance for highmem pages in
    no-mapping allocations
  dma-direct: zero memory allocated with DMA_ATTR_NO_KERNEL_MAPPING

 arch/mips/mm/dma-noncoherent.c    | 10 +++++-----
 arch/powerpc/mm/dma-noncoherent.c |  4 +---
 arch/xtensa/kernel/pci-dma.c      | 12 +++++++++++-
 include/linux/dma-map-ops.h       | 11 +++++++++++
 kernel/dma/direct.c               |  9 +++++++--
 5 files changed, 35 insertions(+), 11 deletions(-)

-- 
2.43.0

