Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:41032 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992043AbcIZUlCUn3M7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Sep 2016 22:41:02 +0200
Date: Mon, 26 Sep 2016 23:41:01 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v2] MIPS: Octeon: mark GPIO controller node not populated
 after IRQ init.
Message-ID: <20160926204101.GB19498@raspberrypi.musicnaut.iki.fi>
References: <57C0922C.40907@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57C0922C.40907@cavium.com>
Return-Path: <aaro.koskinen@iki.fi>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <20160926204101.YhHN03v6DDbOoBZNZldRo63V0mkfZ2iw6onYpU_vl_w@z>

Hi,

On Fri, Aug 26, 2016 at 02:02:04PM -0500, Steven J. Hill wrote:
> We clear the OF_POPULATED flag for the GPIO controller node on Octeon
> processors. Otherwise, none of the devices hanging on the GPIO lines
> are probed. The 'gpio-leds' driver on OCTEON failed to probe in addition
> to other devices on Cavium 71xx and 78xx development boards.
> 
> Fixes: 15cc2ed6dcf9 ("of/irq: Mark initialised interrupt controllers as populated")
> Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Ralf, I think this patch should be still included in v4.8 final.

Thanks,

A.

> ---
>  arch/mips/cavium-octeon/octeon-irq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index 5a9b87b..c1eb1ff 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1619,6 +1619,12 @@ static int __init octeon_irq_init_gpio(
>  		return -ENOMEM;
>  	}
> 
> +	/*
> +	 * Clear the OF_POPULATED flag that was set by of_irq_init()
> +	 * so that all GPIO devices will be probed.
> +	 */
> +	of_node_clear_flag(gpio_node, OF_POPULATED);
> +
>  	return 0;
>  }
>  /*
> -- 
> 1.9.1
> 
> 
