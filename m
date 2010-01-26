Received: from gv-out-0910.google.com ([216.239.58.186]:39553 "EHLO
        gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493360Ab0AZP3B convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Jan 2010 16:29:01 +0100
MIME-Version: 1.0
In-Reply-To: <8c337354c30ac911207df81abd13197c897b2380.1264517495.git.wuzhangjin@gmail.com>
References: <8c337354c30ac911207df81abd13197c897b2380.1264517495.git.wuzhangjin@gmail.com>
Date: Tue, 26 Jan 2010 16:28:59 +0100
Message-ID: <f861ec6f1001260728x64c54ec7m65bc6ebc0ee64a80@mail.gmail.com>
Subject: Re: [PATCH -queue v2] MIPS: Cleanup the debugging of compressed
        kernel support
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100126152859.U0l98dmNQPVi_KddkOiqC4ojrQrEmSiW3QPEZk4-_o4@z>

Hi,

On Tue, Jan 26, 2010 at 4:02 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> Changes from v1 (feedbacks from Ralf):
>
>  o make DEBUG_ZBOOT also depend on DEBUG_KERNEL
>
>  o DEBUG_ZBOOT already depends on SYS_SUPPORTS_ZBOOT_UART16550 so simplify the

Not every chip has a standard 16550, unfortunately.  I liked your
first iteration better:
DEBUG_ZBOOT visible at all times (or depend on DEBUG_KERNEL)  another
(invisible)
config symbol selecting the code to build (i.e. SYS_SUPPORTS_ZBOOT_UART16550
for your loongson boxes, MACH_ALCHEMY for alchemy, and nothing for unsupported
chips).


>  obj-$(CONFIG_DEBUG_ZBOOT_UART16550) into just obj-$(CONFIG_DEBUG_ZBOOT) and
>  no ifdef.

The last hunk does something else:

> -obj-$(CONFIG_SYS_SUPPORTS_ZBOOT_UART16550) += $(obj)/uart-16550.o
> +obj-$(CONFIG_SYS_SUPPORTS_ZBOOT) += $(obj)/uart-16550.o

Manuel
