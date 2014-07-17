Received: from mailapp01.imgtec.com ([195.59.15.196]:9013 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861304AbaGQIVssuoN0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Jul 2014 10:21:48 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DC4FA8A82CEE8
        for <linux-mips@linux-mips.org>; Thu, 17 Jul 2014 09:21:39 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/7] MIPS: GIC: Remove GIC_FLAG_IPI
Date: Thu, 17 Jul 2014 09:20:55 +0100
Message-ID: <1405585259-24941-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405585259-24941-1-git-send-email-markos.chandras@imgtec.com>
References: <1405585259-24941-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140717082055.EumbqBc4K5cpiweGlT52AhwUlk73Dunhcc5R-6Tu9Qk@z>

From: Jeffrey Deans <jeffrey.deans@imgtec.com>

irq-gic.c:gic_get_int() masks out interrupts from the pending set which
aren’t in the pcpu_mask. Only interrupts marked with GIC_FLAG_IPI were
set in pcpu_mask, meaning that peripheral interrupts also had to be
marked as IPIs. Remove the use of GIC_FLAG_IPI and allow the flags
member of struct gic_intr_map to be zero.

Signed-off-by: Jeffrey Deans <jeffrey.deans@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/gic.h     | 3 +--
 arch/mips/kernel/irq-gic.c      | 7 +++----
 arch/mips/mti-malta/malta-int.c | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/gic.h b/arch/mips/include/asm/gic.h
index 80804c16bb9d..394d366b8fc1 100644
--- a/arch/mips/include/asm/gic.h
+++ b/arch/mips/include/asm/gic.h
@@ -317,8 +317,7 @@ struct gic_intr_map {
 	unsigned int polarity;	/* Polarity : +/-	*/
 	unsigned int trigtype;	/* Trigger  : Edge/Levl */
 	unsigned int flags;	/* Misc flags	*/
-#define GIC_FLAG_IPI	       0x01
-#define GIC_FLAG_TRANSPARENT   0x02
+#define GIC_FLAG_TRANSPARENT   0x01
 };
 
 /*
diff --git a/arch/mips/kernel/irq-gic.c b/arch/mips/kernel/irq-gic.c
index a1dea3ea59a0..71cf45a335b6 100644
--- a/arch/mips/kernel/irq-gic.c
+++ b/arch/mips/kernel/irq-gic.c
@@ -311,9 +311,10 @@ static void __init gic_setup_intr(unsigned int intr, unsigned int cpu,
 
 	/* Init Intr Masks */
 	GIC_CLR_INTR_MASK(intr);
+
 	/* Initialise per-cpu Interrupt software masks */
-	if (flags & GIC_FLAG_IPI)
-		set_bit(intr, pcpu_masks[cpu].pcpu_mask);
+	set_bit(intr, pcpu_masks[cpu].pcpu_mask);
+
 	if ((flags & GIC_FLAG_TRANSPARENT) && (cpu_has_veic == 0))
 		GIC_SET_INTR_MASK(intr);
 	if (trigtype == GIC_TRIG_EDGE)
@@ -352,8 +353,6 @@ static void __init gic_basic_init(int numintrs, int numvpes,
 		cpu = intrmap[i].cpunum;
 		if (cpu == GIC_UNUSED)
 			continue;
-		if (cpu == 0 && i != 0 && intrmap[i].flags == 0)
-			continue;
 		gic_setup_intr(i,
 			intrmap[i].cpunum,
 			intrmap[i].pin + pin_offset,
diff --git a/arch/mips/mti-malta/malta-int.c b/arch/mips/mti-malta/malta-int.c
index ecc2785f7858..4ab919141737 100644
--- a/arch/mips/mti-malta/malta-int.c
+++ b/arch/mips/mti-malta/malta-int.c
@@ -427,7 +427,7 @@ static void __init fill_ipi_map1(int baseintr, int cpu, int cpupin)
 	gic_intr_map[intr].pin = cpupin;
 	gic_intr_map[intr].polarity = GIC_POL_POS;
 	gic_intr_map[intr].trigtype = GIC_TRIG_EDGE;
-	gic_intr_map[intr].flags = GIC_FLAG_IPI;
+	gic_intr_map[intr].flags = 0;
 	ipi_map[cpu] |= (1 << (cpupin + 2));
 }
 
-- 
2.0.0
