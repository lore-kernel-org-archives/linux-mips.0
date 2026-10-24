Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792835475;
	b=isG8Tko/7u6hCjTWbM4QOZNTJrcuU0Op7vxQlvh+c5UPl73kE6iceImXlgF21cRb0yx4
	 h4/KECo1QKDJl5z9GvVQcfe6xITgVyjLVNLx454diMsKkmqckbh+rwZl/gS1nByupj+EZ
	 SkffqXwjXbltdIqwO/bf/MbWjC0FdEGpNN0GIkC7wOCeUnaFyWUfb91l3ZlmYH2dxUVhS
	 YKgUHzO28o+WhYazvmczJ9ehlfqobtxvJXf0ILW1oKErRDETaEW3zFIKwMAe5U1nY1XAT
	 tDUeTxGqSCavHiyaOL7hzgqt9ikgYS23SmezGTFmz7yrEwyktlPD21tLXKQZqjkh+Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792835475;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hvKkhPeqGlHLlvQVRL4+Bger2lswWQFcdJt0riLm0Oc=;
	b=GvsOqWXdc763uAVQgo3bqVBhY3ptIDBryrYEQgFSP2kjUO+TsaMIuJH0k2g/Au8tLYYl
	 OTaf3BaIGnLEgejSTPzMOWjhE6otydlaAVCWuBphfp7bxKhGek9z1aD1zxygv2etXo4T/
	 Bt6atWtbP+9RkFcjW1jV9hbKP4u+t8ucl87/jWXJONVfhHRcUFLkaZTuGscXNyln+QqPo
	 Z1ecQixtfMgBza18SfRnwOAaDgHxcGExFzZLBK0gV4EinRC/N7souYWspHf8QsddopS6Y
	 alUJGSotlAeMI6ARBZAg1Dq63WwgtnwV2/6FsJ871wN+B2oEeq0Twatb8b/n/9UTqdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56215606A31B;
	Sat, 24 Oct 2026 09:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56215606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xKYP8-0005Qd-00; Sat, 24 Oct 2026 11:51:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1D083C0423; Sat, 24 Oct 2026 11:51:01 +0200 (CEST)
Date: Sat, 24 Oct 2026 11:51:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Imre Kaloz <kaloz@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: Install the cache error vector on every
 CPU
Message-ID: <atx_hXlK0IxAGGUB@alpha.franken.de>
References: <20261021190253.30128-1-kaloz@kernel.org>
 <alpine.DEB.2.21.2610221953220.22065@angie.orcam.me.uk>
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
In-Reply-To: <alpine.DEB.2.21.2610221953220.22065@angie.orcam.me.uk>

On Thu, Oct 22, 2026 at 08:07:47PM +0100, Maciej W. Rozycki wrote:
> On Wed, 21 Oct 2026, Imre Kaloz wrote:
> 
> > diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
> > index 62733e049570..0fef66b86959 100644
> > --- a/arch/mips/sgi-ip27/ip27-smp.c
> > +++ b/arch/mips/sgi-ip27/ip27-smp.c
> > @@ -133,6 +135,18 @@ static void ip27_init_cpu(void)
> >  	per_cpu_init();
> >  }
> >  
> > +static void ip27_init_secondary(void)
> > +{
> > +	/*
> > +	 * The hub flips the low 128K of the attribute 0 uncached alias per
> > +	 * CPU slice and the cache error vector is fetched through that alias,
> > +	 * so the copy trap_init() made through TO_UNCAC() only serves slice 0.
> > +	 */
> > +	memcpy((void *)CKSEG1ADDR(0x100), (void *)TO_UNCAC(0x100), 0x80);
> 
>  This just copies instructions between the same physical memory locations, 
> from an XKPHYS mapping to its corresponding KSEG1 mapping, i.e. the bus 

IP27 is special here:

/*
 * IP27 uses the R10000's uncached attribute feature.  Attribute 3 selects
 * uncached memory addressing. Hide the definitions on 32-bit compilation
 * of the compat-vdso code.
 */
#ifdef CONFIG_64BIT
#define HSPEC_BASE              _AC(0x9000000000000000, UL)
#define IO_BASE                 _AC(0x9200000000000000, UL)
#define MSPEC_BASE              _AC(0x9400000000000000, UL)
#define UNCAC_BASE              _AC(0x9600000000000000, UL)
#define CAC_BASE                _AC(0xa800000000000000, UL)
#endif

Hub ASIC uses the extra address bits, so the physiacl address is not the same.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
