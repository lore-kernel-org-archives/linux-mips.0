Received: from mail-bn3nam01on0088.outbound.protection.outlook.com ([104.47.33.88]:19728
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992250AbcHYWVImsJuv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 26 Aug 2016 00:21:08 +0200
Message-ID: <57BF6F47.4030803@caviumnetworks.com>
Date: Thu, 25 Aug 2016 15:20:55 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Octeon: mark GPIO controller node not populated
 IRQ, init.
References: <422712ab-4b0d-2b6d-4600-b917c2d327a9@cavium.com>
In-Reply-To: <422712ab-4b0d-2b6d-4600-b917c2d327a9@cavium.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <steven.hill@cavium.com>, Rob Herring <robh@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, devicetree@vger.kernel.org
Message-ID: <20160825222055.mSGP8PTciAGe_0PtDVmmEKX8qn6aaRYZQ_TLwv2m6hg@z>

On 08/25/2016 02:22 PM, Steven J. Hill wrote:
> We clear the OF_POPULATED flag for the GPIO controller node, otherwise
> the GPIO lines used by the MMC driver are never probed.
>
> Fixes: 15cc2ed6dcf9 ("of/irq: Mark initialised interrupt controllers as populated")
> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
> ---
>   arch/mips/cavium-octeon/octeon-irq.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index 5a9b87b..41d12d4 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1619,6 +1619,13 @@ static int __init octeon_irq_init_gpio(
>   		return -ENOMEM;
>   	}
>
> +	/*
> +	 * Clear the OF_POPULATED flag that was set above for the

Can we s/above/in of_irq_init()/ to be less ambiguous?


> +	 * GPIO controller so that the lines used by the MMC driver

I suspect that it is not just MMC that was broken by commit 
15cc2ed6dcf9.  Can we get a real description of exactly which kernel 
facilities are impacted?  Is it all GPIO, or what?

> +	 * will not be skipped.
> +	 */
> +	of_node_clear_flag(gpio_node, OF_POPULATED);
> +
>   	return 0;
>   }
>   /*
>
