Received: from mailapp01.imgtec.com ([195.59.15.196]:62712 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012414AbbKCLNm5mcq1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Nov 2015 12:13:42 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 06/14] genirq: Add struct ipi_mapping and its helper functions
Date: Tue, 3 Nov 2015 11:12:53 +0000
Message-ID: <1446549181-31788-7-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
References: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151103111253.5l90H23Es2lAAEEdzUC_cVJk5bGpK665jQ7aqAbKSh8@z>

struct ipi_mapping will provide a mechanism for irqchip code to fill out the
mapping at reservation and to look it up when sending.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 21 +++++++++++++
 kernel/irq/manage.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 2d3ff30c0cee..ccd53143cc1e 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1008,4 +1008,25 @@ static inline void ipi_mask_set_cpumask(struct ipi_mask *ipimask,
 	cpumask_copy(&ipimask->cpumask, cpumask);
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
+	unsigned int cpumap[];
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
index a71175ff98d5..67a71667a359 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2001,3 +2001,89 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 	return err;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
+
+/**
+ *	irq_alloc_ipi_mapping - allocate memory for struct ipi_mapping
+ *	@nr_cpus: number of CPUs the mapping will have
+ *
+ *	Will allocate and setup ipi_mapping structure.
+ *
+ *	Returns a valid ipi_mapping pointer on success and NULL on error.
+ */
+struct ipi_mapping *irq_alloc_ipi_mapping(unsigned int nr_cpus)
+{
+	struct ipi_mapping *map;
+	int i;
+
+	map = kzalloc(sizeof(struct ipi_mapping) +
+			BITS_TO_LONGS(nr_cpus), GFP_KERNEL);
+	if (!map)
+		return NULL;
+
+	map->nr_cpus = nr_cpus;
+
+	memset(map->cpumap, INVALID_HWIRQ, nr_cpus);
+
+	return map;
+}
+
+/**
+ *	irq_free_ipi_mapping - release mempry associated with ipi_mapping struct
+ *	@map: pointer to struct ipi_mapping to be freed
+ *
+ *	Release the memory allocated for sturct ipi_mapping to the system.
+ */
+void irq_free_ipi_mapping(struct ipi_mapping *map)
+{
+	kfree(map);
+}
+
+/**
+ *	irq_map_ipi - create a CPU to HWIRQ mapping for an IPI
+ *	@map: pointer to the mapping structure
+ *	@cpu: the CPU to map
+ *	@hwirq: the HWIRQ to associate with @cpu
+ *
+ *	Returns zero on success and negative error number on failure.
+ */
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
+/**
+ *	irq_unmap_ipi - remove the CPU mapping of an IPI
+ *	@map: pointer to the mapping structure
+ *	@cpu: the CPU to be unmapped
+ *	@hwirq: pointer to HWIRQ to be filled with old value before unampping
+ *
+ *	Mark the IPI mapping of a CPU to INVALID_HWIRQ setting @hwirq to the
+ *	old value before unamapping. This old value might be required by the
+ *	caller to return it to the pool of IPIs in a dynamic system.
+ *
+ *	Returns zero on success and negative error number on failure.
+ */
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
