Received: from mail-io0-x242.google.com ([IPv6:2607:f8b0:4001:c06::242]:39618
        "EHLO mail-io0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993032AbeG2VZyZS510 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 29 Jul 2018 23:25:54 +0200
Received: by mail-io0-x242.google.com with SMTP id o22-v6so8274193ioh.6
        for <linux-mips@linux-mips.org>; Sun, 29 Jul 2018 14:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180725122621.31713-1-quentin.schulz@bootlin.com>
In-Reply-To: <20180725122621.31713-1-quentin.schulz@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Jul 2018 23:25:20 +0200
Message-ID: <CACRpkdbNAvoEagYwW0K7rQtnq6tsWnheiLuHQMhcUUBEs4FMrA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: mscc: ocelot: add interrupt controller
 properties to GPIO controller
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
To: quentin.schulz@bootlin.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, paul.burton@mips.com, James Hogan <jhogan@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20180729212520.2OdNMdfKtFEuglDG8ESoSo47W0EsvcLu0eDmG79-FrE@z>

On Wed, Jul 25, 2018 at 2:27 PM Quentin Schulz
<quentin.schulz@bootlin.com> wrote:

> The GPIO controller also serves as an interrupt controller for events
> on the GPIO it handles.
>
> An interrupt occurs whenever a GPIO line has changed.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
