Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:35315
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23995072AbdH2StloXU7H (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Aug 2017 20:49:41 +0200
Received: by mail-wr0-x244.google.com with SMTP id a47so2848124wra.2
        for <linux-mips@linux-mips.org>; Tue, 29 Aug 2017 11:49:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] irqchip: irq-bcm7120-l2: Use correct I/O accessors for irq_fwd_mask
Date: Tue, 29 Aug 2017 11:43:06 -0700
Message-ID: <1504032187-53035-1-git-send-email-f.fainelli@gmail.com>
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
To: linux-kernel@vger.kernel.org
Cc: opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>
Message-ID: <20170829184306.Vjb2T4m5uWjI1YdE44nqZBVVAxtM9fhrOAgspR5Ct4w@z>

Initialization of irq_fwd_mask was done using __raw_readl() which
happens to work for all cases except when using ARM BE8 which requires
readl() (with the proper swapping). Move the initialization of the
irq_fwd_mask till later when we have correctly defined our I/O
accessors.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7120-l2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index 64c2692070ef..983640eba418 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -250,12 +250,6 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 	if (ret < 0)
 		goto out_free_l1_data;
 
-	for (idx = 0; idx < data->n_words; idx++) {
-		__raw_writel(data->irq_fwd_mask[idx],
-			     data->pair_base[idx] +
-			     data->en_offset[idx]);
-	}
-
 	for (irq = 0; irq < data->num_parent_irqs; irq++) {
 		ret = bcm7120_l2_intc_init_one(dn, data, irq, valid_mask);
 		if (ret)
@@ -297,6 +291,10 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 		gc->reg_base = data->pair_base[idx];
 		ct->regs.mask = data->en_offset[idx];
 
+		/* gc->reg_base is defined and so is gc->writel */
+		irq_reg_writel(gc, data->irq_fwd_mask[idx],
+			       data->en_offset[idx]);
+
 		ct->chip.irq_mask = irq_gc_mask_clr_bit;
 		ct->chip.irq_unmask = irq_gc_mask_set_bit;
 		ct->chip.irq_ack = irq_gc_noop;
-- 
1.9.1
