Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100878;
	b=SiJfRxUI4mm7w2jXUfUUc3BGPRx9AWV7EJp1kBK9jPwZ461h8okHYTH6kki/mPbzgekP
	 E4HcBDP1jteikWLdATKwpWijR8XQjQ1FOVQG5+27GEtdwswLIG3JF9vD18Saqat0bUn5h
	 hlGid/znOdqENiMzM6kka0OozoJEh9H316iPzGAbrSw4Wy9AIERay4zkPrsASxibchKEO
	 KCUpJQrr6xvekOk9akrAgZWBB75gE//jq3K59IBpQq6Y5VK/zp9j36xMcFyq+b11EKymx
	 QummeiumwBit4Ovz8Rq6XYIz81dAWLVywbNC39kh+uDDFDMazv541uT1zUtkzejK8Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100878;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LN0QKdCCdLYS5zLZ44yA3vN8eKwCwrsKybNv82zNt8c=;
	b=iYQFFFJazCuRt1njIzRIlCHnJsRJaQflGWRsCLY4DJynNplknxP4Rygyc/4DiwzwYbR/
	 0o+Pykvm2XPtZWawZzHsuuwhBzVy7IuQxGz+c42OBBfjtrP3nyLUk9/pBL1+n3XAFTQNf
	 mlb3vGz89MEpyCo7UbwED0DMRWVTpcji6NWMlSq1LLmSt4AVjm4F0nO0+fMAM9HGxu4/D
	 d+PE4dZWJKbcK3FkSRljE3nnmL7udvbiTJEtVpQKZOggh6ITCkdAOc/MTuWh6a5MF59E+
	 +0gN/aPqUHYzBuMymdiQXPecdwRzH7CJ4JK0XJqHbsHiIMUdWEv3L2axto8bHORr5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600E7606A7C8;
	Thu, 19 Nov 2026 15:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600E7606A7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xU3jo-0005um-00; Thu, 19 Nov 2026 16:07:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EF6C9C0201; Thu, 19 Nov 2026 16:07:35 +0100 (CET)
Date: Thu, 19 Nov 2026 16:07:35 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
Message-ID: <av8Qt2gJyDRJntEL@alpha.franken.de>
References: <20261113191933.477395-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
 <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>

On Wed, Nov 18, 2026 at 05:13:26PM -0800, Florian Fainelli wrote:
> On 11/17/26 17:57, Maciej W. Rozycki wrote:
> > On Fri, 13 Nov 2026, Florian Fainelli wrote:
> > 
> > > The SB1250 SWARM build reports missing prototypes for platform time
> > > initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.
> > 
> >   Thank you for doing this.  I've meant to for a long time, but have been
> > distracted with higher priority stuff.
> > 
> > >   static inline int __maybe_unused bcm1250_m3_war(void)
> > >   {
> > > -	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
> > > -		return sb1250_m3_workaround_needed();
> > > +#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
> > > +	return sb1250_m3_workaround_needed();
> > > +#else
> > >   	return 0;
> > > +#endif
> > >   }
> > 
> >   It seems a style regression, why is this change needed?
> 
> The declaration is wrapped under #ifdef CONFIG_SB1_PASS_2_WORKAROUNDS, which
> would hide the prototype when the option was disabled. The if (IS_ENABLED()
> would not compile in that case since we would have lacked a visible
> declaration. We could keep this and just make the prototype unconditionally
> visible instead.
> 
> Thomas, I can send a v3 as an incremental fixup or complete replacement?

incremental fixup please

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
