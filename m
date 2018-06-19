Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:48459 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993097AbeFSXTlEhrgR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 01:19:41 +0200
Date: Tue, 19 Jun 2018 16:19:25 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 18/25] MIPS: loongson64: use generic dma noncoherent ops
Message-ID: <20180619231925.mgbgc7lfvjqumr7a@pburton-laptop>
References: <20180615110854.19253-1-hch@lst.de>
 <20180615110854.19253-19-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180615110854.19253-19-hch@lst.de>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Christoph Hellwig <hch@lst.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>, Kevin Cernekee <cernekee@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Tom Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhc@lemote.com>, iommu@lists.linux-foundation.org, linux-mips@linux-mips.org
Message-ID: <20180619231925.5kGASDHAlNrclvmdhdnaNnNAChvps6Jn2NYVxJAUh70@z>

Hi Christoph,

On Fri, Jun 15, 2018 at 01:08:47PM +0200, Christoph Hellwig wrote:
> -static inline unsigned long plat_dma_addr_to_phys(struct device *dev,
> -	dma_addr_t dma_addr)
> -{
> -#if defined(CONFIG_CPU_LOONGSON2F) && defined(CONFIG_64BIT)
> -	return (dma_addr > 0x8fffffff) ? dma_addr : (dma_addr & 0x0fffffff);
> -#else
> -	return dma_addr & 0x7fffffff;
> -#endif
> -}

...

> +phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +{
> +#if defined(CONFIG_CPU_LOONGSON2F) && defined(CONFIG_64BIT)
> +	if (dma_addr > 0x8fffffff)
> +		return dma_addr;
> +#endif
> +	return dma_addr & 0x0fffffff;
> +}

Thanks for putting in the work here - I've applied patches 1-17 to
mips-next so far, but I'm struggling to convince myself that the above
is correct.

In the original code we have 3 distinct cases:

  64b Loongson2F, dma_addr > 0x8fffffff  -> dma_addr
  64b Loongson2F, dma_addr <= 0x8fffffff -> dma_addr & 0x0fffffff
  Everything else                        -> dma_addr & 0x7fffffff

In the new __dma_to_phys() though only the first case remains the same.

Is this intentional or a mixup?

Thanks,
    Paul
