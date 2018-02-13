Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:58423 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994585AbeBMNxI4YJhV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 14:53:08 +0100
Subject: Re: [PATCH v2 07/15] MIPS: memblock: Reserve kdump/crash regions in
 memblock
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-8-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <7046eb2c-8d53-bac9-3dd5-0f35816dfe0e@mips.com>
Date: Tue, 13 Feb 2018 13:45:57 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-8-fancer.lancer@gmail.com>
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
Message-ID: <20180213134557.Rcbkc-zZB-VhVZFYDz1tnwyo5Y28MZqw2FQ5NWtU1Bc@z>

Hi Serge,

On 02/02/18 03:54, Serge Semin wrote:
> Kdump/crashkernel memory regions should be reserved in the
> memblock allocator so they wouldn't be occupied by any further
> allocations.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

This looks good to me

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

Thanks,
Matt

> ---
>   arch/mips/kernel/setup.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 72853e94c2c7..b2a5b89ae6b2 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -826,17 +826,15 @@ static void __init arch_mem_init(char **cmdline_p)
>   	if (setup_elfcorehdr && setup_elfcorehdr_size) {
>   		printk(KERN_INFO "kdump reserved memory at %lx-%lx\n",
>   		       setup_elfcorehdr, setup_elfcorehdr_size);
> -		reserve_bootmem(setup_elfcorehdr, setup_elfcorehdr_size,
> -				BOOTMEM_DEFAULT);
> +		memblock_reserve(setup_elfcorehdr, setup_elfcorehdr_size);
>   	}
>   #endif
>   
>   	mips_parse_crashkernel();
>   #ifdef CONFIG_KEXEC
>   	if (crashk_res.start != crashk_res.end)
> -		reserve_bootmem(crashk_res.start,
> -				crashk_res.end - crashk_res.start + 1,
> -				BOOTMEM_DEFAULT);
> +		memblock_reserve(crashk_res.start,
> +				 crashk_res.end - crashk_res.start + 1);
>   #endif
>   	device_tree_init();
>   	sparse_init();
> 
