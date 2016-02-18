Received: from mail-ob0-f177.google.com ([209.85.214.177]:32923 "EHLO
        mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012873AbcBRXU7WRc9y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Feb 2016 00:20:59 +0100
Received: by mail-ob0-f177.google.com with SMTP id jq7so91674599obb.0
        for <linux-mips@linux-mips.org>; Thu, 18 Feb 2016 15:20:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455637261-2920972-3-git-send-email-arnd@arndb.de>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
        <1455637261-2920972-1-git-send-email-arnd@arndb.de>
        <1455637261-2920972-3-git-send-email-arnd@arndb.de>
Date: Fri, 19 Feb 2016 00:20:53 +0100
Message-ID: <CACRpkdZEvuA2H7WaFtYtzOTRoZo1t5wpHu+O2oHGudoK63F8Gg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: ks8695: remove irq_to_gpio function
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
Message-ID: <20160218232053.J7Jj9HIA7ek6jN2ipUQfRLsQJI0biK1bErJ_A0Eq01o@z>

On Tue, Feb 16, 2016 at 4:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The ks8695 gpio driver has its own copy of the irq_to_gpio()
> function. This is completely unused in the mainline kernel
> after we converted all remaining users several years ago,
> so we can remove the definition as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
