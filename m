Received: from mailapp01.imgtec.com ([195.59.15.196]:24524 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992881AbdC3THArNAIr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 21:07:00 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/5] irqchip: mips-cpu: Replace magic 0x100 with IE_SW0
Date: Thu, 30 Mar 2017 12:06:09 -0700
Message-ID: <20170330190614.14844-2-paul.burton@imgtec.com>
In-Reply-To: <20170330190614.14844-1-paul.burton@imgtec.com>
References: <20170330190614.14844-1-paul.burton@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170330190609.8qsJBAVZrr39jAOLC0yEr0DeOoiBMQREZVcQVS5Ttqk@z>

Replace use of the magic number 0x100 (ie. bit 8) with the more
explanatory IE_SW0 (ie. interrupt enable for software interrupt 0) or
C_SW0 (ie. cause bit for software interrupt 0) as appropriate.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 drivers/irqchip/irq-mips-cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 8c504f562e9d..e6b413669e57 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -41,13 +41,13 @@
 
 static inline void unmask_mips_irq(struct irq_data *d)
 {
-	set_c0_status(0x100 << (d->irq - MIPS_CPU_IRQ_BASE));
+	set_c0_status(IE_SW0 << (d->irq - MIPS_CPU_IRQ_BASE));
 	irq_enable_hazard();
 }
 
 static inline void mask_mips_irq(struct irq_data *d)
 {
-	clear_c0_status(0x100 << (d->irq - MIPS_CPU_IRQ_BASE));
+	clear_c0_status(IE_SW0 << (d->irq - MIPS_CPU_IRQ_BASE));
 	irq_disable_hazard();
 }
 
@@ -70,7 +70,7 @@ static unsigned int mips_mt_cpu_irq_startup(struct irq_data *d)
 {
 	unsigned int vpflags = dvpe();
 
-	clear_c0_cause(0x100 << (d->irq - MIPS_CPU_IRQ_BASE));
+	clear_c0_cause(C_SW0 << (d->irq - MIPS_CPU_IRQ_BASE));
 	evpe(vpflags);
 	unmask_mips_irq(d);
 	return 0;
@@ -83,7 +83,7 @@ static unsigned int mips_mt_cpu_irq_startup(struct irq_data *d)
 static void mips_mt_cpu_irq_ack(struct irq_data *d)
 {
 	unsigned int vpflags = dvpe();
-	clear_c0_cause(0x100 << (d->irq - MIPS_CPU_IRQ_BASE));
+	clear_c0_cause(C_SW0 << (d->irq - MIPS_CPU_IRQ_BASE));
 	evpe(vpflags);
 	mask_mips_irq(d);
 }
-- 
2.12.1
