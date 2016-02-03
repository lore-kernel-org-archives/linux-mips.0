Received: from mailapp01.imgtec.com ([195.59.15.196]:38886 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009963AbcBCDSF6x4J0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:18:05 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/15] irqchip: mips-gic: Use HW IDs for VPE_OTHER_ADDR
Date: Wed, 3 Feb 2016 03:15:27 +0000
Message-ID: <1454469335-14778-8-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
References: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Message-ID: <20160203031527.0iIiOamgyISfyLPQn3tbDPOM1B2En_d6R_8z4g0KIF0@z>

The Linux CPU number doesn't necessarily match up with the ID used for a
VP by hardware. Convert the CPU number to the HW ID using mips_cm_vp_id
when writing to the VP(E)_OTHER_ADDR register in order to ensure that we
correctly access registers for the VPs of secondary cores. This most
notably affects systems using CM3, such as those based around I6400.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/irqchip/irq-mips-gic.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 9e17ef2..787bafc 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -181,7 +181,7 @@ void gic_write_cpu_compare(cycle_t cnt, int cpu)
 
 	local_irq_save(flags);
 
-	gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), cpu);
+	gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), mips_cm_vp_id(cpu));
 
 	if (mips_cm_is64) {
 		gic_write(GIC_REG(VPE_OTHER, GIC_VPE_COMPARE), cnt);
@@ -534,7 +534,8 @@ static void gic_mask_local_irq_all_vpes(struct irq_data *d)
 
 	spin_lock_irqsave(&gic_lock, flags);
 	for (i = 0; i < gic_vpes; i++) {
-		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), i);
+		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR),
+			  mips_cm_vp_id(i));
 		gic_write32(GIC_REG(VPE_OTHER, GIC_VPE_RMASK), 1 << intr);
 	}
 	spin_unlock_irqrestore(&gic_lock, flags);
@@ -548,7 +549,8 @@ static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
 
 	spin_lock_irqsave(&gic_lock, flags);
 	for (i = 0; i < gic_vpes; i++) {
-		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), i);
+		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR),
+			  mips_cm_vp_id(i));
 		gic_write32(GIC_REG(VPE_OTHER, GIC_VPE_SMASK), 1 << intr);
 	}
 	spin_unlock_irqrestore(&gic_lock, flags);
@@ -665,7 +667,8 @@ static void __init gic_basic_init(void)
 	for (i = 0; i < gic_vpes; i++) {
 		unsigned int j;
 
-		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), i);
+		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR),
+			  mips_cm_vp_id(i));
 		for (j = 0; j < GIC_NUM_LOCAL_INTRS; j++) {
 			if (!gic_local_irq_is_routable(j))
 				continue;
@@ -710,7 +713,8 @@ static int gic_local_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	for (i = 0; i < gic_vpes; i++) {
 		u32 val = GIC_MAP_TO_PIN_MSK | gic_cpu_pin;
 
-		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), i);
+		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR),
+			  mips_cm_vp_id(i));
 
 		switch (intr) {
 		case GIC_LOCAL_INT_WD:
-- 
2.7.0
