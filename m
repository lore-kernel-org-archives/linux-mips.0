Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101336;
	b=Ydano3QoMGoaEOdE216pdLh7HnAxrBUhZEQQvZwtnxO9FeCVoaBr2oHqP1LeyUbO/BMX
	 Nmm2gNITZh9El8mRJz8ya4XRNAz/kuOlhiG76OisU5pius8Mm08imT2hoJKsWlj7z8PI+
	 z5xjq3IEJCfjV3xinrextlsrG5eOqnMnv3BXMROgkv8241oMDZf7qk4b+aAVzzXHosHH9
	 mqd00kY3II/88aVDhOeIv2xMr3Tx3IO7qRA8U2Qkl7Q5eFJ+d/Rjc87L2cj6UXzQsEM0w
	 iuyHHQ4JBw8DiDcqVMi/sS+3RKfadsSHBKIWWXNnS/AlbXWSM5JYGtBlw/VPpRLcH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101336;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	b=GJ5QaDeu46wdVGENVQFvLUQrAoe+frkXp2IoBrPbBtbUcfc36uZgk8tvriYtqfKgsIRx
	 6+3Q/5nAitxayz8VIDZrsCau9z9F1Q38rohSjtrJfY/lD+3XynPDAV3EOFrFvEvysqKB3
	 taS75jv353ZuBbOA2pvaLcw8zPPqrRpDsDaL68gEVaEFpPv3zqJ+4U9kBslUTT93xjhnK
	 nN/rHOssSgdp3Jqf8AllbNOyAsK8HiTsDOvSF1OQEgwLK1rLRYxKSpcSdEBxuWX/h+ds1
	 Nj548CSonZQGmgI2swx7vGDBciXgUXbgWZNa2Owdo1G7gKKNf+nRkIIgS23Vlyw76ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GGwysuCM;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8356E60A261F
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 15:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8356E60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GGwysuCM
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261119151534euoutp01da3ec1d20b03ae39818ea5676595c577~peycSCEMn2662526625euoutp01b
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 15:15:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261119151534euoutp01da3ec1d20b03ae39818ea5676595c577~peycSCEMn2662526625euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795101334;
	bh=PAOoyIXuxloMyFzXEbyj4BFenlPEGjvo8fDerrpcXPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGwysuCMXPEPYjVeusWJL4cnqdklOJrdDsEMbcw/j3NnvHZMPeqlUcr4E/oDluULx
	 4BwDs44vQQGvR0Z6rAM3EckKj6w3zfKtvxLpq5/xho3Zacs13TyFMxW0SYJahcYFYj
	 3IyjED6THoWPLR7KO/NTPgI9Xu+NcX+iHjPMbsr0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e~peybucct00881508815eucas1p2E;
	Thu, 19 Nov 2026 15:15:33 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119151532eusmtip1c3870825822d25974aa0874a95107a8d~peya_J3Vx2049720497eusmtip15;
	Thu, 19 Nov 2026 15:15:32 +0000 (GMT)
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
Subject: [PATCH v3 7/8] dma-direct: do not skip cache maintenance for
 highmem pages in no-mapping allocations
Date: Thu, 19 Nov 2026 16:15:15 +0100
Message-ID: <20261119151520.2383226-8-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e
X-EPHeader: CA
X-CMS-RootMailID: 20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e
References: <20261119151520.2383226-1-m.szyprowski@samsung.com>
	<CGME20261119151533eucas1p26a727ce85c6e07dad9cb117162de518e@eucas1p2.samsung.com>

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

