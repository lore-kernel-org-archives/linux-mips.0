Received: from mailapp01.imgtec.com ([195.59.15.196]:47582 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992474AbcHSRLusPGyr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Aug 2016 19:11:50 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] irqchip: mips-gic: Use for_each_set_bit to iterate over IRQs
Date: Fri, 19 Aug 2016 18:11:19 +0100
Message-ID: <20160819171119.28121-1-paul.burton@imgtec.com>
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
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160819171119.jSV3ZWm5wna3qJp-kYJdRhrGRAtnvLcDzv4jCkNn2y4@z>

The MIPS GIC driver has previously iterated over bits set in a bitmap
representing pending IRQs by calling find_first_bit, clearing that bit
then calling find_first_bit again until all bits are clear. If multiple
interrupts are pending then this is wasteful, as find_first_bit will
have to loop over the whole bitmap from the start. Use the
for_each_set_bit macro which performs exactly what we need here instead.
It will use find_next_bit and thus only scan over the relevant part of
the bitmap, and it makes the intent of the code clearer.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 drivers/irqchip/irq-mips-gic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index d3ef0fc..e9e5022 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -371,18 +371,13 @@ static void gic_handle_shared_int(bool chained)
 	bitmap_and(pending, pending, intrmask, gic_shared_intrs);
 	bitmap_and(pending, pending, pcpu_mask, gic_shared_intrs);
 
-	intr = find_first_bit(pending, gic_shared_intrs);
-	while (intr != gic_shared_intrs) {
+	for_each_set_bit(intr, pending, gic_shared_intrs) {
 		virq = irq_linear_revmap(gic_irq_domain,
 					 GIC_SHARED_TO_HWIRQ(intr));
 		if (chained)
 			generic_handle_irq(virq);
 		else
 			do_IRQ(virq);
-
-		/* go to next pending bit */
-		bitmap_clear(pending, intr, 1);
-		intr = find_first_bit(pending, gic_shared_intrs);
 	}
 }
 
-- 
2.9.3
