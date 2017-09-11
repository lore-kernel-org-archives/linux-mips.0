Received: from mail-it0-x235.google.com ([IPv6:2607:f8b0:4001:c0b::235]:43406
        "EHLO mail-it0-x235.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994876AbdIKUxWuDSHd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Sep 2017 22:53:22 +0200
Received: by mail-it0-x235.google.com with SMTP id g142so13356688ita.0
        for <linux-mips@linux-mips.org>; Mon, 11 Sep 2017 13:53:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXabvax2Wru8j+MC4X5F+z5hoUo1tEbX+zn2AUW6QENVA@mail.gmail.com>
References: <20170910214424.14945-1-linus.walleij@linaro.org>
 <20170910214424.14945-2-linus.walleij@linaro.org> <CAMuHMdXabvax2Wru8j+MC4X5F+z5hoUo1tEbX+zn2AUW6QENVA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2017 22:53:14 +0200
Message-ID: <CACRpkdYePt_reWhVUDR9XZoR_Agscr8T9cEXk7XMpn9umO8yCg@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: gpio: Convert to use descriptors
Content-Type: text/plain; charset="UTF-8"
Return-Path: <linus.walleij@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Steven Miao <realmz6@gmail.com>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Ralf Baechle <ralf@linux-mips.org>, "arm@kernel.org" <arm@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20170911205314.yLGfCzSYr1G07xe1hqGdWH4GBVArnA3sBOrVp4kxyws@z>

On Mon, Sep 11, 2017 at 1:27 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> FYI, I recently posted a series to deprecate (at least for DT) this error
> prone indexing, in favor of using named GPIOs:
>
>     [PATCH/RFC 0/3] i2c: gpio: Add support for named gpios in DT
>     http://www.spinics.net/lists/devicetree/msg191936.html

Grrr I seem to have fallen off the list and don't have these mails
in my inbox ....

Anyways [1/3]:

>  Required properties:
>   - compatible = "i2c-gpio";
> - - gpios: sda and scl gpio
> -
> + - sda-gpios: gpio used for the sda signal
> + - scl-gpios: gpio used for the scl signal
> + - gpios: sda and scl gpio, alternative for {sda,scl}-gpios (deprecated)

Say that the GPIOs should *always* be flagged as open drain
using e.g. (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN) as flags.

>  Optional properties:
>   - i2c-gpio,sda-open-drain: sda as open drain

These should be deprecated. Nobody understands what they mean
anyway, but they mean "I set this line up as open drain behind your
back so don't try to do open drain emulation on me", which is just
totally convoluted.

The GPIO subsystems has ways to indicate this directly to the driver
nowadays.

Add an example?

Patch [2/3]: needs to be rewritten on top of the descriptor code.
(I can do it if you like.)

Patch [3/3] should be:

+ sda-gpios = <&pfc 208 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+ scl-gpios = <&pfc 91 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

Yours,
Linus Walleij
