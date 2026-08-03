Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E20374A0B;
	Mon,  3 Aug 2026 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766373; cv=none; b=Mc1SsxY6/dyU6saBrCvkWBGOdgY75lXQDT4QupJx7dekVZRMxqLwQWYxfWqr5Y9iCNyVt6yets2jBieip2FWA+Gmrx5OKaiIR9ILTOjIWKf5JtFZVnkofkIlJJqS4CEj1q8uC8RgBqfIgLrQwUTsECLBWGoKr1x6zyMmNGJQiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766373; c=relaxed/simple;
	bh=ckWRbSacL3G4eZoxuff9cUbvnMsaLIXXAefKX/iE2TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwTdKcUBhDrnFaavYJVGJ8B5vPBJtsWfZ3vZCsMt7PdtJ5nc6CWQUaEAHf8q4kpd3qgeX3k4xS+37e7ddEdQfiEB7mF7pydGsoXE9AUkPUkC7UmaIsk3FnJqdzzB2PAq2aUrZshiO4nDrqtgjoKLEsN/ZUf6X9/6xxpopEUUI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wqsTP-0002aE-00; Mon, 03 Aug 2026 15:12:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3333CC0110; Mon,  3 Aug 2026 15:12:41 +0200 (CEST)
Date: Mon, 3 Aug 2026 15:12:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Braha <julianbraha@gmail.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, cjd@cjdns.fr
Subject: Re: [PATCH] mips: econet: fix unmet dependencies for ECONET
Message-ID: <anCTyWu_i15aQDZM@alpha.franken.de>
References: <20260802161555.491549-1-julianbraha@gmail.com>
 <59c5582d-6fc1-48d0-a5df-b3b6f58aa227@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c5582d-6fc1-48d0-a5df-b3b6f58aa227@app.fastmail.com>

On Sun, Aug 02, 2026 at 07:41:45PM +0200, Arnd Bergmann wrote:
> On Sun, Aug 2, 2026, at 18:15, Julian Braha wrote:
> > ECONET selects EARLY_PRINTK_8250, SERIAL_OF_PLATFORM, and SERIAL_8250
> > without ensuring their dependencies, EARLY_PRINTK and TTY are met. This
> > causes unmet dependencies:
> >
> > WARNING: unmet direct dependencies detected for SERIAL_8250
> >   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
> >   Selected by [y]:
> >   - ECONET [=y]
> >
> > WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
> >   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
> >   Selected by [y]:
> >   - ECONET [=y]
> >
> > WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
> >   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
> >   Selected by [y]:
> >   - ECONET [=y]
> >
> > Let's select the necessary dependencies, TTY and EARLY_PRINTK, as other
> > similar architecture options do.
> >
> > These unmet dependencies were found by kconfirm, a static analysis tool for
> > Kconfig.
> 
> I think this platform has too many 'select' that are not helpful here
> and should be removed instead.
> 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index a06f24317306..2423a6050088 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -397,8 +397,10 @@ config ECONET
> >  	select BOOT_RAW
> >  	select CPU_BIG_ENDIAN
> 
> CPU_BIG_ENDIAN is automatically set here because of the
> missing SYS_SUPPORTS_LITTLE_ENDIAN

there is already a patch from Julian, which removes this select. I've
applied it a couple of minutes ago.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
