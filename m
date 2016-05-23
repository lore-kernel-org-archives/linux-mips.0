Received: from mailapp01.imgtec.com ([195.59.15.196]:48985 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27030241AbcEWLGjb0vQg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 May 2016 13:06:39 +0200
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH] irqchip/mips-gic: Fix IRQs in gic_dev_domain
Date: Mon, 23 May 2016 12:05:52 +0100
Message-ID: <1464001552-31174-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Qais Yousef <qsyousef@gmail.com>
Message-ID: <20160523110552.xVmWpKItCP4Gwz2YOn6e4-vrJYD8o6ieou9ge1D-dx4@z>

When allocating a new device IRQ, gic_dev_domain_alloc() correctly calls
irq_domain_set_hwirq_and_chip(), but gic_irq_domain_alloc() does not. This
means that gic_irq_domain believes all IRQs from the dev domain have an
hwirq of 0 and creates incorrect mappings in the linear_revmap. As
gic_irq_domain is a parent of the gic_dev_domain, this leads to an
inability to boot on devices with a GIC. Excerpt of the error:

[    2.297649] irq 0: nobody cared (try booting with the "irqpoll" option)
...
[    2.436963] handlers:
[    2.439492] Disabling IRQ #0

Fix this by calling irq_domain_set_hwirq_and_chip() for both the dev and
irq domain.

Now that we are modifying the parent domain, be sure to clear it up in
case of an allocation error.

Fixes: c98c1822ee13 ("irqchip/mips-gic: Add device hierarchy domain")
Fixes: 2af70a962070 ("irqchip/mips-gic: Add a IPI hierarchy domain")
Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Tested-by: Govindraj Raja <Govindraj.Raja@imgtec.com> # On Pistachio SoC
Reviewed-by: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: <linux-mips@linux-mips.org>
Cc: <linux-kernel@vger.kernel.org>
Cc: Qais Yousef <qsyousef@gmail.com>
---
 drivers/irqchip/irq-mips-gic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 4dffccf..40fb120 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -734,6 +734,12 @@ static int gic_irq_domain_alloc(struct irq_domain *d, unsigned int virq,
 		/* verify that it doesn't conflict with an IPI irq */
 		if (test_bit(spec->hwirq, ipi_resrv))
 			return -EBUSY;
+
+		hwirq = GIC_SHARED_TO_HWIRQ(spec->hwirq);
+
+		return irq_domain_set_hwirq_and_chip(d, virq, hwirq,
+						     &gic_level_irq_controller,
+						     NULL);
 	} else {
 		base_hwirq = find_first_bit(ipi_resrv, gic_shared_intrs);
 		if (base_hwirq == gic_shared_intrs) {
@@ -855,10 +861,14 @@ static int gic_dev_domain_alloc(struct irq_domain *d, unsigned int virq,
 						    &gic_level_irq_controller,
 						    NULL);
 		if (ret)
-			return ret;
+			goto error;
 	}
 
 	return 0;
+
+error:
+	irq_domain_free_irqs_parent(d, virq, nr_irqs);
+	return ret;
 }
 
 void gic_dev_domain_free(struct irq_domain *d, unsigned int virq,
-- 
2.8.2
