Received: from mail-oi0-f52.google.com ([209.85.218.52]:35963 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012774AbcBRXTw1KUby (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Feb 2016 00:19:52 +0100
Received: by mail-oi0-f52.google.com with SMTP id w5so878305oie.3
        for <linux-mips@linux-mips.org>; Thu, 18 Feb 2016 15:19:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455637261-2920972-2-git-send-email-arnd@arndb.de>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
        <1455637261-2920972-1-git-send-email-arnd@arndb.de>
        <1455637261-2920972-2-git-send-email-arnd@arndb.de>
Date: Fri, 19 Feb 2016 00:19:46 +0100
Message-ID: <CACRpkdaNA0p95f8i4o0+Abqc-YshvaBhOBAWbi=s1AfFmeHY_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: remove broken irq_to_gpio() interface
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
Message-ID: <20160218231946.r1ypSljRE5KOH-WB8dBXvIQBNpUydbCmC1SPU86evZU@z>

On Tue, Feb 16, 2016 at 4:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> gpiolib has removed the irq_to_gpio() API several years ago,
> but the global header still provided a non-working stub.
>
> To prevent new users of this broken function from showing
> up, let's remove the stubs as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
