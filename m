Received: from mailapp01.imgtec.com ([195.59.15.196]:23962 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011905AbaJ3KHjaGgYz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Oct 2014 11:07:39 +0100
Message-ID: <54520DE4.9090008@imgtec.com>
Date: Thu, 30 Oct 2014 10:07:32 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: DMA: fix coherent alloc in non-coherent systems
References: <20141030014753.13189.48344.stgit@linux-yegoshin>
In-Reply-To: <20141030014753.13189.48344.stgit@linux-yegoshin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
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
Message-ID: <20141030100732.COxH0vuaPaN17hBcLPdptsGdTMMUkdqmFhDoD2UOGPU@z>

Hi Leonid,

On 30/10/14 01:48, Leonid Yegoshin wrote:
> A default dma_alloc_coherent() fails to alloc a coherent memory on non-coherent
> systems in case of device->coherent_dma_mask covering the whole memory space.
> 
> In case of non-coherent systems the coherent memory on MIPS is restricted by
> size of un-cachable segment and should be located in ZONE_DMA.

Has this pretty much always been broken?

> @@ -81,6 +81,11 @@ static gfp_t massage_gfp_flags(const struct device *dev, gfp_t gfp)
>  		dma_flag = __GFP_DMA;
>  	else
>  #endif
> +#ifdef CONFIG_ZONE_DMA
> +	     if (coherent && !plat_device_is_coherent(dev))

Broken indentation. Please fix to use tabs.

> +			dma_flag = __GFP_DMA;
> +	else
> +#endif
>  #if defined(CONFIG_ZONE_DMA32) && defined(CONFIG_ZONE_DMA)
>  	     if (dev->coherent_dma_mask < DMA_BIT_MASK(32))
>  			dma_flag = __GFP_DMA;

Other than that, this patch looks okay to me (but those with more
experience with MIPS DMA than me may know better).

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Thanks
James
