Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:55357 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994615AbeBMOJuDJkAV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 15:09:50 +0100
Subject: Re: [PATCH v2 09/15] MIPS: memblock: Simplify DMA contiguous
 reservation
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-10-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <211f951d-8704-76ed-c9a8-1ff5256d641f@mips.com>
Date: Tue, 13 Feb 2018 13:51:41 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-10-fancer.lancer@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, miodrag.dinic@mips.com, jhogan@kernel.org, goran.ferenc@mips.com, david.daney@cavium.com, paul.gortmaker@windriver.com, paul.burton@mips.com, alex.belits@cavium.com, Steven.Hill@cavium.com
Cc: alexander.sverdlin@nokia.com, kumba@gentoo.org, marcin.nowakowski@mips.com, James.hogan@mips.com, Peter.Wotton@mips.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180213135141.x40Ku9fsBsLAUTYWdMwuRjpKSvyyE1iDeIndbPJJ1-8@z>

Hi Serge,

On 02/02/18 03:54, Serge Semin wrote:
> CMA reserves it areas in the memblock allocator. Since we aren't
> using bootmem anymore, the reservations copying should be discarded.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Looks good to me

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

Thanks,
Matt

> ---
>   arch/mips/kernel/setup.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 54302319ce1c..158a52c17e29 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -755,7 +755,7 @@ static void __init request_crashkernel(struct resource *res)
>   
>   static void __init arch_mem_init(char **cmdline_p)
>   {
> -	struct memblock_region *reg;
> +	struct memblock_region *reg __maybe_unused;
>   	extern void plat_mem_setup(void);
>   
>   	/* call board setup routine */
> @@ -846,10 +846,6 @@ static void __init arch_mem_init(char **cmdline_p)
>   	plat_swiotlb_setup();
>   
>   	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
> -	/* Tell bootmem about cma reserved memblock section */
> -	for_each_memblock(reserved, reg)
> -		if (reg->size != 0)
> -			reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
>   }
>   
>   static void __init resource_init(void)
> 
