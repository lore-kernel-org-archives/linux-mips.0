Received: from mailapp01.imgtec.com ([195.59.15.196]:17311 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993915AbdHMErLL0rQd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:47:11 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 32/38] irqchip: mips-gic: Inline __gic_init()
Date: Sat, 12 Aug 2017 21:36:40 -0700
Message-ID: <20170813043646.25821-33-paul.burton@imgtec.com>
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
Message-ID: <20170813043640.hLWL4iLag0JWByvtw8vj5PQrfP0n2XIaBWRzk0ZCw3k@z>

The __gic_init() function is only called from gic_of_init() now that the
non-DT path has been removed. In order to simplify the code & aid
readability, fold __gic_init() into gic_of_init().

This provides us with the ability to return an error code, which
__gic_init() was previously unable to do. As such the irq_domain_add_*()
error paths are modified to print & return an error rather than panic().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-gic.c | 116 +++++++++++++++++++----------------------
 1 file changed, 55 insertions(+), 61 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index e77e194740a9..a4a22bcb1a38 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -648,15 +648,54 @@ static const struct irq_domain_ops gic_ipi_domain_ops = {
 	.match = gic_ipi_domain_match,
 };
 
-static void __init __gic_init(unsigned long gic_base_addr,
-			      unsigned long gic_addrspace_size,
-			      unsigned int cpu_vec, unsigned int irqbase,
-			      struct device_node *node)
+
+static int __init gic_of_init(struct device_node *node,
+			      struct device_node *parent)
 {
-	unsigned int gicconfig, cpu;
-	unsigned int v[2];
+	unsigned int cpu_vec, i, reserved, gicconfig, cpu, v[2];
+	phys_addr_t gic_base;
+	struct resource res;
+	size_t gic_len;
 
-	mips_gic_base = ioremap_nocache(gic_base_addr, gic_addrspace_size);
+	/* Find the first available CPU vector. */
+	i = reserved = 0;
+	while (!of_property_read_u32_index(node, "mti,reserved-cpu-vectors",
+					   i++, &cpu_vec))
+		reserved |= BIT(cpu_vec);
+	for (cpu_vec = 2; cpu_vec < 8; cpu_vec++) {
+		if (!(reserved & BIT(cpu_vec)))
+			break;
+	}
+	if (cpu_vec == 8) {
+		pr_err("No CPU vectors available for GIC\n");
+		return -ENODEV;
+	}
+
+	if (of_address_to_resource(node, 0, &res)) {
+		/*
+		 * Probe the CM for the GIC base address if not specified
+		 * in the device-tree.
+		 */
+		if (mips_cm_present()) {
+			gic_base = read_gcr_gic_base() &
+				~CM_GCR_GIC_BASE_GICEN;
+			gic_len = 0x20000;
+		} else {
+			pr_err("Failed to get GIC memory range\n");
+			return -ENODEV;
+		}
+	} else {
+		gic_base = res.start;
+		gic_len = resource_size(&res);
+	}
+
+	if (mips_cm_present()) {
+		write_gcr_gic_base(gic_base | CM_GCR_GIC_BASE_GICEN);
+		/* Ensure GIC region is enabled before trying to access it */
+		__sync();
+	}
+
+	mips_gic_base = ioremap_nocache(gic_base, gic_len);
 
 	gicconfig = read_gic_config();
 	gic_shared_intrs = gicconfig & GIC_CONFIG_NUMINTERRUPTS;
@@ -707,17 +746,21 @@ static void __init __gic_init(unsigned long gic_base_addr,
 	}
 
 	gic_irq_domain = irq_domain_add_simple(node, GIC_NUM_LOCAL_INTRS +
-					       gic_shared_intrs, irqbase,
+					       gic_shared_intrs, 0,
 					       &gic_irq_domain_ops, NULL);
-	if (!gic_irq_domain)
-		panic("Failed to add GIC IRQ domain");
+	if (!gic_irq_domain) {
+		pr_err("Failed to add GIC IRQ domain");
+		return -ENXIO;
+	}
 
 	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
 						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
 						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
 						  node, &gic_ipi_domain_ops, NULL);
-	if (!gic_ipi_domain)
-		panic("Failed to add GIC IPI domain");
+	if (!gic_ipi_domain) {
+		pr_err("Failed to add GIC IPI domain");
+		return -ENXIO;
+	}
 
 	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
 
@@ -733,55 +776,6 @@ static void __init __gic_init(unsigned long gic_base_addr,
 
 	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
 	gic_basic_init();
-}
-
-static int __init gic_of_init(struct device_node *node,
-			      struct device_node *parent)
-{
-	struct resource res;
-	unsigned int cpu_vec, i = 0, reserved = 0;
-	phys_addr_t gic_base;
-	size_t gic_len;
-
-	/* Find the first available CPU vector. */
-	while (!of_property_read_u32_index(node, "mti,reserved-cpu-vectors",
-					   i++, &cpu_vec))
-		reserved |= BIT(cpu_vec);
-	for (cpu_vec = 2; cpu_vec < 8; cpu_vec++) {
-		if (!(reserved & BIT(cpu_vec)))
-			break;
-	}
-	if (cpu_vec == 8) {
-		pr_err("No CPU vectors available for GIC\n");
-		return -ENODEV;
-	}
-
-	if (of_address_to_resource(node, 0, &res)) {
-		/*
-		 * Probe the CM for the GIC base address if not specified
-		 * in the device-tree.
-		 */
-		if (mips_cm_present()) {
-			gic_base = read_gcr_gic_base() &
-				~CM_GCR_GIC_BASE_GICEN;
-			gic_len = 0x20000;
-		} else {
-			pr_err("Failed to get GIC memory range\n");
-			return -ENODEV;
-		}
-	} else {
-		gic_base = res.start;
-		gic_len = resource_size(&res);
-	}
-
-	if (mips_cm_present())
-		write_gcr_gic_base(gic_base | CM_GCR_GIC_BASE_GICEN);
-		/* Ensure GIC region is enabled before trying to access it */
-		__sync();
-	}
-
-	__gic_init(gic_base, gic_len, cpu_vec, 0, node);
-
 	return 0;
 }
 IRQCHIP_DECLARE(mips_gic, "mti,gic", gic_of_init);
-- 
2.14.0
