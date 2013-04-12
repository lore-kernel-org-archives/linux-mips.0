Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]:35595
        "EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6835071Ab3DLRK4wtFif (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 12 Apr 2013 19:10:56 +0200
Message-ID: <51684012.2020602@caviumnetworks.com>
Date: Fri, 12 Apr 2013 10:10:42 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2] Octeon: fix broken plat_mem_setup()
References: <51683BCB.8060209@nsn.com>
In-Reply-To: <51683BCB.8060209@nsn.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Sverdlin <alexander.sverdlin.ext@nsn.com>
Cc: linux-mips@linux-mips.org, david.daney@cavium.com, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20130412171042.V-eOwqWSngHgDo2f2-4uRba7GiUF3Gsw6P7aw90xo7I@z>

On 04/12/2013 09:52 AM, Alexander Sverdlin wrote:
> Octeon: fix broken plat_mem_setup()
>
> Upstream patch abe77f90dc9c65a7c9a4d61c2cbb8db4d5566e4f (MIPS: Octeon:
> Add kexec
> and kdump support) seems to be untested and broken Linux 3.8 on Octeon
> -- in
> comparison with 3.7 Linux crashes with
>
[...]
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
>
> There are at least couple of issues in the patch:
>
> 1. reason for add_memory_region(memory, mem_alloc_size, BOOT_MEM_RAM)
> instead of
> add_memory_region(memory, size, BOOT_MEM_RAM) is unclear, especially
> because it
> will discard corrections performed by two preceding calls to
> memory_exclude_page().
> This is fixed using size again instead of mem_alloc_size, moreover,
> block sizes
> calculation could be simplified.
>
> 2. add_memory_region(kernel_start, kernel_size, BOOT_MEM_RAM) marks
> kernel body
> as RAM available for allocation, that's why the kernel later crashes
> overwritting
> itself. Marking it as BOOT_MEM_INIT_RAM solves the crash and still
> allows to load
> the same kernel with kexec (tested also).
>

I have a different patch I am testing that gets rid of all this crap.

The strategy we are using is to use cvmx_bootmem named blocks for all 
memory in a KEXEC environment.

David Daney


> Signed-off-by: Alexander Sverdlin <alexander.sverdlin.ext@nsn.com>
> Cc: David Daney <david.daney@cavium.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>
> Changes in V2:
> * corrected "end" calculation, simplified "size" calculation
> * Mapped the kernel correctly as INIT RAM, instead of throwing this code
> out
>
> As a result, kernel not only boots succefully, but also able to load itself
> with "kexec -l <image>".
>
> --- linux.orig/arch/mips/cavium-octeon/setup.c
> +++ linux/arch/mips/cavium-octeon/setup.c
> @@ -936,14 +936,14 @@ void __init plat_mem_setup(void)
>                           CVMX_PCIE_BAR1_PHYS_SIZE,
>                           &memory, &size);
>   #ifdef CONFIG_KEXEC
> -            end = memory + mem_alloc_size;
> +            end = memory + size;
>
>               /*
>                * This function automatically merges address regions
>                * next to each other if they are received in
>                * incrementing order
>                */
> -            if (memory < crashk_base && end >  crashk_end) {
> +            if (memory < crashk_base && end > crashk_end) {
>                   /* region is fully in */
>                   add_memory_region(memory,
>                             crashk_base - memory,
> @@ -969,20 +969,20 @@ void __init plat_mem_setup(void)
>                    * Overlap with the beginning of the region,
>                    * reserve the beginning.
>                     */
> -                mem_alloc_size -= crashk_end - memory;
> +                size = end - crashk_end;
>                   memory = crashk_end;
>               } else if (memory < crashk_base && end > crashk_base &&
> -                   end < crashk_end)
> +                   end < crashk_end) {
>                   /*
>                    * Overlap with the beginning of the region,
>                    * chop of end.
>                    */
> -                mem_alloc_size -= end - crashk_base;
> +                size = crashk_base - memory;
> +            }
>   #endif
> -            add_memory_region(memory, mem_alloc_size, BOOT_MEM_RAM);
> +            if (size)
> +                add_memory_region(memory, size, BOOT_MEM_RAM);
>               total += mem_alloc_size;
> -            /* Recovering mem_alloc_size */
> -            mem_alloc_size = 4 << 20;
>           } else {
>               break;
>           }
> @@ -994,7 +994,7 @@ void __init plat_mem_setup(void)
>
>       /* Adjust for physical offset. */
>       kernel_start &= ~0xffffffff80000000ULL;
> -    add_memory_region(kernel_start, kernel_size, BOOT_MEM_RAM);
> +    add_memory_region(kernel_start, kernel_size, BOOT_MEM_INIT_RAM);
>   #endif /* CONFIG_CRASH_DUMP */
>
>   #ifdef CONFIG_CAVIUM_RESERVE32
>
>
