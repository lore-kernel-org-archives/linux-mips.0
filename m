Received: from mail-ob0-f178.google.com ([209.85.214.178]:33849 "EHLO
        mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012971AbcBRXV5BLHLy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Feb 2016 00:21:57 +0100
Received: by mail-ob0-f178.google.com with SMTP id kf7so8664964obb.1
        for <linux-mips@linux-mips.org>; Thu, 18 Feb 2016 15:21:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455637261-2920972-4-git-send-email-arnd@arndb.de>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
        <1455637261-2920972-1-git-send-email-arnd@arndb.de>
        <1455637261-2920972-4-git-send-email-arnd@arndb.de>
Date: Fri, 19 Feb 2016 00:21:51 +0100
Message-ID: <CACRpkdYrUxkOGvxi85zAn8O32otLNGtBGrvQPSqvnm1htp=+-w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: ep93xx: remove private irq_to_gpio function
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>
Message-ID: <20160218232151.Y1hnXN6cB4gLkXDq8XD4NuUtOfSK5JnV4JaaZyMApp8@z>

On Tue, Feb 16, 2016 at 4:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The ep93xx goes through its own back-and-forth dance every time
> it wants to know the gpio number for an irq line, when it really
> just hardcodes a fixed offset in ep93xx_gpio_to_irq().
>
> This removes the pointless macro and replaces the conversion inside
> of the driver with simple add/subtract operations, using an
> explicit macro.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Holding this back waiting for the dependent cleanup to come in.

Yours,
Linus Walleij
