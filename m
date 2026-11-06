Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005816;
	b=pCbGUndXXDSTTQnNgykNUbSiHEhA3Z9WfREzDKEUdtI533ICCXi3EcXkqzZxWP+jjBER
	 wS6dWEDQOeAFlVzxXgDoMug3ITTtsqrOhuHHpGUw5o/LIfNupcTbEjjgWL3pSLbBmuCeY
	 MQ8f9ad4Dv12hJvgxeIzZKSarJFmsdPF+FCE2oHJf3UDEVKKyVycrIQbbFklRlG40Xrbl
	 w+5VoEnViHJUYlCwS3SzO/p4i7WQFRsVmYR7rXZkyX6N/wf4VBGI9M4CvDAZKMdfzh2VG
	 +BigJEDgOBAASfUbM6xedgqzsa5MxDqSa9l9x42aHaHH/+XUHManGyfgf2fNWvGlJzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005816;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=a7hoW57Gyr9CSOcHzQjMhTzQYXncvMF6awqNiCCmApc=;
	b=MtXQ0+6yIrd5PwZDAc45GMB9BIaCkNCHk5O6A3DO655h2YRB7Rtc7ebgKthE6e99W916
	 V0tgq7y8Z+RE4C9d37z1NZQjoo4BuNt+Ak6XMrQErhhJTNSabJH/Q7Qp4GMSZkCotHF6k
	 GigPQlVw+seR3wRlrpuWkM29v1wj4ilOCA4C7FYgmWHuWKwY9WKhaTOaaXLx5fV/PM8Vt
	 nXOF18lfx5H+v79GB+ltYJAN4gIpvKn6joWS40S7VcAp/TXw/tZbC6bQXDytq0OctzKwk
	 zfLRyBuF0PJvkSvQrsxNyDmFmJ3KmyUf4bK5hKti0AjDaabtgEo0SUgBvp0JE3UDTcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=f7f4GtVW;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D5606D813
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453D5606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=f7f4GtVW
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225654euoutp011e5f9df66044f6337106c3297f653085~llsia3-gN1319913199euoutp01O
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 22:56:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106225654euoutp011e5f9df66044f6337106c3297f653085~llsia3-gN1319913199euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005814;
	bh=a7hoW57Gyr9CSOcHzQjMhTzQYXncvMF6awqNiCCmApc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f7f4GtVWqRQP+iE6ZAuwtYmRdvGu5p47JDBkuG+xxreX4gWuU4Wwuul0IBaJbKsuN
	 5wKGDf3+dwApkXC6ULmbPshO/yYbqGKJGDhvz2nLxp53c7bumdzabbo5KACAMQeqho
	 KUxUYH2bK1JNo7aSwxMisHR07+1l6aPvTQcD5cdw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225654eucas1p22d7e8c8769d952eef8a7c2cb15923e3c~llsiApKOZ1972019720eucas1p23;
	Fri,  6 Nov 2026 22:56:54 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225653eusmtip2b8dedcc6c7d1e79f93d374b036c15c2c~llshRzBYv2228922289eusmtip2W;
	Fri,  6 Nov 2026 22:56:53 +0000 (GMT)
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
Subject: [PATCH/RFC 7/7] dma-direct: zero memory allocated with
 DMA_ATTR_NO_KERNEL_MAPPING
Date: Fri,  6 Nov 2026 23:56:27 +0100
Message-ID: <20261106225628.215319-8-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261106225654eucas1p22d7e8c8769d952eef8a7c2cb15923e3c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225654eucas1p22d7e8c8769d952eef8a7c2cb15923e3c
X-EPHeader: CA
X-CMS-RootMailID: 20261106225654eucas1p22d7e8c8769d952eef8a7c2cb15923e3c
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225654eucas1p22d7e8c8769d952eef8a7c2cb15923e3c@eucas1p2.samsung.com>

dma_direct_alloc_no_mapping() explicitly clears __GFP_ZERO before
allocating the pages, so buffers allocated with
DMA_ATTR_NO_KERNEL_MAPPING are handed out with stale contents of the
previously freed pages. Such buffers are typically passed to devices or
mapped to userspace, which may expose old kernel data.

The mask comes from the regular allocation path, which always zeroes the
buffer manually through its kernel mapping once it is set up. The
DMA_ATTR_NO_KERNEL_MAPPING path returns early with only a page cookie,
so it never reaches that memset(). This has been the case since the
attribute was first supported in the generic remap code in commit
e440e26a0251 ("dma-remap: support DMA_ATTR_NO_KERNEL_MAPPING") and was
carried over when that handling was lifted into dma-direct.

All other dma_alloc_* paths always return zeroed memory, so do the same
here. Passing __GFP_ZERO to the page allocator is not sufficient, as
__dma_direct_alloc_pages() first tries dma_alloc_contiguous(), and CMA
ignores __GFP_ZERO.

Closes: https://sashiko.dev/#/bug/linux-c4421083-e44e-4373-a2c2-45649ea49c0b
Fixes: d98849aff879 ("dma-direct: handle DMA_ATTR_NO_KERNEL_MAPPING in common code")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/direct.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index fea0dd36dd25..4bfb3e76cd76 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -6,6 +6,7 @@
  */
 #include <linux/memblock.h> /* for max_pfn */
 #include <linux/export.h>
+#include <linux/highmem.h>
 #include <linux/mm.h>
 #include <linux/dma-map-ops.h>
 #include <linux/scatterlist.h>
@@ -201,11 +202,16 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
 	struct page *page;
+	unsigned long i;
 
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
 	if (!page)
 		return NULL;
 
+	/* we always manually zero the allocated memory */
+	for (i = 0; i < size >> PAGE_SHIFT; i++)
+		clear_highpage(page + i);
+
 	/* remove any dirty cache lines on the kernel alias */
 	arch_dma_prep_coherent(page, size);
 	/*
-- 
2.43.0

