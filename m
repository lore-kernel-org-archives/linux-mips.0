Received: from eu1sys200aog108.obsmtp.com ([207.126.144.125]:47225 "EHLO
        eu1sys200aog108.obsmtp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1490968Ab0JAD1v convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 1 Oct 2010 05:27:51 +0200
From: Arun MURTHY <arun.murthy@stericsson.com>
Date: Fri, 1 Oct 2010 05:25:54 +0200
Subject: RE: [PATCH 1/7] pwm: Add pwm core driver
Message-ID: <F45880696056844FA6A73F415B568C69532DCF32BC@EXDCVYMBSTM006.EQ1STM.local>
References: <1285659648-21409-1-git-send-email-arun.murthy@stericsson.com>
        <1285659648-21409-2-git-send-email-arun.murthy@stericsson.com>
        <4CA1AD2B.8000905@metafoo.de>
        <F45880696056844FA6A73F415B568C69532DC2FB6B@EXDCVYMBSTM006.EQ1STM.local>
        <4CA1BC16.3020702@metafoo.de>
        <F45880696056844FA6A73F415B568C69532DC2FC60@EXDCVYMBSTM006.EQ1STM.local>
        <4CA25841.4090702@metafoo.de>
        <F45880696056844FA6A73F415B568C69532DC8B7E4@EXDCVYMBSTM006.EQ1STM.local>
 <AANLkTingb8ox5h5rN1YrxONibfrWLicoiS6yqKf_v5bJ@mail.gmail.com>
In-Reply-To: <AANLkTingb8ox5h5rN1YrxONibfrWLicoiS6yqKf_v5bJ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <arun.murthy@stericsson.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Trilok Soni <soni.trilok@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "eric.y.miao@gmail.com" <eric.y.miao@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, Marek Vasut <marek.vasut@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Mattias WALLIN <mattias.wallin@stericsson.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, STEricsson_nomadik_linux <STEricsson_nomadik_linux@list.st.com>, Bill Gatliff <bgat@billgatliff.com>
Message-ID: <20101001032554.Dog1U_pRJCdbz2L6VHAdZdIV9gWqD1WRjBqtWXIxreM@z>

Hi Trilok,

> Hi Arun,
> 
> Adding Bill Gatliff (anyway, CC list already crowded)
> 
> On Wed, Sep 29, 2010 at 10:19 AM, Arun MURTHY
> <arun.murthy@stericsson.com> wrote:
> >> Arun MURTHY wrote:
> >> >>>> Shouldn't PWM_DEVICES select HAVE_PWM?
> >> >>>
> >> >>> No not required, the entire concept is to remove HAVE_PWM and
> use
> >> >> PWM_CORE.
> 
> There is already nice and clean framework written by Bill for PWM, if
> you grep the LKML and linux-embedded mailing list archive then you
> will get his patches, and it seems that he had promised to send the
> updated version few week back, but not heard from him (may be because
> he was travelling as per FB status).
> 
> Please evaluate that framework too.
> 
Thanks for this information, I did search in linux-embedded mailing list
archive. Below are my views on that patch set.
Many of the functions that has been defined in pwm core driver
written by Bill Gatliff is not being used by the most of the pwm drivers
except Atmel PWM driver. I rather felt the pwm core driver was an attempt
made to generalize the Atmel pwm driver.
And moreover this was posted long back somewhere in the beginning of this
year i.e Feb and the thread is dead thereafter.

This patch has been submitted focusing all the existing pwm drivers and
only these are the functions that are being used by pwm drivers.
This patch set also included patch to align all the existing pwm driver
with the pwm core driver.
So it is an attempt to generalize most of the pwm drivers and
conclude with a pwm core driver.

Thanks and Regards,
Arun R Murthy
-------------
