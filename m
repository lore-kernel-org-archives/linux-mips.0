Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D8B39D6FA;
	Sat, 26 Sep 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418490; cv=none; b=jqHRVV9AGbYLna7CXuoxShDqIMxkxzg5OGyZF2tWBRI+gzI+Y2qMdeU0R/Ip+84ygZVPEE0mQrTCYhM0CR8Lz1sNtMZKmouvdtw/M+G8iBBPh1AP7fWHb/tRQrRtKuQuhg9PPPW/9ZCRNW27uR0W8Y4XUhmMfLMLiW25anyRdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418490; c=relaxed/simple;
	bh=H6N6pAq+DjIrovYoSA00wVda+pBoEDMYedDqq39xHgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNftCmGbCHOaKJE/U5xSKPutb6upN71dzQbUJafEr+bDsO2AIYFQTtT25uHckGEO25o2fdrTxILQb4lnSCEVz13xgkQ43YqdmZxLMrFf2BJUrsu9T4DmLGTchzn2fJ0qQ499dg3l3O+dSiGGrFp12zud+IKC1hZiFIliiePF8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007LJ-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5D1B9C0C8E; Sat, 26 Sep 2026 11:37:31 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:37:31 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: Octeon: size the swiotlb for a modular OHCI
 platform driver
Message-ID: <areSW06DxCXn-4mR@alpha.franken.de>
References: <20260915081828.25800-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915081828.25800-1-orgads@gmail.com>

On Tue, Sep 15, 2026 at 08:18:24AM +0000, Orgad Shaneh wrote:
> plat_swiotlb_setup() raises the swiotlb to 64 MB on OCTEON II with
> memory above 4 GB, because that OHCI can only DMA to 32 bits. The test
> is "#ifdef CONFIG_USB_OHCI_HCD_PLATFORM", which is false when the driver
> is a module - the usual way to build it - so the bump is silently
> skipped.
> 
> What is left depends on the rest of the function: with PCI enabled the
> "memory past the BAR1 hole" branch happens to ask for the same 64 MB,
> but with CONFIG_PCI off - which is normal on these SoCs when no PCI
> devices are wired - swiotlbsize stays at the PAGE_SIZE it was
> initialised to. A full- or low-speed device on an OCTEON II board with
> more than 4 GB of RAM then has no bounce buffer to speak of.
> 
> Use IS_ENABLED() so a modular OHCI gets the same sizing as a built-in
> one. Seen on a CN6635 board with 8 GB of RAM and
> CONFIG_USB_OHCI_HCD_PLATFORM=m.
> 
> Fixes: a8667d706dfa ("MIPS: OCTEON: dma-octeon: fix OHCI USB config check")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -228,7 +228,7 @@ void __init plat_swiotlb_setup(void)
>  		swiotlbsize = 64 * (1<<20);
>  	}
>  #endif
> -#ifdef CONFIG_USB_OHCI_HCD_PLATFORM
> +#if IS_ENABLED(CONFIG_USB_OHCI_HCD_PLATFORM)
>  	/* OCTEON II ohci is only 32-bit. */
>  	if (OCTEON_IS_OCTEON2() && max_addr >= 0x100000000ul)
>  		swiotlbsize = 64 * (1<<20);
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
