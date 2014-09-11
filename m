Received: from mailapp01.imgtec.com ([195.59.15.196]:32307 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008720AbaIKM4PlYcUS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Sep 2014 14:56:15 +0200
Message-ID: <54119BE8.5020605@imgtec.com>
Date: Thu, 11 Sep 2014 13:56:08 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2] MIPS: bugfix of coherentio variable default setup
References: <20140908191002.13852.47842.stgit@linux-yegoshin>
In-Reply-To: <20140908191002.13852.47842.stgit@linux-yegoshin>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, nbd@openwrt.org, jchandra@broadcom.com, paul.burton@imgtec.com, david.daney@cavium.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, macro@linux-mips.org, manuel.lauss@gmail.com, jerinjacobk@gmail.com, chenhc@lemote.com, blogic@openwrt.org
Message-ID: <20140911125608.tYgRcG46u0p4rIECPa_d-K2Gqhty8deBVSiiAcnbczA@z>

On 08/09/14 20:10, Leonid Yegoshin wrote:
> diff --git a/arch/mips/include/asm/mach-generic/dma-coherence.h b/arch/mips/include/asm/mach-generic/dma-coherence.h
> index 7629c35..b4563df 100644
> --- a/arch/mips/include/asm/mach-generic/dma-coherence.h
> +++ b/arch/mips/include/asm/mach-generic/dma-coherence.h
> @@ -49,7 +49,12 @@ static inline int plat_dma_supported(struct device *dev, u64 mask)
>  
>  static inline int plat_device_is_coherent(struct device *dev)
>  {
> -	return coherentio;
> +#ifdef CONFIG_DMA_COHERENT
> +	return 1;

if DMA_COHERENT=y (which seems to imply DMA_MAYBE_COHERENT=n),
coherentio is already defined as 1 in
arch/mips/include/asm/dma-coherent.h, so I don't think you need this case.

> +#else
> +	return (coherentio > 0);
> +#endif
> +

No need for a new blank line here

>  }

...

> diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
> index 44b6dff..42c819a 100644
> --- a/arch/mips/mm/dma-default.c
> +++ b/arch/mips/mm/dma-default.c
> @@ -24,7 +24,7 @@
>  #include <dma-coherence.h>
>  
>  #ifdef CONFIG_DMA_MAYBE_COHERENT
> -int coherentio = 0;	/* User defined DMA coherency from command line. */
> +int coherentio = -1;    /* User defined DMA coherency is not defined yet. */

Please avoid unnecessarily turned tabs into spaces. It makes files
inconsistent.

Other than that and Markos' style comment it looks reasonable to me.

Cheers
James
