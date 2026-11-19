Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098977;
	b=uMIz/NTeB//PY3RoUNmUNo3E9g1u6AtjDw3wKtXhRb9YqWt5oi6j4hmZo4aGyD3GJnW+
	 JgZd0DCPIUD4sCO7SONUTL4y/0PCcpb/oUIB6SqSPcYUY0mTMWwN9AJoqoJbFstp1uDL0
	 EOgWCUpsbhK/zpUdsmwkC/1IyFho7uEmepLmckFFuu/yymc4sIsquIOK7ZPnBFBX/p6am
	 U9gpudzOO2kedXz5K3huoZ93UjmYMst8FtgsIolghNRRJf9rTV8ymmODicMP9aegil6oL
	 4DfHM2kwP3B6mXnP1X9dGxUqWV5vMNyAhsP/FLw2AEn6tRGXyyC8hGOSwp56JkyKO+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=VnF6ja6VhKpFTfNVvE3jU57UL6Hk22nBfY4kDDWDjbs=;
	b=UBmqRuf6agKumX7TSpSh89JzxA6Y9j8H7Uv/0IZcVbQHGCcz+LeV1e9G8Oy4bDRnueyO
	 wX0+I8kxWiaxQbKFUlRHLo/09a678uq8mDCLAFL/z5CyKXtPoEwsdRPra0sBMsO1UZeHt
	 A89iFfPbNlm6swZuMmStU3PHDThCItWZDj+sj6H4BksIvx0v2BSMW0waXyo1EMpkcG3cl
	 TnLQG60oF0+sC4mQKT5AixCxn7oET7c3o6DPn+y98u9NBZkk1g4iRrGK/Z46YbntPr5Oa
	 deO+kNCLAlii/iy9i+AvYlhgnjadklRBwTFrhozFQWdhkwNkZcnrPQaQiUd/ZmhnS/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAjP9YlQ;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B97606A324
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 14:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B97606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAjP9YlQ
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so963804a12.1
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 06:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098976; x=1795703776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnF6ja6VhKpFTfNVvE3jU57UL6Hk22nBfY4kDDWDjbs=;
        b=nAjP9YlQhp87upLUjCnTWUK45A5Zxp7wBMkLLCTB6NgIQ2aegv9kHC2oURGZKk6/JW
         GCHF4AI706JepZlLo/xsRgjQFhsMAZ1RL9P/LM1+7PnvYbCMhB75Zkq1Db+JGi3HiaxS
         J2TqAn3eGZhfHhaEZdSB9Tsyw/lhPG0hYJAhLSA/smdfmPCwbKZ9Y8gFnx2Dyh7O5jPF
         NsbxOkfEs8gu8NOfTs4C/1w865lpJGwcyYC8Nk6lkcC52Bom06AhhSZW4YM1hqAGIhhw
         2AAfa2gw2OFXCK2tPGgWQ2TdgrYQ/us85wRvr6RZXCTqrC8lB6J26j85uOXfquLk1G7/
         7RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098976; x=1795703776;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnF6ja6VhKpFTfNVvE3jU57UL6Hk22nBfY4kDDWDjbs=;
        b=truWYUKo49dwyizGmMENPBgqRjuMRYxOWuSboTAkhNeTcE+2uMs5W813mXCWO47kqv
         VEGbfa07++55IhvXLhVEQ5Z/u3z3lzS2lsRQ9YEDRc5EE5V7jMbL60Op5oBNk9PQubbw
         Sol3JrUVtl4MkbkM4p3bOX76dFH0RZXee/S6+Thr0jXHTyFiUBteJUCpDzkxCIg8vHrR
         AqP17a7Miu/+0dyW/pt/Ay1oCQbtGhmOCJUJHsZPzzk5DMoHIROJEboj803yka9FGH7K
         h9nviknmszV/h6xdFaAelMAIcAHBPBkgPTxYdSnh32AnuwouBRI6fMP7RxGISVT5to4Q
         WhGQ==
X-Forwarded-Encrypted: i=1; AL+hErHBwjlNqEHtQh6KOR9t0uCxea1niBQTxGtonKDm/3kne0Eiscegq2cRVHqgh3c/Muu8zXZbk9GCqROk@vger.kernel.org
X-Gm-Message-State: APuU4Z+FQYaUQe0LpfyJcBe5/nuLxy8KydWoHHCNpiu4WH0oZcx7b3Vs
	XlwuW6gLLJbWEI+EVw17EK9o+tXHMH0nNSQVZsXYnuHSG/pfprgvv4uM
X-Gm-Gg: AZFdTZeCa7o6cruZZzC9rgAlmjDvXLJu/Y1i+X15V60ygJ3P/Dpg0YM3cmfKW9szpz0
	M4XzNH5KwNJvKok49NOpGgsyLx3CMZQ61bissWV2NR0TOhaH1HczHeHJRJ6LOa4QONAtGVIBKeZ
	JLhByXEJnd3+Kn8DtQ7+AtxRJG8RE/bofOCuIVOTUwJgrVeecN0SKtU9UzD7W6jgvTX55GAizfV
	PFBG0WdJ18vyoIpIPEzQBDgC2HRXshoajB3TLblmC0Mb/uH2xXOTS1pGt9OVjNSeZJ2LDmWK1nQ
	kgDqNFjdMF3+et6j95fMIsr4k8LMq6Pq3LrbAGjIwN9j0h1g+rdTJLcYVt05LRLM74YAuP7tPLY
	KH2rrQx3GLbD0CuVMGbXnu1/5gY7cLT+HmX9e2e6yt/MbbMMg7X9aQsdvBEKi8/8KJDARFFbrbo
	eogvZT57zmuidmgMJ6qOWWPuIMHO68LM5pIUZo+17jeeVLzRSfMG89DlpOQai2M4DYzK+YXS2jv
	kfrnXJX4LXHMI7iFs2xCmLp0f39+06usI14pjUhGoDkZyY063uKasuuWfkDY9C0n1VtOwgMjpLM
	yVIper0WqDcV4KbyRthSKVjTTWjsFp5jkuzWwzS/ucMLLOF8
X-Received: by 2002:a05:7300:bc19:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3827f98ff0cmr7469514eec.11.1795098976262;
        Thu, 19 Nov 2026 06:36:16 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm19156884eec.28.2026.11.19.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:36:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, "Christophe Leroy (CS
 GROUP)" <chleroy@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 4/7] powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
In-Reply-To: <2b64e853-89a7-4fa5-a4f8-2c6b0b62bf74@samsung.com>
Date: Thu, 19 Nov 2026 19:59:02 +0530
Message-ID: <5wxslwsx.ritesh.list@gmail.com>
References: <20261110094830.2081847-1-m.szyprowski@samsung.com> <CGME20261110094850eucas1p1f10fa1473aca341473077f60a088b490@eucas1p1.samsung.com> <20261110094830.2081847-5-m.szyprowski@samsung.com> <jym96n4p.ritesh.list@gmail.com> <2b64e853-89a7-4fa5-a4f8-2c6b0b62bf74@samsung.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> On 19.11.2026 13:07, Ritesh Harjani (IBM) wrote:
>> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>>
>>> arch_dma_prep_coherent() performs the cache maintenance on the address
>>> returned by page_address(). On 32-bit powerpc with CONFIG_HIGHMEM that
>>> is NULL for a highmem page which is not kmapped, so the flush would
>>> operate on the wrong virtual range and leave the dirty lines of the
>>> buffer in place.
>>>
>>> The generic DMA code may pass highmem pages to this hook:
>>> dma_direct_alloc() handles a highmem page returned by
>>> dma_alloc_contiguous() by forcing the remap path, which calls
>>> arch_dma_prep_coherent() on that page before creating the uncached
>>> mapping. This cannot happen on powerpc today only because it does not
>>> select HAVE_DMA_CONTIGUOUS, so dma-direct never gets a highmem page
>>> there, but nothing in the hook's contract rules it out.
>>>
>>> Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
>>> arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
>>> one at a time. Without CONFIG_HIGHMEM it does the same
>>> flush_dcache_range() on the linear mapping as before.
>>>
>> Does that mean, this change can add additional overhead for
>> CONFIG_HIGHMEM=y kernels, where the buffer received still belongs to
>> lowmem? (Because of extra per-page book keeping like
>> local_irq_save/restore, kmap_xxx). Thoughts?
>>
>> Although functionally the change looks correct to me. But maybe
>> __dma_sync_page() on powerpc side could use some cleanups (outside of
>> this patch series perhaps).
> Indeed, __dma_sync_page() could be improved by calling __dma_sync_page_highmem()
> only for highmem pages. Something like:
>
>
> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
> index e646256365d5..199ce0467b58 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c
> @@ -97,11 +97,12 @@ static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
>         unsigned offset = paddr & ~PAGE_MASK;
>

Should we return early if size=0 is passed. Although I couldn't find any
caller where this could happen, but since we are doing "paddr + size - 1",
hence wanted to flag it.


>  #ifdef CONFIG_HIGHMEM
> -       __dma_sync_page_highmem(page, offset, size, dir);
> -#else
> -       unsigned long start = (unsigned long)page_address(page) + offset;
> -       __dma_sync((void *)start, size, dir);
> +       if (PageHighMem(pfn_to_page(PHYS_PFN(paddr + size - 1)))) {
> +               __dma_sync_page_highmem(page, offset, size, dir);
> +               return;
> +       }
>  #endif
> +       __dma_sync(page_address(page) + offset, size, dir);
>  }
>
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>
>
> Do You want me to add it as another patch for this series?

I think this should work. I guess we should add this patch first and
then patch-4 on top of it.

Thanks for taking care of it. This at least will avoid the extra work
which we would have done otherwise for highmem kernels, where the buffer
passed to this still comes from lowmem.

-ritesh
