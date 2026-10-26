Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989508;
	b=iftwGYlQm/JZBlId0GvQoG2JGASZISUEdXiGTsWaFZANDtlVl/li6SkZ3OwIiKoPMz4e
	 YPcnw+tFDjxfDjO2PAgZ30co8Zl+qkioezv8QHy/b7GAayHAtjDP25BbOI3gX7Eqil8ls
	 6mcOWxXgV7iO+ThywgATh9yy0E3uN2g/jthGX4Qvx3dI/BWOkI415sz8tV/5gsXEcg19N
	 5KGU9IROen25gX6bFf4x2JOiuqGgZt46IdW9SutZmLpkfbCCaGaQ3Ru/LUlcbq1GUcLa2
	 JU37L8AVlipHMTiitcqYxGNpTK24mmXUeIFvkg/nEn9rilvEHn2cb/Hcpl7xyxQfW+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989508;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IiBw3Z1ioMh3eFsOJwSBP17rl6EXg5CjZe5I8HewILQ=;
	b=T1OTztV0D2/l0opPsU3ZksE6gMTTi6AzWYi3gUVnjCytoq4dsr7leFzmEPE9sjtPSUhh
	 Krq19xCQanI0m7q2J67SW3+35+lrEcbrema1vIcWETkNVnf9AGBbWCW9mxIwllDIOx6h7
	 9jMlnj05UIa/VAqd0Y9T4gtteCMTarnEtLwgbhNti6e/+7lr/571eM65SFobMfk2PmMt1
	 rulECuQcVbrJM5YCz1UH9YJ7JbULPiijn6uhLUYHu0tIlAfN4CA+XHN7H8PzedV9CXKNP
	 e0AB6x4IUl0unhXEaftVLcwyAxAYhDPCReHB4uBv2ggtBjsD1aUCsstr0aU613zaKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88E4606A31A;
	Mon, 26 Oct 2026 04:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A88E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9209A92009C; Mon, 26 Oct 2026 05:38:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8B49692009B;
	Mon, 26 Oct 2026 04:38:18 +0000 (GMT)
Date: Mon, 26 Oct 2026 04:38:18 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI
 I/O window
In-Reply-To: <96828518-81e3-4c58-b9c8-65f46beb7111@gmail.com>
Message-ID: <alpine.DEB.2.21.2610260436360.42255@angie.orcam.me.uk>
References: <20261022163106.1410595-1-f.fainelli@gmail.com> <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk> <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com> <96828518-81e3-4c58-b9c8-65f46beb7111@gmail.com>
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

On Sun, 25 Oct 2026, Florian Fainelli wrote:

> > >   Hmm, why do you need it here now, a leftover from testing?
> > 
> > Yes indeed it was a leftover from moving code around until I settled on the
> > current approach.
> 
> Actually I take it back, it is to provide a declaration for cobalt_pci_init()
> otherwise we get a warning with -Wmissing-prototypes since the function used
> to be static and now it is not.

 Ah, right, indeed.  Thank you for double-checking.

  Maciej
