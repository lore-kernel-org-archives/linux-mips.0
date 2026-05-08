Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1403D5673;
	Fri,  8 May 2026 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245166; cv=none; b=ZvA+lQfJs66ZSjslMTyCdAG5oajYWkuoJkf7l4qd3e8GAyghOkT8N1YhiPr9kcEWzBm38DufZdb4vn6FKcACXorrr/NBooW5PyuVDJZNBvKH5cqF1WGv5Pbbz940OR7nEPUl09yGUD9s4S0RmIbdrVRhT+iQunI5he59T4LW9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245166; c=relaxed/simple;
	bh=kEO3W2RtBvJpkOj//cj+gG001/vJAUHV8X4GqTFPJZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=epc4QN7iWSN7mm+ozx4BVev99k1NLnBKlyYMUlESZ95idazzoMnkLOeWmVP4XsyXvYhnvt1jFTWCJt1l5anHpu9QpxcLL6CMTTkH/hiyKhobG6WvjhEIh9rz4YThnDZ7Di9+ZioVtmwzv2Ig2BHB3zD6EF8b9VvraUn5Jg7YUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4460C92009C; Fri,  8 May 2026 14:59:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3E25992009B;
	Fri,  8 May 2026 13:59:15 +0100 (BST)
Date: Fri, 8 May 2026 13:59:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Rosen Penev <rosenp@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] mips: cps: Assemble jr.hb with an R2 ISA level
In-Reply-To: <20260507232323.489383-1-rosenp@gmail.com>
Message-ID: <alpine.DEB.2.21.2605080101340.46195@angie.orcam.me.uk>
References: <20260507232323.489383-1-rosenp@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Rosen Penev wrote:

> diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
> index 2ae7034a3d5c..70413c816eb0 100644
> --- a/arch/mips/kernel/cps-vec.S
> +++ b/arch/mips/kernel/cps-vec.S
> @@ -373,8 +373,11 @@ LEAF(mips_cps_boot_vpes)
>  	.set	pop
>  
>  	PTR_LA	t1, 1f
> +	.set	push
> +	.set	MIPS_ISA_LEVEL_RAW
>  	jr.hb	t1
>  	 nop
> +	.set	pop
>  1:	mfc0	t1, CP0_MVPCONTROL
>  	ori	t1, t1, MVPCONTROL_VPC
>  	mtc0	t1, CP0_MVPCONTROL
> @@ -487,8 +490,11 @@ LEAF(mips_cps_boot_vpes)
>  	li	t0, TCHALT_H
>  	mtc0	t0, CP0_TCHALT
>  	PTR_LA	t0, 1f
> +	.set	push
> +	.set	MIPS_ISA_LEVEL_RAW
>  1:	jr.hb	t0
>  	 nop
> +	.set	pop
>  
>  2:
>  

 This seems exceedingly pedantic to me at the cost of cluttering code with 
these .set push/pop blocks.  Why not simply wrap the whole code block down 
to the end of the CONFIG_MIPS_MT_SMP conditional instead, analogously to 
how mips_cps_core_init() has been arranged?  The presence of MT implies R2 
after all.

 Ah, I can see we have MIPS_ISA_LEVEL_RAW always hardcoded to a 64-bit one 
and commit 8dbc1864b74f ("MIPS: CPS: Fix MIPS_ISA_LEVEL_RAW fallout") 
reporting the MOVE macro getting expanded to a 64-bit DADDU instruction on 
64-bit ISAs, which is obviously not incorrect (you get what you asked 
for), though also problematic in this use case.

 This is actually no longer relevant however, as this was changed back in 
2025 with binutils commit 40fc1451c63d ("[MIPS] Map 'move' to 'or'.") 
targetting version 2.26, while our requirement nowadays is 2.30, according 
to Documentation/process/changes.rst.  It is a fairly recent requirement 
though, from Linux 6.16 only, and the previous one was 2.25, so backports 
would be affected and it might be too early to rely on for a bug fix.

 Still my guts' feeling is we should define MIPS_ISA_LEVEL_RAW and the 
other such macros to a 32-bit or 64-bit ISA according to the machine word 
size of the CPU/ISA chosen for the whole kernel build.  This would enable 
the cleanup I suggested at the top with no reservation and remove the risk 
of GAS choosing to produce 64-bit instructions where a 32-bit CPU/ISA has 
been chosen in the configuration.

 You are welcome to do that, however as it stands your patch is not 
incorrect and fixes a real problem, so:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
