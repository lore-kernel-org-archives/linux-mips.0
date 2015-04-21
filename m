Received: from mailapp01.imgtec.com ([195.59.15.196]:18916 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025951AbbDUOxXjRDNu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 16:53:23 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 20/37] MIPS: JZ4740: support newer SoC interrupt controllers
Date: Tue, 21 Apr 2015 15:46:47 +0100
Message-ID: <1429627624-30525-21-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150421144647.jYsHRigWmnC58fvbv63_dDI8VZhhXS9luRpvR-Bi-t8@z>

Allow the interrupt controllers of the JZ4770, JZ4775 & JZ4780 SoCs to
be probed via devicetree, supporting the 64 interrupts they provide.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
---
Changes in v3:
  - Support JZ4775, and use a more generic "2chip" probe function name
    for doing so whilst sharing code with the JZ4780.

Changes in v2:
  - None.
---
 arch/mips/jz4740/irq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 65b27c8..5f4ec08 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -161,3 +161,12 @@ static int __init intc_1chip_of_init(struct device_node *node,
 	return ingenic_intc_of_init(node, 1);
 }
 IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", intc_1chip_of_init);
+
+static int __init intc_2chip_of_init(struct device_node *node,
+	struct device_node *parent)
+{
+	return ingenic_intc_of_init(node, 2);
+}
+IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
-- 
2.3.5
