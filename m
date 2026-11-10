Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304135;
	b=Vn7PkSlDsY45QiGkwws4OIqk3iEI2msm2YF6JhBf+Eptopglm7B4px5sAVtKUMTBN+NJ
	 TQHHnJQuxloBB02Nz8+5TYubRF2uHvdIUggEoycgKAp6QJcc5UgZP5PBnRBDPw1F9wzM3
	 X4ZpYf4Q6Js45AkQ30msUYAFdFGnEJ5GskxjOh1Q23jqwHMOMyEjCiQeDzGWvaYKvHxe+
	 H46/zYM82TJ1S6IvJDy0Gv+fQtgBUJ+pJN9dSYRfBWyopN9qC94F+MONDU6EvKWaape9f
	 piSSO97ycTFF4xYl43Mg3eY1KfVOCyEJH7J01QSol2alJazlxwlirCOCoLObUBZ5GoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304135;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	b=C3HPGcvekVicRmfokDAxFX5mB3BlibpJLrv3XbhZIs8ZZR+vguBmyLygHlcww82tN9GA
	 0/V6YkcszUbfPdmHTG1j3jf/ZvFTs9gvPP2cN9Vtu04qy0OJrU25FixOGBxPluzpBnu+4
	 evAcHj6sVnriUOSGI+QrureNl8ehDTM7w/NWLl4ZVgCULvRu1Dza0CUcEwihuAxQp5A1w
	 7O/qCgU2x4SJukDGr8ei9NPQcbrIZWpe6L2urG6Oh1AIBENCJoqrIjiSIT0smVXzmx2gB
	 N8V+Qe5h3pJM4+Vfoyvy4bPlY2zoLr8/8qOPhny+P1MLMf6L0gW6VYpJV0yHtL2zCKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=W8PyNThn;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515A606C666
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7515A606C666
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=W8PyNThn
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261110094853euoutp02048affda686905e692b4bd0e7d297530~mpho459c82948129481euoutp024
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 09:48:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261110094853euoutp02048affda686905e692b4bd0e7d297530~mpho459c82948129481euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794304133;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W8PyNThnlQcp7PmR1yN6Rrpv06MxIyDsVc/z+kwv/zaBP+/FtY2ea4Bk/RXQr7JSa
	 Kb2JCIowk/YNHX2jW8JKT+PouuJ7BzICax6XnFOiaATqw3tugUE9MGxqeZWkTFY0mE
	 jYL7muKoO9OMpJucPU8o4v4pfUNLhp6I2ewQKHJs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261110094852eucas1p28920baba9ddde5dbb2760e45fee7179a~mphoBaH7z1404414044eucas1p2x;
	Tue, 10 Nov 2026 09:48:52 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261110094851eusmtip1e09b2c252063ce2db3a6fe60e6c01e19~mphnSDeWc0098400984eusmtip18;
	Tue, 10 Nov 2026 09:48:51 +0000 (GMT)
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
Subject: [PATCH v2 6/7] dma-direct: do not skip cache maintenance for
 highmem pages in no-mapping allocations
Date: Tue, 10 Nov 2026 10:48:26 +0100
Message-ID: <20261110094830.2081847-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094830.2081847-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261110094852eucas1p28920baba9ddde5dbb2760e45fee7179a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261110094852eucas1p28920baba9ddde5dbb2760e45fee7179a
X-EPHeader: CA
X-CMS-RootMailID: 20261110094852eucas1p28920baba9ddde5dbb2760e45fee7179a
References: <20261110094830.2081847-1-m.szyprowski@samsung.com>
	<CGME20261110094852eucas1p28920baba9ddde5dbb2760e45fee7179a@eucas1p2.samsung.com>

dma_direct_alloc_no_mapping() calls arch_dma_prep_coherent() only for
lowmem pages. The check was added when the DMA_ATTR_NO_KERNEL_MAPPING
handling was moved to dma-direct, because some implementations of the
hook used page_address() and could not handle highmem pages.

As a result, a buffer backed by a highmem CMA page is handed to the
device without removing the dirty cache lines covering it, which may
still be present from the previous user of the page. These lines can be
evicted later and corrupt data written by a non-coherent device.

All implementations of arch_dma_prep_coherent() now handle highmem
pages, and the hook is documented to do so; dma_direct_alloc() already
calls it on highmem pages in its remap path. Drop the check so that
highmem pages get the same cache maintenance as lowmem pages.

Fixes: d98849aff879 ("dma-direct: handle DMA_ATTR_NO_KERNEL_MAPPING in common code")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/direct.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 25e9a86835fd..fea0dd36dd25 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -207,8 +207,7 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 		return NULL;
 
 	/* remove any dirty cache lines on the kernel alias */
-	if (!PageHighMem(page))
-		arch_dma_prep_coherent(page, size);
+	arch_dma_prep_coherent(page, size);
 	/*
 	 * return the page pointer as the opaque cookie.
 	 * Never used for unencrypted allocation
-- 
2.43.0

