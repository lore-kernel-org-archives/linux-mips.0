Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:45983 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990406AbeAXGO5bmB10 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 07:14:57 +0100
Subject: Re: [PATCH 07/14] MIPS: memblock: Mark present sparsemem sections
References: <20180117222312.14763-1-fancer.lancer@gmail.com>
 <20180117222312.14763-8-fancer.lancer@gmail.com>
From: Marcin Nowakowski <marcin.nowakowski@mips.com>
Message-ID: <7246ebaa-0ffa-f012-c18e-269b1e0130e6@mips.com>
Date: Wed, 24 Jan 2018 07:13:03 +0100
MIME-Version: 1.0
In-Reply-To: <20180117222312.14763-8-fancer.lancer@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@mips.com>
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
Cc: alexander.sverdlin@nokia.com, matt.redfearn@mips.com, kumba@gentoo.org, James.hogan@mips.com, Peter.Wotton@mips.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180124061303.tS3O1OPjuRQs9bV_JOzyzPoLXLVXKHEvmxWVkKRtbiE@z>

Hi Serge,

On 17.01.2018 23:23, Serge Semin wrote:
> If sparsemem is activated all sections with present pages must
> be accordingly marked after memblock is fully initialized.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/kernel/setup.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index b121fa702..6df1eaf38 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -778,7 +778,7 @@ static void __init request_crashkernel(struct resource *res)
>   
>   static void __init arch_mem_init(char **cmdline_p)
>   {
> -	struct memblock_region *reg;
> +	struct memblock_region *reg __maybe_unused;

nit: reg is used here. It becomes __maybe_unused in patch 8.


Marcin
