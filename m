Received: from mailapp01.imgtec.com ([195.59.15.196]:18087 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009971AbbGIJlyYIWch (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:54 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 15/19] drivers: irqchip: irq-mips-gic: Add support for CM3 64-bit timer irqs
Date: Thu, 9 Jul 2015 10:40:49 +0100
Message-ID: <1436434853-30001-16-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Bresticker <abrestic@chromium.org>
Message-ID: <20150709094049.HF9FVw_6UbDBUfvHEcY5E2arFqjklRHROH_PggkWQUA@z>

CM3 uses a 64-bit counter and compare registers so add support for
them in the GIC counter interrupt.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 drivers/irqchip/irq-mips-gic.c   | 33 ++++++++++++++++++++++++---------
 include/linux/irqchip/mips-gic.h |  4 ++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 29c494691b71..def7a9be36a0 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -140,6 +140,9 @@ cycle_t gic_read_count(void)
 {
 	unsigned int hi, hi2, lo;
 
+	if (mips_cm_is64)
+		return (cycle_t)gic_read(GIC_REG(SHARED, GIC_SH_COUNTER));
+
 	do {
 		hi = gic_read32(GIC_REG(SHARED, GIC_SH_COUNTER_63_32));
 		lo = gic_read32(GIC_REG(SHARED, GIC_SH_COUNTER_31_00));
@@ -162,10 +165,14 @@ unsigned int gic_get_count_width(void)
 
 void gic_write_compare(cycle_t cnt)
 {
-	gic_write32(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_HI),
-				(int)(cnt >> 32));
-	gic_write32(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_LO),
-				(int)(cnt & 0xffffffff));
+	if (mips_cm_is64) {
+		gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE), cnt);
+	} else {
+		gic_write32(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_HI),
+					(int)(cnt >> 32));
+		gic_write32(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_LO),
+					(int)(cnt & 0xffffffff));
+	}
 }
 
 void gic_write_cpu_compare(cycle_t cnt, int cpu)
@@ -174,11 +181,16 @@ void gic_write_cpu_compare(cycle_t cnt, int cpu)
 
 	local_irq_save(flags);
 
-	gic_write32(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), cpu);
-	gic_write32(GIC_REG(VPE_OTHER, GIC_VPE_COMPARE_HI),
-				(int)(cnt >> 32));
-	gic_write32(GIC_REG(VPE_OTHER, GIC_VPE_COMPARE_LO),
-				(int)(cnt & 0xffffffff));
+	gic_write(GIC_REG(VPE_LOCAL, GIC_VPE_OTHER_ADDR), cpu);
+
+	if (mips_cm_is64) {
+		gic_write(GIC_REG(VPE_OTHER, GIC_VPE_COMPARE), cnt);
+	} else {
+		gic_write32(GIC_REG(VPE_OTHER, GIC_VPE_COMPARE_HI),
+					(int)(cnt >> 32));
+		gic_write32(GIC_REG(VPE_OTHER, GIC_VPE_COMPARE_LO),
+					(int)(cnt & 0xffffffff));
+	}
 
 	local_irq_restore(flags);
 }
@@ -187,6 +199,9 @@ cycle_t gic_read_compare(void)
 {
 	unsigned int hi, lo;
 
+	if (mips_cm_is64)
+		return (cycle_t)gic_read(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE));
+
 	hi = gic_read32(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_HI));
 	lo = gic_read32(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_LO));
 
diff --git a/include/linux/irqchip/mips-gic.h b/include/linux/irqchip/mips-gic.h
index 10e4a9073019..4e6861605050 100644
--- a/include/linux/irqchip/mips-gic.h
+++ b/include/linux/irqchip/mips-gic.h
@@ -41,6 +41,8 @@
 
 /* Shared Global Counter */
 #define GIC_SH_COUNTER_31_00_OFS	0x0010
+/* 64-bit counter register for CM3 */
+#define GIC_SH_COUNTER_OFS		GIC_SH_COUNTER_31_00_OFS
 #define GIC_SH_COUNTER_63_32_OFS	0x0014
 #define GIC_SH_REVISIONID_OFS		0x0020
 
@@ -104,6 +106,8 @@
 #define GIC_VPE_WD_COUNT0_OFS		0x0094
 #define GIC_VPE_WD_INITIAL0_OFS		0x0098
 #define GIC_VPE_COMPARE_LO_OFS		0x00a0
+/* 64-bit Compare register on CM3 */
+#define GIC_VPE_COMPARE_OFS		GIC_VPE_COMPARE_LO_OFS
 #define GIC_VPE_COMPARE_HI_OFS		0x00a4
 
 #define GIC_VPE_EIC_SHADOW_SET_BASE_OFS	0x0100
-- 
2.4.5
