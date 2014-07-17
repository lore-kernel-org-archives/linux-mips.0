Received: from mailapp01.imgtec.com ([195.59.15.196]:41822 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861307AbaGQIVuFCsKt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Jul 2014 10:21:50 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 4/7] MIPS: GIC: Prevent array overrun
Date: Thu, 17 Jul 2014 09:20:56 +0100
Message-ID: <1405585259-24941-5-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405585259-24941-1-git-send-email-markos.chandras@imgtec.com>
References: <1405585259-24941-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Jeffrey Deans <jeffrey.deans@imgtec.com>, stable@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140717082056.Qgb3igAIsALdK40IqKM8iLPxRSNRJ_3NF1b_DhMl-So@z>

From: Jeffrey Deans <jeffrey.deans@imgtec.com>

A GIC interrupt which is declared as having a GIC_MAP_TO_NMI_MSK
mapping causes the cpu parameter to gic_setup_intr() to be increased
to 32, causing memory corruption when pcpu_masks[] is written to again
later in the function.

Cc: stable@vger.kernel.org
Signed-off-by: Jeffrey Deans <jeffrey.deans@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/irq-gic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/irq-gic.c b/arch/mips/kernel/irq-gic.c
index 71cf45a335b6..9932aef91abb 100644
--- a/arch/mips/kernel/irq-gic.c
+++ b/arch/mips/kernel/irq-gic.c
@@ -281,11 +281,13 @@ static void __init gic_setup_intr(unsigned int intr, unsigned int cpu,
 
 	/* Setup Intr to Pin mapping */
 	if (pin & GIC_MAP_TO_NMI_MSK) {
+		int i;
+
 		GICWRITE(GIC_REG_ADDR(SHARED, GIC_SH_MAP_TO_PIN(intr)), pin);
 		/* FIXME: hack to route NMI to all cpu's */
-		for (cpu = 0; cpu < NR_CPUS; cpu += 32) {
+		for (i = 0; i < NR_CPUS; i += 32) {
 			GICWRITE(GIC_REG_ADDR(SHARED,
-					  GIC_SH_MAP_TO_VPE_REG_OFF(intr, cpu)),
+					  GIC_SH_MAP_TO_VPE_REG_OFF(intr, i)),
 				 0xffffffff);
 		}
 	} else {
-- 
2.0.0
