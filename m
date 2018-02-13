Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:43686 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992821AbeBMLaRkrOaI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 12:30:17 +0100
Subject: Re: [PATCH v2 02/15] MIPS: memblock: Surely map BSS kernel memory
 section
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-3-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <aa201bf9-2901-d5d9-64c7-835c444a980e@mips.com>
Date: Tue, 13 Feb 2018 11:22:13 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-3-fancer.lancer@gmail.com>
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
Message-ID: <20180213112213.y0a9dq98UiV0tsyZlNk2sWraiaFFkWNno_AdVpUK6HA@z>



On 02/02/18 03:54, Serge Semin wrote:
> The current MIPS code makes sure the kernel code/data/init
> sections are in the maps, but BSS should also be there.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Looks good to me :-)

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

Thanks,
Matt

> ---
>   arch/mips/kernel/setup.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 1a4d64410303..f502cd702fa7 100644
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
