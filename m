Received: from mailapp01.imgtec.com ([195.59.15.196]:4656 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010515AbbJMKRHhooUs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:17:07 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 13/14] irqchip: mips-gic: implement the new irq_send_ipi
Date: Tue, 13 Oct 2015 11:16:21 +0100
Message-ID: <1444731382-19313-14-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151013101621.gPrYfVIYBo__ZmNXsNPcIPpeIEQNdDTFHH_Bi5ECKs4@z>

Now irqchip has a irq_send_ipi() function, implement gic_send_ipi()
to make use of it

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 drivers/irqchip/irq-mips-gic.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 9c8ece1d90f2..764470375cd0 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -266,9 +266,24 @@ static void gic_bind_eic_interrupt(int irq, int set)
 		  GIC_VPE_EIC_SS(irq), set);
 }
 
-void gic_send_ipi(unsigned int intr)
+static void gic_send_ipi(struct irq_data *d, const struct ipi_mask *cpumask)
 {
-	gic_write(GIC_REG(SHARED, GIC_SH_WEDGE), GIC_SH_WEDGE_SET(intr));
+	struct ipi_mapping *map = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t intr;
+	int vpe;
+
+	if (!map)
+		return;
+
+	vpe = find_first_bit(cpumask->cpumask, cpumask->nbits);
+	while (vpe != cpumask->nbits) {
+		intr = map->cpumap[vpe];
+		if (intr == INVALID_HWIRQ)
+			continue;
+		gic_write(GIC_REG(SHARED, GIC_SH_WEDGE), GIC_SH_WEDGE_SET(intr));
+
+		vpe = find_next_bit(cpumask->cpumask, cpumask->nbits, vpe + 1);
+	}
 }
 
 int gic_get_c0_compare_int(void)
@@ -476,6 +491,7 @@ static struct irq_chip gic_edge_irq_controller = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	=	gic_set_affinity,
 #endif
+	.irq_send_ipi		=	gic_send_ipi,
 };
 
 static void gic_handle_local_int(bool chained)
-- 
2.1.0
