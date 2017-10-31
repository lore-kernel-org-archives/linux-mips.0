Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:38688 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992366AbdJaQntwD8qA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 17:43:49 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2 6/8] irqchip: mips-gic: Remove gic_vpes variable
Date: Tue, 31 Oct 2017 09:41:49 -0700
Message-ID: <20171031164151.6357-7-paul.burton@mips.com>
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
Message-ID: <20171031164149.mXEa0DbJSWLug2dkvZXjWrsHuOjouRWtCpZo3zDojW0@z>

Following the past few patches nothing uses the gic_vpes variable any
longer. Remove the dead code.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

Changes in v2: None

 drivers/irqchip/irq-mips-gic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 4304283bfb1a..48f0f43cd05d 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -49,7 +49,6 @@ static DEFINE_SPINLOCK(gic_lock);
 static struct irq_domain *gic_irq_domain;
 static struct irq_domain *gic_ipi_domain;
 static int gic_shared_intrs;
-static int gic_vpes;
 static unsigned int gic_cpu_pin;
 static unsigned int timer_cpu_pin;
 static struct irq_chip gic_level_irq_controller, gic_edge_irq_controller;
@@ -721,10 +720,6 @@ static int __init gic_of_init(struct device_node *node,
 	gic_shared_intrs >>= __ffs(GIC_CONFIG_NUMINTERRUPTS);
 	gic_shared_intrs = (gic_shared_intrs + 1) * 8;
 
-	gic_vpes = gicconfig & GIC_CONFIG_PVPS;
-	gic_vpes >>= __ffs(GIC_CONFIG_PVPS);
-	gic_vpes = gic_vpes + 1;
-
 	if (cpu_has_veic) {
 		/* Always use vector 1 in EIC mode */
 		gic_cpu_pin = 0;
-- 
2.14.3
