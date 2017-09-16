Received: from mail-it0-x234.google.com ([IPv6:2607:f8b0:4001:c0b::234]:53006
        "EHLO mail-it0-x234.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991131AbdIPWZTHsnrt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 17 Sep 2017 00:25:19 +0200
Received: by mail-it0-x234.google.com with SMTP id c195so6355234itb.1
        for <linux-mips@linux-mips.org>; Sat, 16 Sep 2017 15:25:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170914093509.uwk47vt3wnm3rtqb@dell>
References: <20170910214424.14945-1-linus.walleij@linaro.org>
 <20170910214424.14945-2-linus.walleij@linaro.org> <20170914093509.uwk47vt3wnm3rtqb@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 17 Sep 2017 00:25:12 +0200
Message-ID: <CACRpkdZYDALXSoEE9jdo7A5P4XZczVbh_uiLkE54=sRtA3rNDQ@mail.gmail.com>
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
To: Lee Jones <lee.jones@linaro.org>, Ben Dooks <ben@fluff.org.uk>, Ville Syrjala <syrjala@sci.fi>, Magnus Damm <magnus.damm@gmail.com>, Heiko Schocher <hs@denx.de>, Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS <linux-mips@linux-mips.org>, adi-buildroot-devel@lists.sourceforge.net, "arm@kernel.org" <arm@kernel.org>, Steven Miao <realmz6@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170916222512.WgoC0jx4oUkuDK6mQXLniSlYwklIZuEOROLsj3itIqQ@z>

On Thu, Sep 14, 2017 at 11:35 AM, Lee Jones <lee.jones@linaro.org> wrote:

>>  drivers/mfd/sm501.c                          |  49 +++++-----
>
> I'd prefer for this to be applied with a Tested-by.  I appreciate that
> this is an old driver, but can you attempt to contact one of the
> authors or someone else who might have hardware please?

For SM501 specifically I guess.

OK makes sense as it is the most invasive one, paging around...

Ben, Ville, Magnus, Heiko, Guenther: is one of you still using this
hardware so you can test the patch set?

Yours,
Linus Walleij
