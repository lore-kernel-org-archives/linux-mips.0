Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896920;
	b=WD5xMV8WDzAv1WBW9P5qKPeUAMo+WleBfPTjMaVnHQ+eyoot2SVSW4Hr8J446a13J8CR
	 wjDw86hw/Uyt6EFqWP5VHUr3DhT5tTYfJ0Ctl4/w7oNscFJG6LDfiBZxW3jdIYNX3NBai
	 /dCh3qLuXwOdRgheNdIa8GMntDVWm56V+eCFlYwZJA7RA2RWRXuWmfxN6QaID+wGLUq0B
	 qislfD9F1+SPjMdGyspOU9BJ6syq8ufIbZgOnrJnm4MEj4XuTYXp3DWpiYetouF2yJScs
	 H2dkR1LJFp3lup1GPAhOH2tzFMRcnuVf+3PeUhQZOT4QmdWdVwX9UWKnPnV12SvdTLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896920;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=/YytvGdk1zdZinqM6OZmmmHH8j1UW2iQ0JJCwjI5UG0=;
	b=nvb7GU/U7UrBuHpcGaPhQP2yw+w540gKCJVavmqdI1wZM5+3SAkMP0iiIbFw9Xygg6On
	 bwWtQ+v/rHsim5zknBLB7TB3ZwDapYBSwghuPAU5KOV0mMPA+/5n8chIp9jsq/2/FbHoY
	 i1R5D0BokUy2rjeNvVS7iUVijZeWuCkrdLpRn7/1BJF+KIpE5ULkFQty7OE0uFj8qW/mb
	 zQrmH73F6ioZ/GNztD21fQr8C6dY0jKMOQPVwlovJcGJ0jkySrAwaK9OLPtrW3IxV+RJE
	 Xt12EIUyKh+TZX8LNIqnG5lJnaxjie7+OwlyFS3mIe0EcCezuEK6EDC2x7zgMhuOMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF50A606A31A;
	Sun, 25 Oct 2026 02:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF50A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 231F692009C; Sun, 25 Oct 2026 03:55:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1F43492009B;
	Sun, 25 Oct 2026 02:55:11 +0000 (GMT)
Date: Sun, 25 Oct 2026 02:55:11 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI
 I/O window
In-Reply-To: <20261022163106.1410595-1-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
References: <20261022163106.1410595-1-f.fainelli@gmail.com>
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

On Thu, 22 Oct 2026, Florian Fainelli wrote:

> Changes in v2:
> 
> - implement Maciej's suggestion to reserve PCI resources first
>   and then the rest of the peripherals

 Thanks.

> diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
> index 85ec9cc31d66..29fd052766b2 100644
> --- a/arch/mips/cobalt/pci.c
> +++ b/arch/mips/cobalt/pci.c
> @@ -14,6 +14,8 @@
>  
>  #include <asm/gt64120.h>
>  
> +#include <cobalt.h>
> +

 Hmm, why do you need it here now, a leftover from testing?

 With that removed, unless proved otherwise:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
