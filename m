Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:57844 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994586AbeBMOZaIDB8X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Feb 2018 15:25:30 +0100
Subject: Re: [PATCH v2 15/15] MIPS: memblock: Deactivate bootmem allocator
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180202035458.30456-1-fancer.lancer@gmail.com>
 <20180202035458.30456-16-fancer.lancer@gmail.com>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <eeb9647d-967b-d2b3-bd75-ba1ffc270d53@mips.com>
Date: Tue, 13 Feb 2018 14:18:18 +0000
MIME-Version: 1.0
In-Reply-To: <20180202035458.30456-16-fancer.lancer@gmail.com>
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
Message-ID: <20180213141818.KyP3ymUch3EwbMf-0wL-nArDjMmsQnudLEjRrjfoQPE@z>

Hi Serge,

On 02/02/18 03:54, Serge Semin wrote:
> Memblock allocator can be successfully used from now for early
> memory management
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 350a990fc719..434f756e03e9 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -4,7 +4,6 @@ config MIPS
>   	default y
>   	select ARCH_BINFMT_ELF_STATE
>   	select ARCH_CLOCKSOURCE_DATA
> -	select ARCH_DISCARD_MEMBLOCK
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_MIGHT_HAVE_PC_PARPORT
> @@ -57,6 +56,7 @@ config MIPS
>   	select HAVE_IRQ_TIME_ACCOUNTING
>   	select HAVE_KPROBES
>   	select HAVE_KRETPROBES
> +	select NO_BOOTMEM

Please maintain the alphabetical order in config MIPS. It makes 
conflicts easier to manage.

Thanks,
Matt

>   	select HAVE_MEMBLOCK
>   	select HAVE_MEMBLOCK_NODE_MAP
>   	select HAVE_MOD_ARCH_SPECIFIC
> 
