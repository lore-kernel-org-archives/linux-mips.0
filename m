Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DA21DFFB;
	Mon,  3 Aug 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766368; cv=none; b=T1T3wrdrS3MFA8Amx3lZ47+Wc499Y+DfBgTqN2XWXJkA+o7QIuKfzrUdgfJcGtB1+BYoCw7caZ2lOw/ZoINqXocndCkyKIEZHC0EsnOuBMgkgWa2Z2IZPRkRNoU7RKLcOUZUMacDJVK6RYsS6uMeeY+NlUatKKe3GBJRj9bI+LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766368; c=relaxed/simple;
	bh=Vef+Fe3GMP0LZW76gWmW69lUJOq1/jYSWoAB3+f1wns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCje43TFsNrHxqRCVr50YHNFq2aMX9HUnFKJQvsuVcXV+tJdJyIUu9iu/9cRtsrwYOV0P3LX282Etq6uQFXHY2VZNQsD8NrsqtK92HkmlCxKOSsW/+lLoSbprySwKAIaHIGPhFYZd3zZY4MlAp1aoIwS4F3296/xTHnPpR0Qeys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wqsTP-0002aA-00; Mon, 03 Aug 2026 15:12:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 44D9CC0110; Mon,  3 Aug 2026 15:09:09 +0200 (CEST)
Date: Mon, 3 Aug 2026 15:09:09 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Julian Braha <julianbraha@gmail.com>
Cc: arnd@arndb.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: remove dead select
Message-ID: <anCS9XmWol2V9wY4@alpha.franken.de>
References: <20260723104933.117413-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723104933.117413-1-julianbraha@gmail.com>

On Thu, Jul 23, 2026 at 11:49:33AM +0100, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so the current
> 'select CPU_BIG_ENDIAN' does nothing (dead code).
> 
> However, ECONET already also selects SYS_SUPPORTS_BIG_ENDIAN so this
> means that CPU_BIG_ENDIAN will always be set.
> 
> Let's remove the unnecessary 'select CPU_BIG_ENDIAN'.
> 
> This dead select was found by kconfirm, a static analysis tool for
> Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index a06f24317306..e2eb9627bd14 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -395,7 +395,6 @@ config MACH_DECSTATION
>  config ECONET
>  	bool "EcoNet MIPS family"
>  	select BOOT_RAW
> -	select CPU_BIG_ENDIAN
>  	select DEBUG_ZBOOT if DEBUG_KERNEL
>  	select EARLY_PRINTK_8250
>  	select ECONET_EN751221_TIMER
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
