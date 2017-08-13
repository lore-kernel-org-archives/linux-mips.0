Received: from mailapp01.imgtec.com ([195.59.15.196]:54348 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993932AbdHMEs6Rss5d (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:48:58 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 38/38] irqchip: mips-gic: Let the core set struct irq_common_data affinity
Date: Sat, 12 Aug 2017 21:36:46 -0700
Message-ID: <20170813043646.25821-39-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043646.RyXFWNaju92G_e9VPKarJ6Fkr0yJPwfMRbSqM2q32Rs@z>

gic_set_affinity() manually copies the provided cpumask to the struct
irq_common_data affinity field, returning IRQ_SET_MASK_OK_NOCOPY in
order to prevent the core code from doing that.

We can instead simply let the core code do it for us, by returning
IRQ_SET_MASK_OK instead of IRQ_SET_MASK_OK_NOCOPY & doing the copy
ourselves.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org

---

 drivers/irqchip/irq-mips-gic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index cd9cbda1f263..11bab55e18bd 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -266,10 +266,9 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	/* Update the pcpu_masks */
 	gic_setup_pcpu_mask(irq, read_gic_mask(irq) ? cpu : NR_CPUS);
 
-	cpumask_copy(irq_data_get_affinity_mask(d), cpumask);
 	spin_unlock_irqrestore(&gic_lock, flags);
 
-	return IRQ_SET_MASK_OK_NOCOPY;
+	return IRQ_SET_MASK_OK;
 }
 #endif
 
-- 
2.14.0
