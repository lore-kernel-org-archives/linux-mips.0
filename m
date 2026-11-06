Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005816;
	b=B47JsB3JoL3pcXO0MwiY1V2d7uoXgLVqidGnKS852cTkRXL2cTkaLNBitLkkGZgoL/zn
	 XWs8ek87NzOqlkzwQRsByWvFVrWutG7GUWdBntrx5Sn8Q5A4fY/YWLuXbt6YPbbb1yK/Q
	 IQDRxQC3CkJ5pdekiYlZ4xEFdtEu07n3sPBfyf9yxB0n0kdanpo2W6II0n/fpKM0AavGp
	 aEcSzTz4G3/Lnt+LLDxZuDBhpf/Vq7gZuJN6zqocsp9eFJSBAUp/qT6qZoftvkvUd5jNA
	 qYz8Hss6elpTDxYDapfcUKkusZ4UwiLU+TcHfyijzN3nYB5G9R1YvpRL9jEwRzuKHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005816;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	b=HJZJ8/rAw7ySBhQoST/MzqN/aK+4Z4sUWs36LfIBbiUt5eegH8zksfmV/fm/3itjYr4x
	 5+XL391KTP+3DKJCLxuYTfySeSZrTQzWqFIFpzUxOKP04CD73QkMWXeOpsmKWXKIB7SEr
	 u4KPwcw2IO/HVeo8TtWWSZTreu1naB8kLsMTgL73JENxfdRbWDqugtZNZ+N3h88AgevPP
	 7W1HxQDrYfRqoyCozA2ErDs/mr1F0myZotgjorogziv9Wme/39LWTcLg7q9v/u8meQ6L5
	 KNpcJ6TsBL3qAGhoztKXHZVbAlDHxD934px1Cgllqc7FbeWQxZYdgclV+uhXrJELCrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s+hEcDHR;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78800606D804
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78800606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s+hEcDHR
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225654euoutp02e003dae3c4e6562130ec81006953eda1~llshnuQL10400204002euoutp02N
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106225654euoutp02e003dae3c4e6562130ec81006953eda1~llshnuQL10400204002euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005814;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+hEcDHRa9aZ6yFGFMOqA/vaS9g0tKra+R2l/lJu5oW++Eg8GYxqCrYGAkU++SG27
	 80MDiYSknFlVecCsz3wbeJAVG/aVH7HTTyZ8UA2AvL0fx3b0lGy1ZRKD+s94wGjL72
	 rYGEcbSawFK2lhe0VpEc8hwcApT83hZsh6TqNZlI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106225653eucas1p1f4445ad04b7eb455ba1bcd7992143694~llshMlcAi0802308023eucas1p1m;
	Fri,  6 Nov 2026 22:56:53 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225652eusmtip284c23b74aa8f5e1bb9c46a763246c71e~llsgdIHgu2228922289eusmtip2V;
	Fri,  6 Nov 2026 22:56:52 +0000 (GMT)
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
Subject: [PATCH/RFC 6/7] dma-direct: do not skip cache maintenance for
 highmem pages in no-mapping allocations
Date: Fri,  6 Nov 2026 23:56:26 +0100
Message-ID: <20261106225628.215319-7-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261106225653eucas1p1f4445ad04b7eb455ba1bcd7992143694
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225653eucas1p1f4445ad04b7eb455ba1bcd7992143694
X-EPHeader: CA
X-CMS-RootMailID: 20261106225653eucas1p1f4445ad04b7eb455ba1bcd7992143694
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225653eucas1p1f4445ad04b7eb455ba1bcd7992143694@eucas1p1.samsung.com>

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

