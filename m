Received: from mailapp01.imgtec.com ([195.59.15.196]:33029 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009498AbbJMKQ6sXdbs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:16:58 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 07/14] irq: add a new generic IPI reservation code to irq core
Date: Tue, 13 Oct 2015 11:16:15 +0100
Message-ID: <1444731382-19313-8-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151013101615.11zSHF7rjzxNNFy-XrjQvti8QSby5slhF8TNrgEgX0g@z>

Add a generic mechanism to dynamically allocate an IPI.

With this change the user can call irq_reserve_ipi() to dynamically allocate an
IPI and use the associate virq to send one to 1 or more cpus.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irqdomain.h |  6 ++++
 kernel/irq/irqdomain.c    | 84 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 9b3dc6c2a3cc..f5003f5fd530 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -41,6 +41,7 @@ struct irq_domain;
 struct of_device_id;
 struct irq_chip;
 struct irq_data;
+struct ipi_mask;
 
 /* Number of irqs reserved for a legacy isa controller */
 #define NUM_ISA_INTERRUPTS	16
@@ -280,6 +281,11 @@ int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
 
+/* IPI functions */
+unsigned int irq_reserve_ipi(struct irq_domain *domain,
+			     const struct ipi_mask *dest);
+void irq_destroy_ipi(unsigned int irq);
+
 /* V2 interfaces to support hierarchy IRQ domains. */
 extern struct irq_data *irq_domain_get_irq_data(struct irq_domain *domain,
 						unsigned int virq);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dc9d27c0c158..781407f7d692 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -749,6 +749,90 @@ static int irq_domain_alloc_descs(int virq, unsigned int cnt,
 	return virq;
 }
 
+/**
+ * irq_reserve_ipi() - setup an IPI to destination cpumask
+ * @domain: IPI domain
+ * @dest: cpumask of cpus to receive the IPI
+ *
+ * Allocate a virq that can be used to send IPI to any CPU in dest mask.
+ *
+ * On success it'll return linux irq number and 0 on failure
+ */
+unsigned int irq_reserve_ipi(struct irq_domain *domain,
+			     const struct ipi_mask *dest)
+{
+	struct irq_data *data;
+	int virq;
+	unsigned int nr_irqs;
+
+	if (domain == NULL)
+		domain = irq_default_domain; /* need a separate ipi_default_domain? */
+
+	if (domain == NULL) {
+		pr_warn("Must provide a valid IPI domain!\n");
+		return 0;
+	}
+
+	if (!irq_domain_is_ipi(domain)) {
+		pr_warn("Not an IPI domain!\n");
+		return 0;
+	}
+
+	/* always allocate a virq per cpu */
+	nr_irqs = bitmap_weight(dest->cpumask, dest->nbits);;
+
+	virq = irq_domain_alloc_descs(-1, nr_irqs, 0, NUMA_NO_NODE);
+	if (virq <= 0) {
+		pr_warn("Can't reserve IPI, failed to alloc descs\n");
+		return 0;
+	}
+
+	/* we are reusing hierarchy alloc function, should we create another one? */
+	virq = __irq_domain_alloc_irqs(domain, virq, nr_irqs, NUMA_NO_NODE,
+					(void *) dest, true);
+	if (virq <= 0) {
+		pr_warn("Can't reserve IPI, failed to alloc irqs\n");
+		goto free_descs;
+	}
+
+	data = irq_get_irq_data(virq);
+	bitmap_copy(data->ipi_mask.cpumask, dest->cpumask, dest->nbits);
+	data->ipi_mask.nbits = dest->nbits;
+
+	return virq;
+
+free_descs:
+	irq_free_descs(virq, nr_irqs);
+	return 0;
+}
+
+/**
+ * irq_destroy_ipi() - unreserve an IPI that was previously allocated
+ * @irq: linux irq number to be destroyed
+ *
+ * Return an IPI allocated with irq_reserve_ipi() to the system.
+ */
+void irq_destroy_ipi(unsigned int irq)
+{
+	struct irq_data *data = irq_get_irq_data(irq);
+	struct irq_domain *domain;
+
+	if (!irq || !data)
+		return;
+
+	domain = data->domain;
+	if (WARN_ON(domain == NULL))
+		return;
+
+	if (!irq_domain_is_ipi(domain)) {
+		pr_warn("Not an IPI domain!\n");
+		return;
+	}
+
+	irq_domain_free_irqs(irq,
+		bitmap_weight(data->ipi_mask.cpumask, data->ipi_mask.nbits));
+}
+
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 /**
  * irq_domain_add_hierarchy - Add a irqdomain into the hierarchy
-- 
2.1.0
