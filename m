Received: from mail-bl2on0066.outbound.protection.outlook.com ([65.55.169.66]:6208
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27009143AbbJBQxaSpwCR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 2 Oct 2015 18:53:30 +0200
Message-ID: <560EB67E.4070401@caviumnetworks.com>
Date: Fri, 2 Oct 2015 09:53:18 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Octeon: Fix kernel panic on startup from memory
 corruption
References: <1443588042-21496-1-git-send-email-matt.bennett@alliedtelesis.co.nz>
In-Reply-To: <1443588042-21496-1-git-send-email-matt.bennett@alliedtelesis.co.nz>
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
To: Matt Bennett <matt.bennett@alliedtelesis.co.nz>, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, aleksey.makarov@auriga.com, david.daney@cavium.com
Message-ID: <20151002165318.PZjLwzQeX88KW0-QfOrnana9y92eQ7vjkDxRg263QVg@z>

On 09/29/2015 09:40 PM, Matt Bennett wrote:
> During development it was found that a number of builds would panic
> during the kernel init process, more specifically in 'delayed_fput()'.
> The panic showed the kernel trying to access a memory address of
> '0xb7fdc00' while traversing the 'delayed_fput_list' structure.
> Comparing this memory address to the value of the pointer used on
> builds that did not panic confirmed that the pointer on crashing
> builds must have been corrupted at some stage earlier in the init
> process.
>
> By traversing the list earlier and earlier in the code it was found
> that 'plat_mem_setup()' was responsible for corrupting the list.
> Specifically the line:
>
>      memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
> 			__pa_symbol(&__init_end), -1,
> 			0x100000,
> 			CVMX_BOOTMEM_FLAG_NO_LOCKING);
>
> Which would eventually call:
>
>      cvmx_bootmem_phy_set_size(new_ent_addr,
> 		cvmx_bootmem_phy_get_size
> 		(ent_addr) -
> 		(desired_min_addr -
> 			ent_addr));
>
> Where 'new_ent_addr'=0x4800000 (the address of 'delayed_fput_list')
> and the second argument (size)=0xb7fdc00 (the address causing the
> kernel panic). The job of this part of 'plat_mem_setup()' is to
> allocate chunks of memory for the kernel to use. At the start of
> each chunk of memory the size of the chunk is written, hence the
> value 0xb7fdc00 is written onto memory at 0x4800000, therefore the
> kernel panics when it goes back to access 'delayed_fput_list' later
> on in the initialisation process.
>
> On builds that were not crashing it was found that the compiler had
> placed 'delayed_fput_list' at 0x4800008, meaning it wasn't corrupted
> (but something else in memory was overwritten).
>
> As can be seen in the first function call above the code begins to
> allocate chunks of memory beginning from the symbol '__init_end'.
> The MIPS linker script (vmlinux.lds.S) however defines the .bss
> section to begin after '__init_end'. Therefore memory within the
> .bss section is allocated to the kernel to use (System.map shows
> 'delayed_fput_list' and other kernel structures to be in .bss).
>
> To stop the kernel panic (and the .bss section being corrupted)
> memory should begin being allocated from the symbol '_end'.
>
> Signed-off-by: Matt Bennett <matt.bennett@alliedtelesis.co.nz>


This is obviously correct.  I wonder how it was able to work for so long 
without failing for someone.

Acked-by: David Daney <david.daney@cavium.com>

It is probably suitable for stable as well.

David Daney


> ---
>   arch/mips/cavium-octeon/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> index 89a6284..bd63425 100644
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -933,7 +933,7 @@ void __init plat_mem_setup(void)
>   	while ((boot_mem_map.nr_map < BOOT_MEM_MAP_MAX)
>   		&& (total < MAX_MEMORY)) {
>   		memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
> -						__pa_symbol(&__init_end), -1,
> +						__pa_symbol(&_end), -1,
>   						0x100000,
>   						CVMX_BOOTMEM_FLAG_NO_LOCKING);
>   		if (memory >= 0) {
>
