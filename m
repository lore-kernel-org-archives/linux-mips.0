Received: from mailapp01.imgtec.com ([195.59.15.196]:25655 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013345AbbLHNVP5308Z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Dec 2015 14:21:15 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v4 06/19] genirq: Add an extra comment about the use of affinity in irq_common_data
Date: Tue, 8 Dec 2015 13:20:17 +0000
Message-ID: <1449580830-23652-7-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151208132017.bLQB7mDnHa5BkVSbvQJHerT4FqP9DYamNunfRNTnxQ4@z>

Affinity will have dual meaning depends on the type of the irq. If it is
a normal irq, it'll have the standard affinity meaning.

If it is an IPI, it will hold the IPI mask of the cpus it can talk to.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 6bcbd11207ea..7f6dd4eec207 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -145,7 +145,9 @@ struct ipi_mapping {
  *			Use accessor functions to deal with it
  * @node:		node index useful for balancing
  * @handler_data:	per-IRQ data for the irq_chip methods
- * @affinity:		IRQ affinity on SMP
+ * @affinity:		IRQ affinity on SMP.
+ *			If this is an IPI irq data, this will be the IPI mask
+ *			of the cpus it can talk to.
  * @msi_desc:		MSI descriptor
  * @ipi_mapping:	Contains the hwirq mapping of IPIs.
  *			The use of this struct is optional and not all irqchips
-- 
2.1.0
