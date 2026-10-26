Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044815;
	b=zDuikHopBAWoHyg8sLikXRtklEcnUJEA7SW+EifD3IjuarTqYfNsc3qYBvNtYnyqQ7L3
	 FLvy/TCFpJjU6hO6FnCj0ujfwVxoQEqVLQC8CIlC1ZbpFxqWzlyvMbturdiiE/kEmNMmc
	 cqE2o5nkApfMv2JWYY34pskl+ZP8tu1zFtTQ9oiklQU5EmLrxA6dc4d1EALe4I91UTqzc
	 UIeg60Wv8Q9LoYADANKWx01vPO0xIkr5v+KP2zzQyWEfajavGBDbn8D3kvDTn6IMxTSIR
	 yvDUKMq6Rya9Qf1mLhN6lrvHwvNUnwlCRuQk8eqQRFvCWqxnm1Em5aHEQNHxFlPojMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044815;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=yjpEJuwd/chEbV+8REbDswEYUFqzFB5fRglTNP/t88A=;
	b=1xh6qxCdI2kfIfoRJe0JsoGy9OtFdDAXQX0KX8ov6X92pgHNFl9f2Pizz4QDGtalKv6C
	 /5ZYQ3bc5bQFnOPwShS9FQ/lb/koUGzaVqviuJgnMuqlh5JUbT0I/Z3lTGbA9HHmeqDDx
	 WEeQUYboztOwpsrUR0+lwA8gsSe2UqCQZuZmaIZC4IVJxWCazWZCWJ/gPgAyZbqdes6Cg
	 4ybGPj1kUsb8NNIf9C0cxEwjzwewNVbxU2WafFlM2cOVBqgfM9w2I+GhAoPab0f4nIHJ6
	 bFC0nSvwSOLCH/YcoJeNrBxWANSX3PpV2IGpE6IjDpmc6WTu9VZ9Fi+xIrtYWdvsE2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FC1606A31D;
	Mon, 26 Oct 2026 20:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FC1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 111F592009C; Mon, 26 Oct 2026 21:00:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0A16992009B;
	Mon, 26 Oct 2026 20:00:12 +0000 (GMT)
Date: Mon, 26 Oct 2026 20:00:11 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Imre Kaloz <kaloz@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: c-r4k: Flush the cache error vector before
 writing it uncached
In-Reply-To: <20261026120430.13238-1-kaloz@kernel.org>
Message-ID: <alpine.DEB.2.21.2610261935230.42255@angie.orcam.me.uk>
References: <20261026120430.13238-1-kaloz@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2026, Imre Kaloz wrote:

> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
> index 5099c1b65a58..753dc3d7b190 100644
> --- a/arch/mips/include/asm/cacheflush.h
> +++ b/arch/mips/include/asm/cacheflush.h
> @@ -120,6 +120,7 @@ extern void copy_from_user_page(struct vm_area_struct *vma,
>  
>  extern void (*flush_icache_all)(void);
>  extern void (*flush_data_cache_page)(unsigned long addr);
> +extern void (*cache_wback_inv)(unsigned long start, unsigned long size);

 Hmm, I'd be tempted to call the hook flush_dcache_size() or suchlike for 
consistency with our existing nomenclature where "flush" stands for WB+INV 
and to signify that this function doesn't touch I$ (the *_range() suffix 
is already taken for interfaces using start/end rather than start/size for 
the boundaries), although our naming seems messy overall.

 Any other suggestions, anyone?

> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index d8aadd3dc057..11bb82263b63 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -743,9 +743,7 @@ static void r4k_flush_icache_user_range(unsigned long start,
> unsigned long end)
>  	return __r4k_flush_icache_range(start, end, true);
>  }
>  
> -#ifdef CONFIG_DMA_NONCOHERENT
> -
> -static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
> +static void r4k_cache_wback_inv(unsigned long addr, unsigned long size)

 Likewise accordingly.

> @@ -1743,14 +1743,15 @@ void r4k_cache_init(void)
>  
>  	flush_icache_all	= r4k_flush_icache_all;
>  	flush_data_cache_page	= r4k_flush_data_cache_page;
> +	cache_wback_inv		= r4k_cache_wback_inv;

 Please update arch/mips/mm/c-r3k.c accordingly.

  Maciej
