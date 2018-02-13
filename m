Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:44067 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994614AbeBMONPUnJWV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 15:13:15 +0100
Subject: Re: [PATCH v2 12/15] MIPS: memblock: Print out kernel virtual mem
 layout
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-13-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <0448b8d7-48f1-7519-693c-47cdd162d000@mips.com>
Date: Tue, 13 Feb 2018 14:05:31 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-13-fancer.lancer@gmail.com>
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
Message-ID: <20180213140531.HJ0dl3z-_DSkR8RzZ5dhUuJ8-JziGy_cQZphNHmCTUU@z>

Hi Serge,

On 02/02/18 03:54, Serge Semin wrote:
> It is useful to have the kernel virtual memory layout printed
> at boot time so to have the full information about the booted
> kernel. In some cases it might be unsafe to have virtual
> addresses freely visible in logs, so the %pK format is used if
> one want to hide them.

Please could you update the commit message to reflect the guard on 
CONFIG_DEBUG_KERNEL, and the %pK format is no longer used.

It would be better to have this patch either at the start of the series, 
or the end, since it is not strictly involved in switching between 
bootmem and memblock.  It would be better to have a short sequence of 
patches to make that transition, with patches to lead up to that or 
clean up afterwards at the beginning and end of the series. It will just 
make any future bisection easier.

Thanks,
Matt


> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/mm/init.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 84b7b592b834..eec92194d4dc 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -32,6 +32,7 @@
>   #include <linux/kcore.h>
>   #include <linux/export.h>
>   #include <linux/initrd.h>
> +#include <linux/sizes.h>
>   
>   #include <asm/asm-offsets.h>
>   #include <asm/bootinfo.h>
> @@ -60,6 +61,53 @@ EXPORT_SYMBOL_GPL(empty_zero_page);
>   EXPORT_SYMBOL(zero_page_mask);
>   
>   /*
> + * Print out the kernel virtual memory layout
> + */
> +#define MLK(b, t) (void *)b, (void *)t, ((t) - (b)) >> 10
> +#define MLM(b, t) (void *)b, (void *)t, ((t) - (b)) >> 20
> +#define MLK_ROUNDUP(b, t) (void *)b, (void *)t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
> +static void __init mem_print_kmap_info(void)
> +{
> +#ifdef CONFIG_DEBUG_KERNEL
> +	pr_notice("Kernel virtual memory layout:\n"
> +		  "    lowmem  : 0x%px - 0x%px  (%4ld MB)\n"
> +		  "      .text : 0x%px - 0x%px  (%4td kB)\n"
> +		  "      .data : 0x%px - 0x%px  (%4td kB)\n"
> +		  "      .init : 0x%px - 0x%px  (%4td kB)\n"
> +		  "      .bss  : 0x%px - 0x%px  (%4td kB)\n"
> +		  "    vmalloc : 0x%px - 0x%px  (%4ld MB)\n"
> +#ifdef CONFIG_HIGHMEM
> +		  "    pkmap   : 0x%px - 0x%px  (%4ld MB)\n"
> +#endif
> +		  "    fixmap  : 0x%px - 0x%px  (%4ld kB)\n",
> +		  MLM(PAGE_OFFSET, (unsigned long)high_memory),
> +		  MLK_ROUNDUP(_text, _etext),
> +		  MLK_ROUNDUP(_sdata, _edata),
> +		  MLK_ROUNDUP(__init_begin, __init_end),
> +		  MLK_ROUNDUP(__bss_start, __bss_stop),
> +		  MLM(VMALLOC_START, VMALLOC_END),
> +#ifdef CONFIG_HIGHMEM
> +		  MLM(PKMAP_BASE, (PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE)),
> +#endif
> +		  MLK(FIXADDR_START, FIXADDR_TOP));
> +
> +	/* Check some fundamental inconsistencies. May add something else? */
> +#ifdef CONFIG_HIGHMEM
> +	BUILD_BUG_ON(VMALLOC_END < PAGE_OFFSET);
> +	BUG_ON(VMALLOC_END < (unsigned long)high_memory);
> +	BUILD_BUG_ON((PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE) < PAGE_OFFSET);
> +	BUG_ON((PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE) <
> +		(unsigned long)high_memory);
> +#endif
> +	BUILD_BUG_ON(FIXADDR_TOP < PAGE_OFFSET);
> +	BUG_ON(FIXADDR_TOP < (unsigned long)high_memory);
> +#endif /* CONFIG_DEBUG_KERNEL */
> +}
> +#undef MLK
> +#undef MLM
> +#undef MLK_ROUNDUP
> +
> +/*
>    * Not static inline because used by IP27 special magic initialization code
>    */
>   void setup_zero_pages(void)
> @@ -468,6 +516,7 @@ void __init mem_init(void)
>   	free_all_bootmem();
>   	setup_zero_pages();	/* Setup zeroed pages.  */
>   	mem_init_free_highmem();
> +	mem_print_kmap_info();
>   	mem_init_print_info(NULL);
>   
>   #ifdef CONFIG_64BIT
> 
