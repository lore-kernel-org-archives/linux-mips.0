Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810060;
	b=ouMLYqox+edQbZ3tAQlmbg0TX+9mYwslJgl7JxcIEmjELYlzIQG0J6iANeCnfryYS5nJ
	 O40N/Np04xnNo35Mc4plnYEhMYB72snRMO12be8iNiMR5mN/w4heHmVS8e0vHUgb+XiEI
	 KpnRGjdKlFQ6SIxgLFr9XY7WgOhzsmzPsQJ0PVc5zPMq+hoHDjm83O0cAbdhV/mG2xRAq
	 CqCl3zkfqYX4J+BIJDg4ExX5YjYWOawwMIoRYa9tXEUBcNtEL34IDaTdLEQ/TBldES5q9
	 gE8KaerxEwThIqbLnsI2S5mSQBbQs4OE8/6Z3OQg13doseFx0R+34hAbunMeHUfJq9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810060;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=hmBsrz/aL9oT9f9SNLGjLK07Qw1Q4mCzoam8lguSPUc=;
	b=crnhS+V0+czFnA9ws7td3YG/TlAGeEbGYgk3iIOqr4+gzIDu/i9/PY8eFEHfml022JTd
	 2XUKGnnDyj4V5I0td5m5MNSN4j4KG4lCZ1LdxDvCSYgNpU9epAavhrob00OEetlol7Pxd
	 Gp6AtOcz/hhJuInM/ASng7/3R093fXoiKbhW85zquUH4ODqx6fzGrpkV11a4bm1U5Tlsc
	 SM3ojbUbKi3PMnaEATs7Y958U3Zl6s0Y1yCseapK6TgZXaOQ5XEkjCbvZ5B/4Vnf9+kkc
	 HE+46FrPLbUkIJzrJQGv9nUKULKW8r/h2ct5Q0x0mHcP0GMCR0GzptVf/721s9tZo3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE945606A31C;
	Mon, 16 Nov 2026 06:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE945606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C9B3592009C; Mon, 16 Nov 2026 07:20:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C50B392009B;
	Mon, 16 Nov 2026 06:20:50 +0000 (GMT)
Date: Mon, 16 Nov 2026 06:20:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Hunter Laux <hunterlaux@gmail.com>
cc: Paul Cercueil <paul@crapouillou.net>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Lars-Peter Clausen <lars@metafoo.de>, 
    "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is
 virtual
In-Reply-To: <20261111195609.2694096-1-hunterlaux@gmail.com>
Message-ID: <alpine.DEB.2.21.2611160613590.17804@angie.orcam.me.uk>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com> <1a6aac61cb167ce0eea611afe73e8c87782edd43.camel@crapouillou.net> <20261111195609.2694096-1-hunterlaux@gmail.com>
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

On Wed, 11 Nov 2026, Hunter Laux wrote:

> >> -#define cpu_has_vtag_icache	1
> >
> > Don't remove it, set it to 0.
> 
> The Config.VI probe already reports it correctly, so I left it to the
> probe. Would you prefer the constant anyway?

 The sole purpose of the constants is to avoid going for run-time probes, 
which cost execution time, and to make the compiler drop execution paths 
that won't ever run.  It's an optimisation.

 Only with platforms where you don't know in advance what CPU features are 
going to be present, e.g. where you can swap a CPU module for a different 
model and still run the same kernel, the relevant overrides need to be 
absent.

  Maciej
