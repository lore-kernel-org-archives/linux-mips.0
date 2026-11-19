Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077118;
	b=klpahMWJDbiqM64GVOVSQXMe1XRPmAnrkcNJTAQftvv8GKYxKCKNzsvDxQVwNTXs86VH
	 QafHx/sv3aa9jakM2x60HHQy3Vcbldfou1sQ2l5HXDE8E/WVLleuf4ix4LniU8oypjinM
	 s8GTfoqJOzYVEwoVJi164CVFRBfVSzYQ6sxR7+48C0Po9KdehXsJ6s1g//GLsH9rabU6U
	 FU6uZYwKkZDoGRaNBA2liG8J8hQ+T4vIqiqWNvTcWpo6vhjmtBtfuQHrHzHiqNoHdsGFw
	 KdTiMh4g3Z5mlpl0MShj524ql5Y7dCxM/RyWUcX44xoKp6e2X0NFXQQ4vAJ9t3sNHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077118;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=YS+V5bv8dCzco93yDxyZsr24dP7b8qAKCfJdw6hRamw=;
	b=lNRqFdjZe4lufMcDfT3hZ5aZ8IqZ5iip6Lc0Qh1PmdET69FBZnu5PtGmU38reBrY5DG1
	 mfefRR4dRHCdHf+r24H1abXSJ93X/FwByMx5oRYOhNu46Q8F1ASyz3gY1WWG3pFtPbCVI
	 arWZi90QXmLbDSuKaKO6/udd+DLeomjWFYqdFG/iyDtCFm5Zle8IKUHD7FrWqJWdyn93s
	 lDeE+XN0WlU/7WzCugh9tsam0LVWh7VKsnguX99qrtAjXVXXvXmlikSImLLL/5yI30WTH
	 KrBR5RuMqPZnKeEeaxaxINu8wcYW+U8lGiciOiGS2OZt6VjiTwtl8yf71X+U46eT+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0A5606A320;
	Thu, 19 Nov 2026 08:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6D7E59200BC; Thu, 19 Nov 2026 09:31:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 650419200BB;
	Thu, 19 Nov 2026 08:31:50 +0000 (GMT)
Date: Thu, 19 Nov 2026 08:31:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
In-Reply-To: <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
Message-ID: <alpine.DEB.2.21.2611190811510.54328@angie.orcam.me.uk>
References: <20261113191933.477395-1-f.fainelli@gmail.com> <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk> <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
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

On Wed, 18 Nov 2026, Florian Fainelli wrote:

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

 I've pondered it a bit more and I'm not entirely happy with the use of a 
platform header in generic code in the first place.  Would <asm/bugs.h> be 
a better place for the prototype?

  Maciej
