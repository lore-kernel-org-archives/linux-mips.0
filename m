Received: from mailapp01.imgtec.com ([195.59.15.196]:4147 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012073AbbLBMWhoacZA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Dec 2015 13:22:37 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v3 15/19] irqchip/mips-gic: Clear percpu_masks correctly when mapping
Date: Wed, 2 Dec 2015 12:21:56 +0000
Message-ID: <1449058920-21011-16-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1449058920-21011-1-git-send-email-qais.yousef@imgtec.com>
References: <1449058920-21011-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151202122156.giH97qrkuF9wYc0MSUNJfT6q2WoFC50dF0qmzmnmUF8@z>

When setting the mapping for a hwirq, make sure we clear percpu_masks for
all other cpus in case it was set previously.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 drivers/irqchip/irq-mips-gic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index c24feb739bb3..2b1b48665612 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -760,6 +760,7 @@ static int gic_shared_irq_domain_map(struct irq_domain *d, unsigned int virq,
 {
 	int intr = GIC_HWIRQ_TO_SHARED(hw);
 	unsigned long flags;
+	int i;
 
 	irq_set_chip_and_handler(virq, &gic_level_irq_controller,
 				 handle_level_irq);
@@ -767,6 +768,8 @@ static int gic_shared_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	spin_lock_irqsave(&gic_lock, flags);
 	gic_map_to_pin(intr, gic_cpu_pin);
 	gic_map_to_vpe(intr, vpe);
+	for (i = 0; i < gic_vpes; i++)
+		clear_bit(intr, pcpu_masks[i].pcpu_mask);
 	set_bit(intr, pcpu_masks[vpe].pcpu_mask);
 	spin_unlock_irqrestore(&gic_lock, flags);
 
-- 
2.1.0
