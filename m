Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE1D5592F7;
	Tue,  8 Sep 2026 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877035; cv=none; b=KDzwcfsSEzwqxjnxlbjPzGdAJb13gOag6M9Xgg2lK2kueHInMLeddmR3fgBgCQCx5TB4jmRqZOwEvSyLTaye0kldoAWANj/3G57UAiziKGUDRBF2lB2kcKMwSbokITwCymgjFbxQLSzlE8A/vH7k5zA3BPehDaqMpD6Tk7M6+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877035; c=relaxed/simple;
	bh=F7d7vUa9WQfkc7W5AyK7dAWJLmsWu1piFBCbiY/SUBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFj0AO/JdfJmBlrpCyNdjPLMWw7j4kjkT2a6bFu7DvVbU4fOH9wa7Fvr2QyFlvZnZxQhcTxfbsQ4KngW6JGIZoazqMzxA/4CDMq75N038neyuWEeeJ9ExhoRRS3OA1oI/jbl2BBFGIRDM5mw41tM7ZO4T3qC/vtGVKPFwk+LM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1x3wd2-0002ff-00; Tue, 08 Sep 2026 16:16:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1466CC0130; Tue,  8 Sep 2026 16:14:18 +0200 (CEST)
Date: Tue, 8 Sep 2026 16:14:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Julian Braha <julianbraha@gmail.com>
Cc: arnd@arndb.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	cjd@cjdns.fr
Subject: Re: [PATCH v2] mips: econet: fix unmet dependencies for ECONET
Message-ID: <aqAYOi0AMN_N2JLl@alpha.franken.de>
References: <20260815235109.666268-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815235109.666268-1-julianbraha@gmail.com>

On Sun, Aug 16, 2026 at 12:51:09AM +0100, Julian Braha wrote:
> ECONET selects EARLY_PRINTK_8250, SERIAL_OF_PLATFORM, and SERIAL_8250
> without ensuring their dependencies, EARLY_PRINTK and TTY are met. This
> causes unmet dependencies:
> 
> WARNING: unmet direct dependencies detected for SERIAL_8250
>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>   Selected by [y]:
>   - ECONET [=y]
> 
> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
>   Selected by [y]:
>   - ECONET [=y]
> 
> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>   Selected by [y]:
>   - ECONET [=y]
> 
> However, in the discussion of v1 of this patch, Arnd pointed out that these
> selects don't belong here in the first place. [1]
> Let's remove them to resolve the unmet dependencies.
> 
> These unmet dependencies were found by kconfirm, a static analysis tool for
> Kconfig.
> 
> Fixes: 79ee1d20e37c ("mips: econet: Fix incorrect Kconfig dependencies")
> Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
> Link: https://lore.kernel.org/all/59c5582d-6fc1-48d0-a5df-b3b6f58aa227@app.fastmail.com/ [1]
> 
> Changes since v1: remove the selects, instead of selecting more
> Link to v1: https://lore.kernel.org/all/20260802161555.491549-1-julianbraha@gmail.com/
> ---
>  arch/mips/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e2eb9627bd14..c3f69def2008 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -396,10 +396,7 @@ config ECONET
>  	bool "EcoNet MIPS family"
>  	select BOOT_RAW
>  	select DEBUG_ZBOOT if DEBUG_KERNEL
> -	select EARLY_PRINTK_8250
>  	select ECONET_EN751221_TIMER
> -	select SERIAL_8250
> -	select SERIAL_OF_PLATFORM
>  	select SYS_SUPPORTS_BIG_ENDIAN
>  	select SYS_HAS_CPU_MIPS32_R1
>  	select SYS_HAS_CPU_MIPS32_R2
> -- 
> 2.55.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
