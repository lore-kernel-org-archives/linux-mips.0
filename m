Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696071;
	b=SP1QHDp3UlzCeu7N+FHSigmorDGWYfvBE3LSUICLnsNpJQ+qY4fjItnKACjWdgIAZwZx
	 KO8ITtcJwQungU0IoDB4k8GSayxsFYc0sw2tpukUwy219hM3KiKih3HQDacrKZwF3ZOFC
	 CJoPN9HQaalxSNH6np0Yt2dRwJd0wufCHCFEV+2VpXgibyBdbYFjhPgsJ1h6ksZsfyyzI
	 2hz+jn3AkH5TAhwcTRycHw+/Bw3wi1JLNj3VL5kVn+0cnb5MFKuSfO3TbePMSOSWYlAdl
	 8alo5TmPOzQjkmjSMfK+ojFeGK67RR4tw8FMufMuZoNvlUVUzrkqC0blBMGIo9jLd1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696071;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=3ljvcb14XNhLnHcOmJEx73K2+x2OStvM/Cj3DPoChpc=;
	b=PaDhStsi62lnW7W6DZYdTod1U+Q70HT5rgGm5ZoogRUqhhXKmmGa5wqSYAjo+ipCztuR
	 LR2ilK3pIw/5lXZfXAc4mISE9+vPj6O3cpxrR7uwOBYhnl2euOfhtcgV4yHXLR+DnLZOy
	 sLv2T/kdVwS6ChFpWnf8rAXUZ1qh/iBsSDuHsMQuG2tR6KDOAKbW1QajjXnBJAAs4d0+G
	 7kv/0iHvRFE9Yw9XfoJAASH5immbvA+e1189ZqO+tOdv4dYriEJJ12Seff8gTfolPbuq6
	 J0qBbWkxtiHxuspKp4I/Saj3JxFN+bEnpJ4ErOFx1biJhZMF49bwBb4ZTWjxKmTLFvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDB9606A31B;
	Thu, 22 Oct 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDB9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B9A2692009E; Thu, 22 Oct 2026 21:07:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B362F92009C;
	Thu, 22 Oct 2026 20:07:47 +0100 (BST)
Date: Thu, 22 Oct 2026 20:07:47 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Imre Kaloz <kaloz@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: Install the cache error vector on every
 CPU
In-Reply-To: <20261021190253.30128-1-kaloz@kernel.org>
Message-ID: <alpine.DEB.2.21.2610221953220.22065@angie.orcam.me.uk>
References: <20261021190253.30128-1-kaloz@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Oct 2026, Imre Kaloz wrote:

> diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
> index 62733e049570..0fef66b86959 100644
> --- a/arch/mips/sgi-ip27/ip27-smp.c
> +++ b/arch/mips/sgi-ip27/ip27-smp.c
> @@ -133,6 +135,18 @@ static void ip27_init_cpu(void)
>  	per_cpu_init();
>  }
>  
> +static void ip27_init_secondary(void)
> +{
> +	/*
> +	 * The hub flips the low 128K of the attribute 0 uncached alias per
> +	 * CPU slice and the cache error vector is fetched through that alias,
> +	 * so the copy trap_init() made through TO_UNCAC() only serves slice 0.
> +	 */
> +	memcpy((void *)CKSEG1ADDR(0x100), (void *)TO_UNCAC(0x100), 0x80);

 This just copies instructions between the same physical memory locations, 
from an XKPHYS mapping to its corresponding KSEG1 mapping, i.e. the bus 
addresses are the same, so please give a more elaborate explanation how 
this is supposed to work.  I guess I'm just missing something, but that 
has to be obvious from the contribution itself, also for other people that 
may come across this change in the repo in the future.

 Also, please don't cc stable with submissions targeting mainline, fixes 
will be picked up for backporting based on the Cc: tag in the commit 
description.

  Maciej
