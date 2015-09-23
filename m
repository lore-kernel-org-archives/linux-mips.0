Received: from mailapp01.imgtec.com ([195.59.15.196]:26070 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008227AbbIWOttPo9Hn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Sep 2015 16:49:49 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 1/6] irqdomain: add new IRQ_DOMAIN_FLAGS_IPI
Date: Wed, 23 Sep 2015 15:49:13 +0100
Message-ID: <1443019758-20620-2-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
References: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
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
To: linux-kernel@vger.kernel.org, tglx@linutronix.de
Cc: marc.zyngier@arm.com, jason@lakedaemon.net, jiang.liu@linux.intel.com, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20150923144913.4mOWmnG0l2hmfZG1mz22xgYURxrP-aTDTQPGIgKtnzM@z>

This flag will be used to identify an IPI domain.

The idea is to reuse the alloc functions to allocate an IPI if it's set.

We could alternatively add a separate new alloc_ipi() function to struct
domain_ops.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irqdomain.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index d3ca79236fb0..9b3dc6c2a3cc 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -153,6 +153,9 @@ enum {
 	/* Core calls alloc/free recursive through the domain hierarchy. */
 	IRQ_DOMAIN_FLAG_AUTO_RECURSIVE	= (1 << 1),
 
+	/* Irq domain is an IPI domain */
+	IRQ_DOMAIN_FLAG_IPI		= (1 << 2),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the
@@ -326,6 +329,11 @@ static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
 }
+
+static inline bool irq_domain_is_ipi(struct irq_domain *domain)
+{
+	return domain->flags & IRQ_DOMAIN_FLAG_IPI;
+}
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 static inline void irq_domain_activate_irq(struct irq_data *data) { }
 static inline void irq_domain_deactivate_irq(struct irq_data *data) { }
@@ -339,6 +347,11 @@ static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return false;
 }
+
+static inline bool irq_domain_is_ipi(struct irq_domain *domain)
+{
+	return false;
+}
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
 #else /* CONFIG_IRQ_DOMAIN */
-- 
2.1.0
