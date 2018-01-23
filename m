Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:53846 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991534AbeAWN6XLcM4j (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 Jan 2018 14:58:23 +0100
Subject: Re: [PATCH v2] MIPS: fix incorrect mem=X@Y handling
References: <1504609608-7694-1-git-send-email-marcin.nowakowski@imgtec.com>
 <20171221210100.12002-1-malat@debian.org>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <9e00cd68-ff9a-37e1-3e38-f0e58ae4a400@mips.com>
Date: Tue, 23 Jan 2018 13:58:06 +0000
MIME-Version: 1.0
In-Reply-To: <20171221210100.12002-1-malat@debian.org>
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
To: Mathieu Malaterre <malat@debian.org>, James Hogan <jhogan@kernel.org>
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>, "# v4 . 11" <stable@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180123135806.G2TX2_h2_Ik21XmdRDAgexxOvQeweetz8Q4B1scWsnM@z>

Hi

On 21/12/17 21:00, Mathieu Malaterre wrote:
> From: Marcin Nowakowski <marcin.nowakowski@mips.com>
> 
> Change 73fbc1eba7ff added a fix to ensure that the memory range between
> PHYS_OFFSET and low memory address specified by mem= cmdline argument is
> not later processed by free_all_bootmem.
> This change was incorrect for systems where the commandline specifies
> more than 1 mem argument, as it will cause all memory between
> PHYS_OFFSET and each of the memory offsets to be marked as reserved,
> which results in parts of the RAM marked as reserved (Creator CI20's
> u-boot has a default commandline argument 'mem=256M@0x0
> mem=768M@0x30000000').
> 
> Change the behaviour to ensure that only the range between PHYS_OFFSET
> and the lowest start address of the memories is marked as protected.
> 
> This change also ensures that the range is marked protected even if it's
> only defined through the devicetree and not only via commandline
> arguments.
> 
> Reported-by: Mathieu Malaterre <mathieu.malaterre@gmail.com>
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@mips.com>
> Fixes: 73fbc1eba7ff ("MIPS: fix mem=X@Y commandline processing")
> Cc: <stable@vger.kernel.org> # v4.11

Tested on:
Creator Ci20
Creator Ci40
MIPS Boston
UTM8 (Cavium Octeon III)

It certainly fixes the ci20 when it's factory default command line args 
of "mem=256M@0x0 mem=768M@0x30000000" are passed. Though those arguments 
appear redundant since without them both memory regions are detected 
through device tree instead, and there is no problem.

Tested-by: Matt Redfearn <matt.redfearn@mips.com>


> ---
> v2: Use updated email adress, add tag for stable.
>   arch/mips/kernel/setup.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 702c678de116..f19d61224c71 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -375,6 +375,7 @@ static void __init bootmem_init(void)
>   	unsigned long reserved_end;
>   	unsigned long mapstart = ~0UL;
>   	unsigned long bootmap_size;
> +	phys_addr_t ramstart = ~0UL;
>   	bool bootmap_valid = false;
>   	int i;
>   
> @@ -395,6 +396,21 @@ static void __init bootmem_init(void)
>   	max_low_pfn = 0;
>   
>   	/*
> +	 * Reserve any memory between the start of RAM and PHYS_OFFSET
> +	 */
> +	for (i = 0; i < boot_mem_map.nr_map; i++) {
> +		if (boot_mem_map.map[i].type != BOOT_MEM_RAM)
> +			continue;
> +
> +		ramstart = min(ramstart, boot_mem_map.map[i].addr);
> +	}
> +
> +	if (ramstart > PHYS_OFFSET)
> +		add_memory_region(PHYS_OFFSET, ramstart - PHYS_OFFSET,
> +				  BOOT_MEM_RESERVED);
> +
> +
> +	/*
>   	 * Find the highest page frame number we have available.
>   	 */
>   	for (i = 0; i < boot_mem_map.nr_map; i++) {
> @@ -664,9 +680,6 @@ static int __init early_parse_mem(char *p)
>   
>   	add_memory_region(start, size, BOOT_MEM_RAM);
>   
> -	if (start && start > PHYS_OFFSET)
> -		add_memory_region(PHYS_OFFSET, start - PHYS_OFFSET,
> -				BOOT_MEM_RESERVED);
>   	return 0;
>   }
>   early_param("mem", early_parse_mem);
> 
