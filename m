Received: from mailapp01.imgtec.com ([195.59.15.196]:40368 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010797AbbKYMIIPY3Af (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Nov 2015 13:08:08 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2 10/19] genirq: Add a new irq_send_ipi() to irq_chip
Date: Wed, 25 Nov 2015 12:06:48 +0000
Message-ID: <1448453217-3874-11-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151125120648.PBIX5xXVSC7ll36cYBbKcYA-edFEX2_ntQnjh3yt77c@z>

Introduce the new functions to allow generic IPI send mechanism to be
used from arch and drivers code.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 9a5d1e11a08f..ee01e89c2140 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -381,6 +381,10 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @irq_get_irqchip_state:	return the internal state of an interrupt
  * @irq_set_irqchip_state:	set the internal state of a interrupt
  * @irq_set_vcpu_affinity:	optional to target a vCPU in a virtual machine
+ * @ipi_send_single:	send a single IPI to destination cpus
+ * @ipi_send_mask:	send an IPI to destination cpus in cpumask
+ * @ipi_send_coproc_single:	send a single IPI to destination coprocessor
+ * @ipi_send_coproc_mask:	send an IPI to destination corocessors in ipi_mask
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -425,6 +429,11 @@ struct irq_chip {
 
 	int		(*irq_set_vcpu_affinity)(struct irq_data *data, void *vcpu_info);
 
+	void		(*ipi_send_single)(struct irq_data *data, unsigned int cpu);
+	void		(*ipi_send_mask)(struct irq_data *data, const struct cpumask *dest);
+	void		(*ipi_send_coproc_single)(struct irq_data *data, unsigned int cpu);
+	void		(*ipi_send_coproc_mask)(struct irq_data *data, const struct ipi_mask *dest);
+
 	unsigned long	flags;
 };
 
-- 
2.1.0
