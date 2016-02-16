Received: from mail-ob0-f178.google.com ([209.85.214.178]:33063 "EHLO
        mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012831AbcBPPxwWJdrn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Feb 2016 16:53:52 +0100
Received: by mail-ob0-f178.google.com with SMTP id jq7so80285097obb.0
        for <linux-mips@linux-mips.org>; Tue, 16 Feb 2016 07:53:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2646870.5L1En4yxph@wuerfel>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
        <1455551208-2825510-2-git-send-email-arnd@arndb.de>
        <CACRpkdaQN9_qoTn4_riZGvi4BKRLEVkRRL4CWzKj8e_di7Q2Xg@mail.gmail.com>
        <2646870.5L1En4yxph@wuerfel>
Date: Tue, 16 Feb 2016 16:53:43 +0100
Message-ID: <CACRpkdYDqU7bbZguifQ2cos0r0ywgofzx4XvsmkQ8d73W9183A@mail.gmail.com>
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
Message-ID: <20160216155343.5aeeKaJlhtZl9AVL10wOs2Vb_mV6k_sF3YwpePq08UQ@z>

On Tue, Feb 16, 2016 at 4:45 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> I've just sent v2 of the series, with a separate patch for MIPS
> that now conflicts with this one. Can you pick up the new patch
> instead?

OK I'll back out and apply the v2 versions.

Yours,
Linus Walleij
