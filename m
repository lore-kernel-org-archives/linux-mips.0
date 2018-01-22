Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:34936 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991068AbeAVQiAVoWOH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Jan 2018 17:38:00 +0100
Subject: Re: [PATCH 02/14] MIPS: memblock: Surely map BSS kernel memory
 section
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180117222312.14763-3-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <3fbb8850-bf34-d698-299a-f1cd62d063ae@mips.com>
Date: Mon, 22 Jan 2018 16:35:26 +0000
MIME-Version: 1.0
In-Reply-To: <20180117222312.14763-3-fancer.lancer@gmail.com>
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
Message-ID: <20180122163526.q_7F0Er7F4w7JjTO8V6Mo5xDl-ZYYsb_DwJX-xWSYmM@z>

Hi Serge,

On 17/01/18 22:23, Serge Semin wrote:
> The current MIPS code makes sure the kernel code/data/init
> sections are in the maps, but BSS should also be there.

Quite right - it should. But this was protected against by reserving all 
bootmem up to the _end symbol here:
http://elixir.free-electrons.com/linux/v4.15-rc8/source/arch/mips/kernel/setup.c#L388
Which you remove in the next patch in this series. I'm not sure it is 
worth disentangling the reserved_end stuff from the next patch to make 
this into a single logical change of reserving just .bss rather than 
everything below _end.

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

Thanks,
Matt

> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/kernel/setup.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 76e9e2075..0d21c9e04 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -845,6 +845,9 @@ static void __init arch_mem_init(char **cmdline_p)
>   	arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
>   			 PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
>   			 BOOT_MEM_INIT_RAM);
> +	arch_mem_addpart(PFN_DOWN(__pa_symbol(&__bss_start)) << PAGE_SHIFT,
> +			 PFN_UP(__pa_symbol(&__bss_stop)) << PAGE_SHIFT,
> +			 BOOT_MEM_RAM);
>   
>   	pr_info("Determined physical RAM map:\n");
>   	print_memory_map();
> 
