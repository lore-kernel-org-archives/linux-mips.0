Received: from mail-fx0-f49.google.com ([209.85.161.49]:40416 "EHLO
        mail-fx0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493023Ab0LAQVL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Dec 2010 17:21:11 +0100
Subject: [RFC 3/3] VSMP support for MSP71xx family
From: Anoop P A <anoop.pa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Dec 2010 21:53:57 +0530
Message-ID: <1291220637.31413.20.camel@paanoop1-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <anoop.pa@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: kevink@paralogos.com, linux-mips@linux-mips.org, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20101201162357.lJS6ClLY-HrNlxz25m_mqryuhTLBhC2QzLrWBAf295w@z>

From 5bfd3ba210e521df2b493862446b4535bcdb0cdf Mon Sep 17 00:00:00 2001
Message-Id:
<5bfd3ba210e521df2b493862446b4535bcdb0cdf.1291219118.git.anoop.pa@gmail.com>
In-Reply-To: <cover.1291219118.git.anoop.pa@gmail.com>
References: <cover.1291219118.git.anoop.pa@gmail.com>
From: Anoop P A <anoop.pa@gmail.com>
Date: Wed, 1 Dec 2010 21:08:37 +0530
Subject: [RFC 3/3] VSMP support for MSP71xx family.
Cc: anoop.pa@gmail.com

followig patches setup vectored interrupt in msp_irq.c and
register vsmp_ops from msp_setup.c.
It also changes get_c0_compare_int to return corresponding vpe timer
interrupt.

Signed-off-by: Anoop P A <anoop.pa@gmail.com>
---
 arch/mips/pmc-sierra/msp71xx/msp_irq.c   |   49
+++++++++++++++++++++++++-----
 arch/mips/pmc-sierra/msp71xx/msp_setup.c |    3 ++
 arch/mips/pmc-sierra/msp71xx/msp_time.c  |    2 +-
 3 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/arch/mips/pmc-sierra/msp71xx/msp_irq.c
b/arch/mips/pmc-sierra/msp71xx/msp_irq.c
index 734d598..e9144c8 100644
--- a/arch/mips/pmc-sierra/msp71xx/msp_irq.c
+++ b/arch/mips/pmc-sierra/msp71xx/msp_irq.c
@@ -19,8 +19,6 @@
 
 #include <msp_int.h>
 
-extern void msp_int_handle(void);
-
 /* SLP bases systems */
 extern void msp_slp_irq_init(void);
 extern void msp_slp_irq_dispatch(void);
@@ -29,6 +27,19 @@ extern void msp_slp_irq_dispatch(void);
 extern void msp_cic_irq_init(void);
 extern void msp_cic_irq_dispatch(void);
 
+/* VSMP support init */
+extern void msp_vsmp_int_init(void);
+
+/* vectored interrupt implementation */
+
+/* SW0/1 interrupts are used for SMP/SMTC */
+static inline void mac0_int_dispatch(void) { do_IRQ(MSP_INT_MAC0); }
+static inline void mac1_int_dispatch(void) { do_IRQ(MSP_INT_MAC1); }
+static inline void mac2_int_dispatch(void) { do_IRQ(MSP_INT_SAR); }
+static inline void usb_int_dispatch(void)  { do_IRQ(MSP_INT_USB);  }
+static inline void sec_int_dispatch(void)  { do_IRQ(MSP_INT_SEC);  }
+
+
 /*
  * The PMC-Sierra MSP interrupts are arranged in a 3 level cascaded
  * hierarchical system.  The first level are the direct MIPS interrupts
@@ -96,29 +107,51 @@ asmlinkage void plat_irq_dispatch(struct pt_regs
*regs)
 		do_IRQ(MSP_INT_SW1);
 }
 
-static struct irqaction cascade_msp = {
+static struct irqaction cic_cascade_msp = {
 	.handler = no_action,
-	.name	 = "MSP cascade"
+	.name	 = "MSP CIC cascade"
 };
 
+static struct irqaction per_cascade_msp = {
+	.handler = no_action,
+	.name	 = "MSP PER cascade"
+};
 
 void __init arch_init_irq(void)
 {
+	/* assume we'll be using vectored interrupt mode except in UP mode*/
+#ifdef CONFIG_MIPS_MT
+	BUG_ON(!cpu_has_vint);
+#endif
+
 	/* initialize the 1st-level CPU based interrupt controller */
 	mips_cpu_irq_init();
 
 #ifdef CONFIG_IRQ_MSP_CIC
 	msp_cic_irq_init();
+#ifdef CONFIG_MIPS_MT
+	set_vi_handler(MSP_INT_CIC, msp_cic_irq_dispatch);
+	set_vi_handler(MSP_INT_MAC0, mac0_int_dispatch);
+	set_vi_handler(MSP_INT_MAC1, mac1_int_dispatch);
+	set_vi_handler(MSP_INT_SAR, mac2_int_dispatch);
+	set_vi_handler(MSP_INT_USB, usb_int_dispatch);
+	set_vi_handler(MSP_INT_SEC, sec_int_dispatch);
+#endif
+#ifdef CONFIG_MIPS_MT_SMP
+	msp_vsmp_int_init();
+#endif
 
 	/* setup the cascaded interrupts */
-	setup_irq(MSP_INT_CIC, &cascade_msp);
-	setup_irq(MSP_INT_PER, &cascade_msp);
+	setup_irq(MSP_INT_CIC, &cic_cascade_msp);
+	setup_irq(MSP_INT_PER, &per_cascade_msp);
+
 #else
 	/* setup the 2nd-level SLP register based interrupt controller */
+	/* VSMP /SMTC support support is not enabled for SLP */
 	msp_slp_irq_init();
 
 	/* setup the cascaded SLP/PER interrupts */
-	setup_irq(MSP_INT_SLP, &cascade_msp);
-	setup_irq(MSP_INT_PER, &cascade_msp);
+	setup_irq(MSP_INT_SLP, &cic_cascade_msp);
+	setup_irq(MSP_INT_PER, &per_cascade_msp);
 #endif
 }
diff --git a/arch/mips/pmc-sierra/msp71xx/msp_setup.c
b/arch/mips/pmc-sierra/msp71xx/msp_setup.c
index a54e85b..d7e06b8 100644
--- a/arch/mips/pmc-sierra/msp71xx/msp_setup.c
+++ b/arch/mips/pmc-sierra/msp71xx/msp_setup.c
@@ -225,6 +225,9 @@ void __init prom_init(void)
 	 * in separate specific files.
 	 */
 	msp_serial_setup();
+#ifdef CONFIG_MIPS_MT_SMP
+	register_smp_ops(&vsmp_smp_ops);
+#endif
 
 #ifdef CONFIG_PMCTWILED
 	/*
diff --git a/arch/mips/pmc-sierra/msp71xx/msp_time.c
b/arch/mips/pmc-sierra/msp71xx/msp_time.c
index 01df84c..67c0222 100644
--- a/arch/mips/pmc-sierra/msp71xx/msp_time.c
+++ b/arch/mips/pmc-sierra/msp71xx/msp_time.c
@@ -83,5 +83,5 @@ void __init plat_time_init(void)
 
 unsigned int __cpuinit get_c0_compare_int(void)
 {
-	return MSP_INT_VPE0_TIMER;
+	return smp_processor_id() ? MSP_INT_VPE1_TIMER : MSP_INT_VPE0_TIMER;
 }
-- 
1.7.0.4
