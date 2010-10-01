Received: from mail-bw0-f49.google.com ([209.85.214.49]:61551 "EHLO
        mail-bw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491759Ab0JAHmt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 Oct 2010 09:42:49 +0200
Received: by bwz19 with SMTP id 19so2693116bwz.36
        for <linux-mips@linux-mips.org>; Fri, 01 Oct 2010 00:42:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F45880696056844FA6A73F415B568C69532DCF33BB@EXDCVYMBSTM006.EQ1STM.local>
References: <1285659648-21409-1-git-send-email-arun.murthy@stericsson.com>
        <1285659648-21409-2-git-send-email-arun.murthy@stericsson.com>
        <4CA1AD2B.8000905@metafoo.de>
        <F45880696056844FA6A73F415B568C69532DC2FB6B@EXDCVYMBSTM006.EQ1STM.local>
        <4CA1BC16.3020702@metafoo.de>
        <F45880696056844FA6A73F415B568C69532DC2FC60@EXDCVYMBSTM006.EQ1STM.local>
        <4CA25841.4090702@metafoo.de>
        <F45880696056844FA6A73F415B568C69532DC8B7E4@EXDCVYMBSTM006.EQ1STM.local>
        <AANLkTingb8ox5h5rN1YrxONibfrWLicoiS6yqKf_v5bJ@mail.gmail.com>
        <F45880696056844FA6A73F415B568C69532DCF32BC@EXDCVYMBSTM006.EQ1STM.local>
        <AANLkTikTo42Q5-yMEwyQH4mt=qLjaKrtJK3ydZNFyqai@mail.gmail.com>
        <F45880696056844FA6A73F415B568C69532DCF33BB@EXDCVYMBSTM006.EQ1STM.local>
Date: Fri, 1 Oct 2010 16:42:48 +0900
Message-ID: <AANLkTimPgPY9rX_MYZTv0PpRQgfWGoSeSE9WWy_ami-V@mail.gmail.com>
Subject: Re: [PATCH 1/7] pwm: Add pwm core driver
From: Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <jassisinghbrar@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Arun MURTHY <arun.murthy@stericsson.com>
Cc: Trilok Soni <soni.trilok@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Bill Gatliff <bgat@billgatliff.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Marek Vasut <marek.vasut@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, Mattias WALLIN <mattias.wallin@stericsson.com>, STEricsson_nomadik_linux <STEricsson_nomadik_linux@list.st.com>, "eric.y.miao@gmail.com" <eric.y.miao@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20101001074248.iuu1VirY3_UULQB-pP_tIQgwebc4N2eJAnT4cE8EHJY@z>

On Fri, Oct 1, 2010 at 4:25 PM, Arun MURTHY <arun.murthy@stericsson.com> wrote:
> You can have a look at the pwm_config_nosleep(),pwm_set_polarity(),
> pwm_synchronize(),pwm_unsynchronize(), pwm_set_handler() etc.
> These are not being used by the exsting pwm drivers except Atmel pwm.
How would your 'simple' driver handle Atmel then ?
What if future's SoCs start providing those 'advance' features like Atmel's ?

> I mean not the functions but the functionality.
> PWM is a simple device and most of its clients are controlling intensity
> of backlight, leds, vibrator etc.
> I don't think these complex functionality are required.
oh dear !
