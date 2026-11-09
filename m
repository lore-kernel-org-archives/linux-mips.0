Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205029;
	b=WMdmc+qE61ILk+CB16xHXgy5IMWEFKBYkfajHDRKlQTVk+PfWDfP8OrFtexLjfPbP66m
	 vyRckRuwGbfMVKmP4kmZcSUmloyndQb0uemATVhC6NO/Nr8FLhj/xHZef7mmuWunXQ+5q
	 6Enz18inElV7mJj/xX3wFFZRWRDKPu//marTF2/TUAk6dWgaFNMwGldj93aSLkGy0O0ig
	 uQBt+9PSbw4Ui/rP5awt3GC3MyKyJE867CYWvB+keHAqsLe8wDo6wRTQyfWCn4QDpawWo
	 nWEvk5OgtjvJnploO9wpT8Xxzkp4izGHCEUydhIH00cuWdTGrGwJHbRujtBMxRAOYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205029;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=CeNune+Xe5gcnKsfyPzbtx0SWguVXYJkIwyYkJoc2O0=;
	b=QOBt+qpmSbFLQrDIhPhqF8j2KAWnDJeCcvkK9gNqcglnaLmtK1z1cxUoXgiX5FbBCJ7c
	 clkeqGVtA7mQuA6l0KM9eZ4018DLSng7J7vB00yC4gJT7KQZEwsjFATvvXzc/4qrSZ85w
	 AiNcTvhISF5CRt/m7lk2L+N2JmRN8uTkgbxh9G1jugH6qaDWCoqAx0Bv+dFUeiLKB9Iug
	 F3GlXkCgb3zh5tITimQhL9aXU9Gw1BuZhBJ4TPpMiBrx7DHHj27VRLRWf1BdtFzP8HnQl
	 7ZHLFydvfEE2QwQyrl8EgvXFWncelo1LjGlbYn9/Sayf0gVFi3dYtxPEwVVJqb/7R+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BFE606A31C;
	Mon,  9 Nov 2026 06:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1DB7692009E; Mon,  9 Nov 2026 07:17:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 17AA892009B;
	Mon,  9 Nov 2026 06:17:05 +0000 (GMT)
Date: Mon, 9 Nov 2026 06:17:05 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Thomas Gleixner <tglx@kernel.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
In-Reply-To: <alpine.DEB.2.21.2611060517330.17804@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2611090615360.17804@angie.orcam.me.uk>
References: <20261103215043.1190947-1-f.fainelli@gmail.com> <alpine.DEB.2.21.2611060517330.17804@angie.orcam.me.uk>
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

On Fri, 6 Nov 2026, Maciej W. Rozycki wrote:

> > sb1250_set_affinity() selects the first online CPU in the requested
> > affinity mask without checking whether such a CPU exists. If the
> > intersection is empty, the resulting CPU index is invalid and must
> > not be passed to cpu_logical_map().
> > 
> > Reject affinity masks containing no online CPU with -EINVAL before
> > accessing the CPU mapping or interrupt mapper registers.
> 
>  Why do you think this is needed?  The only case where an unvalidated mask 
> is passed is AFAICT with:
> 
> /**
>  * irq_force_affinity - Force the irq affinity of a given irq
>  * @irq:	Interrupt to set affinity
>  * @cpumask:	cpumask
>  *
>  * Same as irq_set_affinity, but without checking the mask against
>  * online cpus.
>  *
>  * Solely for low level cpu hotplug code, where we need to make per
>  * cpu interrupts affine before the cpu becomes online.
>  */
> 
> -- which does not apply here (nor for arch/mips/sibyte/bcm1480/irq.c, 
> which uses analogous code and should otherwise be updated accordingly) 
> since all the CPUs are onchip the SoC.
> 
>  Have I missed anything?
> 
> > Also update the effective affinity mask to reflect the single logical
> > CPU selected as the interrupt target.
> 
>  Likewise, why is it needed?  This code returns IRQ_SET_MASK_OK (should 
> really use the enumeration constant), so the caller will do the copy.

 I can see it went to Linus already.  Can we please have it reverted?

  Maciej
