Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:43337 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994577AbeBMLapz-uaI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 12:30:45 +0100
Subject: Re: [PATCH v2 03/15] MIPS: memblock: Reserve initrd memory in
 memblock
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-4-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <e8403d12-fc19-34ce-722b-1d060b384bf5@mips.com>
Date: Tue, 13 Feb 2018 11:22:37 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-4-fancer.lancer@gmail.com>
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
Message-ID: <20180213112237.5ba3bvBNJKDKAjTz4apYSBt-hSHjct7lrDyEQf1kIfA@z>



On 02/02/18 03:54, Serge Semin wrote:
> There is no reserve_bootmem() method in the nobootmem interface,
> so we need to replace it with memblock-specific one.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>


Looks good to me :-)

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

Thanks,
Matt

> ---
>   arch/mips/kernel/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index f502cd702fa7..a015cee353be 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -330,7 +330,7 @@ static void __init finalize_initrd(void)
>   
>   	maybe_bswap_initrd();
>   
> -	reserve_bootmem(__pa(initrd_start), size, BOOTMEM_DEFAULT);
> +	memblock_reserve(__pa(initrd_start), size);
>   	initrd_below_start_ok = 1;
>   
>   	pr_info("Initial ramdisk at: 0x%lx (%lu bytes)\n",
> 
