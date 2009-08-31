Received: from mail-fx0-f220.google.com ([209.85.220.220]:47372 "EHLO
	mail-fx0-f220.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492097AbZHaGb5 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 31 Aug 2009 08:31:57 +0200
MIME-Version: 1.0
In-Reply-To: <200908170028.27210.florian@openwrt.org>
References: <200908170028.27210.florian@openwrt.org>
Date: Mon, 31 Aug 2009 08:31:48 +0200
Message-ID: <f861ec6f0908302331p7f44a584pdae29cafce7ef950@mail.gmail.com>
Subject: Re: [PATCH 1/2] au1000: fix build failure for db1x00 configured for
	Au1100 SoC
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Florian Fainelli <florian@openwrt.org>
Message-ID: <20090831063148.rQWdF7mJBPECLeMmkxMR0lFFah9C3EO1JkSjhzrmkk4@z>

Hi Ralf,

Please add Florian's patch below to your patchqueue!

On Mon, Aug 17, 2009 at 12:28 AM, Florian Fainelli<florian@openwrt.org> wrote:
> Hi Ralf,
>
> This patch should apply to both -master and -queue. Thanks !
> --
> From: Florian Fainelli <florian@openwrt.org>
> Subject: [PATCH 1/2] au1000: fix build failure for db1x00 configured for Au1100 SoC
>
> This patch fixes the following warning, which becomes an error due to
> -Werror to be turned on:
>  CC      arch/mips/alchemy/common/gpiolib-au1000.o
> cc1: warnings being treated as errors
> arch/mips/alchemy/common/gpiolib-au1000.c: In function 'au1100_gpio2_to_irq':
> /home/florian/dev/kernel/linux-queue/arch/mips/include/asm/mach-au1x00/gpio-au1000.h:107: warning: control reaches end of non-void function
>
> Signed-off-by: Florian Fainelli <florian@openwrt.org>
> ---
> diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> index 127d4ed..4d54d40 100644
> --- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> +++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
> @@ -104,6 +104,8 @@ static inline int au1100_gpio2_to_irq(int gpio)
>
>        if ((gpio >= 8) && (gpio <= 15))
>                return MAKE_IRQ(0, 29);         /* shared GPIO208_215 */
> +
> +       return -ENXIO;
>  }
>
>  #ifdef CONFIG_SOC_AU1100


Thanks!

     Manuel Lauss
