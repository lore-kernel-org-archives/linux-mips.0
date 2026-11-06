Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005813;
	b=a6x9vcjkR0E7PtezFw2M4woGHVVak3akGL2U2KAAjcadGdI269k6rxIpQmX+qBXuomfI
	 q/16cry8RUnaNExhIk/aFBXT20beHtdIZrv5R7RycZ3j+1MTncN14QzrEXzgfCc+t/adH
	 CON0VS/jP1YTWVzylgK2ryK2WhKxgLZawaSeKxJs0kcW5hAzgaqwppvmrThtbOjwZ00tV
	 APmHx91+le371u5os9bUkhXR0aTaP4/RkQ6caFmeKn+15BYBsOtkuQ+YKymS34Ug+Cef7
	 rkHo+hDpKmGldz3rHN2XJ8yavvAaVJfnWNf6lCwdGbohuYP73gAPGpzDkfkj9KRmylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005813;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=IJCShxZcd5Lye/mgdSMJcV5l3GYpCC0DWWah+SYwQXc=;
	b=PotU9Yn6gvtTnHYsU6iGPZ0SAGx2m0/JPbryeAkdHEGRiLMfINu8h52NV2axuZ2wp1uC
	 NEGSF5ZAlWj5cGrHfQufxLQ2wgKAK9Zt2sfyYm4dzADN0yOhUExunwfTbj7nwJJdq5pZR
	 w7KX/BvMkEaj9lV3XyJH1+Ru198+ahhfTaVIWXZvAnq/Qn2w5wdbISsiiUnUrwhatYxS3
	 XhrpcHk3asQYWSzg/KZ9TmeKMExdbuojwYsYRzIrmMaPgXmyNNujJ9ydezaihWeQ5eRFZ
	 tGQ8qZ7nPSnqlH/JGc/uIUmbXuX2q5RzvV+IZ2bLT/gBiuXmVeSHWuhxi3dJcfh0BOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hs91eL7m;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D5606A32F
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B83D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hs91eL7m
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225649euoutp010176bc3f56c6c87cffab43ec6dd6d40a~llsdvOMRp1322713227euoutp01B
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106225649euoutp010176bc3f56c6c87cffab43ec6dd6d40a~llsdvOMRp1322713227euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005809;
	bh=IJCShxZcd5Lye/mgdSMJcV5l3GYpCC0DWWah+SYwQXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hs91eL7mUpYnQeSAfRDH1Oq+s2tCrEuouC64XdTIwtASMPJBU1vza7uF0dRcjQG6l
	 q8P1PvEVI+KgJm8jIxpVYUtLd4PJWoFnMXODmdxhf/iAuu483uETIfBkdaposYWl//
	 td4bhQPxPNEGWQY5o4h/JjtfT26PjiqLggJxx2lE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e~llsdEb1b41955019550eucas1p2q;
	Fri,  6 Nov 2026 22:56:49 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225648eusmtip2ae191027336406180fa85101917bad82~llscVidfA2228922289eusmtip2Q;
	Fri,  6 Nov 2026 22:56:48 +0000 (GMT)
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
Subject: [PATCH/RFC 1/7] xtensa: write back dirty lines in
 arch_dma_prep_coherent()
Date: Fri,  6 Nov 2026 23:56:21 +0100
Message-ID: <20261106225628.215319-2-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e
X-EPHeader: CA
X-CMS-RootMailID: 20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225649eucas1p27f1d64162099ef1c7472469f2a33201e@eucas1p2.samsung.com>

arch_dma_prep_coherent() is expected to remove any dirty cache lines
covering the buffer, so that they are neither lost nor evicted later on
top of data written through the uncached alias or by the device.
xtensa implements it with __invalidate_dcache_range(), which uses the
DHI instruction and discards dirty lines without writing them back.

This loses data written through the cached kernel mapping right before
the call. dma_direct_alloc() zeroes the buffer with memset() on the
cached linear mapping and only then calls arch_dma_prep_coherent() and
switches to the KSEG bypass alias via arch_dma_set_uncached(). On cores
with a write-back data cache the zeroes still sitting in the cache are
dropped, and dma_alloc_coherent() returns a buffer with stale content.
The same applies to dma_direct_alloc_no_mapping(), which allocates the
pages with __GFP_ZERO before calling arch_dma_prep_coherent().

Use __flush_invalidate_dcache_range() (DHWBI) instead, which writes the
dirty lines back before invalidating them. On cores with a write-through
data cache it maps to __invalidate_dcache_range(), so nothing changes
there.

Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/xtensa/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index 94955caa4488..e1c00ec37eed 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -82,7 +82,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	__invalidate_dcache_range((unsigned long)page_address(page), size);
+	__flush_invalidate_dcache_range((unsigned long)page_address(page), size);
 }
 
 /*
-- 
2.43.0

