Received: from mail-pd0-f174.google.com ([209.85.192.174]:56798 "EHLO
        mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6859997AbaGBFUbuDSth convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 2 Jul 2014 07:20:31 +0200
Received: by mail-pd0-f174.google.com with SMTP id y10so11291615pdj.19
        for <linux-mips@linux-mips.org>; Tue, 01 Jul 2014 22:20:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Mike Turquette <mturquette@linaro.org>
In-Reply-To: <1404061055-89797-3-git-send-email-manuel.lauss@gmail.com>
References: <1404061055-89797-1-git-send-email-manuel.lauss@gmail.com>
 <1404061055-89797-3-git-send-email-manuel.lauss@gmail.com>
Message-ID: <20140702052012.23338.54536@quantum>
Subject: Re: [PATCH 2/2] MIPS: Alchemy: common clock framework integration
Date: Tue, 01 Jul 2014 22:20:12 -0700
Return-Path: <mturquette@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Manuel Lauss <manuel.lauss@gmail.com>, Linux-MIPS <linux-mips@linux-mips.org>
Cc: linux-kernel@vger.kernel.org
Message-ID: <20140702052012.MTDRvnbtXg0o2PtyImV0_AkxomuhJTYGwhQROgcT5Js@z>

Quoting Manuel Lauss (2014-06-29 09:57:35)
> Expose chip-internal configurable clocks to the common clk framework,
> and fix a few drivers to take advantage of it.

Thanks for the patch series! Both patches cover a lot of ground, but
I'll focus on #2. It would be best to split the driver changes out
separately. You can introduce the common clk changes but not compile
them in, then change the drivers, then add the logic to compile the new
common clock driver all as separate patches.

<snip>

> diff --git a/arch/mips/alchemy/common/Makefile b/arch/mips/alchemy/common/Makefile
> index cb83d8d..2e4d505 100644
> --- a/arch/mips/alchemy/common/Makefile
> +++ b/arch/mips/alchemy/common/Makefile
> @@ -5,7 +5,7 @@
>  # Makefile for the Alchemy Au1xx0 CPUs, generic files.
>  #
>  
> -obj-y += prom.o time.o clocks.o platform.o power.o setup.o \
> +obj-y += prom.o time.o clock.o platform.o power.o setup.o \
>         sleeper.o dma.o dbdma.o vss.o irq.o usb.o

As stated above, in the first patch only introduce
arch/mips/alchemy/common/clock, but don't compile it here in the
Makefile.

A quick glance through clock.c below looks pretty good. I'll go through
it in more detail once the other parts of the series are split out.

Additionally, it would be cool to push this driver out to drivers/clk/
if you are so inclined. It looks like your header dependencies are not
so bad as to make that task impossible. Just a suggestion from me.

Regards,
Mike
