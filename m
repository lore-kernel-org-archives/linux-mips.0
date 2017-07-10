Received: from mail-lf0-x244.google.com ([IPv6:2a00:1450:4010:c07::244]:35565
        "EHLO mail-lf0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993868AbdGJPzEBjPIg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Jul 2017 17:55:04 +0200
Received: by mail-lf0-x244.google.com with SMTP id z78so11211500lff.2
        for <linux-mips@linux-mips.org>; Mon, 10 Jul 2017 08:55:01 -0700 (PDT)
Subject: Re: [PATCH 6/6] irqchip: brcmstb-l2: Add support for the BCM7271 L2
 controller
References: <20170707192016.13001-1-opendmb@gmail.com>
 <20170707192016.13001-7-opendmb@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <cdf386bc-84ad-392c-098f-fa1558cbcf1b@gmail.com>
Date: Mon, 10 Jul 2017 08:54:49 -0700
MIME-Version: 1.0
In-Reply-To: <20170707192016.13001-7-opendmb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Doug Berger <opendmb@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20170710155449.UykFVo9DFvSeZ9XKm6wzLK6W-S7hVIO6-P-VRcuz-dY@z>

On 07/07/2017 12:20 PM, Doug Berger wrote:
> Add the initialization of the generic irq chip for the BCM7271 L2
> interrupt controller.  This controller only supports level
> interrupts and uses the "brcm,bcm7271-l2-intc" compatibility
> string.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
