Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:50417 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994674AbeE3X0IEK792 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 31 May 2018 01:26:08 +0200
Date: Wed, 30 May 2018 16:25:52 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 05/25] MIPS: Octeon: refactor swiotlb code
Message-ID: <20180530232552.4rqnoo3652mabrqq@pburton-laptop>
References: <20180525092111.18516-1-hch@lst.de>
 <20180525092111.18516-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180525092111.18516-6-hch@lst.de>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, David Daney <david.daney@cavium.com>, Tom Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@linux-mips.org, iommu@lists.linux-foundation.org
Message-ID: <20180530232552.CASh-N2CUVsy6yVF-v3Vg7oxqpKXOEWD0HaBBxKSHQw@z>

Hi Christoph,

For patches 1-4:

  Reviewed-by: Paul Burton <paul.burton@mips.com>

Comment below for this patch though.

On Fri, May 25, 2018 at 11:20:51AM +0200, Christoph Hellwig wrote:
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
> index e5d00c79bd26..1e68636c9137 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -23,10 +23,16 @@
>  #include <asm/octeon/octeon.h>
>  
>  #ifdef CONFIG_PCI
> +#include <linux/pci.h>
>  #include <asm/octeon/pci-octeon.h>
>  #include <asm/octeon/cvmx-npi-defs.h>
>  #include <asm/octeon/cvmx-pci-defs.h>
>  
> +struct octeon_dma_map_ops {
> +	dma_addr_t (*phys_to_dma)(struct device *dev, phys_addr_t paddr);
> +	phys_addr_t (*dma_to_phys)(struct device *dev, dma_addr_t daddr);
> +};
> +
>  static dma_addr_t octeon_hole_phys_to_dma(phys_addr_t paddr)
>  {
>  	if (paddr >= CVMX_PCIE_BAR1_PHYS_BASE && paddr < (CVMX_PCIE_BAR1_PHYS_BASE + CVMX_PCIE_BAR1_PHYS_SIZE))
> @@ -43,6 +49,11 @@ static phys_addr_t octeon_hole_dma_to_phys(dma_addr_t daddr)
>  		return daddr;
>  }
>  
> +static const struct octeon_dma_map_ops octeon_gen2_ops = {
> +	.phys_to_dma	= octeon_hole_phys_to_dma,
> +	.dma_to_phys	= octeon_hole_dma_to_phys,
> +};

These are pointers to functions of the wrong type, right? phys_to_dma &
dma_to_phys have the struct device * argument but the octeon_hole_*
functions do not. I'd expect we either need to restore the
octeon_gen2_* wrappers that you remove below or change the definition of
the octeon_hole_* functions.

Thanks,
    Paul

>  static dma_addr_t octeon_gen1_phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
>  	if (paddr >= 0x410000000ull && paddr < 0x420000000ull)
> @@ -60,15 +71,10 @@ static phys_addr_t octeon_gen1_dma_to_phys(struct device *dev, dma_addr_t daddr)
>  	return daddr;
>  }
>  
> -static dma_addr_t octeon_gen2_phys_to_dma(struct device *dev, phys_addr_t paddr)
> -{
> -	return octeon_hole_phys_to_dma(paddr);
> -}
> -
> -static phys_addr_t octeon_gen2_dma_to_phys(struct device *dev, dma_addr_t daddr)
> -{
> -	return octeon_hole_dma_to_phys(daddr);
> -}
