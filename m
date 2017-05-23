Received: from mail-it0-x235.google.com ([IPv6:2607:f8b0:4001:c0b::235]:35979
        "EHLO mail-it0-x235.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993612AbdEWJgBc3Hmt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 May 2017 11:36:01 +0200
Received: by mail-it0-x235.google.com with SMTP id o5so15835140ith.1
        for <linux-mips@linux-mips.org>; Tue, 23 May 2017 02:36:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170521215727.1243-3-wsa@the-dreams.de>
References: <20170521215727.1243-1-wsa@the-dreams.de> <20170521215727.1243-3-wsa@the-dreams.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2017 11:35:53 +0200
Message-ID: <CACRpkdZzrtP0Jr5ZnOJrN9CZQDO1CXgW7Z9jTw1Mt_MkP0Saqw@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: pcf857x: move header file out of I2C realm
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
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Jonathan Cameron <jic23@cam.ac.uk>, Ralf Baechle <ralf@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Message-ID: <20170523093553.jSLk0LycsDPKwRV9BtwZjSkXpLn1xiinI6JxiS_rhlY@z>

On Sun, May 21, 2017 at 11:57 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> include/linux/i2c is not for client devices. Move the header file to a
> more appropriate location.
>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>  arch/arm/mach-davinci/board-da830-evm.c        | 2 +-
>  arch/arm/mach-davinci/board-dm644x-evm.c       | 2 +-
>  arch/arm/mach-davinci/board-dm646x-evm.c       | 2 +-
>  arch/arm/mach-pxa/balloon3.c                   | 2 +-
>  arch/arm/mach-pxa/stargate2.c                  | 2 +-
>  arch/mips/ath79/mach-pb44.c                    | 2 +-
>  drivers/gpio/gpio-pcf857x.c                    | 2 +-
>  include/linux/{i2c => platform_data}/pcf857x.h | 0
>  8 files changed, 7 insertions(+), 7 deletions(-)
>  rename include/linux/{i2c => platform_data}/pcf857x.h (100%)

Patch applied.

BTW ARM SoC maintainers be warned, I optimistically assume this will
not collide with any ARM SoC work...

Yours,
Linus Walleij
