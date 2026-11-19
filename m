Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108997;
	b=DhbukSct2Df8xleNP10iSGvO0hae8ecn8ZSfrd/e00a09rpRNIfC4pOE2VqAgFLMQ5xX
	 EJao9wiUdCDVChVK09WfegjXDShD54JT5g2zWF3vNq74g1joXpQMYkYp4SH3gYtzW8M0f
	 pt5NnMG+IifIBeFb7nKdd9qXAzo5+iTyJEtG6BlK66Rx24whrl8faGrrqKOI7a6OeqrK1
	 2Cs1akgR91oAnQ93SiKglyM4+vrsEZDWRpmGNQmGU2/j08c6sjtjYoMlaz1PR7B3qPSAQ
	 RJLrMrLoUQ8nQtr7nC8Tgu6H4tn6IYpqFQCS3qWx9aukfqzGz+jN6PaKVinVcMsxWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=dvwpM6x9UyT5LtxoyNzaw4LyWCYizJm0AMP5Y1DvOYE=;
	b=AXGF+J53Qr4NFwZDPKzyGwS70UDItKW5RFfHeRpA+imQavpnRGKPu6hdMintjj96s30i
	 68pg7ZIDX/8rn34TSMhxcZhtjI/m8teapwqI3twS6qCqww/3GO7SmudU0FXCDGkBL4q+b
	 s73AOdwPHDi2+0+OoXWSB08YYa0GVwAjxnDX/fKElpsk3aKiQyX4iTdy9BCYgZ9sop5b3
	 73O1gdE98+ePQGX6aUzxATr+Ya88Lxq9D12KIWnI5rndcQB9wDm1GWDEYSjLU651WqBeH
	 0IenmGKNyABQ7YftpSODRjzVduvSIwy4ayT/Vq8CsxhMx0BjjiXKgCwDbn7wHCEdoqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr2mE5V0;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29221606A320
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 17:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29221606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr2mE5V0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so5754823eec.1
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 09:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108996; x=1795713796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvwpM6x9UyT5LtxoyNzaw4LyWCYizJm0AMP5Y1DvOYE=;
        b=lr2mE5V039VB51Vsm/jWl3rrHr6VYkhtZ435HmeV3b+Q9iIig7dYr9Xdhv5iThmAY0
         7zu0pGrVBW1+tc3zOhqWk5nmnfUibifLRaPn1romfsmuWWzM/D0s0xLBxOOFjuU9kyzp
         gDXa27D5drpJ4btnm9hwGVOANYEOeaLCotZME39JJMC16/0ALhFKnRImFlvvReJpEsXk
         LLyh9mIylJB8y6EPwpwPQwrwAhyZG6de4tHE10z9suIJdUjfV2gyZa3/n0E6HfmLTO7o
         90udpZZM3kODzi4ET4fDk/bufnAYXhZfcmqMB3Fk9UZnNsOOO2Fyqvi8/uaLJ29Oz6ji
         3lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108996; x=1795713796;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvwpM6x9UyT5LtxoyNzaw4LyWCYizJm0AMP5Y1DvOYE=;
        b=zXBjRNYMNJwX578+Zk8wOHL9kyTgKKicpc0CpmkX4mRnIVKR4q9J5LC58OynDsD66e
         9maRdm7ve3XTXPb2F6eYNQfa7TLRvRx9Q6N91xLydpVEikktJumatMjaqlRWTjpJDhrk
         znOGm8kBbaVv8Dy+kZ4fB+kLU3STd6eIV/ELjah8Gv/py1RA/Pwh0vN9NmMcI/aqWTeV
         kMll1wwb7cmSSvGHzpYeN2aeWajDGSSG+RcjzTe9lV0hp1OsoIloeAGG1CD26gCeSheB
         IJfjSX7BAtw+GU1zRmvZJ347Po/0tmyyFvTgTc5MwUKPXkSXZ6i/wTNTgt1lyZCBSFT+
         MHgg==
X-Forwarded-Encrypted: i=1; AL+hErFXP23iYTc7f/EIBMISI1Hjibk4q2jvf91goLWRxXDyHaM6yO4EYvGrLBLf75Z5leBD4XR0udWssUQk@vger.kernel.org
X-Gm-Message-State: APuU4Z+zHPc/mGkQDAiVevSi5/5fYG25PtGcHmTUXFn2Cyv9ucfRdJ3g
	B+5jiDwD6zf4bIgcXODgBa0n+XhxT2wZgbxE1lNr0nrlbSyZnq70KDUj
X-Gm-Gg: AZFdTZf6dYJCAnhqTB9/9d79lZa6AgWwLdtf7cF8K/oZudBJnSuUOdDHmliUDy/j/wA
	IoVtstpYYRnixvArzs5TKdi0RwuieHmkRDvWgKy7LpOK377I/JVhGSrIrEgzSgzkJ1qcDUNFh2P
	58eyXJMYUKCvwFP/c/74nhPCahF6d90goWI77ybVDVqSc3xB6Ex+qAELYPKa6oc/0WXnivBs8VT
	aPrWxL5jea9BT1YuyEbf0B6OiiZLtCyFrnA8G1j6eSD+bmMvJA0Hv1AciRkcFsUEE3lWA5Rrcy6
	EtTrBWt+2A5FiOQrv+r4DxpzixiI85Zr0aze25/iRw7uQ0aV45S40WfiwjBV+glZ5DTeCFYMT5T
	m3qb+rykcx+fiDshgafArVXq55SU8WcvnIM001R3r79Xin889x+7PnRhOXyh9awGJmVWd7x+Ieq
	3YJ/+YnqU/wfkVdFlyX9KW/JUCy4jQhi/koxqUcfLh8aeZScchTZ4tM0Ev5wKZBbhM4MzyMRiBw
	Lv5UY57GX7sE9Yhg9o/tkaaq+d67/i63VWBtzfJFtEuQWjHDkwHWY/6eq9Wi5rs/lxbWbp9Xou5
	iomerd5FcwicqcmGt47lX+bjDtUpQ1DTWS0uoDShjuzofyg4
X-Received: by 2002:a05:693c:829b:10b0:383:a0bd:275a with SMTP id 5a478bee46e88-3856e947850mr47370eec.7.1795108996234;
        Thu, 19 Nov 2026 09:23:16 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm265231eec.26.2026.11.19.09.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:23:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v3 5/8] powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
In-Reply-To: <20261119151520.2383226-6-m.szyprowski@samsung.com>
Date: Thu, 19 Nov 2026 22:45:22 +0530
Message-ID: <33swlp3p.ritesh.list@gmail.com>
References: <20261119151520.2383226-1-m.szyprowski@samsung.com> <CGME20261119151531eucas1p2be2ec1360d1d94c80b200c53b25f292c@eucas1p2.samsung.com> <20261119151520.2383226-6-m.szyprowski@samsung.com>
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

> arch_dma_prep_coherent() performs the cache maintenance on the address
> returned by page_address(). On 32-bit powerpc with CONFIG_HIGHMEM that
> is NULL for a highmem page which is not kmapped, so the flush would
> operate on the wrong virtual range and leave the dirty lines of the
> buffer in place.
>
> The generic DMA code may pass highmem pages to this hook:
> dma_direct_alloc() handles a highmem page returned by
> dma_alloc_contiguous() by forcing the remap path, which calls
> arch_dma_prep_coherent() on that page before creating the uncached
> mapping. This cannot happen on powerpc today only because it does not
> select HAVE_DMA_CONTIGUOUS, so dma-direct never gets a highmem page
> there, but nothing in the hook's contract rules it out.

That is correct.

>
> Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
> arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
> one at a time. Without CONFIG_HIGHMEM it does the same
> flush_dcache_range() on the linear mapping as before.
>
> Fixes: f2902a2fb40c ("powerpc: use the generic dma coherent remap allocator")

I don't think we need a Fixes tag here for the reason you quoted above.
I’m afraid that adding a Fixes tag might cause this patch to be
backported without the previous patch, which would result in extra work
for lowmem pages on highmem-enabled kernels

I think we should drop the "Fixes" tag here.

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/powerpc/mm/dma-noncoherent.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Otherwise, LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

