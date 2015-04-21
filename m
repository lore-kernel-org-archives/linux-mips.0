Received: from mailapp01.imgtec.com ([195.59.15.196]:32929 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025945AbbDUOvOkIUWY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 16:51:14 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 13/37] MIPS: JZ4740: register an irq_domain for the interrupt controller
Date: Tue, 21 Apr 2015 15:46:40 +0100
Message-ID: <1429627624-30525-14-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
References: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Message-ID: <20150421144640.nTDJHRh9o6yTukfysmiwFpnTmD-kRjnFoz9OFc87yEQ@z>

When probining the interrupt controller, register an IRQ domain such
that the interrupts can be translated by devicetree code & thus used
from devicetree.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
---
Changes in v3:
  - Rebase.

Changes in v2:
  - None.
---
 arch/mips/jz4740/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index ed51915..ddcf78a 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -85,6 +85,7 @@ static int __init jz4740_intc_of_init(struct device_node *node,
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	struct irq_domain *domain;
 	int parent_irq;
 
 	parent_irq = irq_of_parse_and_map(node, 0);
@@ -113,6 +114,11 @@ static int __init jz4740_intc_of_init(struct device_node *node,
 
 	irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0, IRQ_NOPROBE | IRQ_LEVEL);
 
+	domain = irq_domain_add_legacy(node, num_chips * 32, JZ4740_IRQ_BASE, 0,
+				       &irq_domain_simple_ops, NULL);
+	if (!domain)
+		pr_warn("unable to register IRQ domain\n");
+
 	setup_irq(parent_irq, &jz4740_cascade_action);
 	return 0;
 }
-- 
2.3.5
