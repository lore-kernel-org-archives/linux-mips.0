Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:43696 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994554AbeBMN5XiykPV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 14:57:23 +0100
Subject: Re: [PATCH v2 08/15] MIPS: memblock: Mark present sparsemem sections
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-9-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <2e6f3afd-6413-2fc7-4c23-a272cb9e19ff@mips.com>
Date: Tue, 13 Feb 2018 13:50:14 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-9-fancer.lancer@gmail.com>
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
Message-ID: <20180213135014.02neOG7UJajBbt0LLBobaoBzzfE1cPSAf2cnRhthRG4@z>

Hi Serge,


On 02/02/18 03:54, Serge Semin wrote:
> If sparsemem is activated all sections with present pages must
> be accordingly marked after memblock is fully initialized.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/kernel/setup.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index b2a5b89ae6b2..54302319ce1c 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -837,6 +837,11 @@ static void __init arch_mem_init(char **cmdline_p)
>   				 crashk_res.end - crashk_res.start + 1);
>   #endif
>   	device_tree_init();
> +#ifdef CONFIG_SPARSEMEM
> +	for_each_memblock(memory, reg)
> +		memory_present(0, memblock_region_memory_base_pfn(reg),
> +				memblock_region_memory_end_pfn(reg));
> +#endif /* CONFIG_SPARSEMEM */


Existing code calls memory_present without CONFIG_SPARSEMEM, is it 
really conditional on SPARSEMEM?

Thanks,
Matt

>   	sparse_init();
>   	plat_swiotlb_setup();
>   
> 
