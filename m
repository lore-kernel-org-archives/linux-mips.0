Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A553C3453;
	Mon, 29 Jun 2026 17:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754811; cv=none; b=OrwRDod7KEuXSnULzsUZFhs/NkXmL3dp5k0BCoz3FGkBY7kLwmepFPJkTrfct5PIfGCQp5GihGwnnnHiqI52xAFcfNPb96cSRPZGImJPujXMkWWvow1KCXuvhyEKfvas6tqA7XC/BuOaRicLQFA7SUcb4/koxzgjwFlQaR00teo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754811; c=relaxed/simple;
	bh=h6RqCzY473q3j2e4/eJDtRWCxGaC1Nk1nTAqBqWPSYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzPJ6wl1zIn26SR1HrOPsyeq4pmzW3Verf57IA25dbpzeHp+XpWa/POJ+k/tGAMgLKAeWUN1H4lDPUaRvWA3lEXzJTvskEunreED6MU8ca2W6FCBzXl5WgWBEd0J5SYRxXlNdtynjWQArd1PJncABsonPEcOBvcxcg0WF34LsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005ib-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 57BA0C0142; Mon, 29 Jun 2026 19:14:44 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:14:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: configs: Enable the current Ingenic USB PHY symbol
Message-ID: <akKoBOSNmk5KUVFn@alpha.franken.de>
References: <20260624081739.1283-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624081739.1283-1-pengpeng@iscas.ac.cn>

On Wed, Jun 24, 2026 at 04:17:39PM +0800, Pengpeng Hou wrote:
> The Ingenic USB PHY provider is now built from phy-ingenic-usb.o under
> `CONFIG_PHY_INGENIC_USB`.
> 
> The Ingenic defconfigs below still enable the stale `CONFIG_JZ4770_PHY`
> symbol.  That symbol no longer carries the provider object, so the
> defconfigs lose the intended USB PHY provider after olddefconfig.
> 
> Use `CONFIG_PHY_INGENIC_USB` instead.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/mips/configs/cu1000-neo_defconfig | 2 +-
>  arch/mips/configs/cu1830-neo_defconfig | 2 +-
>  arch/mips/configs/gcw0_defconfig       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
