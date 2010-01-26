Received: from mail-px0-f181.google.com ([209.85.216.181]:61786 "EHLO
        mail-px0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493366Ab0AZQHY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Jan 2010 17:07:24 +0100
Subject: Re: [PATCH -queue v2] MIPS: Cleanup the debugging of compressed
 kernel support
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
In-Reply-To: <1264521494.24895.28.camel@falcon>
References: <8c337354c30ac911207df81abd13197c897b2380.1264517495.git.wuzhangjin@gmail.com>
         <f861ec6f1001260728x64c54ec7m65bc6ebc0ee64a80@mail.gmail.com>
         <1264521494.24895.28.camel@falcon>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Jan 2010 00:01:19 +0800
Message-ID: <1264521679.24895.30.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100126160119.EClooXhvk_91VB5bLto1ZP4fGKPx_ISh5u0-zLwEuUo@z>

On Tue, 2010-01-26 at 23:58 +0800, Wu Zhangjin wrote:
> On Tue, 2010-01-26 at 16:28 +0100, Manuel Lauss wrote:
> > Hi,
> > 
> > On Tue, Jan 26, 2010 at 4:02 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> > > Changes from v1 (feedbacks from Ralf):
> > >
> > >  o make DEBUG_ZBOOT also depend on DEBUG_KERNEL
> > >
> > >  o DEBUG_ZBOOT already depends on SYS_SUPPORTS_ZBOOT_UART16550 so simplify the
> > 
> > Not every chip has a standard 16550, unfortunately.  I liked your
> > first iteration better:
> > DEBUG_ZBOOT visible at all times (or depend on DEBUG_KERNEL)  another
> > (invisible)
> > config symbol selecting the code to build (i.e. SYS_SUPPORTS_ZBOOT_UART16550
> > for your loongson boxes, MACH_ALCHEMY for alchemy, and nothing for unsupported
> > chips).
> > 
> 
> Yes, It will be not convenient for a new serial port debugging support
> with the current modification, for example, if you add UARTXXXX, we need
> to select it for the new board and also add it under the "depends" of
> DEBUG_ZBOOT. how about this?
> 
> diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
> index 5e556f7..6fccbf0 100644
> --- a/arch/mips/Kconfig.debug
> +++ b/arch/mips/Kconfig.debug
> @@ -104,7 +104,7 @@ config RUNTIME_DEBUG
>  
>  config DEBUG_ZBOOT
>         bool "Enable compressed kernel support debugging"
> -       depends on DEBUG_KERNEL && SYS_SUPPORTS_ZBOOT_UART16550
> +       depends on DEBUG_KERNEL
> 

oh, no, this dependency is also needed: SYS_SUPPORTS_ZBOOT, so, it
should be:

depends on DEBUG_KERNEL && SYS_SUPPORTS_ZBOOT

> and we keep the old:
> 
> ifdef CONFIG_DEBUG_ZBOOT
> obj-$(CONFIG_SYS_SUPPORTS_ZBOOT_UART16550) += $(obj)/uart-16550.o
> endif
> 
> If a new serial port is needed, we just need to add the following lines
> to arch/mips/Kconfig
> 
> config SYS_SUPPORTS_ZBOOT_UARTXXX
> 	bool
> 	select SYS_SUPPORTS_ZBOOT
> 
> config MACH_XXXX
> 	[...]
> 	select SYS_SUPPORTS_ZBOOT_UARTXXX
> 	[...]
> 
> and in arch/mips/boot/compressed/Makfefile
> 
> ifdef CONFIG_DEBUG_ZBOOT
> obj-$(CONFIG_SYS_SUPPORTS_ZBOOT_UART16550) += $(obj)/uart-16550.o
> +obj-$(CONFIG_SYS_SUPPORTS_ZBOOT_UARTXXX) += $(obj)/uart-xxx.o
> endif
> 
> and also a new arch/mips/boot/compressed/uar-xxx.c is needed.
> 
> If this is okay, I will send a new revision asap.
> 
> Regards,
> 	Wu Zhangjin
