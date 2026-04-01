Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6EE2FD7BE;
	Wed,  1 Apr 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075457; cv=none; b=aE/I1kA7QGKMdlobwhUzljnS5aRljObscTPirnaEU88SLO4FEmafu6RRGr1RImiLSqpObIBq7OKQFtoJI8UpIpF2CBBH2xd4MjKwA6UIqRoTxnhSjLVUozFVVAR3cZcSuZC/hH4FcvwKlCpoUC+z3B2W9mJviuK7A8jpbW/ioo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075457; c=relaxed/simple;
	bh=BQHtOIlcRNd347Leecq/jzKVHOQSNV1WlEI8GeplSjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8tAOHceA+IQhtYNM9ZU3eNWAFKVTh6q8XkxSTEU7JfDEq9BW1hScpLOoKA3znSC3n5wAoK5kSTZsoE8etm8Yrtg++kxXCko+PiGW+JRd7NSJcny3F4SGZGZbaC0JrFczMjBSGqtqyoP2BD2JGZyPvyqGHgd8qOgWA0iJOU+n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82D7-0008H7-00; Wed, 01 Apr 2026 22:30:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EF197C0988; Wed,  1 Apr 2026 22:28:10 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:28:10 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Loongson64: env: Check UARTs passed by LEFI
 cautiously
Message-ID: <ac1_2jpwEFVs_4bV@alpha.franken.de>
References: <20260314211336.408561-1-rongrong@oss.cipunited.com>
 <20260315172824.352412-1-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315172824.352412-1-rongrong@oss.cipunited.com>

On Mon, Mar 16, 2026 at 01:28:22AM +0800, Rong Zhang wrote:
> Some firmware does not set nr_uarts properly and passes empty items.
> Iterate at most min(system->nr_uarts, MAX_UARTS) items to prevent
> out-of-bounds access, and ignore UARTs with addr 0 silently.
> 
> Meanwhile, our DT only works with UPIO_MEM but theoretically firmware
> may pass other IO types, so explicitly check against that.
> 
> Tested on Loongson-LS3A4000-7A1000-NUC-SE.
> 
> Fixes: 3989ed418483 ("MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI")
> Cc: stable@vger.kernel.org
> Reviewed-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> ---
> Changes in v2:
> - Sort new includes alphabetically (thanks Yao Zi)
> ---
>  arch/mips/loongson64/env.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
