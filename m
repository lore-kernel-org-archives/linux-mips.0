Received: from mailapp01.imgtec.com ([195.59.15.196]:49271 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992501AbcHON4ExLIij (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 15 Aug 2016 15:56:04 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 3/9] MIPS: xilfpga: Use irqchip_init instead of the legacy way
Date: Mon, 15 Aug 2016 14:55:29 +0100
Message-ID: <1471269335-58747-4-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1471269335-58747-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1471269335-58747-1-git-send-email-Zubair.Kakakhel@imgtec.com>
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
To: monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de
Cc: jason@lakedaemon.net, marc.zyngier@arm.com, Zubair.Kakakhel@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Message-ID: <20160815135529.Xk0GebSwrCFBVOv18gek_VILYRH92REO-9GOpApotvM@z>

This prepares the code use the Xilinx AXI Interrupt Controller
driver now available in drivers/irqchip/irq-xilinx.c

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
1.9.1
