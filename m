Received: from mailapp01.imgtec.com ([195.59.15.196]:4095 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009454AbbJMKQqairhs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:16:46 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 01/14] irq: add new IRQ_DOMAIN_FLAGS_IPI
Date: Tue, 13 Oct 2015 11:16:09 +0100
Message-ID: <1444731382-19313-2-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151013101609.02ABozHfpxsVGcjKFl5sIXuoToeQspCi6pEaxgCbB0w@z>

This flag will be used to identify an IPI domain.

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
