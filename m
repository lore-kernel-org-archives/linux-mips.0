Received: from mail-io0-x231.google.com ([IPv6:2607:f8b0:4001:c06::231]:46484
        "EHLO mail-io0-x231.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993179AbdIRTJp6KK7n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Sep 2017 21:09:45 +0200
Received: by mail-io0-x231.google.com with SMTP id d16so4632454ioj.3
        for <linux-mips@linux-mips.org>; Mon, 18 Sep 2017 12:09:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX+bx9pNEAFoBzfM7JhhH800u-HumpQYRsG3d5BNuduvg@mail.gmail.com>
References: <20170917093906.16325-1-linus.walleij@linaro.org>
 <20170917093906.16325-8-linus.walleij@linaro.org> <CAMuHMdX+bx9pNEAFoBzfM7JhhH800u-HumpQYRsG3d5BNuduvg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Sep 2017 21:09:39 +0200
Message-ID: <CACRpkdaYjQC9wTCvAJ-zEdX9fvBTRK5sazCd4L32zG3WkB1q4A@mail.gmail.com>
Subject: Re: [PATCH 7/7] i2c: gpio: Add support for named gpios in DT
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
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>
Message-ID: <20170918190939.ebJ_B4NsO7PLuLUrUdPSWn2PVNXzrU0vhN7qfjWvcPs@z>

On Mon, Sep 18, 2017 at 11:58 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

>> +       if (ret != -EPROBE_DEFER)
>> +               dev_err(dev, "error trying to get descriptor: %ld\n", ret);
>
> warning: format '%ld' expects argument of type 'long int', but
> argument 3 has type 'int' [-Wformat=]
>
> %d (0day busy?)

Bah haven't pushed it to the 0day builders yet.
I'll do that tonight so I can drown in the build errors.
:-D

Fixing it.

Yours,
Linus Walleij
