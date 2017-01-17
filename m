Received: from mail-cys01nam02on0068.outbound.protection.outlook.com ([104.47.37.68]:34944
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993889AbdAQUAfMtrAm (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Jan 2017 21:00:35 +0100
Subject: Re: [PATCH 11/13] MIPS: octeon: avoid empty-body warning
References: <20170117151911.4109452-1-arnd@arndb.de>
 <20170117151911.4109452-11-arnd@arndb.de>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <4d7895e9-5554-8cfa-f33f-37f84c1d26db@caviumnetworks.com>
Date: Tue, 17 Jan 2017 12:00:23 -0800
MIME-Version: 1.0
In-Reply-To: <20170117151911.4109452-11-arnd@arndb.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Arnd Bergmann <arnd@arndb.de>, Ralf Baechle <ralf@linux-mips.org>, "Hill, Steven" <Steven.Hill@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org
Message-ID: <20170117200023.5ERXL7EtD1H1ftWWx1DidjNCIq_WEDLSICBWiwwJkY0@z>

On 01/17/2017 07:18 AM, Arnd Bergmann wrote:
> gcc-6 reports a harmless build warning:
>
> arch/mips/cavium-octeon/dma-octeon.c: In function 'octeon_dma_alloc_coherent':
> arch/mips/cavium-octeon/dma-octeon.c:179:3: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
>
> We can fix this by rearranging the code slightly using the
> IS_ENABLED() macro.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: David Daney <david.daney@cavium.com>

Steven: Please test this patch.


Thanks,
David Daney

> ---
>  arch/mips/cavium-octeon/dma-octeon.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
> index fd69528b24fb..1226965e1e4f 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -164,19 +164,14 @@ static void *octeon_dma_alloc_coherent(struct device *dev, size_t size,
>  	/* ignore region specifiers */
>  	gfp &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
>
> -#ifdef CONFIG_ZONE_DMA
> -	if (dev == NULL)
> +	if (IS_ENABLED(CONFIG_ZONE_DMA) && dev == NULL)
>  		gfp |= __GFP_DMA;
> -	else if (dev->coherent_dma_mask <= DMA_BIT_MASK(24))
> +	else if (IS_ENABLED(CONFIG_ZONE_DMA) &&
> +		 dev->coherent_dma_mask <= DMA_BIT_MASK(24))
>  		gfp |= __GFP_DMA;
> -	else
> -#endif
> -#ifdef CONFIG_ZONE_DMA32
> -	     if (dev->coherent_dma_mask <= DMA_BIT_MASK(32))
> +	else if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
> +		 dev->coherent_dma_mask <= DMA_BIT_MASK(32))
>  		gfp |= __GFP_DMA32;
> -	else
> -#endif
> -		;
>
>  	/* Don't invoke OOM killer */
>  	gfp |= __GFP_NORETRY;
>
