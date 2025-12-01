Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681F8301710;
	Mon,  1 Dec 2025 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582307; cv=none; b=clS+kXamaDLnO8rAJESNA39vdKGCegCvG8gkwQaUQPPn+B4j9sHoAA4hAo7aC+4x36/mE+byTumnFFns+lY/YBcaPGUsFex+E4OkkQ8GRZHAjv3fsWfbik+lMGp485SkbIna9sjHltjKrlQnTJuiWus7SO+EREPQyqopQNR4Me8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582307; c=relaxed/simple;
	bh=bZfsTyOj4z1wRRx3q3ooWvBuN6KRGQ9GfHw3L9GOKWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CezYNfPZsV9yXeZWVwBvYU75cCjCXdstfmr8bUBQhNJI9cIv+y7RL501NN3PCQUIE2QAxHtxZIs+Is6aV2z7bPHZuHtP7OMlB3BWrxCoJy5UiJpkvQtk/hoTlyprzTaBEyazNzVzsrx8VZSQcjEKgg56/UsdZgQAm5712fxkJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQ0Sm-0002fs-00; Mon, 01 Dec 2025 10:44:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5C670C06A7; Mon,  1 Dec 2025 10:41:17 +0100 (CET)
Date: Mon, 1 Dec 2025 10:41:17 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Fix HOTPLUG_PARALLEL dependency
Message-ID: <aS1ivdcuLnLYOgLQ@alpha.franken.de>
References: <20251027-mips_paralell_hotplug-v1-1-82567f3e4b85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-mips_paralell_hotplug-v1-1-82567f3e4b85@bootlin.com>

On Mon, Oct 27, 2025 at 05:15:35PM +0100, Gregory CLEMENT wrote:
> With MIPS, it is possible to have SMP enabled without HOTPLUG_CPU
> selected. However, in kernel/cpu.c, some code that uses
> HOTPLUG_PARALLEL also requires HOTPLUG_CPU to be selected. Therefore,
> we should fix the HOTPLUG_PARALLEL dependency to depend on
> HOTPLUG_CPU, not just SMP.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510270120.21wA1aX1-lkp@intel.com/
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e8683f58fd3e2..b88b97139fa8e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -658,7 +658,7 @@ config EYEQ
>  	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
>  	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
>  	select USE_OF
> -	select HOTPLUG_PARALLEL if SMP
> +	select HOTPLUG_PARALLEL if HOTPLUG_CPU
>  	help
>  	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
>  
> 
> ---
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> change-id: 20251027-mips_paralell_hotplug-e9ae2b1fa126

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
