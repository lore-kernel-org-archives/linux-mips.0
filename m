Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6362334695;
	Thu,  7 May 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139449; cv=none; b=kvQed8NHfadMwDbZVNO0gZMmNIRvgs3ikHOsavcX8kQPH0TxTSXW2+TCOEU0xba6gQhtMWsosXmrB5dScfxJDYSMeKrE17vGr/ai8+yWCbnhTJr8AfS2PuoYAdDV7fqvaQFX4qE96LUuA7zxstJs6PNsV1mfyRshh5VVekoRPFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139449; c=relaxed/simple;
	bh=TRYPdbdQ7AEV3jQUZjl6mtYTKcLAI/I31T2cjc5KvBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/uKpd1ouPo8lJteeK/SbulFWrTvT13jjLYvenb+GzypY9YAPZoTzaPS+a6PkCzQ/iActCYNcQxERKf7ugVE/C0feKGcwLAvyRqf/Px8dgRH1esgAJwPILe/Hzv/e60zFyL6PHzwNTNL5/b0S4v08JHuu0rcGgVxfxpFAdr8RKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dWS/GY2D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+dAJREre; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dWS/GY2D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+dAJREre"
Date: Thu, 7 May 2026 09:37:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778139446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jz+1MqT1MQrqTQro6mhqLqng63xA6szDDx+vMYI/l9I=;
	b=dWS/GY2D6hL5gDXjk+M04rVEEH+NhbUYKc5kV5+8Q0T2hfMRXcWMy245UELbZ6jRV/MZY/
	5JQnt6+xot7OCvyNK4p5tIbrJsvPUBZi7beg4SA9TQ17N9mvohq7k29VhkdiIlIQtPk3jd
	1kWclQR/CTV3e6zFHatG9NVqHvXqJ6ReDMs/AilpTka6DVRm17Nxc/EO2L0wOAfIS3Em6d
	45+s7RqbuveEJ2zdKn4wuU5q0HHStwo+fw3Iwx23+BSKMK3LH0vAtvdbjKHVLtWVhgWFTf
	BYazj0gfmmIipMV2fAUcs3kmWh5G1Z00Xk/Re2d5JjNS9jeufxk7001UhxKDGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778139446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jz+1MqT1MQrqTQro6mhqLqng63xA6szDDx+vMYI/l9I=;
	b=+dAJREre91cuYFtLntYlq+m0+OeAUM0bytmlzxFnyVwiSwOOJ2ZYovXxg0JXnh/nEaHcCw
	xLHRRVSNc3mQxUDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: DEC: Remove IRQF_ONESHOT reference for IOASIC DMA
 error IRQs
Message-ID: <20260507073725.86GqPgce@linutronix.de>
References: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>

On 2026-05-06 12:15:21 [+0100], Maciej W. Rozycki wrote:
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

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
