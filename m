Received: from 5pmail.ess.barracuda.com ([64.235.150.216]:34798 "EHLO
        5pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991550AbdJYXiuloqHS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Oct 2017 01:38:50 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 8/8] irqchip: mips-gic: Make IPI bitmaps static
Date: Wed, 25 Oct 2017 16:37:30 -0700
Message-ID: <20171025233730.22225-9-paul.burton@mips.com>
In-Reply-To: <20171025233730.22225-1-paul.burton@mips.com>
References: <20171025233730.22225-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20171025233730.y7ZNxbw4RYuNCbYmJYi3M3oE2-hnMQsOcZmUTNlwDTY@z>

We have 2 bitmaps used to keep track of interrupts dedicated to IPIs in
the MIPS GIC irqchip driver. These bitmaps are only used from the one
compilation unit of that driver, and so can be made static. Do so in
order to avoid polluting the symbol table & global namespace.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org

---

 drivers/irqchip/irq-mips-gic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 8c719a9912fc..108ffdc4f804 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -52,8 +52,8 @@ static int gic_shared_intrs;
 static unsigned int gic_cpu_pin;
 static unsigned int timer_cpu_pin;
 static struct irq_chip gic_level_irq_controller, gic_edge_irq_controller;
-DECLARE_BITMAP(ipi_resrv, GIC_MAX_INTRS);
-DECLARE_BITMAP(ipi_available, GIC_MAX_INTRS);
+static DECLARE_BITMAP(ipi_resrv, GIC_MAX_INTRS);
+static DECLARE_BITMAP(ipi_available, GIC_MAX_INTRS);
 
 static struct gic_all_vpes_chip_data {
 	u32	map;
-- 
2.14.3
