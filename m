Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:38601
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993975AbdG2BveP4ynf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 Jul 2017 03:51:34 +0200
Received: by mail-wr0-x244.google.com with SMTP id g32so10349383wrd.5
        for <linux-mips@linux-mips.org>; Fri, 28 Jul 2017 18:51:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170727223817.7494-1-f.fainelli@gmail.com>
References: <20170727223817.7494-1-f.fainelli@gmail.com>
From: Gregory Fong <gregory.0xf0@gmail.com>
Date: Fri, 28 Jul 2017 18:50:58 -0700
Message-ID: <CADtm3G4Rnm1276qYWe_MSnoZ2_Lxc1QFCUx1ZVfWtb5n4M2T2w@mail.gmail.com>
Subject: Re: [PATCH] irqchip: brcmstb-l2: Define an irq_pm_shutdown function
Content-Type: text/plain; charset="UTF-8"
Return-Path: <gregory.0xf0@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Doug Berger <opendmb@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Brian Norris <computersforpeace@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>
Message-ID: <20170729015058.ix7ioC0yMNAFrrfnnpTFHjoD9n6GdFZ1MJ1hVtuRnpY@z>

On Thu, Jul 27, 2017 at 3:38 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> The Broadcom STB platforms support S5 and we allow specific hardware
> wake-up events to take us out of this state. Because we were not
> defining an irq_pm_shutdown() function pointer, we would not be
> correctly masking non-wakeup events, which would result in spurious
> wake-ups from sources that were not explicitly configured for wake-up.
>
> Fixes: 7f646e92766e ("irqchip: brcmstb-l2: Add Broadcom Set Top Box Level-2 interrupt controller")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
