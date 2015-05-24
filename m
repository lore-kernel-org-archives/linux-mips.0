Received: from mailapp01.imgtec.com ([195.59.15.196]:26926 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013021AbbEXPTDgHyGG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:19:03 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 12/37] MIPS: JZ4740: parse SoC interrupt controller parent IRQ from DT
Date: Sun, 24 May 2015 16:11:22 +0100
Message-ID: <1432480307-23789-13-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>
Message-ID: <20150524151122.pHQChKhvZzNghH0cL8g0NXc6df5RxE581wCVaRmOvMg@z>

Rather than hardcoding the IRQ number used to cascade interrupts from
the SoC interrupt controller to the CPU interrupt controller, read that
IRQ number from the DT describing the system.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- New patch.

Changes in v2: None

 arch/mips/jz4740/irq.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 43e000a..ed51915 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -85,6 +85,11 @@ static int __init jz4740_intc_of_init(struct device_node *node,
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	int parent_irq;
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq)
+		return -EINVAL;
 
 	jz_intc_base = ioremap(JZ4740_INTC_BASE_ADDR, 0x14);
 
@@ -108,7 +113,7 @@ static int __init jz4740_intc_of_init(struct device_node *node,
 
 	irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0, IRQ_NOPROBE | IRQ_LEVEL);
 
-	setup_irq(2, &jz4740_cascade_action);
+	setup_irq(parent_irq, &jz4740_cascade_action);
 	return 0;
 }
 IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", jz4740_intc_of_init);
-- 
2.4.1
