Received: from mailapp01.imgtec.com ([195.59.15.196]:14546 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006954AbbLHNVbAToFZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Dec 2015 14:21:31 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v4 07/19] genirq: Make irq_domain_alloc_descs() non static
Date: Tue, 8 Dec 2015 13:20:18 +0000
Message-ID: <1449580830-23652-8-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1449580830-23652-1-git-send-email-qais.yousef@imgtec.com>
References: <1449580830-23652-1-git-send-email-qais.yousef@imgtec.com>
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
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, lisa.parratt@imgtec.com, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151208132018.tWxrm85yn516Um952HZXsr532wc19VSlbkHx0mj0lBk@z>

We will need to use this function to implement irq_reserve_ipi() later. So make
it non static and move the prototype to irqdomain.h to allow using it outside
irqdomain.c

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irqdomain.h | 2 ++
 kernel/irq/irqdomain.c    | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index f717796a4d5e..fcafae8e3aaf 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -212,6 +212,8 @@ struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
 extern struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
 						   enum irq_domain_bus_token bus_token);
 extern void irq_set_default_host(struct irq_domain *host);
+extern int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
+				  irq_hw_number_t hwirq, int node);
 
 static inline struct fwnode_handle *of_node_to_fwnode(struct device_node *node)
 {
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 22aa9612ef7c..c31ab8f67f06 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -23,8 +23,6 @@ static DEFINE_MUTEX(irq_domain_mutex);
 static DEFINE_MUTEX(revmap_trees_mutex);
 static struct irq_domain *irq_default_domain;
 
-static int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
-				  irq_hw_number_t hwirq, int node);
 static void irq_domain_check_hierarchy(struct irq_domain *domain);
 
 struct irqchip_fwid {
@@ -833,8 +831,8 @@ const struct irq_domain_ops irq_domain_simple_ops = {
 };
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
 
-static int irq_domain_alloc_descs(int virq, unsigned int cnt,
-				  irq_hw_number_t hwirq, int node)
+int irq_domain_alloc_descs(int virq, unsigned int cnt,
+			   irq_hw_number_t hwirq, int node)
 {
 	unsigned int hint;
 
-- 
2.1.0
