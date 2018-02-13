Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:38913 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994584AbeBMODVfsQ7V (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 15:03:21 +0100
Subject: Re: [PATCH v2 10/15] MIPS: memblock: Allow memblock regions resize
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-11-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <8a5a46fd-c103-ea78-88f9-35b1dcf6d181@mips.com>
Date: Tue, 13 Feb 2018 13:55:29 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-11-fancer.lancer@gmail.com>
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
Message-ID: <20180213135529.h1I81JHDV1wa8gZjy9Ovtdls6QCsX_OLGHRElHnqr1k@z>

Hi Serge,

On 02/02/18 03:54, Serge Semin wrote:
> When all the main reservations are done the memblock regions
> can be dynamically resized. Additionally it would be useful to have
> memblock regions dumped on debug at this point.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Looks good to me.

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

Thanks,
Matt

> ---
>   arch/mips/kernel/setup.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 158a52c17e29..531a1471a2a4 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -846,6 +846,10 @@ static void __init arch_mem_init(char **cmdline_p)
>   	plat_swiotlb_setup();
>   
>   	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
> +
> +	memblock_allow_resize();
> +
> +	memblock_dump_all();
>   }
>   
>   static void __init resource_init(void)
> 
