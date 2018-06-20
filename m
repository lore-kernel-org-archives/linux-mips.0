Received: from verein.lst.de ([213.95.11.211]:35707 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990475AbeFTHOU6FqH8 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 20 Jun 2018 09:14:20 +0200
Date: Wed, 20 Jun 2018 09:23:28 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/25] MIPS: loongson64: use generic dma noncoherent ops
Message-ID: <20180620072328.GA1675@lst.de>
References: <20180615110854.19253-1-hch@lst.de> <20180615110854.19253-19-hch@lst.de> <20180619231925.mgbgc7lfvjqumr7a@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619231925.mgbgc7lfvjqumr7a@pburton-laptop>
Return-Path: <hch@lst.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@mips.com>
Cc: Christoph Hellwig <hch@lst.de>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>, Kevin Cernekee <cernekee@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Tom Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhc@lemote.com>, iommu@lists.linux-foundation.org, linux-mips@linux-mips.org
Message-ID: <20180620072328.r0XAAG3hnOyTUjCJPo9jW94LtF5DwV1uGOWS5lVBUWI@z>

On Tue, Jun 19, 2018 at 04:19:25PM -0700, Paul Burton wrote:
> Hi Christoph,
> 
> On Fri, Jun 15, 2018 at 01:08:47PM +0200, Christoph Hellwig wrote:
> > -static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
> > -	dma_addr_t dma_addr)
> > -{
> > -#if defined(CONFIG_CPU_LOONGSON2F) && defined(CONFIG_64BIT)
> > -	return (dma_addr > 0x8fffffff) ? dma_addr : (dma_addr & 0x0fffffff);
> > -#else
> > -	return dma_addr & 0x7fffffff;
> > -#endif
> > -}
> 
> ...
> 
> > +phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> > +{
> > +#if defined(CONFIG_CPU_LOONGSON2F) && defined(CONFIG_64BIT)
> > +	if (dma_addr > 0x8fffffff)
> > +		return dma_addr;
> > +#endif
> > +	return dma_addr & 0x0fffffff;
> > +}
> 
> Thanks for putting in the work here - I've applied patches 1-17 to
> mips-next so far, but I'm struggling to convince myself that the above
> is correct.
> 
> In the original code we have 3 distinct cases:
> 
>   64b Loongson2F, dma_addr > 0x8fffffff  -> dma_addr
>   64b Loongson2F, dma_addr <= 0x8fffffff -> dma_addr & 0x0fffffff
>   Everything else                        -> dma_addr & 0x7fffffff
> 
> In the new __dma_to_phys() though only the first case remains the same.
> 
> Is this intentional or a mixup?

No, this is a mixup.  I hadn't noticed one case was 0x0fffffff and
the other 0x7fffffff.

Below is the minimal fixup that keeps things as much as it was before.

---
