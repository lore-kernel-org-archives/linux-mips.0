Received: from mailapp01.imgtec.com ([195.59.15.196]:57959 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012477AbbBDPWhT-ahM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 Feb 2015 16:22:37 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 08/34] MIPS: jz4740: allow interrupt controller probe via DT
Date: Wed, 4 Feb 2015 15:21:37 +0000
Message-ID: <1423063323-19419-9-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1423063323-19419-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1423063323-19419-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com, gregkh@linuxfoundation.org, mturquette@linaro.org, sboyd@codeaurora.org, ralf@linux-mips.org, jslaby@suse.cz, tglx@linutronix.de, jason@lakedaemon.net, lars@metafoo.de, paul.burton@imgtec.com
Message-ID: <20150204152137.W3Vxs7QU8D9KDjmtzI8S41LmliUjygyQdyOkO30wNgs@z>

From: Paul Burton <paul.burton@imgtec.com>

Declare the interrupt controller for probe via the standard irqchip_init
function.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/jz4740/irq.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 1b742c3..a4f0a82 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -18,6 +18,7 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
+#include <linux/of_irq.h>
 #include <linux/timex.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
@@ -29,6 +30,8 @@
 
 #include <asm/mach-jz4740/base.h>
 
+#include "../../drivers/irqchip/irqchip.h"
+
 static void __iomem *jz_intc_base;
 
 #define JZ_REG_INTC_STATUS	0x00
@@ -74,7 +77,7 @@ static struct irqaction jz4740_cascade_action = {
 	.name = "JZ4740 cascade interrupt",
 };
 
-void __init jz4740_intc_init(void)
+static void __init __jz4740_intc_init(int parent_irq)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
@@ -101,8 +104,27 @@ void __init jz4740_intc_init(void)
 
 	irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0, IRQ_NOPROBE | IRQ_LEVEL);
 
-	setup_irq(2, &jz4740_cascade_action);
+	setup_irq(parent_irq, &jz4740_cascade_action);
+}
+
+void __init jz4740_intc_init(void)
+{
+	__jz4740_intc_init(2);
+}
+
+static int __init jz4740_intc_of_init(struct device_node *node,
+	struct device_node *parent)
+{
+	int parent_irq;
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq)
+		return -EINVAL;
+
+	__jz4740_intc_init(parent_irq);
+	return 0;
 }
+IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", jz4740_intc_of_init);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
1.9.1
