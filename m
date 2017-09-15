Received: from mail-lf0-x243.google.com ([IPv6:2a00:1450:4010:c07::243]:38661
        "EHLO mail-lf0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991438AbdIORvfciBKM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Sep 2017 19:51:35 +0200
Received: by mail-lf0-x243.google.com with SMTP id m199so1539681lfe.5
        for <linux-mips@linux-mips.org>; Fri, 15 Sep 2017 10:51:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170910214424.14945-2-linus.walleij@linaro.org>
References: <20170910214424.14945-1-linus.walleij@linaro.org> <20170910214424.14945-2-linus.walleij@linaro.org>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 15 Sep 2017 10:51:28 -0700
Message-ID: <CAOesGMitNqwjEHugsiwsmRAVSinUEv=eprJXHRRhSHUypm=b1A@mail.gmail.com>
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
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-MIPS <linux-mips@linux-mips.org>, adi-buildroot-devel@lists.sourceforge.net, "arm@kernel.org" <arm@kernel.org>, Steven Miao <realmz6@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Lee Jones <lee.jones@linaro.org>
Message-ID: <20170915175128.f4yFs7QPcSU_abhtNN7n4nx2gD_Ys_K_EdWi6awo6Ig@z>

On Sun, Sep 10, 2017 at 2:44 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
[...]
> Cc: arm@kernel.org
> Cc: Steven Miao <realmz6@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC folks: requesting ACK for Wolfram to take this patch.
> Steven (Blackfin): requesting ACK for Wolfram to take this patch.
> Ralf (MIPS): requesting ACK for Wolfram to take this patch.
> Lee: requesting ACK for Wolfram to take this patch.

Acked-by: Olof Johansson <olof@lixom.net>

Wolfram: Same thing here, maybe this and the other patch can go on one
branch for merge in case of conflicts.


-Olof
