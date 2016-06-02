Received: from mailapp01.imgtec.com ([195.59.15.196]:59515 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27030556AbcFBJPUU4n4u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Jun 2016 11:15:20 +0200
Subject: Re: [PATCH] MIPS: pic32mzda: fix linker error for pic32_get_pbclk().
References: <1464844821-1581-1-git-send-email-purna.mandal@microchip.com>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <9f53c6f4-735a-1a76-9c62-a4f5f127b1e9@imgtec.com>
Date: Thu, 2 Jun 2016 10:15:13 +0100
MIME-Version: 1.0
In-Reply-To: <1464844821-1581-1-git-send-email-purna.mandal@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Purna Chandra Mandal <purna.mandal@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Joshua Henderson <digitalpeer@digitalpeer.com>, Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <20160602091513.zNbl3zTwvcnfUsdZ0Ox7yPSgeNg0xfk-ovqz3W2jnfg@z>

Hi Purna,

On 02/06/16 06:20, Purna Chandra Mandal wrote:
> Early clock API pic32_get_pbclk() is defined in early_clk.c and
> used by time.c and early_console.c. When CONFIG_EARLY_PRINTK isn't
> set, early_clk.c isn't compiled and so a linker error is reported
> while referring the API from time.c.

Maybe "early_clk.c isn't compiled and so time.c fails to link"?

>
> Fix it by compiling early_clk.c always. Also sort files in
> alphabetical order.
>
> Cc: Harvey Hunt <harvey.hunt@imgtec.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Cc: Joshua Henderson <digitalpeer@digitalpeer.com>
>
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
>
> ---
>
>  arch/mips/pic32/pic32mzda/Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/pic32/pic32mzda/Makefile b/arch/mips/pic32/pic32mzda/Makefile
> index 4a4c272..c286496 100644
> --- a/arch/mips/pic32/pic32mzda/Makefile
> +++ b/arch/mips/pic32/pic32mzda/Makefile
> @@ -2,8 +2,7 @@
>  # Joshua Henderson, <joshua.henderson@microchip.com>
>  # Copyright (C) 2015 Microchip Technology, Inc.  All rights reserved.
>  #
> -obj-y			:= init.o time.o config.o
> +obj-y			:= config.o early_clk.o init.o time.o
>
>  obj-$(CONFIG_EARLY_PRINTK)	+= early_console.o      \
> -				   early_pin.o		\
> -				   early_clk.o
> +				   early_pin.o
>

Perhaps add:

Reported-by: Harvey Hunt <harvey.hunt@imgtec.com>

Thanks for fixing this,

Reviewed-by: Harvey Hunt <harvey.hunt@imgtec.com>

Thanks,

Harvey
