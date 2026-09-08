Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7402F1FC3;
	Tue,  8 Sep 2026 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877034; cv=none; b=q7GGPjdgOQIVL21QK4o0JW2ftTDOYIwBAG4aT8JfTA0HropWavNdi2p3C+KwUceS6uhtbTw+4yD7bzTGiijDtGhAhk74XvO4yrzsotlGhkYQgWT6yEpBLgktwWWrJ1uRM8a5ZwMf1RHdc29hoi212CCUh1sof0l+8V4XGkcCgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877034; c=relaxed/simple;
	bh=t1okoGPaxHAt35FqcHquy0wxG8EyE9Pc1d0XxM7Rewg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h12S7LeBYvlE8R6OZ6dUwi6+tHF6Y3nHim53ximQB3PetYbf8PVpp5QmcfD4G+2+Aj1tgQ6lEMFERyUBZeCipXnc2wkIfe5h6KjdrOU76Q/WZH+wil6ZY4QWX0xr89S5rW5fB2qqzXTQjxtqLg9TdNGfpJw2rvoHA8JX1Qo1PDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1x3wd3-0002fh-00; Tue, 08 Sep 2026 16:16:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 87ED2C0133; Tue,  8 Sep 2026 16:15:18 +0200 (CEST)
Date: Tue, 8 Sep 2026 16:15:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Octeon: apply USB FDT fixups also when USB is
 modular
Message-ID: <aqAYdvTNO4DOYAdF@alpha.franken.de>
References: <20260827175728.1574-1-orgads@gmail.com>
 <20260901193357.1352617-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901193357.1352617-1-orgads@gmail.com>

On Tue, Sep 01, 2026 at 07:33:55PM +0000, Orgad Shaneh wrote:
> The uctl/usbn device-tree fixups in octeon_prune_device_tree() - which
> set the board's USB reference-clock frequency and type from
> __cvmx_helper_board_usb_get_clock_type() - are guarded by
> "#ifdef CONFIG_USB", which is false when USB is built as a module. The
> fixups then silently disappear and octeon-hcd sees whatever default the
> DTS carries (12MHz crystal in octeon_3xxx.dts), leaving the PHY dead or
> the bus erroring on boards with a different reference clock.
> 
> Use IS_ENABLED() so USB=m gets the same fixups as USB=y.
> 
> Fixes: 7fd57ab9d9cf ("MIPS: Octeon: Fix compile error when USB is not enabled.")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> 
> v2: no code change; added the Assisted-by tag for the AI assistance used
>     (Documentation/process/coding-assistants.rst).
> 
> diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
> --- a/arch/mips/cavium-octeon/octeon-platform.c
> +++ b/arch/mips/cavium-octeon/octeon-platform.c
> @@ -18,7 +18,7 @@
>  #include <asm/octeon/octeon.h>
>  #include <asm/octeon/cvmx-helper-board.h>
>  
> -#ifdef CONFIG_USB
> +#if IS_ENABLED(CONFIG_USB)
>  #include <linux/usb/ehci_def.h>
>  #include <linux/usb/ehci_pdriver.h>
>  #include <linux/usb/ohci_pdriver.h>
> @@ -1080,7 +1080,7 @@
>  		;
>  	}
>  
> -#ifdef CONFIG_USB
> +#if IS_ENABLED(CONFIG_USB)
>  	/* OHCI/UHCI USB */
>  	alias_prop = fdt_getprop(initial_boot_params, aliases,
>  				 "uctl", NULL);
> -- 
> 2.47.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
