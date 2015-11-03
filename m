Received: from mailapp01.imgtec.com ([195.59.15.196]:61060 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012406AbbKCLNlloLC1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Nov 2015 12:13:41 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 05/14] genirq: Add struct ipi_mask to irq_data
Date: Tue, 3 Nov 2015 11:12:52 +0000
Message-ID: <1446549181-31788-6-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151103111252.FPk8BLodKo9Y-5Blyjw5C9I97Hbz51jz5unqIyKeNas@z>

It has a similar role to affinity mask, but tracks the IPI affinity instead.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 77ed4c53ef64..2d3ff30c0cee 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -164,6 +164,7 @@ struct irq_common_data {
 	void			*handler_data;
 	struct msi_desc		*msi_desc;
 	cpumask_var_t		affinity;
+	struct ipi_mask		*ipi_mask;
 };
 
 /**
@@ -689,6 +690,11 @@ static inline int irq_data_get_node(struct irq_data *d)
 	return irq_common_data_get_node(d->common);
 }
 
+static inline struct cpumask *irq_data_get_ipi_mask(struct irq_data *d)
+{
+	return &d->common->ipi_mask->cpumask;
+}
+
 static inline struct cpumask *irq_get_affinity_mask(int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
-- 
2.1.0
