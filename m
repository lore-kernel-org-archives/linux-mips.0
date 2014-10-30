Received: from mailapp01.imgtec.com ([195.59.15.196]:23199 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012245AbaJ3JsdGhY0q (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Oct 2014 10:48:33 +0100
Message-ID: <54520969.8030900@imgtec.com>
Date: Thu, 30 Oct 2014 09:48:25 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: DMA: fix coherent alloc in non-coherent systems
References: <20141030014753.13189.48344.stgit@linux-yegoshin>
In-Reply-To: <20141030014753.13189.48344.stgit@linux-yegoshin>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, nbd@openwrt.org, yanh@lemote.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, alex.smith@imgtec.com, taohl@lemote.com, chenhc@lemote.com, blogic@openwrt.org
Message-ID: <20141030094825.UdliL-7rXjk4nnlnRDzFH5oL0ikDD_T8IETjCcQ4RbE@z>

Hi,

On 10/30/2014 01:48 AM, Leonid Yegoshin wrote:
> A default dma_alloc_coherent() fails to alloc a coherent memory on non-coherent
> systems in case of device->coherent_dma_mask covering the whole memory space.
> 
> In case of non-coherent systems the coherent memory on MIPS is restricted by
> size of un-cachable segment and should be located in ZONE_DMA.
> 
> Added __GFP_DMA flag in case of non-coherent systems to enforce an allocation
> of coherent memory in ZONE_DMA.
> 
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
>  .../include/asm/mach-cavium-octeon/dma-coherence.h |    2 +-
>  arch/mips/include/asm/mach-generic/dma-coherence.h |    2 +-
>  arch/mips/include/asm/mach-ip27/dma-coherence.h    |    2 +-
>  arch/mips/include/asm/mach-ip32/dma-coherence.h    |    2 +-
>  arch/mips/include/asm/mach-jazz/dma-coherence.h    |    2 +-
>  .../mips/include/asm/mach-loongson/dma-coherence.h |    2 +-
>  arch/mips/mm/dma-default.c                         |   11 ++++++++---
>  7 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h b/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
> index f9f4486..fe0b465 100644
> --- a/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
> +++ b/arch/mips/include/asm/mach-cavium-octeon/dma-coherence.h
> @@ -52,7 +52,7 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
>  	return 0;
>  }
>  
> -static inline int plat_device_is_coherent(struct device *dev)
> +static inline int plat_device_is_coherent(const struct device *dev)

Why adding const here?

>  {
>  	return 1;
>  }
> diff --git a/arch/mips/include/asm/mach-generic/dma-coherence.h b/arch/mips/include/asm/mach-generic/dma-coherence.h
> index b4563df..2283996 100644
> --- a/arch/mips/include/asm/mach-generic/dma-coherence.h
> +++ b/arch/mips/include/asm/mach-generic/dma-coherence.h
> @@ -47,7 +47,7 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
>  	return 1;
>  }
>  
> -static inline int plat_device_is_coherent(struct device *dev)
> +static inline int plat_device_is_coherent(const struct device *dev)

likewise

>  {
>  #ifdef CONFIG_DMA_COHERENT
>  	return 1;
> diff --git a/arch/mips/include/asm/mach-ip27/dma-coherence.h b/arch/mips/include/asm/mach-ip27/dma-coherence.h
> index 4ffddfd..c7767e3 100644
> --- a/arch/mips/include/asm/mach-ip27/dma-coherence.h
> +++ b/arch/mips/include/asm/mach-ip27/dma-coherence.h
> @@ -58,7 +58,7 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
>  	return 1;
>  }
>  
> -static inline int plat_device_is_coherent(struct device *dev)
> +static inline int plat_device_is_coherent(const struct device *dev)

likewise

>  {
>  	return 1;		/* IP27 non-cohernet mode is unsupported */
>  }
> diff --git a/arch/mips/include/asm/mach-ip32/dma-coherence.h b/arch/mips/include/asm/mach-ip32/dma-coherence.h
> index 104cfbc..a6b6a55 100644
> --- a/arch/mips/include/asm/mach-ip32/dma-coherence.h
> +++ b/arch/mips/include/asm/mach-ip32/dma-coherence.h
> @@ -80,7 +80,7 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
>  	return 1;
>  }
>  
> -static inline int plat_device_is_coherent(struct device *dev)
> +static inline int plat_device_is_coherent(const struct device *dev)

likewise etc

Is it just a matter of consistence with the rest of the interfaces? Do
you need to move these into a separate patch since they don't quite fit
here.

-- 
markos
