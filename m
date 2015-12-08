Received: from mailapp01.imgtec.com ([195.59.15.196]:36592 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007016AbbLHNVPu0LjZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Dec 2015 14:21:15 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v4 05/19] genirq: Add ipi_offset to irq_common_data
Date: Tue, 8 Dec 2015 13:20:16 +0000
Message-ID: <1449580830-23652-6-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151208132016.fkAvgvDVuec8NxLDgwR0SO8HjDi339Mj7eRfHW0-fNA@z>

IPIs are always assumed to be consecutively allocated, hence virqs and hwirqs
can be inferred by using CPU id as an offset. But the first cpu doesn't always
have to start at position 0. ipi_offset stores the position of the first cpu so
that we can easily calculate the virq or hwirq of an IPI associated with a
specific cpu.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 14f1c036119c..6bcbd11207ea 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -150,6 +150,7 @@ struct ipi_mapping {
  * @ipi_mapping:	Contains the hwirq mapping of IPIs.
  *			The use of this struct is optional and not all irqchips
  *			will use it.
+ * @ipi_offset:		offset of first IPI in the mask
  */
 struct irq_common_data {
 	unsigned int		state_use_accessors;
@@ -161,6 +162,7 @@ struct irq_common_data {
 	cpumask_var_t		affinity;
 #ifdef CONFIG_GENERIC_IRQ_IPI
 	struct ipi_mapping	*ipi_map;
+	unsigned int		ipi_offset;
 #endif
 };
 
-- 
2.1.0
