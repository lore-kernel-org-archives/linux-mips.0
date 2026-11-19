Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101331;
	b=zFLWQ21QfbqTS7XfGNCMlCwYBzUKTZjmGc3GkljgRiK7SecaC1jNkK5HzOttQ0u3T1bI
	 k9OI5KfQjzWf4BnAJ1e7zoyyCQIePOVeUiEB7SJYBJAjyE3frqRzna6xF2KiKM+kioK4t
	 SYI+sw9Xa6aFgIemVeoBJLTaxNoh9spjthcZrn3RUuKfqyShEcoIZ5vJzTlTO03dJuI8m
	 evaBT3MvJYjucsWow+5KraAkW2j2mLuQ2BIFMPBY0EQdtlr7sCundpqTeBKENYJixGBTr
	 OIAlrxb0x5NhEO02ZcR6/OFm0PXIP5HVVoDwmGown1EWToWLETRVLVaW9x/98f7Q45Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101331;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=IEgW4twElg7BhRZOum7kSGP0qGy7dRuOCQhsK+aKtks=;
	b=4hzpe7Ytfnc+gYVVOfdaorhTvRAxU5dvJf2aXr/AdxEwtgcggLyxbCmO6JeUsH7dBexy
	 svdxz405JRAzB7bwd/yX4Q8KM8uOOkGxkWZiC3GEDH24LffT0MX0RFGrlQsjJd1MlOCHJ
	 DJaGuAza2H8q0E90sBFxAJ0rkAJTXo9P7FAgCj3WDzJcpfAUQ1K99iq0H2rRb9El5dtY6
	 85uO0OPgDghHXul8wwEDn2pyXv9JQWyKMTuHiGDnCJTPUSde/E1zaefhGTPq2LVceyX4X
	 NV3wydySx+TGm/T08rkA+N8YJfJA5AkKH48Dyg3LKOVgQi9VJEUoT/aJLU0eOumM43w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HMuSmK0v;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF9606A330
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 15:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DF9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HMuSmK0v
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261119151527euoutp01541a46bb5d1fa348a57247a506e9880a~peyWKq_Nw2728527285euoutp019
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 15:15:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261119151527euoutp01541a46bb5d1fa348a57247a506e9880a~peyWKq_Nw2728527285euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795101327;
	bh=IEgW4twElg7BhRZOum7kSGP0qGy7dRuOCQhsK+aKtks=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HMuSmK0vciD8RQGkLfrGpUJnZ/srENN84PugIdOxj5JSWTkIGDD6tTavunOO6WZZ2
	 Dv8bGAWh51j/oqkkq0CWmHRthTtvQG6LfLNUK5tNV11GmlhAbmrQTpKUs78iPzC7hg
	 OYW5+r+O2cAZYSRgQ03VO2Kg1HPdiyNKPLJmZ13I=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151527eucas1p16c69a0580b2caabe66f952572362021f~peyV3V5AX2357323573eucas1p1Z;
	Thu, 19 Nov 2026 15:15:27 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151526eusmtip134f5dc711c4d05cf83c876262b52330f~peyVHCLrD2050420504eusmtip1r;
	Thu, 19 Nov 2026 15:15:26 +0000 (GMT)
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
Subject: [PATCH v3 0/7] dma-mapping: DMA_ATTR_NO_KERNEL_MAPPING related
 fixes
Date: Thu, 19 Nov 2026 16:15:08 +0100
Message-ID: <20261119151520.2383226-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261119151527eucas1p16c69a0580b2caabe66f952572362021f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119151527eucas1p16c69a0580b2caabe66f952572362021f
X-EPHeader: CA
X-CMS-RootMailID: 20261119151527eucas1p16c69a0580b2caabe66f952572362021f
References: <CGME20261119151527eucas1p16c69a0580b2caabe66f952572362021f@eucas1p1.samsung.com>

Hi All,

arch_dma_prep_coherent() is called by the generic DMA code on pages
which may be located in highmem: dma_direct_alloc() forces the remap
path for a highmem page returned from CMA and calls this hook on it
before creating the uncached mapping. However, the hook has never been
documented and some implementations assume that the page has a kernel
linear mapping. This issue affects MIPS, xtensa and PowerPC. It gets
fixed by patches #2-#5.

xtensa also only invalidates the cache, which discards the zeroes
written by the dma_direct_alloc(). Patch #1 switches it to a
writeback+invalidate.

Patch #6 documents that arch_dma_prep_coherent() must write back dirty
lines and must accept highmem pages. With that in place, patch #7 drops
the PageHighMem() check in dma_direct_alloc_no_mapping(), which so far
skipped cache maintenance for highmem CMA pages allocated with
DMA_ATTR_NO_KERNEL_MAPPING.

Patch #8 makes dma_direct_alloc_no_mapping() always return zeroed
memory, like all other dma_alloc_* paths. Passing __GFP_ZERO is not
enough there, because CMA ignores it.

The analysis and the patchset was prepared with the help of an LLM. The
code compiles fine, but it has not been runtime tested on any of the
affected architectures yet. Testing on real hardware would be
appreciated. I've reviewed the resulting changes.

I plan to merge this via my dma-mapping tree, I can provide a tag if
needed for merging it also to arch code.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:
v3:
- added patch improving lowmem handling in __dma_sync_page() (PowerPC
  arch) to avoid performance regression in latter patches
- added fixes tag to "powerpc/mm: handle highmem pages in
  arch_dma_prep_coherent()" patch
- collected tags

v2: https://lore.kernel.org/all/20261110094830.2081847-1-m.szyprowski@samsung.com/
- fixed minor issues in comments and patch descriptions pointed by sashiko
- dropped RFC annotation

v1: https://lore.kernel.org/all/20261106225628.215319-1-m.szyprowski@samsung.com/


Patch summary:

Marek Szyprowski (8):
  xtensa: write back dirty lines in arch_dma_prep_coherent()
  xtensa: handle highmem pages in arch_dma_prep_coherent()
  MIPS: mm: handle highmem pages in arch_dma_prep_coherent()
  powerpc/mm: skip kmap for lowmem pages in __dma_sync_page()
  powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
  dma-mapping: document that arch_dma_prep_coherent() must handle
    highmem
  dma-direct: do not skip cache maintenance for highmem pages in
    no-mapping allocations
  dma-direct: zero memory allocated with DMA_ATTR_NO_KERNEL_MAPPING

 arch/mips/mm/dma-noncoherent.c    | 10 +++++-----
 arch/powerpc/mm/dma-noncoherent.c | 16 +++++++++-------
 arch/xtensa/kernel/pci-dma.c      | 12 +++++++++++-
 include/linux/dma-map-ops.h       | 11 +++++++++++
 kernel/dma/direct.c               |  9 +++++++--
 5 files changed, 43 insertions(+), 15 deletions(-)

-- 
2.43.0

