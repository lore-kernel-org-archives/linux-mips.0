Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792906410;
	b=dB79CgLHX5OSJhLkf9XR3f8P6Q4ubYQFA5qNeo4Ve8AQhEVb4yfIi9N0C2I3wpvqk16j
	 y08f8Up8nvkia9XEfSky5ryNeItUjOL3dqLXnxLFuMZTFZgrxDxmhYcoSi3AUN/uam0WW
	 e/z4RlbhCETowVVHaA15VkFzNi34rkYbITEwV6Mt6miT8jrTAzIg//v5NwRBG4IzQQ6rB
	 qFFVCTcnjczgWsKLNtH7bcOzRzXD/XEKIdMCVtUUg1yUF+I8LTmp53gJpZmDs0O4CHC0O
	 P824t/wNwDiD7tU/nWIhi/otIRhirQV2ByB7W8rtY7J7kbNzZeDveAhWkyJpebv5fMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792906410;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=1ANVMfLp4l2foOJsqdBUZ/ic2ZamTqOSZ+rmSVWAd18=;
	b=q8gCNilFktN9JKP9myHvSkJJcZ2pXUCEjlL/PsD/vpRa5vOI/+W1JVd1HpGIF1XMfkbB
	 C0siF5rH5XNiDV4bvYBSCAcTVE+MlZ+8Lgbf4f1ujZZ8xWXKNF17t3XDZ4zyaVNOagEoL
	 /CN5yqyf3GLe2xFAIOk7SRFM41DTFyYzWrXnfOgJBAvyga9F7niIU64f++OKGd9r4B0rG
	 1t76K/1ELS+/UL74ZBN4ZukJjZKKWhQo+nMR6t6EuIS0Wzd+9gaO4dpFcLZior2tKDywu
	 BtIi1wEML2pMcxb+h3XALy6KzCEsimUXyaYi5KFGrlcSJPP5SloL6sHTSeGivitLdug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAA0606A31A;
	Sun, 25 Oct 2026 05:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EAA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8364C92009C; Sun, 25 Oct 2026 06:33:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7DBF692009B;
	Sun, 25 Oct 2026 05:33:27 +0000 (GMT)
Date: Sun, 25 Oct 2026 05:33:27 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Imre Kaloz <kaloz@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: Install the cache error vector on every
 CPU
In-Reply-To: <atx_hXlK0IxAGGUB@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2610250519380.42255@angie.orcam.me.uk>
References: <20261021190253.30128-1-kaloz@kernel.org> <alpine.DEB.2.21.2610221953220.22065@angie.orcam.me.uk> <atx_hXlK0IxAGGUB@alpha.franken.de>
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

On Sat, 24 Oct 2026, Thomas Bogendoerfer wrote:

> > > diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
> > > index 62733e049570..0fef66b86959 100644
> > > --- a/arch/mips/sgi-ip27/ip27-smp.c
> > > +++ b/arch/mips/sgi-ip27/ip27-smp.c
> > > @@ -133,6 +135,18 @@ static void ip27_init_cpu(void)
> > >  	per_cpu_init();
> > >  }
> > >  
> > > +static void ip27_init_secondary(void)
> > > +{
> > > +	/*
> > > +	 * The hub flips the low 128K of the attribute 0 uncached alias per
> > > +	 * CPU slice and the cache error vector is fetched through that alias,
> > > +	 * so the copy trap_init() made through TO_UNCAC() only serves slice 0.
> > > +	 */
> > > +	memcpy((void *)CKSEG1ADDR(0x100), (void *)TO_UNCAC(0x100), 0x80);
> > 
> >  This just copies instructions between the same physical memory locations, 
> > from an XKPHYS mapping to its corresponding KSEG1 mapping, i.e. the bus 
> 
> IP27 is special here:
> 
> /*
>  * IP27 uses the R10000's uncached attribute feature.  Attribute 3 selects
>  * uncached memory addressing. Hide the definitions on 32-bit compilation
>  * of the compat-vdso code.
>  */
> #ifdef CONFIG_64BIT
> #define HSPEC_BASE              _AC(0x9000000000000000, UL)
> #define IO_BASE                 _AC(0x9200000000000000, UL)
> #define MSPEC_BASE              _AC(0x9400000000000000, UL)
> #define UNCAC_BASE              _AC(0x9600000000000000, UL)
> #define CAC_BASE                _AC(0xa800000000000000, UL)
> #endif
> 
> Hub ASIC uses the extra address bits, so the physiacl address is not the same.

 Fair enough, though I think that the use of the R10k's uncached attribute 
driven on the bus for what I gather is each CPU's local memory (?) will 
best be documented more clearly through the change (i.e. in the commit 
description and with ip27_init_secondary()).

  Maciej
