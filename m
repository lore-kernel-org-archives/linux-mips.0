Received: from mail-yw0-f182.google.com ([209.85.211.182]:35859 "EHLO
        mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493394Ab0AZSM7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Jan 2010 19:12:59 +0100
Subject: Re: [PATCH -queue v3] MIPS: Cleanup the debugging of compressed
 kernel support
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
In-Reply-To: <f861ec6f1001261007k4f71244fqcc92e2b6b1c9234c@mail.gmail.com>
References: <cf2781a56090637044a5ad3837caef468a674ee4.1264524254.git.wuzhangjin@gmail.com>
         <f861ec6f1001261007k4f71244fqcc92e2b6b1c9234c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Jan 2010 02:06:48 +0800
Message-ID: <1264529208.11605.3.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100126180648.3AOrlC1byr-FmXrs4OqiE3KpcPRVceVeAKd9wTJv1sA@z>

On Tue, 2010-01-26 at 19:07 +0100, Manuel Lauss wrote:
> Hi!
> 
> On Tue, Jan 26, 2010 at 6:01 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> > From: Wu Zhangjin <wuzhangjin@gmail.com>
> >
> > --- a/arch/mips/boot/compressed/Makefile
> > +++ b/arch/mips/boot/compressed/Makefile
> > @@ -32,7 +32,9 @@ KBUILD_AFLAGS := $(LINUXINCLUDE) $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
> >
> >  obj-y := $(obj)/head.o $(obj)/decompress.o $(obj)/dbg.o
> >
> > +ifdef DEBUG_ZBOOT
> 
> The above doesn't work in my testing, but this does:
> ifeq ($(CONFIG_DEBUG_ZBOOT),y)

oh, my god, I have forgotten the prefix CONFIG_, perhaps Ralf will help to fix it ;)

it should be:

ifdef CONFIG_DEBUG_ZBOOT
...
endif

of course, your ifeq version also works ;)

Thanks & Regards!
	Wu Zhangjin
