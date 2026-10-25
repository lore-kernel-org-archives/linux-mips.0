Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792908011;
	b=DvVf++Rs1MVsUyTaU5JGD6BEXTvtrdiAhbSIhVD+6TEhv2eiPDfxUU++9s5+z0rM2wGu
	 Za5zwxJNVJ6X9r+JTbXkCsODQLk5bP1VAvaRJOw7P2SLrWzBr93SXPBtucTCVjKLnEWuu
	 lSfqqbg7QE7p5gaAv7bqfoBrTcZ03vOvKlLWCIl/Qc8t0O9296AOcPtfJPcaQlui5zzEx
	 EBiQWNmMUyr+UQRXyxiydMKkcAUxMPJsU1Ll15jAdR7EXtgsvoNItRVgulHjfXP57xx0I
	 p9jDYGlOE1EKyHp9q64s3Z2GVigec7yzFUWZTfuIfqBqTw9QxJT2ZS4LhcWlVkj0RPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792908011;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CmM3mJp2/PXJWrqcWWMwCOjSIUrPDL9XWQTGPHbqeFE=;
	b=T1THnIyvkSJn1wsvdeBhW3OGxQZCLTZFWFdvK1uXawRCW102RXgIG70VEsxSzyGoLE3I
	 JWdMnmxEym6AO7+Gg+Va/rliAzGKWA7SCVWTeOs7yHaUIL3AQlKumeBLqccoC/y05DgRr
	 cQD7IBunFCOC04bRNcDYjkQTyta7pL8LTo6FdV/ZbmadBEHK6t+JjI+wsJ7ElZirxyQ7Y
	 dmFbyisoEgw2WnD8WwLDOkLn8HkVI2Szu7HF85/J2FHllp9qiZinznHklZuuF3RDI6viC
	 oOiPC0CoVqFF780uHoGFr0gO/8BSr1j7bNWen6G2TLhpKR44IahBieuuOKIm8la9+SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE42606A320;
	Sun, 25 Oct 2026 06:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE42606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BF77B92009C; Sun, 25 Oct 2026 07:00:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B253992009B;
	Sun, 25 Oct 2026 06:00:08 +0000 (GMT)
Date: Sun, 25 Oct 2026 06:00:08 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
cc: Olivier Louvignes <olivier@mgcrea.io>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, 
    Paul Boddie <paul@boddie.org.uk>, Andreas Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic
 X1600
In-Reply-To: <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
Message-ID: <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
References: <20261023204205.48222-1-olivier@mgcrea.io> <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 24 Oct 2026, H. Nikolaus Schaller wrote:

> > diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> > index 0fd9f9bbd21f..ff7b63587daa 100644
> > --- a/arch/mips/include/asm/cpu.h
> > +++ b/arch/mips/include/asm/cpu.h
> > @@ -186,6 +186,7 @@
> >  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
> >  */
> > 
> > +#define PRID_IMP_XBURST_X1600 0x0000 /* XBurst®1 in the X1600 (PRId 0x00d00000) */
> 
> Well, XBURST is an MIPS CPU architecture and not a SoC. So there should be no X1600 in
> this macro name, especially if this ends up in a non-SoC-specific arch/mips/include.

 Is there a documentation reference available for this value of PrID?

  Maciej
