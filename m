Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5208034A799;
	Mon,  9 Feb 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638397; cv=none; b=XHqTI6OdyxoguDzAp7tM7+aRz185SILj/KPDisLFD00n+wNTqJGBkpdOzqBAJW0dQJgufCPCfI2xws9+Xq7dVcWnr4EivqMzNjVcNRgwvVa2YD/6bCRzQvpYtH3dYAa0Y57rBB54hQlXvtNnaTPvM08LUj8k4ZMEOw/ix2zG4Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638397; c=relaxed/simple;
	bh=wAC1iDP4b/NkK+r+R/C88EDX+bdooXYrMFTwqmJuRkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEMEZjxNLJ08ygEzGJfr1/mDpvAox11eocnwwlzOSQ7x6t6q1PDeC8yBetP+NS3boOUSns5J/XtYpYSvepoWiNs0UwSFi1KYmeOIaNAquHet+8KjxKVDs9U22zTSa+5GGAn+nf3ZJLJhV2hDswuzFx4NsbZKIv+8xaomQYaivHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vpPvg-00079y-00; Mon, 09 Feb 2026 12:59:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 78A40C061A; Mon,  9 Feb 2026 12:59:07 +0100 (CET)
Date: Mon, 9 Feb 2026 12:59:07 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yi Yang <yiyang13@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: [PATCH] MIPS: rb532: Fix MMIO UART resource registration
Message-ID: <aYnMC1CgcTwYB5eY@alpha.franken.de>
References: <20260205-rb532-uart-v1-1-334dbdfafa60@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-rb532-uart-v1-1-334dbdfafa60@flygoat.com>

On Thu, Feb 05, 2026 at 10:08:42AM +0000, Jiaxun Yang wrote:
> Since commit 6e690d54cfa8 ("serial: 8250: fix return error code in
> serial8250_request_std_resource()"), registering an 8250 MMIO port
> without mapbase no longer works, as the resource range is derived from
> mapbase/mapsize.
> 
> Populate mapbase and mapsize accordingly. Also drop ugly membase KSEG1
> pointer and set UPF_IOREMAP instead, letting the 8250 core perform the
> ioremap.
> 
> Fixes: 6e690d54cfa8 ("serial: 8250: fix return error code in serial8250_request_std_resource()")
> Cc: stable@vger.kernel.org
> Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> Link: https://lore.kernel.org/linux-mips/aX-d0ShTplHKZT33@waldemar-brodkorb.de/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Since it's a partial fix to the issue report, I'll not use Closes
> tag. checkpatch is unhappy :-(
> ---
>  arch/mips/rb532/devices.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 8ecb56be81acc36e39192dee9f5d2a4d19b3755c..4f027efbf27b05377ddac306ff16714b8764915b 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
>  static struct plat_serial8250_port rb532_uart_res[] = {
>  	{
>  		.type           = PORT_16550A,
> -		.membase	= (char *)KSEG1ADDR(REGBASE + UART0BASE),
> +		.mapbase        = REGBASE + UART0BASE,
> +		.mapsize        = 0x1000,
>  		.irq		= UART0_IRQ,
>  		.regshift	= 2,
>  		.iotype		= UPIO_MEM,
> -		.flags		= UPF_BOOT_AUTOCONF,
> +		.flags		= UPF_BOOT_AUTOCONF | UPF_IOREMAP,
>  	},
>  	{
>  		.flags		= 0,
> 
> ---
> base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
> change-id: 20260205-rb532-uart-5f2d2ff28eb8

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
