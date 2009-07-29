Received: from mail-fx0-f220.google.com ([209.85.220.220]:42134 "EHLO
	mail-fx0-f220.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492094AbZG2HP5 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 29 Jul 2009 09:15:57 +0200
MIME-Version: 1.0
In-Reply-To: <200907282300.14118.florian@openwrt.org>
References: <200907282300.14118.florian@openwrt.org>
Date: Wed, 29 Jul 2009 09:15:52 +0200
Message-ID: <f861ec6f0907290015v34d277beh18efed6aac10aa79@mail.gmail.com>
Subject: Re: [PATCH 1/4] alchemy: register au1000_eth as a platform driver
	part one
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Florian Fainelli <florian@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20090729071552.atE9SUeCJ2Pic8DzzWAVHvNR19SKchxA3lxlECefqP8@z>

Hi Florian,

On Tue, Jul 28, 2009 at 11:00 PM, Florian Fainelli<florian@openwrt.org> wrote:
> --- a/arch/mips/alchemy/common/platform.c
> +++ b/arch/mips/alchemy/common/platform.c
> @@ -331,6 +331,61 @@ static struct platform_device pbdb_smbus_device = {
>  };
>  #endif
>
> +/* All Alchemy board have at least one Ethernet MAC */

Au1200/1300 don't have a MAC (unfortunately, IMO).


>  static int __init au1xxx_platform_init(void)
>  {
>        unsigned int uartclk = get_au1x00_uart_baud_base() * 16;
> -       int i;
> +       int i, ni;
>
>        /* Fill up uartclk. */
>        for (i = 0; au1x00_uart_data[i].flags; i++)
>                au1x00_uart_data[i].uartclk = uartclk;
>
> +       /* Register second MAC if enabled in pinfunc */
> +#ifndef CONFIG_SOC_AU1100
> +        ni = (int)((au_readl(SYS_PINFUNC) & (u32)(SYS_PF_NI2)) >> 4);
> +        if (!(ni + 1))
> +               platform_device_register(&au1xxx_eth1_device);
> +#endif
> +

This won't work on Au1200/Au1300 since their SYS_PINFUNC register
has a different bit layout.


And you already know that I'm not very fond of alchemy/common/platform.c ;-)
I still think you should add appropriate MAC platform information to the boards
which actually use it.

Manuel Lauss
