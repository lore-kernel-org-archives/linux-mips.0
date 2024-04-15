Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2854C3C06B
	for <linux-mips@vger.kernel.org>; Mon, 15 Apr 2024 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170170; cv=none; b=CGYIr7McGDvyhNtMTMZEor5Z6uEWHtxNEr0TdQGQv1yIP5/mm509LyujDmyXXZcgIzZ4YaF9brAENAw5SCxAfsDXKUK71TNUSX9Bf6Gx2h87VHVWujwxcVzUDi//zKi/PyTNJ0qeEnXBYOMuLqeW7wFd6SpD2pjYvC4oBZhSitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170170; c=relaxed/simple;
	bh=XowrG0vul+kW+cMeqD5hy1U3VSUrH9HqVTSZO9ovkv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4SvvYvhBUoezXYXxaggeD/70imX5szCCiwUu7aF7Ikgl9aTEagaXC1yLkQLp2JdE5wo7eRbsGJ/0/da+mkGyGxDAHYKOosn+tOJjeOaIBGK59jsScCM5Pgxpu3d7JBqjKZZ0hFgM0omIpsZlupaNUb+3C/pcGPVabDwgUN3mPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rwHob-0004hp-00; Mon, 15 Apr 2024 10:35:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 914CDC0318; Mon, 15 Apr 2024 10:33:42 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:33:42 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Cc: hauke@hauke-m.de, zajec5@gmail.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM47XX: Declare early_tlb_init() static
Message-ID: <ZhzmZkEiGTcsfmgB@alpha.franken.de>
References: <20240315025235.182866-1-zhangyongzhen@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315025235.182866-1-zhangyongzhen@kylinos.cn>

On Fri, Mar 15, 2024 at 10:52:35AM +0800, Yongzhen Zhang wrote:
> early_tlb_init() was local to file but not declared static,
> leading to error:
> 
> arch/mips/bcm47xx/prom.c:126:6: error: no previous prototype for ‘early_tlb_init’ [-Werror=missing-prototypes]
>   126 | void early_tlb_init(void)
>       |      ^~~~~~~~~~~~~~
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>  arch/mips/bcm47xx/prom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
> index 7344a5eb990e..58fb7c2dc3b8 100644
> --- a/arch/mips/bcm47xx/prom.c
> +++ b/arch/mips/bcm47xx/prom.c
> @@ -124,7 +124,7 @@ void __init prom_init(void)
>  /* Stripped version of tlb_init, with the call to build_tlb_refill_handler
>   * dropped. Calling it at this stage causes a hang.
>   */
> -void early_tlb_init(void)
> +static void early_tlb_init(void)
>  {
>  	write_c0_pagemask(PM_DEFAULT_MASK);
>  	write_c0_wired(0);
> -- 
> 2.34.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
