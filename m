Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516416;
	b=AQ7Toam1qpb2jxgxaSFZTdqwshBkBY3NMIFhq+AyxF9dYp/pFpVe7S2YfkhnOgb/wWgK
	 EQa8R6FDXzUGptqrGMz7f7PQWV2xTkOYJ62J+lDV2jA/narGc7BZdYwqyJu0qhKjeXMLL
	 udNxxUL4wLMrIHsnPwm2a6GlxuAtlItmAIOfeqtjbJHf3u0dTu0ugXmfkoXCH/Cw8kFVd
	 2Zh8NgMYmdYvTXJYMPg72VVsSnyyqjNHPBUSZOLcD3jW6e9DEcmHPMItK9/n4LPcaUcp1
	 Co9BqxHs73ZR9D6lFGSgEHHIxVvFQfp+Y55bLIf2mEZ1nMzK+Yzuxa+fN4If4NIng5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516416;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=tPVdO1o+Ij7sz/RsEElNJyknFuLxfrVY4fHViUXvVJE=;
	b=y9aXfHyvkXEm7D0g8FjAmpSk3aCu5GvM/7SWhHMTFXPOz+D/lS3d2g4ywIJyx2Ey1T9M
	 1pf5xKxFurqTbLZA9s5QyrpZr8pga8y4iaGRXz4ZG1Rd8DnrLmhvkL13fuidrR5xyfPJ1
	 RwxM2pa10lDrT+0Nlp3/MU2gdlrGBWOqtykokdQC2ph4ejWBOB4tCj10TqKjRjYqjXnXg
	 5uBrOuw/e1hufDQRbb3B3qsoIpvo4CothKz/vo156kPbSbrVaFogrZmoi1M6imCHl+9r9
	 5bwWLkmKVji2KD/0RPYvFhS5Ruq5vqxBolbXJAfHLf7PSbf8DDOX+xmzUlfxD4U55pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2EB606A320;
	Tue, 20 Oct 2026 17:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2EB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9507892009C; Tue, 20 Oct 2026 19:13:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8FD1B92009B;
	Tue, 20 Oct 2026 18:13:32 +0100 (BST)
Date: Tue, 20 Oct 2026 18:13:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
In-Reply-To: <20261015203107.545047-1-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.21.2610201758400.22065@angie.orcam.me.uk>
References: <20261015203107.545047-1-f.fainelli@gmail.com>
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

On Thu, 15 Oct 2026, Florian Fainelli wrote:

> The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
> controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
> 0x3f6. These resources cannot be claimed under the host bridge window.
> 
> Since pcibios_enable_device() was converted to pci_enable_resources(),
> the unclaimed IDE resources cause device enable to fail with -EINVAL:
> 
>   pata_via 0000:00:09.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
>   pata_via 0000:00:09.1: probe with driver pata_via failed with error -22
> 
> Lower the PCI I/O window start to 0x100 so the fixed IDE resources can
> be claimed. Keep the reserved ISA resources below 0x100 outside the PCI
> window.

 Why not go with 0 (unless that's not what the system controller supports 
as the bottom of the PCI I/O space), and just set PCIBIOS_MIN_IO correctly 
as several platforms do instead?  Is there a southbridge in your system?

  Maciej
