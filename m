Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:51752 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994554AbeBMNvwRo0UV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 14:51:52 +0100
Subject: Re: [PATCH v2 06/15] MIPS: memblock: Add reserved memory regions to
 memblock
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-7-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <ff5e9bd4-2d27-9199-e6e3-759763fc3b6a@mips.com>
Date: Tue, 13 Feb 2018 13:44:40 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-7-fancer.lancer@gmail.com>
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
Message-ID: <20180213134440.tONvqFcNgUHWonpdpcSw9y3arEIXMYxjtkwncovP_Z8@z>

Hi Serge,

On 02/02/18 03:54, Serge Semin wrote:
> The memory reservation has to be performed for all the crucial
> objects like kernel itself, it data and fdt blob. FDT reserved-memory
> nodes should also be scanned to declare or discard reserved memory
> regions, but it has to be done after the memblock is fully initialized
> with low/high RAM (see the function description/code).

Again, if possible, introduce this change before discarding bootmem 
initialisation, so that the series can be bisected.


> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/kernel/setup.c | 96 +++++++++++++++++++++++++++---------------------
>   1 file changed, 54 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index cf3674977170..72853e94c2c7 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -362,6 +362,10 @@ static unsigned long __init init_initrd(void)
>   static void __init bootmem_init(void)
>   {
>   	init_initrd();
> +}
> +
> +static void __init reservation_init(void)
> +{
>   	finalize_initrd();
>   }
>   
> @@ -478,60 +482,70 @@ static void __init bootmem_init(void)
>   		memblock_add_node(PFN_PHYS(start), PFN_PHYS(end - start), 0);
>   	}
>   	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
> +}
> +
> +static void __init reservation_init(void)
> +{
> +	phys_addr_t size;
> +	int i;
>   
>   	/*
> -	 * Register fully available low RAM pages with the bootmem allocator.
> +	 * Reserve memory occupied by the kernel and it data
>   	 */
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		unsigned long start, end, size;
> +	size = __pa_symbol(&_end) - __pa_symbol(&_text);
> +	memblock_reserve(__pa_symbol(&_text), size);
>   
> -		start = PFN_UP(boot_mem_map.map[i].addr);
> -		end   = PFN_DOWN(boot_mem_map.map[i].addr
> -				    + boot_mem_map.map[i].size);
> +	/*
> +	 * Handle FDT and it reserved-memory nodes now
> +	 */
> +	early_init_fdt_reserve_self();
> +	early_init_fdt_scan_reserved_mem();
>   
> -		/*
> -		 * Reserve usable memory.
> -		 */
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -			break;
> -		case BOOT_MEM_INIT_RAM:
> -			memory_present(0, start, end);
> -			continue;
> -		default:
> -			/* Not usable memory */
> -			if (start > min_low_pfn && end < max_low_pfn)
> -				reserve_bootmem(boot_mem_map.map[i].addr,
> -						boot_mem_map.map[i].size,
> -						BOOTMEM_DEFAULT);
> -			continue;
> -		}

I think this change maybe belongs in "MIPS: memblock: Discard bootmem 
initialization"?

Thanks,
Matt

> +	/*
> +	 * Reserve requested memory ranges with the memblock allocator.
> +	 */
> +	for (i = 0; i < boot_mem_map.nr_map; i++) {
> +		phys_addr_t start, end;
>   
> -		/*
> -		 * We are rounding up the start address of usable memory
> -		 * and at the end of the usable range downwards.
> -		 */
> -		if (start >= max_low_pfn)
> +		if (boot_mem_map.map[i].type == BOOT_MEM_RAM)
>   			continue;
> -		if (end > max_low_pfn)
> -			end = max_low_pfn;
> +
> +		start = boot_mem_map.map[i].addr;
> +		end   = boot_mem_map.map[i].addr + boot_mem_map.map[i].size;
> +		size  = boot_mem_map.map[i].size;
>   
>   		/*
> -		 * ... finally, is the area going away?
> +		 * Make sure the region isn't already reserved
>   		 */
> -		if (end <= start)
> +		if (memblock_is_region_reserved(start, size)) {
> +			pr_warn("Reserved region %08zx @ %pa already in-use\n",
> +				(size_t)size, &start); >   			continue;
> -		size = end - start;
> +		}
>   
> -		/* Register lowmem ranges */
> -		free_bootmem(PFN_PHYS(start), size << PAGE_SHIFT);
> -		memory_present(0, start, end);
> +		switch (boot_mem_map.map[i].type) {
> +		case BOOT_MEM_ROM_DATA:
> +		case BOOT_MEM_RESERVED:
> +		case BOOT_MEM_INIT_RAM:
> +			memblock_reserve(start, size);
> +			break;
> +		case BOOT_MEM_RESERVED_NOMAP:
> +		default:
> +			memblock_remove(start, size);
> +			break;
> +		}
>   	}
>   
>   	/*
>   	 * Reserve initrd memory if needed.
>   	 */
>   	finalize_initrd();
> +
> +	/*
> +	 * Reserve for hibernation
> +	 */
> +	size = __pa_symbol(&__nosave_end) - __pa_symbol(&__nosave_begin);
> +	memblock_reserve(__pa_symbol(&__nosave_begin), size);
>   }
>   
>   #endif	/* CONFIG_SGI_IP27 */
> @@ -546,6 +560,7 @@ static void __init bootmem_init(void)
>    * kernel but generic memory management system is still entirely uninitialized.
>    *
>    *  o bootmem_init()
> + *  o reservation_init()
>    *  o sparse_init()
>    *  o paging_init()
>    *  o dma_contiguous_reserve()
> @@ -803,10 +818,10 @@ static void __init arch_mem_init(char **cmdline_p)
>   		print_memory_map();
>   	}
>   
> -	early_init_fdt_reserve_self();
> -	early_init_fdt_scan_reserved_mem();
> -
>   	bootmem_init();
> +
> +	reservation_init();
> +
>   #ifdef CONFIG_PROC_VMCORE
>   	if (setup_elfcorehdr && setup_elfcorehdr_size) {
>   		printk(KERN_INFO "kdump reserved memory at %lx-%lx\n",
> @@ -832,9 +847,6 @@ static void __init arch_mem_init(char **cmdline_p)
>   	for_each_memblock(reserved, reg)
>   		if (reg->size != 0)
>   			reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
> -
> -	reserve_bootmem_region(__pa_symbol(&__nosave_begin),
> -			__pa_symbol(&__nosave_end)); /* Reserve for hibernation */
>   }
>   
>   static void __init resource_init(void)
> 
