Received: from mailapp01.imgtec.com ([195.59.15.196]:31697 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025950AbbDUOwoMI25o (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 16:52:44 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 18/37] MIPS: JZ4740: read intc base address from DT
Date: Tue, 21 Apr 2015 15:46:45 +0100
Message-ID: <1429627624-30525-19-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150421144645.orGT4pcwDcQq7a5BDWxQroSl7ZPQ6bUc1m1QU313HLU@z>

Read the base address of the SoC interrupt controller from the device
tree rather than relying upon the JZ4740_INTC_BASE_ADDR macro, in order
to remove the dependency on the asm/mach-jz4740/base.h header.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
---
Changes in v3:
  - New patch.
---
 arch/mips/jz4740/irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index a154d9b..58fe64f 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -18,14 +18,13 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/timex.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 
 #include <asm/io.h>
-
-#include <asm/mach-jz4740/base.h>
 #include <asm/mach-jz4740/irq.h>
 
 #include "irq.h"
@@ -110,7 +109,11 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 	}
 
 	intc->num_chips = num_chips;
-	intc->base = ioremap(JZ4740_INTC_BASE_ADDR, 0x14);
+	intc->base = of_iomap(node, 0);
+	if (!intc->base) {
+		err = -ENODEV;
+		goto out;
+	}
 
 	for (i = 0; i < num_chips; i++) {
 		/* Mask all irqs */
-- 
2.3.5
