Received: from mailapp02.imgtec.com ([217.156.133.132]:32238 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992940AbcJQQxPlwW8z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 18:53:15 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [Patch v5 05/12] irqchip: xilinx: Try to fall back if xlnx,kind-of-intr not provided
Date: Mon, 17 Oct 2016 17:52:49 +0100
Message-ID: <1476723176-39891-6-git-send-email-Zubair.Kakakhel@imgtec.com>
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
Message-ID: <20161017165249.EWKzKnZuV36St6Mxgi9YLKTc4PUx2NXFFgmCO7TSmSg@z>

The powerpc dts file upstream does not have the xlnx,kind-of-intr
property. Instead of erroring out, give a warning instead.
And attempt to continue to probe the interrupt controller while
assuming kind-of-intr is 0x0 as a fall back.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V5 new patch
---
 drivers/irqchip/irq-xilinx-intc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-xilinx-intc.c b/drivers/irqchip/irq-xilinx-intc.c
index dbf8b0c..485fb11 100644
--- a/drivers/irqchip/irq-xilinx-intc.c
+++ b/drivers/irqchip/irq-xilinx-intc.c
@@ -197,8 +197,8 @@ static int __init xilinx_intc_of_init(struct device_node *intc,
 
 	ret = of_property_read_u32(intc, "xlnx,kind-of-intr", &irqc->intr_mask);
 	if (ret < 0) {
-		pr_err("%s: unable to read xlnx,kind-of-intr\n", __func__);
-		goto err_alloc;
+		pr_warn("%s: unable to read xlnx,kind-of-intr\n", __func__);
+		irqc->intr_mask = 0;
 	}
 
 	if (irqc->intr_mask >> nr_irq)
-- 
1.9.1
