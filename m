Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183625;
	b=sGSfgmDZLJ8UXex1ucvHWzbmR0S2dRKIsYybpmxDtc4dlM12+eME2jLPEf6AtUh0ZP79
	 a2x5HQaTYwBP6mtf4S4EqlqXWejRnF5JxomFi2gqzo0Odwac5ipF2yekbuD/mz97tmRRZ
	 XMac/UbfKAAV8PCtbl3tmhVn5VEp+iCJXB/OxG17FOFr9qPtf6JRoe62UAt8xV1AxhQMg
	 W2FyKVW21crut1BJrn6VS8dFQ8uWKcA35+lWRDZyXrueFoY83cdUtKNFCBrxvnBlBVrn0
	 MnCpGmBOop1BiXhldB2SGmVBM03u3bRSN37dRLIz20HZd+bg4D2vm52M4WeJtmfxdTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183625;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=WSXr3OR7IpRJQ5Qk2WyHJzmDHog8U7gaLnP2BcLUYpM=;
	b=b4Q17Zu7iSMjGOJba9S4fIZPSxcgEcdLBgfn1DaKTlFtVZgBgrE4EA4PthldYW9aMNJX
	 VWem704H8XFxiFgKmoKeUkUOShma8SLtHp1ePjlbjcrqmCtOIVMCQ4xv3qbJ6USH/OF9e
	 93HMfWZwuSo6+Mjf4t7rvntAW+xKOcCCdS71Z+GMRv2uciLNrdsXIB9k2eydVuBS7UlIb
	 zkAt/pOt6UdkJFPR6dAqgzU9kXs+Yq8fz181PrdljudadGcnTXornAOgFJ7P1c+EloRGN
	 amFREtq5OXSYxSQHeU0sbXT8SjzNjnjvdtek7JxFLdPWGgBQYJ6BuTPGo2oOwf0g2Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C44606A320;
	Fri, 20 Nov 2026 14:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9250F9200BC; Fri, 20 Nov 2026 15:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8FB329200B3;
	Fri, 20 Nov 2026 14:06:56 +0000 (GMT)
Date: Fri, 20 Nov 2026 14:06:56 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst
 secondary entry
In-Reply-To: <20261120050827.804767-1-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.21.2611201404490.54328@angie.orcam.me.uk>
References: <20261120050827.804767-1-f.fainelli@gmail.com>
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

On Thu, 19 Nov 2026, Florian Fainelli wrote:

> Remove .set noreorder and the two explicit delay-slot nops from the
> XBurst secondary CPU reset entry. GNU as emits identical reset-entry
> instructions with reordering enabled in both the CI20 and generic
> MIPS64r2 Ingenic SMP builds.
> 
> On CI20, two baseline and three updated cold boots brought both CPUs
> online. Each boot passed the CPU affinity check and 100 cross-core
> idle-wakeup round trips in each direction. Codex assisted with the
> assembly comparison and hardware test campaign.
> 
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
> if that is simpler. Thanks!

 Have you compared objects produced to be the same with and without the 
change applied?  If they are, then:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

 Thanks for this follow-up cleanup.

  Maciej
