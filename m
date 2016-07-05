Received: from mailapp01.imgtec.com ([195.59.15.196]:36088 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992972AbcGEN0mhOMCl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 Jul 2016 15:26:42 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] irqchip: mips-gic: Map to VPs using HW VPNum
Date: Tue, 5 Jul 2016 14:25:59 +0100
Message-ID: <20160705132600.27730-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Qais Yousef <qsyousef@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160705132559.ApkTixcVbbskeajp-XJw4zsxOpJS9-QQjUzRjTp60tw@z>

When mapping an interrupt to a VP(E) we must use the identifier for the
VP that the hardware expects, and this does not always match up with the
Linux CPU number. Commit d46812bb0bef ("irqchip: mips-gic: Use HW IDs
for VPE_OTHER_ADDR") corrected this for the cases that existed at the
time it was written, but commit 2af70a962070 ("irqchip/mips-gic: Add a
IPI hierarchy domain") added another case before the former patch was
merged. This leads to incorrectly using Linux CPU numbers when mapping
interrupts to VPs, which breaks on certain systems such as those with
multi-core I6400 CPUs. Fix by adding the appropriate call to
mips_cm_vp_id() to retrieve the expected VP identifier.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: d46812bb0bef ("irqchip: mips-gic: Use HW IDs for VPE_OTHER_ADDR")
Fixes: 2af70a962070 ("irqchip/mips-gic: Add a IPI hierarchy domain")
Cc: Qais Yousef <qsyousef@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 drivers/irqchip/irq-mips-gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 8a4adbeb..69b1b82 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -718,7 +718,7 @@ static int gic_shared_irq_domain_map(struct irq_domain *d, unsigned int virq,
 
 	spin_lock_irqsave(&gic_lock, flags);
 	gic_map_to_pin(intr, gic_cpu_pin);
-	gic_map_to_vpe(intr, vpe);
+	gic_map_to_vpe(intr, mips_cm_vp_id(vpe));
 	for (i = 0; i < min(gic_vpes, NR_CPUS); i++)
 		clear_bit(intr, pcpu_masks[i].pcpu_mask);
 	set_bit(intr, pcpu_masks[vpe].pcpu_mask);
-- 
2.9.0
