Received: from mailapp01.imgtec.com ([195.59.15.196]:33086 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009477AbbJMKQ5MX2fs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:16:57 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 06/14] irq: add struct ipi_mapping and its helper functions
Date: Tue, 13 Oct 2015 11:16:14 +0100
Message-ID: <1444731382-19313-7-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151013101614.qVwFEITqgSJyQk-tf0zXtgpqc_scqirmmqgF0fh4RLo@z>

struct ipi_mapping will provide a mechanism for irqdomain/architure
code to fill out the mapping for the generic code later to implement
generic IPI reserve and send functions.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 21 +++++++++++++++++++
 kernel/irq/manage.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index b000b217ea24..c3d0f26c3eff 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -964,4 +964,25 @@ static inline u32 irq_reg_readl(struct irq_chip_generic *gc,
 		return readl(gc->reg_base + reg_offset);
 }
 
+#define INVALID_HWIRQ	-1
+
+/**
+ * struct ipi_mapping - IPI mapping information object
+ * @nr_hwirqs: number of hwirqs mapped
+ * @nr_cpus: number of cpus the controller can talk to
+ * @cpumap: per cpu hwirq mapping table
+ */
+struct ipi_mapping {
+	unsigned int nr_hwirqs;
+	unsigned int nr_cpus;
+	unsigned int *cpumap;
+};
+
+struct ipi_mapping *irq_alloc_ipi_mapping(unsigned int nr_cpus);
+void irq_free_ipi_mapping(struct ipi_mapping *map);
+int irq_map_ipi(struct ipi_mapping *map,
+		unsigned int cpu, irq_hw_number_t hwirq);
+int irq_unmap_ipi(struct ipi_mapping *map,
+		  unsigned int cpu, irq_hw_number_t *hwirq);
+
 #endif /* _LINUX_IRQ_H */
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index f9a59f6cabd2..9a9bc0822c8f 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1924,3 +1924,62 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 	return err;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
+
+struct ipi_mapping *irq_alloc_ipi_mapping(unsigned int nr_cpus)
+{
+	struct ipi_mapping *map;
+	int i;
+
+	map = kzalloc(sizeof(struct ipi_mapping), GFP_KERNEL);
+	if (!map)
+		return NULL;
+
+	map->nr_cpus = nr_cpus;
+
+	map->cpumap = kmalloc(sizeof(irq_hw_number_t) * nr_cpus, GFP_KERNEL);
+	if (!map->cpumap) {
+		kfree(map);
+		return NULL;
+	}
+
+	for (i = 0; i < nr_cpus; i++)
+		map->cpumap[i] = INVALID_HWIRQ;
+
+	return map;
+}
+
+void irq_free_ipi_mapping(struct ipi_mapping *map)
+{
+	kfree(map->cpumap);
+	kfree(map);
+}
+
+int irq_map_ipi(struct ipi_mapping *map,
+		unsigned int cpu, irq_hw_number_t hwirq)
+{
+	if (cpu >= map->nr_cpus)
+		return -EINVAL;
+
+	map->cpumap[cpu] = hwirq;
+	map->nr_hwirqs++;
+
+	return 0;
+}
+
+int irq_unmap_ipi(struct ipi_mapping *map,
+		  unsigned int cpu, irq_hw_number_t *hwirq)
+{
+	if (cpu >= map->nr_cpus)
+		return -EINVAL;
+
+	if (map->cpumap[cpu] == INVALID_HWIRQ)
+		return -EINVAL;
+
+	if (hwirq)
+		*hwirq = map->cpumap[cpu];
+
+	map->cpumap[cpu] = INVALID_HWIRQ;
+	map->nr_hwirqs--;
+
+	return 0;
+}
-- 
2.1.0
