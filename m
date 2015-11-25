Received: from mailapp01.imgtec.com ([195.59.15.196]:10510 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012723AbbKYMIAIwxef (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Nov 2015 13:08:00 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2 05/19] genirq: Add struct ipi_mask to irq_data
Date: Wed, 25 Nov 2015 12:06:43 +0000
Message-ID: <1448453217-3874-6-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
References: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151125120643.7zF18NIsp4vsXcCyYkvREBUINRaqTl40SQPbT1z4G5M@z>

It has a similar role to affinity mask, but tracks the IPI affinity instead.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 7d8c3d88f16f..fcdcb9394e75 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -168,6 +168,9 @@ struct irq_common_data {
 	void			*handler_data;
 	struct msi_desc		*msi_desc;
 	cpumask_var_t		affinity;
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	struct ipi_mask		*ipi_mask;
+#endif
 };
 
 /**
@@ -705,6 +708,21 @@ static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 	return d->common->affinity;
 }
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+
+static inline struct ipi_mask *irq_data_get_ipi_mask(struct irq_data *d)
+{
+	return d->common->ipi_mask;
+}
+
+static inline void irq_data_set_ipi_mask(struct irq_data *d,
+					 struct ipi_mask *ipimask)
+{
+	d->common->ipi_mask = ipimask;
+}
+
+#endif
+
 unsigned int arch_dynirq_lower_bound(unsigned int from);
 
 int __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
-- 
2.1.0
