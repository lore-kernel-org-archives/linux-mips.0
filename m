Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893544;
	b=Rb8NNKahSe61fxGZjWbV9dQnIGSkdXc/y/o/lqsCGi5cgcJlStMuiOkpgGlWrSv5pdi1
	 W6x0xOHYN4fTrhv1a7/et8ui2J5JaLLmD/eaDZmJoDplA9ipus+WcacA7FdmicxN4xwPe
	 Rokheb2dYFG4cedlY7XvMHINU3rDZFv4hcrPrWwC9jUJGqpqvANK4z+zen/W41vzcDUYA
	 dfWzJnjceGUNW+exMyV4rIiHzao/YLGCu5y46Cs7eUMk+3kNOSSfYX1qd0aNteySNIivm
	 f/0ezkeAb3Nwj5P+7eR23bBN1Nr1sHquDOa0qPItY+NAtp3FA8MQ+ccF6UqIkbFKPBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893544;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gtjV7Lleo2+ONnpavg8cztU4m7vyzoQjZh5qfVTQ3aA=;
	b=Z1fR8XUo2jx3qzUkN1ARkOXN+HE4GZesNbXfMrv/X+rjDVk8yuZCF02rKCNZE2YDAmdt
	 an9+/5GW/5RAz8pn1pbU8tsHN2CYGLP65Lyfso+xIuJCGcjIUuQMwwBVU96kQdR2+4ojr
	 OPfswcv4oTAdv/zayMUYO1BhAaLzrhincQgD8jzs4QIlJPvWW8xJXHx6VnwawDV9KjleW
	 Uq5mgctu3yvSRM1iI10VMoJFIvVtY6Xfe4vR6Tmtjzu6epm7aBrrivuc4zT/kDwSa4Iu1
	 5eQq++NzTPeItTJkpLJqSLE6qlCU3CyYNmmCN7r/yU7GeVCBTGVd+E6ZTeoFEmIJINA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4BD606A32D;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4BD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-000716-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CF5BCC01A0; Thu,  5 Nov 2026 16:20:07 +0100 (CET)
Date: Thu, 5 Nov 2026 16:20:07 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, manuel.lauss@gmail.com,
	Thierry Reding <treding@nvidia.com>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Alchemy: Register interrupt chips with the IRQ core
Message-ID: <auyepzYMrbQNmAad@alpha.franken.de>
References: <20261016181602.2152632-1-f.fainelli@gmail.com>
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
In-Reply-To: <20261016181602.2152632-1-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 11:15:59AM -0700, Florian Fainelli wrote:
> Alchemy initializes its interrupt chips through the set-type callbacks,
> which use irq_set_chip_handler_name_locked() to assign the chip and flow
> handler. This bypasses irq_set_chip() and its descriptor registration.
> 
> Since /proc/interrupts switched to iterating the IRQ descriptor maple tree,
> the statically allocated Alchemy descriptors are no longer found. On an
> MTX-1, the file contains only the CPU header and ERR counter even though
> the timer, serial, Ethernet and PCI wireless interrupts work.
> 
> Register each IC0/IC1 interrupt chip through irq_set_chip() before setting
> the initial trigger type. Do the same for the Au1300 GPIC. Keep the locked
> set-type callbacks for later trigger changes.
> 
> Fixes: 171cc0d9eed1 ("genirq/proc: Speed up /proc/interrupts iteration")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/mips/alchemy/common/irq.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
