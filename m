Received: from mailapp02.imgtec.com ([217.156.133.132]:45220 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992942AbcJQQxPmxNVz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 18:53:15 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [Patch v5 07/12] MIPS: xilfpga: Use irqchip instead of the legacy way
Date: Mon, 17 Oct 2016 17:52:51 +0100
Message-ID: <1476723176-39891-8-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1476723176-39891-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1476723176-39891-1-git-send-email-Zubair.Kakakhel@imgtec.com>
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
To: monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, alistair@popple.id.au, mporter@kernel.crashing.org
Cc: soren.brinkmann@xilinx.com, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, michal.simek@xilinx.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulus@samba.org, benh@kernel.crashing.org
Message-ID: <20161017165251.hLBjeCoScuyrGQpGWGZa9B6finxktdMplYscjl4ilWs@z>

This prepares the code use the Xilinx Interrupt Controller
driver now available in drivers/irqchip

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
V4 -> V5
Better commit message

V3 -> V4
Corrected commit message. Was irq-xilinx.c. Now irq-axi-intc.c

V2 -> V3
No change

V1 -> V2
No change
---
 arch/mips/xilfpga/intc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/mips/xilfpga/intc.c b/arch/mips/xilfpga/intc.c
index c4d1a71..a127cca 100644
--- a/arch/mips/xilfpga/intc.c
+++ b/arch/mips/xilfpga/intc.c
@@ -11,15 +11,12 @@
 
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/irqchip.h>
 
 #include <asm/irq_cpu.h>
 
-static struct of_device_id of_irq_ids[] __initdata = {
-	{ .compatible = "mti,cpu-interrupt-controller", .data = mips_cpu_irq_of_init },
-	{},
-};
 
 void __init arch_init_irq(void)
 {
-	of_irq_init(of_irq_ids);
+	irqchip_init();
 }
-- 
1.9.1
