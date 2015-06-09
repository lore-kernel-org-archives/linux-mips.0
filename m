Received: from mail1.windriver.com ([147.11.146.13]:48172 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008460AbbFIXP5fpz6H (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Jun 2015 01:15:57 +0200
Date: Tue, 9 Jun 2015 19:15:28 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 3/4] mips: make loongsoon serial driver explicitly modular
Message-ID: <20150609231528.GQ7125@windriver.com>
References: <1433276168-21550-1-git-send-email-paul.gortmaker@windriver.com>
 <1433276168-21550-4-git-send-email-paul.gortmaker@windriver.com>
 <20150609073533.GB2753@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20150609073533.GB2753@linux-mips.org>
Return-Path: <Paul.Gortmaker@windriver.com>
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
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Huacai Chen <chenhc@lemote.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
Message-ID: <20150609231528.ph2P8ybMSP2qMlJPd-SatqvKBCkWmXAXkT6ltYCN97Y@z>

[Re: [PATCH 3/4] mips: make loongsoon serial driver explicitly modular] On 09/06/2015 (Tue 09:35) Ralf Baechle wrote:

> On Tue, Jun 02, 2015 at 04:16:07PM -0400, Paul Gortmaker wrote:
> 
> Ccing a few people with interest in Loongson stuff.
> 
> > The file looks as if it is non-modular, but it piggy-backs
> > off CONFIG_SERIAL_8250 which is tristate.  If set to "=m"
> > we will get this after the init/module header cleanup:
> > 
> > arch/mips/loongson/common/serial.c:76:1: error: data definition has no type or storage class [-Werror]
> > arch/mips/loongson/common/serial.c:76:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
> > arch/mips/loongson/common/serial.c:76:1: error: parameter names (without types) in function declaration [-Werror]
> > arch/mips/loongson/common/serial.c:58:19: error: 'serial_init' defined but not used [-Werror=unused-function]
> > cc1: all warnings being treated as errors
> > make[3]: *** [arch/mips/loongson/common/serial.o] Error 1
> > 
> > Make it clearly modular, and add a module_exit function,
> > so that we avoid the above breakage.
> 
> Following up on our IRC discussion - your commit would result in
> platform device registrations from module code which opens another can
> of worms.  This and the whole philosophy of platforms devices to show
> what devices do exist in a system, not which drivers are configured.
> So just always build serial.c into the kernel.
> 
> A related issue is uart_base.o which I think is required to register
> properly initialized platform devices.  It depends on
> CONFIG_LOONGSON_UART_BASE but probably should also be put into the
> kernel whenever we register the UART platform devices and that's
> always.
> 
>   Ralf
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

I've dropped my change in favour of this one, and crafted up a commit
log from this e-mail exchange as follows:

https://git.kernel.org/cgit/linux/kernel/git/paulg/linux.git/commit/?h=init-v4.1-rc6&id=5eee56adcce9b0baf2da55c0bff88eb0f1c0eb61

Assuming nobody else has an issue with it, then we should be done here
(i.e. it doesn't even need to be in mips-next; it just needs to be here
in this series so we don't get bisect fails introduced.)

Thanks,
Paul.
--

> 
> diff --git a/arch/mips/loongson/common/Makefile b/arch/mips/loongson/common/Makefile
> index e70c33f..f2e8153 100644
> --- a/arch/mips/loongson/common/Makefile
> +++ b/arch/mips/loongson/common/Makefile
> @@ -3,15 +3,13 @@
>  #
>  
>  obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
> -    bonito-irq.o mem.o machtype.o platform.o
> +    bonito-irq.o mem.o machtype.o platform.o serial.o
>  obj-$(CONFIG_PCI) += pci.o
>  
>  #
>  # Serial port support
>  #
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> -loongson-serial-$(CONFIG_SERIAL_8250) := serial.o
> -obj-y += $(loongson-serial-m) $(loongson-serial-y)
>  obj-$(CONFIG_LOONGSON_UART_BASE) += uart_base.o
>  obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
>  
