Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD6A400E05;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807072; cv=none; b=rYMAbqGnhBAsqhmfSRYixpDoRqbup2Xki+EfbZmRNqB1LMfjz/65mVtnqDIqfiXuv1dbYLxOH1XC1oLoIiz2dfCKZ6aK5XR9TPNE+bqUCbEEx40Nyp1Ez8xkfk+RIY0i2if+dzfwKLHlvBEdH5qMyhHCTp3pqaAboRHmumgv0qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807072; c=relaxed/simple;
	bh=hLLM+TKEgZ8SsKGhi14i72sxyb5/yQPPXH+RP5lIojM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvLNx8es6OZs3IRHL8dVOI1e29WH3paEowizv+55ZHjFCVSjZ2vKPPxJqydpeiXUY/naXVBK7TzsJSlWx7d1McGKrCf3o+FTdR1Taz5iuCNmk5/SdMbCRZqYibcqeKsDPXKfImgWeo1CdA6NOaJuuNJxJqPekxU54UluluWO9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015Z-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 32D82C07FF; Tue, 26 May 2026 16:44:52 +0200 (CEST)
Date: Tue, 26 May 2026 16:44:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: DEC: Remove IRQF_ONESHOT reference for IOASIC DMA
 error IRQs
Message-ID: <ahWx5MX00R64nanU@alpha.franken.de>
References: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>

On Wed, May 06, 2026 at 12:15:21PM +0100, Maciej W. Rozycki wrote:
> There is no need for IOASIC DMA error interrupts to use the IRQF_ONESHOT 
> flag, because while they do need to have the source cleared only at the 
> conclusion of handling, the action handler supplied is either run in the 
> hardirq context with interrupts disabled at the CPU level or, where IRQ 
> threading has been forced, the primary handler has the IRQF_ONESHOT flag 
> implicitly added and therefore the original action handler, now run as 
> the thread handler and with interrupts enabled in the CPU, is executed 
> with the originating interrupt line masked.  Therefore no interrupt will 
> retrigger regardless until the original request has been handled.
> 
> Link: https://lore.kernel.org/r/20260127135334.qUEaYP9G@linutronix.de/
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/dec/ioasic-irq.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
