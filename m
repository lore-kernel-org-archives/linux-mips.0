Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:41435 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994689AbeEaX2DH7W-B (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 Jun 2018 01:28:03 +0200
Date: Thu, 31 May 2018 16:27:53 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: pb44: Fix i2c-gpio GPIO descriptor table
Message-ID: <20180531232753.oerjviicedi2u25y@pburton-laptop>
References: <20180526171251.7653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180526171251.7653-1-linus.walleij@linaro.org>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Wolfram Sang <wsa@the-dreams.de>, Simon Guinot <simon.guinot@sequanux.org>
Message-ID: <20180531232753.Fma_zWVBQvy8hdt7h6vJKPnze3H7bfTFdehslf_-9m0@z>

Hi Linus,

On Sat, May 26, 2018 at 07:12:51PM +0200, Linus Walleij wrote:
> I used bad names in my clumsiness when rewriting many board
> files to use GPIO descriptors instead of platform data. A few
> had the platform_device ID set to -1 which would indeed give
> the device name "i2c-gpio".
> 
> But several had it set to >=0 which gives the names
> "i2c-gpio.0", "i2c-gpio.1" ...
> 
> Fix the one affected board in the MIPS tree. Sorry.

Reviewed-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

> Fixes: b2e63555592f ("i2c: gpio: Convert to use descriptors")
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> Reported-by: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Ralf can you please apply this for MIPS fixes?
> ---
>  arch/mips/ath79/mach-pb44.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ath79/mach-pb44.c b/arch/mips/ath79/mach-pb44.c
> index 6b2c6f3baefa..75fb96ca61db 100644
> --- a/arch/mips/ath79/mach-pb44.c
> +++ b/arch/mips/ath79/mach-pb44.c
> @@ -34,7 +34,7 @@
>  #define PB44_KEYS_DEBOUNCE_INTERVAL	(3 * PB44_KEYS_POLL_INTERVAL)
>  
>  static struct gpiod_lookup_table pb44_i2c_gpiod_table = {
> -	.dev_id = "i2c-gpio",
> +	.dev_id = "i2c-gpio.0",
>  	.table = {
>  		GPIO_LOOKUP_IDX("ath79-gpio", PB44_GPIO_I2C_SDA,
>  				NULL, 0, GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
> -- 
> 2.17.0
> 
> 
