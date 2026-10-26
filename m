Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045710;
	b=B0ddSfM4kgoun5Jkc9DqHqTYFGgdhQslAZwcZzAePSzBYNMPLDElsD5Y2Gl+tGi18MY7
	 4EYwqUiB2OD82vIJU/9xSZOSahMeV2F7g9GtgEdfQ59scEIeTzihHYRCve3NfhYJgYqRO
	 03fC7xinANfw9XdrJ4nAloGSV+JF7dJpIZT3noDrjY3W5QI+GWqdosQ7sLvMKO00v5aUK
	 JneF88mY3TNosnfw4VUacy/7ay3bH2y4mANLxWi23pbVQJYsae902GRmL20cukzpJwESn
	 zhmEebsf5UEJ4oU/7LWVGaty9FlDTap4g9hlVG5/uMzTNeuPfGqXpGj4jVkErnyYvBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045710;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=s0hN/jK93qBQrkUExLOTmLB+FzXiAlxVvbdhpz1LY0c=;
	b=vlCIP8cngOl+tts0VW0hIzczsG5sUzLHg5x4gYcwB6h5RZ+pFeGH0mHtpNXAjkSY/SnY
	 NrA6BIUwlLMliasFWpcKQkhur8HAxsdhBIv2Q0QfKP/kI2WY7hdG1vdmb/WkEmVg/bLv2
	 /z4ddUAnkfAMBLAmt1sqq2Feuxa4LeeU7iDNXbAke9kSAkTFi7yM9jvkNtGknJqSqqSLS
	 QY9CaAqVUa+O0bAcszDXadIvLbI3NW+E/6E5pW8GwnjkyWRxo9YY0vT/BynpzjAdquyiK
	 INjx4YlKvS5UTk0v1djolW+GaiMiEeHZmTITBGq3CX9wsWbjjjFn8o1YsitwxbtElFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB434606A322;
	Mon, 26 Oct 2026 20:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB434606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F2B1A92009C; Mon, 26 Oct 2026 21:15:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EDDCC92009B;
	Mon, 26 Oct 2026 20:15:06 +0000 (GMT)
Date: Mon, 26 Oct 2026 20:15:06 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Imre Kaloz <kaloz@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: SGI-IP27: Install the cache error vector on
 every CPU
In-Reply-To: <20261026120011.24675-1-kaloz@kernel.org>
Message-ID: <alpine.DEB.2.21.2610262005340.42255@angie.orcam.me.uk>
References: <20261026120011.24675-1-kaloz@kernel.org>
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

On Mon, 26 Oct 2026, Imre Kaloz wrote:

> The R10000 drives an uncached attribute on the bus, decoded by the hub.
> CKSEG1 uses attribute 0, UALIAS, whose low 128K is flipped by CPU slice
> (UALIAS_FLIP_BIT), so slice 1 reads CKSEG1 0x100 from node memory
> 0x10100. trap_init() writes the vector only through TO_UNCAC(),
> attribute 3, unflipped. Copy it on each secondary.

 OK, slice 1 gets 0xffffffffa0000100 virtual mapped to 0x10100 physical.

 So does slice 0 get 0xffffffffa0000100 virtual mapped to 0x100 physical?  
How about other slices?  "Each secondary" suggests there are more than 2.

 Not questioning the validity of the change, but trying to understand the 
system topology.

  Maciej
