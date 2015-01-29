Received: from mailapp01.imgtec.com ([195.59.15.196]:62304 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012166AbbA2LOiPGD6B (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jan 2015 12:14:38 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/9] irqchip: mips-gic: Don't treat FDC IRQ as percpu devid
Date: Thu, 29 Jan 2015 11:14:08 +0000
Message-ID: <1422530054-7976-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
References: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Message-ID: <20150129111408.5543YbMZ0FmEcEIkR-XGtGCHRGUhQ4o_NnmZlZK1PWg@z>

Treat the Fast Debug Channel (FDC) interrupt the same as the timer and
performance counter interrupts. Like them, the FDC IRQ is also per-VPE,
and also doesn't use a per-CPU device ID yet. Per-CPU device IDs don't
seem to work with IRQF_SHARED which is needed for compatibility with
cores which don't route the FDC IRQ through the GIC. For hardware which
routes FDC IRQs through the GIC this is something that could be added
later.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: linux-mips@linux-mips.org
---
 drivers/irqchip/irq-mips-gic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 1f12eaedc9d9..bcfead6e8ae6 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -591,15 +591,20 @@ static int gic_local_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	 * of the MIPS kernel code does not use the percpu IRQ API for
 	 * the CP0 timer and performance counter interrupts.
 	 */
-	if (intr != GIC_LOCAL_INT_TIMER && intr != GIC_LOCAL_INT_PERFCTR) {
+	switch (intr) {
+	case GIC_LOCAL_INT_TIMER:
+	case GIC_LOCAL_INT_PERFCTR:
+	case GIC_LOCAL_INT_FDC:
+		irq_set_chip_and_handler(virq,
+					 &gic_all_vpes_local_irq_controller,
+					 handle_percpu_irq);
+		break;
+	default:
 		irq_set_chip_and_handler(virq,
 					 &gic_local_irq_controller,
 					 handle_percpu_devid_irq);
 		irq_set_percpu_devid(virq);
-	} else {
-		irq_set_chip_and_handler(virq,
-					 &gic_all_vpes_local_irq_controller,
-					 handle_percpu_irq);
+		break;
 	}
 
 	spin_lock_irqsave(&gic_lock, flags);
-- 
2.0.5
