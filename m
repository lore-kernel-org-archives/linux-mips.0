Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893544;
	b=V/FiC67SGeOQiBMkhget2W9JBSECgEnE25kcV0FJMYNe7I7FeFg622A/Yi3LmuV6AR4/
	 j0KLmE+0iiXOskOfCmJFXD8KKNH0HKd+PPNRCqSOjkKaL1Nkl5w8obMA7Nsx46coSkCIP
	 7rWYp9WaaCHjev/WsWsF3XRZw28355hs7YRN6Zh8r2lztEFmM+0156GS+TX96bc67CP3P
	 FAciZvf2eDrMx96hax+T03lgmdj365NCKh5JopfnTA599dW3fxlHEk+FLSnUYTJXyfVCK
	 ihcFoRfDVWE8QdBNeu1inE3kLc+ae8TBWJLkWWiXgiwgvchKrTk00TgesYYQhS949Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893544;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=S7yKmMyP8iYDY9A9+tbzo35SaJL4hyQbGYHlzf01vPw=;
	b=iH8Fz9GPW4uh01MYityaeHv4nOxokATp9UoVhn+VqEFeMxGD+qr9Hw/7YaEMivyxOQKw
	 zYlhG9lN7oToewzTTvgU4D31i/Icad7ypsH94KGj+IyDWmgakor8IzKpWfwT49hKLVt1C
	 dmSuml8IzhSmFqpfu1K4PYu7E8r06UlS/Wopo9MoA0jshxQM0LQQcwHcO/UtvdZ2+FInP
	 Sv9r/7Nox3XCe1KwL/niCyeBpTGRzjKU5kpNbhlwrNZ9bW6AXD2RwQTy8833B4eX90qH/
	 8MKLP9cvv8xvIu0h6z3oUxBwnc7oGzYD1wMPAOavwrlYnJMmJQo0pxUlQAjA1B/FiKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4B3606A339;
	Thu,  5 Nov 2026 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4B3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-00071A-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 52CDCC04A0; Thu,  5 Nov 2026 16:21:33 +0100 (CET)
Date: Thu, 5 Nov 2026 16:21:33 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, macro@orcam.me.uk,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
Message-ID: <auye_XP-CKkZ16kd@alpha.franken.de>
References: <20261022163106.1410595-1-f.fainelli@gmail.com>
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
In-Reply-To: <20261022163106.1410595-1-f.fainelli@gmail.com>

On Thu, Oct 22, 2026 at 09:31:00AM -0700, Florian Fainelli wrote:
> The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
> controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
> 0x3f6. Since pcibios_enable_device() was converted to
> pci_enable_resources(), these unclaimed resources cause pata_via to
> fail to probe with -EINVAL.
> 
> Start the PCI I/O window at zero to cover the southbridge legacy ports,
> retaining 0x1000 as the allocation minimum via PCIBIOS_MIN_IO. Register
> the PCI controller from plat_mem_setup(), before the VIA reservations
> and i8259 initialization, so the legacy resources do not conflict with
> the host bridge window and prevent PCI bus scanning.
> 
> Keep the VIA resource reservations in plat_mem_setup() after the PCI
> controller registration and use insert_resource() to nest them beneath
> the PCI window. The i8259 and RTC resources are also claimed beneath it.
> 
> Boot-tested on a Qube2 with a MIPS64 kernel. All seven PCI functions
> enumerate, both tulip devices bind, and pata_via initializes both ATA
> hosts and detects the ST380012A 80 GB disk. All 18 boot checks pass,
> including a read-only disk test and Ethernet ping.
> 
> Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
> 
> - implement Maciej's suggestion to reserve PCI resources first
>   and then the rest of the peripherals
> 
>  arch/mips/cobalt/pci.c                     | 11 +++++------
>  arch/mips/cobalt/setup.c                   |  4 +++-
>  arch/mips/include/asm/mach-cobalt/cobalt.h |  1 +
>  3 files changed, 9 insertions(+), 7 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
