Received: from gv-out-0910.google.com ([216.239.58.187]:63164 "EHLO
        gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493394Ab0AZSHX convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Jan 2010 19:07:23 +0100
MIME-Version: 1.0
In-Reply-To: <cf2781a56090637044a5ad3837caef468a674ee4.1264524254.git.wuzhangjin@gmail.com>
References: <cf2781a56090637044a5ad3837caef468a674ee4.1264524254.git.wuzhangjin@gmail.com>
Date: Tue, 26 Jan 2010 19:07:22 +0100
Message-ID: <f861ec6f1001261007k4f71244fqcc92e2b6b1c9234c@mail.gmail.com>
Subject: Re: [PATCH -queue v3] MIPS: Cleanup the debugging of compressed
        kernel support
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100126180722.tPJNjFbPycCSzVA2GEUS2nFKdqA4TdNd8suHci_gV28@z>

Hi!

On Tue, Jan 26, 2010 at 6:01 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> From: Wu Zhangjin <wuzhangjin@gmail.com>
>
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -32,7 +32,9 @@ KBUILD_AFLAGS := $(LINUXINCLUDE) $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
>
>  obj-y := $(obj)/head.o $(obj)/decompress.o $(obj)/dbg.o
>
> +ifdef DEBUG_ZBOOT

The above doesn't work in my testing, but this does:
ifeq ($(CONFIG_DEBUG_ZBOOT),y)

>  obj-$(CONFIG_SYS_SUPPORTS_ZBOOT_UART16550) += $(obj)/uart-16550.o
> +endif


Manuel
