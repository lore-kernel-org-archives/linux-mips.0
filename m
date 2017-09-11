Received: from mail-it0-f52.google.com ([209.85.214.52]:38346 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994844AbdIKTnqaY9g2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Sep 2017 21:43:46 +0200
Received: by mail-it0-f52.google.com with SMTP id c195so22182786itb.1
        for <linux-mips@linux-mips.org>; Mon, 11 Sep 2017 12:43:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXabvax2Wru8j+MC4X5F+z5hoUo1tEbX+zn2AUW6QENVA@mail.gmail.com>
References: <20170910214424.14945-1-linus.walleij@linaro.org>
 <20170910214424.14945-2-linus.walleij@linaro.org> <CAMuHMdXabvax2Wru8j+MC4X5F+z5hoUo1tEbX+zn2AUW6QENVA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2017 21:37:16 +0200
Message-ID: <CACRpkdb4LQAqyWpRAWGRxUOcTbWVksNc3FTWdPnYNE-AUHtfgg@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Steven Miao <realmz6@gmail.com>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Ralf Baechle <ralf@linux-mips.org>, "arm@kernel.org" <arm@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20170911193716.xefn-gWgyHLPkRCczaOiShfygpL-GFnAYDJr-XKtyj4@z>

On Mon, Sep 11, 2017 at 1:27 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Sep 10, 2017 at 11:44 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> This converts the GPIO-based I2C-driver to using GPIO
>> descriptors instead of the old global numberspace-based
>> GPIO interface. We:
>>
>> - Convert the driver to unconditionally grab two GPIOs
>>   from the device by index 0 (SDA) and 1 (SCL) which
>>   will work fine with device tree and descriptor tables.
>>   The existing device trees will continue to work just
>>   like before, but without any roundtrip through the
>>   global numberspace.
>
> FYI, I recently posted a series to deprecate (at least for DT) this error
> prone indexing, in favor of using named GPIOs:
>
>     [PATCH/RFC 0/3] i2c: gpio: Add support for named gpios in DT
>     http://www.spinics.net/lists/devicetree/msg191936.html

Nice.

If Wolfram likes this series, I volunteer to rebase your patch
(oh well rewrite patch 2 from scratch, haha) on top of it as well
so he can apply the whole thing.

They will need some adjustments, I volunteer to do them.
Will provide feedback in the patches.

Yours.
Linus Walleij
