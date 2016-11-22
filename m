Received: from mailapp01.imgtec.com ([195.59.15.196]:1433 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993111AbcKVRwyy8KPE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Nov 2016 18:52:54 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 1/6] MIPS: xilfpga: Use irqchip instead of the legacy way
Date: Tue, 22 Nov 2016 17:52:38 +0000
Message-ID: <20161122175243.8853-2-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <20161122175243.8853-1-Zubair.Kakakhel@imgtec.com>
References: <20161122175243.8853-1-Zubair.Kakakhel@imgtec.com>
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
To: ralf@linux-mips.org
Cc: Zubair.Kakakhel@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20161122175238.uwi7J7fXwkUsqOEp8zuOQLYo2jZ4AfVnYrXthS22X3E@z>

This prepares the code to use the Xilinx Interrupt Controller
driver in drivers/irqchip/irq-xilinx-intc.c

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
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
2.10.2
