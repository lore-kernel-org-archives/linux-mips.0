Received: from mailapp01.imgtec.com ([195.59.15.196]:65357 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011996AbbLBMW1ymw2A (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Dec 2015 13:22:27 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v3 11/19] genirq: Implement ipi_send_{mask, single}()
Date: Wed, 2 Dec 2015 12:21:52 +0000
Message-ID: <1449058920-21011-12-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1449058920-21011-1-git-send-email-qais.yousef@imgtec.com>
References: <1449058920-21011-1-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151202122152.j7iSCwi9Bbz3Ev2HTlVJlV8zIzz4m4sSl3ydxxt1ps0@z>

Add APIs to send single or mask IPI. We have 2 variants, one that uses cpumask
and to be used by arch code to send regular SMP IPIs. And another that uses
ipi_mask to be used by drivers to send IPIs to coprocessors.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h |   5 ++
 kernel/irq/ipi.c    | 165 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index b0556c5787d7..f521f1ac36d4 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -988,4 +988,9 @@ irq_hw_number_t irq_ipi_mapping_get_hwirq(struct ipi_mapping *map,
 
 irq_hw_number_t ipi_get_hwirq(unsigned int irq, unsigned int cpu);
 
+int __ipi_send_single(struct irq_desc *desc, unsigned int cpu);
+int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
+int ipi_send_single(unsigned int virq, unsigned int cpu);
+int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
+
 #endif /* _LINUX_IRQ_H */
diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index 814162b72aed..02882ca8f336 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -270,3 +270,168 @@ irq_hw_number_t ipi_get_hwirq(unsigned int irq, unsigned int cpu)
 	return hwirq;
 }
 EXPORT_SYMBOL_GPL(ipi_get_hwirq);
+
+/**
+ * __ipi_send_single - send an IPI to a target Linux SMP CPU
+ * @desc: pointer to irq_desc of the IRQ
+ * @cpu: dest CPU, must be the same or a subset of the mask passed to
+ *        irq_reserve_ipi()
+ *
+ * Sends an IPI to a single smp cpu
+ * This function is meant to be used from arch code to send single SMP IPI.
+ *
+ * Returns zero on success and negative error number on failure.
+ */
+int __ipi_send_single(struct irq_desc *desc, unsigned int cpu)
+{
+	struct irq_data *data = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct cpumask *dest = cpumask_of(cpu);
+
+#ifdef DEBUG
+	/*
+	 * Minimise the overhead by omitting the checks for Linux SMP IPIs.
+	 * Since the callers should be ARCH code which is generally trusted,
+	 * only check for errors when debugging.
+	 */
+	struct cpumask *ipimask = data ? irq_data_get_affinity_mask(data) : NULL;
+
+	if (!chip || !ipimask)
+		return -EINVAL;
+
+	if (!chip->ipi_send_single && !chip->ipi_send_mask)
+		return -EINVAL;
+
+	if (cpu > nr_cpu_ids)
+		return -EINVAL;
+
+	if (!cpumask_test_cpu(cpu, ipimask))
+		return -EINVAL;
+#endif
+
+	if (chip->ipi_send_single)
+		chip->ipi_send_single(data, cpu);
+	else
+		chip->ipi_send_mask(data, dest);
+	return 0;
+}
+
+/**
+ * ipi_send_mask - send an IPI to target Linux SMP CPU(s)
+ * @desc: pointer to irq_desc of the IRQ
+ * @dest: dest CPU(s), must be the same or a subset of the mask passed to
+ *        irq_reserve_ipi()
+ *
+ * Sends an IPI to all smp cpus in dest mask.
+ * This function is meant to be used from arch code to send SMP IPIs.
+ *
+ * Returns zero on success and negative error number on failure.
+ */
+int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest)
+{
+	struct irq_data *data = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	unsigned int cpu;
+
+#ifdef DEBUG
+	/*
+	 * Minimise the overhead by omitting the checks for Linux SMP IPIs.
+	 * Since the callers should be ARCH code which is generally trusted,
+	 * only check for errors when debugging.
+	 */
+	struct cpumask *ipimask = data ? irq_data_get_affinity_mask(data) : NULL;
+
+	if (!chip || !ipimask)
+		return -EINVAL;
+
+	if (!chip->ipi_send_single && !chip->ipi_send_mask)
+		return -EINVAL;
+
+	if (!cpumask_subset(dest, ipimask))
+		return -EINVAL;
+#endif
+
+	if (chip->ipi_send_mask) {
+		chip->ipi_send_mask(data, dest);
+		return 0;
+	}
+
+	if (irq_domain_is_ipi_per_cpu(data->domain)) {
+		unsigned int base_virq = data->irq;
+		for_each_cpu(cpu, dest) {
+			data = irq_get_irq_data(base_virq + cpu - data->common->ipi_offset);
+			chip->ipi_send_single(data, cpu);
+		}
+	} else {
+		for_each_cpu(cpu, dest)
+			chip->ipi_send_single(data, cpu);
+	}
+
+	return 0;
+}
+
+/**
+ * ipi_send_single - send an IPI to a single CPU
+ * @virq: linux irq number from irq_reserve_ipi()
+ * @cpu: CPU ID. Must be a subset of the mask passed to irq_reserve_ipi()
+ *
+ * Sends an IPI to destination CPU
+ *
+ * Returns zero on success and negative error number on failure.
+ */
+int ipi_send_single(unsigned int virq, unsigned int cpu)
+{
+	struct irq_desc *desc = irq_to_desc(virq);
+	struct irq_data *data = desc ? irq_desc_get_irq_data(desc) : NULL;
+	struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
+	struct cpumask *ipimask = data ? irq_data_get_affinity_mask(data) : NULL;
+
+	if (!chip || !ipimask)
+		return -EINVAL;
+
+	if (!chip->ipi_send_single && !chip->ipi_send_mask)
+		return -EINVAL;
+
+	if (cpu > nr_cpu_ids)
+		return -EINVAL;
+
+	if (!cpumask_test_cpu(cpu, ipimask))
+		return -EINVAL;
+
+	__ipi_send_single(desc, cpu);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ipi_send_single);
+
+/**
+ * ipi_send_mask - send an IPI to target CPU(s)
+ * @virq: linux irq number from irq_reserve_ipi()
+ * @dest: dest CPU(s), must be the same or a subset of the mask passed to
+ *        irq_reserve_ipi()
+ *
+ * Sends an IPI to all prcessors in dest mask.
+ *
+ * Returns zero on success and negative error number on failure.
+ */
+int ipi_send_mask(unsigned int virq, const struct cpumask *dest)
+{
+	struct irq_desc *desc = irq_to_desc(virq);
+	struct irq_data *data = desc ? irq_desc_get_irq_data(desc) : NULL;
+	struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
+	struct cpumask *ipimask = data ? irq_data_get_affinity_mask(data) : NULL;
+
+	if (!chip || !ipimask)
+		return -EINVAL;
+
+	if (!chip->ipi_send_single && !chip->ipi_send_mask)
+		return -EINVAL;
+
+	if (!cpumask_subset(dest, ipimask))
+		return -EINVAL;
+
+	__ipi_send_mask(desc, dest);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ipi_send_mask);
-- 
2.1.0
