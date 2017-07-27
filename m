Received: from mail-qk0-x243.google.com ([IPv6:2607:f8b0:400d:c09::243]:35303
        "EHLO mail-qk0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993961AbdG0WifsYC5D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 28 Jul 2017 00:38:35 +0200
Received: by mail-qk0-x243.google.com with SMTP id a77so2298268qkb.2
        for <linux-mips@linux-mips.org>; Thu, 27 Jul 2017 15:38:35 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] irqchip: brcmstb-l2: Define an irq_pm_shutdown function
Date: Thu, 27 Jul 2017 15:38:17 -0700
Message-ID: <20170727223817.7494-1-f.fainelli@gmail.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: opendmb@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>
Message-ID: <20170727223817.YJvGvfb7AXoSGHG4HwP0fPaisnIij3V5ofmZLy7L7GQ@z>

The Broadcom STB platforms support S5 and we allow specific hardware
wake-up events to take us out of this state. Because we were not
defining an irq_pm_shutdown() function pointer, we would not be
correctly masking non-wakeup events, which would result in spurious
wake-ups from sources that were not explicitly configured for wake-up.

Fixes: 7f646e92766e ("irqchip: brcmstb-l2: Add Broadcom Set Top Box Level-2 interrupt controller")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-brcmstb-l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index bddf169c4b37..b009b916a292 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -189,6 +189,7 @@ static int __init brcmstb_l2_intc_of_init(struct device_node *np,
 
 	ct->chip.irq_suspend = brcmstb_l2_intc_suspend;
 	ct->chip.irq_resume = brcmstb_l2_intc_resume;
+	ct->chip.irq_pm_shutdown = brcmstb_l2_intc_suspend;
 
 	if (data->can_wake) {
 		/* This IRQ chip can wake the system, set all child interrupts
-- 
2.9.3
