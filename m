Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C53922F767;
	Wed,  1 Apr 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075457; cv=none; b=OFStM7Bcx3dT6as2rQt00Rr4qle6BBy15Csbxagybws60dLwPVyNDdPLxJv4uj3WO0tjTJxsJUbayFzobjlFyZGYpCXkElKctVApk1MwrcVF6gyxEEGYnHMeB1ZW0ueZelfHLNPOt0ShuhklPTmw/X0X1e8FDvUk9Y4RpOfQW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075457; c=relaxed/simple;
	bh=Rnrt4O8ZQZ66ebrf8hMZOyRz2LDZeUmo1dXIAltmjsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij9DezLUHwwXLoa1hWPBmFgjl7ZVRTqu+xdTL1x7JJ0NPwxofj0tmByorXqDzpO1efGq5YXfzk9Al5pB3bFoLQl/EmpMwSU6oCYdDfyt5WVpJzj1E26rqo4BAyxFmKSsPQf4vrPwFYwxs7ogck9uV9xmwcGpJ7n2ebtMqhNj7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82D7-0008H9-00; Wed, 01 Apr 2026 22:30:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 88E71C0C39; Wed,  1 Apr 2026 22:29:16 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:29:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SiByte: Bring back cache initialisation
Message-ID: <ac2AHAFoI8FaqU0J@alpha.franken.de>
References: <alpine.DEB.2.21.2603271117500.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603271117500.60268@angie.orcam.me.uk>

On Fri, Mar 27, 2026 at 11:38:06AM +0000, Maciej W. Rozycki wrote:
> Bring back cache initialisation for Broadcom SiByte SB1 cores, which has 
> been removed causing the kernel to hang at bootstrap right after:
> 
> Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
> Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)
> 
> The cause of the problem is R4k cache handlers are also used by Broadcom 
> SiByte SB1 cores, however with a different cache error exception handler 
> and therefore not using CPU_R4K_CACHE_TLB:
> 
> obj-$(CONFIG_CPU_R4K_CACHE_TLB) += c-r4k.o cex-gen.o tlb-r4k.o
> obj-$(CONFIG_CPU_SB1)           += c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o
> 
> (from arch/mips/mm/Makefile).
> 
> Fixes: bbe4f634f48c ("mips: fix r3k_cache_init build regression")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v6.8+
> ---
>  arch/mips/mm/cache.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> linux-mips-sibyte-r4k-cache-init.diff
> Index: linux-swarm64/arch/mips/mm/cache.c
> ===================================================================
> --- linux-swarm64.orig/arch/mips/mm/cache.c
> +++ linux-swarm64/arch/mips/mm/cache.c
> @@ -207,7 +207,8 @@ void cpu_cache_init(void)
>  {
>  	if (IS_ENABLED(CONFIG_CPU_R3000) && cpu_has_3k_cache)
>  		r3k_cache_init();
> -	if (IS_ENABLED(CONFIG_CPU_R4K_CACHE_TLB) && cpu_has_4k_cache)
> +	if ((IS_ENABLED(CONFIG_CPU_R4K_CACHE_TLB) ||
> +	     IS_ENABLED(CONFIG_CPU_SB1)) && cpu_has_4k_cache)
>  		r4k_cache_init();
>  
>  	if (IS_ENABLED(CONFIG_CPU_CAVIUM_OCTEON) && cpu_has_octeon_cache)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
