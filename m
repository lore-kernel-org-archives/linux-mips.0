Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090677;
	b=4bjCTz0QqlUuleCJdHBZvtVREeRR5v+CpGbE5SIz4JtWJwiDf2jUBKtg8Crxij5Kka3n
	 QZqBgUvMv4JEi+a3VuujcOAiNHs0CqIitFv4yjlPvNkrtHQpD4h9mllpJSvHzzpBbWmco
	 5cL1t9MYw+VROubswemYqwpZJHXNdGiJCBwCOg0mfjh0UpdTO8iT0qOtxJto6jOvq/VNj
	 gTeRxMTC9Cbmq9pa7/KFv+/8DRxvIqPFVyZaukwN+3MseMEx53md3vnkipB720UwtGBVw
	 gqDHFjlOkq248JgrGOUySKR82SkcUbOGKJDl0+xucIUlWaQkYAwH5UqMt9Qevh2EBOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=SsWTDqy6U/s3LdSWkLHVQ7n4MxNSxrVjauJtJeDqFQI=;
	b=36mWwS5fYN4iKJRtzVBPTp7EOoWKg0fy1SSuOK0PslVR4vhxaZNGBDnhuNeViyZBx0B4
	 Qbi2Ltbiqcvg7wIvAq4g/sm1GMBtYHSzoXFSWRHyI/63RkiN9C21yaZvQV/my5aKd1x2F
	 x4FvyVIsZSYeGJ6nCNZTgFEMp4jJDXGDzvEdWLf8LJ4UeBnUHTW9PGN6MssMfw2cFXUNc
	 2xa/Z3ENTI5Jpkhmo280Q1n0quUTmL7E3AEsjg1Cl1DVKDqb7uxmYfVjU3IR2PFDrqjui
	 w6ORMFrP/MZOlBP1jRSmeUxFEhyTcu/E5O3s41dmplMxug++4Bsqsd5T3Z7VpJh4/IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIkQSdBe;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF49C606A325
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 12:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF49C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIkQSdBe
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2738274c88.1
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795090676; x=1795695476; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SsWTDqy6U/s3LdSWkLHVQ7n4MxNSxrVjauJtJeDqFQI=;
        b=wIkQSdBeKHGD9OHvdEKRNQHd2doiTGcjmt89soALJ+dPNIjXwxkOGo/m+1fOOXh2Di
         okQfvDHLmXLlrKlJzNFiLW4mI+MEL0syItZSnVg+DhTggqmohwpdB4R0pYXa8IFqchoo
         uMYa0wl70C4+RY6J89nJKTrPo5N8d4BABJXXyapoq18vc4pXBTD1o84dwep/gBQa0uuY
         HlEEi3AoKgmKDAS0dYBSLF/OgrI3Aere8AdLzTjpNhjEN1Lg0oaweukW/wYYnVkvwNZn
         1jrBPBT4vSS3A7i8QryHobyqc9Drlsvxb2IPziQOLHYgW3XG+DTQsRUFAXFwDHnou0q4
         p9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090676; x=1795695476;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsWTDqy6U/s3LdSWkLHVQ7n4MxNSxrVjauJtJeDqFQI=;
        b=E427piT4CyySbtuhy5ODdcu15qQ5Dfi/S5yXe8lwI+AYJfUB2baCXQK+0HT6nPdrTE
         Z9y+uiXTZmIsB2k4LQ/0zyoUG9Jf1Yq16R/6DgBMywyr3Hz2al66jsHbLpHCTbZhK40P
         qwdfpnkkaChPQHqB5TzOqQ/VW1t6D4Ka2X+PIAHoODNV1JFPiqu4/zSbJ10HS0WkjHYC
         u6HTICcK7FSR+bGSBfokn5+b9tiQjU7eFYs06WscFcAkmOgvzOEtjc0uGv5azzxUd6pT
         jDDI4xBkR81MnNspPCX9XmeJotlft95zNG4BZp+ADpu8rwJm5eGW31Gjh7AADQz4888P
         vwEQ==
X-Forwarded-Encrypted: i=1; AL+hErHOH6122d9dvwgbHzerPIEnHE5AgcEG8pCiuuH5Z95MMCCnf97mZn0p5Gec4LDGaIMXOA89LzatN2TV@vger.kernel.org
X-Gm-Message-State: APuU4Z9rZRof6lcRqMyMYNwtjs09S8sGOyrMBi+TJaWzNF+dQEZBKOFu
	Sl5eIyjYc374cAPGrEaXesocsJJrwFKpBZfzDi15mn9gcCqSnWCN2bXl
X-Gm-Gg: AZFdTZdP/Ec6jJxoH8nLt4yn/Dnr/h8/4AO7ZNE9iUR9IwpTn4tj1sG1KRNrUT9qd61
	ZotToPt0fURVgLG3Cwl8wVVrXY98xekiOG4lqo6jrx5uTue3YaaoHR9JBFh84mochFQgbJhjTtQ
	GgxVt+4z/MEt8ZnNNUHiBWx77qxq47qeZlkB7nlLhG+67FWI2mgstMJTg2+wZFYV2SDXxbAbOea
	WDzCPUHqdJ7xRdkwYopAb2m2qP6RPW+kdibc4Aw+6S27JHIoClABWBKgu+0wjc17YcnbUBH+6ue
	6JxSjaMo1uBiP2fIp5WTo3JcOWIClFlm5k3bbGmOOG1aPVoLV9Vc1FQtYJBy6y8y6LEA2BulnwX
	Z0Cs/sb2TH83WX97emR2JhH3DVJYtEwJsmPHX3TTSS6zlAYL3ZDxuXX6gftUoIWspez2u+1GYsh
	ZYHmYvWLu79Oy22iFxo75Lkuq4q0kk54GHXrD+LufgCpvQYaZOSbhUwOPbjDjPWQitO8xwwZNjg
	Rr3FpWmsQATcxGkj5/JXzd/FgPN1soz3SBpCv8Vj2qKffV5hQ+fk8wZGGVg7YuihG5l43iYOr0i
	Qx7xHv/slLbFp772LMK66WDr+LDwXyS9ehPBnIcgOZSeZr9LQQ==
X-Received: by 2002:a05:7300:1c9c:b0:361:1dd6:531b with SMTP id 5a478bee46e88-38281025c89mr5440546eec.26.1795090675937;
        Thu, 19 Nov 2026 04:17:55 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm17656695eec.29.2026.11.19.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:17:54 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 4/7] powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
In-Reply-To: <20261110094830.2081847-5-m.szyprowski@samsung.com>
Date: Thu, 19 Nov 2026 17:37:02 +0530
Message-ID: <jym96n4p.ritesh.list@gmail.com>
References: <20261110094830.2081847-1-m.szyprowski@samsung.com> <CGME20261110094850eucas1p1f10fa1473aca341473077f60a088b490@eucas1p1.samsung.com> <20261110094830.2081847-5-m.szyprowski@samsung.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list

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
>
> Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
> arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
> one at a time. Without CONFIG_HIGHMEM it does the same
> flush_dcache_range() on the linear mapping as before.
>

Does that mean, this change can add additional overhead for
CONFIG_HIGHMEM=y kernels, where the buffer received still belongs to
lowmem? (Because of extra per-page book keeping like
local_irq_save/restore, kmap_xxx). Thoughts?

Although functionally the change looks correct to me. But maybe
__dma_sync_page() on powerpc side could use some cleanups (outside of
this patch series perhaps).


-ritesh

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/powerpc/mm/dma-noncoherent.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
> index 30260b5d146d..e646256365d5 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c
> @@ -118,7 +118,5 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
> -	unsigned long kaddr = (unsigned long)page_address(page);
> -
> -	flush_dcache_range(kaddr, kaddr + size);
> +	__dma_sync_page(page_to_phys(page), size, DMA_BIDIRECTIONAL);
>  }
> -- 
> 2.43.0
