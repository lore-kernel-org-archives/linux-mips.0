Received: from mailapp01.imgtec.com ([195.59.15.196]:61522 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993302AbdCaLFtOZXNd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 31 Mar 2017 13:05:49 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/2] irqchip/mips-gic: Fix Local compare interrupt
Date: Fri, 31 Mar 2017 12:05:32 +0100
Message-ID: <1490958332-31094-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1490958332-31094-1-git-send-email-matt.redfearn@imgtec.com>
References: <1490958332-31094-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Message-ID: <20170331110532.bmmK11Ul6SwByQE4pbCcMMvyz2r_Op82xiZCQU_QwNY@z>

Commit 4cfffcfa5106 ("irqchip/mips-gic: Fix local interrupts") added
mapping of several local interrupts during initialisation of the gic
driver. This associates virq numbers with these interrupts.
Unfortunately, as not all of the interrupts are mapped in hardware
order, when drivers subsequently request these interrupts they conflict
with the mappings that have already been set up. For example, this
manifests itself in the gic clocksource driver, which fails to probe
with the message:

clocksource: GIC: mask: 0xffffffffffffffff max_cycles: 0x7350c9738,
max_idle_ns: 440795203769 ns
GIC timer IRQ 25 setup failed: -22

This is because virq 25 (the correct IRQ number specified via device
tree) was allocated to the PERFCTR interrupt (and 24 to the timer, 26 to
the FDC). To fix this, map all of these local interrupts in the hardware
order so as to associate their virq numbers with the correct hw
interrupts.

Fixes: 4cfffcfa5106 ("irqchip/mips-gic: Fix local interrupts")
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 drivers/irqchip/irq-mips-gic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 11d12bccc4e7..cd20df12d63d 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -991,8 +991,12 @@ static void __init gic_map_single_int(struct device_node *node,
 
 static void __init gic_map_interrupts(struct device_node *node)
 {
+	gic_map_single_int(node, GIC_LOCAL_INT_WD);
+	gic_map_single_int(node, GIC_LOCAL_INT_COMPARE);
 	gic_map_single_int(node, GIC_LOCAL_INT_TIMER);
 	gic_map_single_int(node, GIC_LOCAL_INT_PERFCTR);
+	gic_map_single_int(node, GIC_LOCAL_INT_SWINT0);
+	gic_map_single_int(node, GIC_LOCAL_INT_SWINT1);
 	gic_map_single_int(node, GIC_LOCAL_INT_FDC);
 }
 
-- 
2.7.4
