Received: from mail-lf0-x242.google.com ([IPv6:2a00:1450:4010:c07::242]:33025
        "EHLO mail-lf0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991438AbdIOR5bWV40M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Sep 2017 19:57:31 +0200
Received: by mail-lf0-x242.google.com with SMTP id y15so1559659lfd.0
        for <linux-mips@linux-mips.org>; Fri, 15 Sep 2017 10:57:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170915175439.izhfpx2ztep4evet@ninjato>
References: <20170910214424.14945-1-linus.walleij@linaro.org>
 <20170910214424.14945-2-linus.walleij@linaro.org> <CAOesGMitNqwjEHugsiwsmRAVSinUEv=eprJXHRRhSHUypm=b1A@mail.gmail.com>
 <20170915175439.izhfpx2ztep4evet@ninjato>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 15 Sep 2017 10:57:24 -0700
Message-ID: <CAOesGMi5Jx+hDGtUV_3sE8-7Rc+KronFyUmRzT55hZuRn28OPQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: gpio: Convert to use descriptors
Content-Type: text/plain; charset="UTF-8"
Return-Path: <olof@lixom.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-MIPS <linux-mips@linux-mips.org>, adi-buildroot-devel@lists.sourceforge.net, "arm@kernel.org" <arm@kernel.org>, Steven Miao <realmz6@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Lee Jones <lee.jones@linaro.org>
Message-ID: <20170915175724.Z6t6jO_NrHqUHM8qZTc-0DnsIII5MaO6MK56eR3bftE@z>

On Fri, Sep 15, 2017 at 10:54 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Fri, Sep 15, 2017 at 10:51:28AM -0700, Olof Johansson wrote:
>> On Sun, Sep 10, 2017 at 2:44 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> [...]
>> > Cc: arm@kernel.org
>> > Cc: Steven Miao <realmz6@gmail.com>
>> > Cc: Ralf Baechle <ralf@linux-mips.org>
>> > Cc: Lee Jones <lee.jones@linaro.org>
>> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> > ---
>> > ARM SoC folks: requesting ACK for Wolfram to take this patch.
>> > Steven (Blackfin): requesting ACK for Wolfram to take this patch.
>> > Ralf (MIPS): requesting ACK for Wolfram to take this patch.
>> > Lee: requesting ACK for Wolfram to take this patch.
>>
>> Acked-by: Olof Johansson <olof@lixom.net>
>>
>> Wolfram: Same thing here, maybe this and the other patch can go on one
>> branch for merge in case of conflicts.
>
> Yes, I am fine with picking all these up. However, we already found out
> there needs to be a V2 because Geert had another series cleaning up the
> i2c-gpio driver and it was decided to merge those two series.

Yep, that approach makes sense. I suspect the arm mach pieces will
still look the same so the ack can stay in that case.


-Olof
