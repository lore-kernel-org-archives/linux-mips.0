Received: from mailapp01.imgtec.com ([195.59.15.196]:46539 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009467AbbJMKQxp2iis (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:16:53 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 04/14] irq: add a new irq_send_ipi() to irq_chip
Date: Tue, 13 Oct 2015 11:16:12 +0100
Message-ID: <1444731382-19313-5-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151013101612.mVAovNezMAcxJrt5T2AkScMNr7D-mgbQ9Tt2WCNbHto@z>

Introduce the new function to allow generic IPI send mechanism to be
used from drivers code.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 4b537e4d393b..504133671985 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -369,6 +369,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @irq_get_irqchip_state:	return the internal state of an interrupt
  * @irq_set_irqchip_state:	set the internal state of a interrupt
  * @irq_set_vcpu_affinity:	optional to target a vCPU in a virtual machine
+ * @irq_send_ipi:	send an IPI to destination cpus
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -413,6 +414,8 @@ struct irq_chip {
 
 	int		(*irq_set_vcpu_affinity)(struct irq_data *data, void *vcpu_info);
 
+	void		(*irq_send_ipi)(struct irq_data *data, const struct ipi_mask *dest);
+
 	unsigned long	flags;
 };
 
-- 
2.1.0
