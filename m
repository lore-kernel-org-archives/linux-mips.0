Received: from mailapp01.imgtec.com ([195.59.15.196]:18870 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011814AbbLBMWQ5pXjA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Dec 2015 13:22:16 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v3 01/19] genirq: Add new IRQ_DOMAIN_FLAGS_IPI
Date: Wed, 2 Dec 2015 12:21:42 +0000
Message-ID: <1449058920-21011-2-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151202122142.qVzJuSoqXiTLo_1jqB01QsQuXo0jVWIDeexmmWYKktI@z>

This flag will be used to identify an IPI domain.

We have two types:

	- PER_CPU: indicating a virq for each IPI
	- SINGLE: indicating a single virq for all IPIs

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irqdomain.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index d5e5c5bef28c..c1a59f37674d 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -171,6 +171,12 @@ enum {
 	/* Core calls alloc/free recursive through the domain hierarchy. */
 	IRQ_DOMAIN_FLAG_AUTO_RECURSIVE	= (1 << 1),
 
+	/* Irq domain is an IPI domain with virq per cpu */
+	IRQ_DOMAIN_FLAG_IPI_PER_CPU	= (1 << 2),
+
+	/* Irq domain is an IPI domain with single virq */
+	IRQ_DOMAIN_FLAG_IPI_SINGLE	= (1 << 3),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the
@@ -391,6 +397,22 @@ static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
 }
+
+static inline bool irq_domain_is_ipi(struct irq_domain *domain)
+{
+	return domain->flags &
+		(IRQ_DOMAIN_FLAG_IPI_PER_CPU | IRQ_DOMAIN_FLAG_IPI_SINGLE);
+}
+
+static inline bool irq_domain_is_ipi_per_cpu(struct irq_domain *domain)
+{
+	return domain->flags & IRQ_DOMAIN_FLAG_IPI_PER_CPU;
+}
+
+static inline bool irq_domain_is_ipi_single(struct irq_domain *domain)
+{
+	return domain->flags & IRQ_DOMAIN_FLAG_IPI_SINGLE;
+}
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 static inline void irq_domain_activate_irq(struct irq_data *data) { }
 static inline void irq_domain_deactivate_irq(struct irq_data *data) { }
@@ -404,6 +426,21 @@ static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return false;
 }
+
+static inline bool irq_domain_is_ipi(struct irq_domain *domain)
+{
+	return false;
+}
+
+static inline bool irq_domain_is_ipi_per_cpu(struct irq_domain *domain)
+{
+	return false;
+}
+
+static inline bool irq_domain_is_ipi_single(struct irq_domain *domain)
+{
+	return false;
+}
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
 #else /* CONFIG_IRQ_DOMAIN */
-- 
2.1.0
