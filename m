Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:39547 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992381AbdJaQoEhZeIA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 17:44:04 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2 8/8] irqchip: mips-gic: Make IPI bitmaps static
Date: Tue, 31 Oct 2017 09:41:51 -0700
Message-ID: <20171031164151.6357-9-paul.burton@mips.com>
In-Reply-To: <20171031164151.6357-1-paul.burton@mips.com>
References: <867evc5cc9.fsf@arm.com>
 <20171031164151.6357-1-paul.burton@mips.com>
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
Message-ID: <20171031164151.wPQIERBPLNx_54yqZYlBErvzO4LT3Doi8zKkO7oSZTM@z>

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

Changes in v2: None

 drivers/irqchip/irq-mips-gic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index b2e83461e2a8..3ccebb020f40 100644
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
