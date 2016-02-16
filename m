Received: from mail-ob0-f176.google.com ([209.85.214.176]:33969 "EHLO
        mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012831AbcBPPmvffxYn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Feb 2016 16:42:51 +0100
Received: by mail-ob0-f176.google.com with SMTP id wb13so264705936obb.1
        for <linux-mips@linux-mips.org>; Tue, 16 Feb 2016 07:42:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455551208-2825510-2-git-send-email-arnd@arndb.de>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
        <1455551208-2825510-1-git-send-email-arnd@arndb.de>
        <1455551208-2825510-2-git-send-email-arnd@arndb.de>
Date: Tue, 16 Feb 2016 16:42:18 +0100
Message-ID: <CACRpkdaQN9_qoTn4_riZGvi4BKRLEVkRRL4CWzKj8e_di7Q2Xg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: remove broken irq_to_gpio() interface
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
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Linux MIPS <linux-mips@linux-mips.org>
Message-ID: <20160216154218.USgADuy0CNn6SF8VZCVL30AxomemY-ENc6dCIgwz5V0@z>

On Mon, Feb 15, 2016 at 4:46 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> gpiolib has removed the irq_to_gpio() API several years ago,
> but the global header still provided a non-working stub.
>
> Apparently one new user has shown up in arch/mips, so this patch
> moves the broken definition to where it is used, ensuring that
> we get new users but not changing the current behavior on jz4740.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

I expect the driver maintainer to deal with the resulting
deprecation fallout.

Yours,
Linus Walleij
