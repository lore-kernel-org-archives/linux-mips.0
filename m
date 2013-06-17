Received: from mail-ob0-f172.google.com ([209.85.214.172]:62035 "EHLO
        mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6835136Ab3FQJVFjfGA3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Jun 2013 11:21:05 +0200
Received: by mail-ob0-f172.google.com with SMTP id wo10so2904766obc.3
        for <linux-mips@linux-mips.org>; Mon, 17 Jun 2013 02:20:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1371228049-27080-5-git-send-email-javier.martinez@collabora.co.uk>
References: <1371228049-27080-1-git-send-email-javier.martinez@collabora.co.uk>
        <1371228049-27080-5-git-send-email-javier.martinez@collabora.co.uk>
Date: Mon, 17 Jun 2013 11:20:57 +0200
Message-ID: <CACRpkdafxpwuaUHLb3uHiPNrKLsmcekqG1ATQKj8fgz+ekXmDg@mail.gmail.com>
Subject: Re: [PATCH 4/7] mfd: stmpe: use irq_get_trigger_type() to get IRQ flags
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
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
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Grant Likely <grant.likely@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org
Message-ID: <20130617092057.mpkqrPmlne4OAYV0VnFOuht9arEq5F7iTs8HWUvSklw@z>

On Fri, Jun 14, 2013 at 6:40 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:

> Use irq_get_trigger_type() to get the IRQ trigger type flags
> instead calling irqd_get_trigger_type(irq_get_irq_data(irq))
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

If you get the other patches ACKed.

Yours,
Linus Walleij
