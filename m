Received: from mailapp01.imgtec.com ([195.59.15.196]:24455 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993915AbdHMEoqYfk7d (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:44:46 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 24/38] irqchip: mips-gic: Remove __gic_irq_dispatch() forward declaration
Date: Sat, 12 Aug 2017 21:36:32 -0700
Message-ID: <20170813043646.25821-25-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043632.Pyz6A9G2Vx9rSZRZZhw6nONqqOJlM7FkfxmYtj28gCc@z>

We provide a forward declaration of the __gic_irq_dispatch() function
for no apparent reason. Remove it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 6086747f02bf..ce5b2f59c3fb 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -58,8 +58,6 @@ static struct irq_chip gic_level_irq_controller, gic_edge_irq_controller;
 DECLARE_BITMAP(ipi_resrv, GIC_MAX_INTRS);
 DECLARE_BITMAP(ipi_available, GIC_MAX_INTRS);
 
-static void __gic_irq_dispatch(void);
-
 static bool gic_local_irq_is_routable(int intr)
 {
 	u32 vpe_ctl;
-- 
2.14.0
