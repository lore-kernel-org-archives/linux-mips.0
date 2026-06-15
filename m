Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F2833BBA2;
	Mon, 15 Jun 2026 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520238; cv=none; b=BtpcSnJxhqYbvKAChKGXU3E2iMKGBwpgwgmAdh6mx7LRf/7uXupXJIZXmA3dxNRfxl7iP1Jy7bpOhV7TN73HBt0vfuBwHa03tgfoaPF0IOu/0TIw00+DPvUDIHGdaUaxbrdl8omXjWdcTujpQz44LWGV0Q6EvRA3q2Bus5FIhCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520238; c=relaxed/simple;
	bh=og9kT3MhgU+ySTX3EJC8pVUZ3MbMvTJo6EbrPV+vAGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfA8YNdKs+HJrcJIxuCCK6ARGTFYcq5VVHNabRoZlyZ/37FhGAW0BhMqGEmKmQPQmpAPjb766gY9TcKnBisNOCjJFAdQGDlSH3QimvjD5aAG+g5lTlpsg1gpL6N7DAqkT8jSZV61dgltWyTQzVYYrRtB1vB137EGGvzmnFckMGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JR-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0A18BC0562; Mon, 15 Jun 2026 12:27:38 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:27:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: lib: Remove '.hidden' for local symbols
Message-ID: <ai_Tmi-nlNNebn4o@alpha.franken.de>
References: <20260608-mips-fix-binutils-visibility-warning-v1-1-3c809cfb5a9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-mips-fix-binutils-visibility-warning-v1-1-3c809cfb5a9d@kernel.org>

On Mon, Jun 08, 2026 at 08:36:25PM -0700, Nathan Chancellor wrote:
> After a recent change in binutils that warns when local symbols have
> non-default visibility [1], there are a couple instances when building
> arch/mips:
> 
>   Assembler messages:
>   {standard input}: Warning: local symbol `__memset' has non-default visibility
>   Assembler messages:
>   {standard input}: Warning: local symbol `__memcpy' has non-default visibility
> 
> Remove the '.hidden' directives for these symbols to clear up the
> warnings, as they are pointless with a local symbol, which is by
> definition hidden. This results in no changes to these symbols in nm's
> output when assembled with various copies of binutils.
> 
> Closes: https://lore.kernel.org/20260509122517.GA1108596@ax162/
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c4150acbda1b3ce0602f79cbb7700b39e577be7e [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/mips/lib/memcpy.S | 2 --
>  arch/mips/lib/memset.S | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
> index a4b4e805ff13..84f85aba6f4b 100644
> --- a/arch/mips/lib/memcpy.S
> +++ b/arch/mips/lib/memcpy.S
> @@ -274,7 +274,6 @@
>  	/* initialize __memcpy if this the first time we execute this macro */
>  	.ifnotdef __memcpy
>  	.set __memcpy, 1
> -	.hidden __memcpy /* make sure it does not leak */
>  	.endif
>  
>  	/*
> @@ -538,7 +537,6 @@
>  	.if __memcpy == 1
>  	END(memcpy)
>  	.set __memcpy, 0
> -	.hidden __memcpy
>  	.endif
>  
>  .Ll_exc_copy\@:
> diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
> index 79405c32cc85..ab087406da66 100644
> --- a/arch/mips/lib/memset.S
> +++ b/arch/mips/lib/memset.S
> @@ -89,7 +89,6 @@
>  	/* Initialize __memset if this is the first time we call this macro */
>  	.ifnotdef __memset
>  	.set __memset, 1
> -	.hidden __memset /* Make sure it does not leak */
>  	.endif
>  
>  	sltiu		t0, a2, STORSIZE	/* very small region? */
> @@ -231,7 +230,6 @@
>  	.if __memset == 1
>  	END(memset)
>  	.set __memset, 0
> -	.hidden __memset
>  	.endif
>  
>  #ifdef CONFIG_CPU_NO_LOAD_STORE_LR
> 
> ---
> base-commit: 6d96cc123ce33cd74e799c5434440393ed022bb7
> change-id: 20260608-mips-fix-binutils-visibility-warning-71e531e65f78

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
