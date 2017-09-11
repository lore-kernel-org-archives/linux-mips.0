Received: from mail-pg0-x243.google.com ([IPv6:2607:f8b0:400e:c05::243]:32959
        "EHLO mail-pg0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990825AbdIKL2HDf3A2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Sep 2017 13:28:07 +0200
MIME-Version: 1.0
In-Reply-To: <20170910214424.14945-2-linus.walleij@linaro.org>
References: <20170910214424.14945-1-linus.walleij@linaro.org> <20170910214424.14945-2-linus.walleij@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Sep 2017 13:27:59 +0200
Message-ID: <CAMuHMdXabvax2Wru8j+MC4X5F+z5hoUo1tEbX+zn2AUW6QENVA@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: gpio: Convert to use descriptors
Content-Type: text/plain; charset="UTF-8"
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Steven Miao <realmz6@gmail.com>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Ralf Baechle <ralf@linux-mips.org>, "arm@kernel.org" <arm@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20170911112759.oPTjBVCb9SLkTce8NxZh6xz7ODM9j5Y86j7S2gNVNmc@z>

Hi Linus,

On Sun, Sep 10, 2017 at 11:44 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> This converts the GPIO-based I2C-driver to using GPIO
> descriptors instead of the old global numberspace-based
> GPIO interface. We:
>
> - Convert the driver to unconditionally grab two GPIOs
>   from the device by index 0 (SDA) and 1 (SCL) which
>   will work fine with device tree and descriptor tables.
>   The existing device trees will continue to work just
>   like before, but without any roundtrip through the
>   global numberspace.

FYI, I recently posted a series to deprecate (at least for DT) this error
prone indexing, in favor of using named GPIOs:

    [PATCH/RFC 0/3] i2c: gpio: Add support for named gpios in DT
    http://www.spinics.net/lists/devicetree/msg191936.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
