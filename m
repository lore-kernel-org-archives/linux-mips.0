Received: from mailapp01.imgtec.com ([195.59.15.196]:25537 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013814AbaKQJhyieRV4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 10:37:54 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D9E5F9B6B47D2
        for <linux-mips@linux-mips.org>; Mon, 17 Nov 2014 09:37:46 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: lib: mips-atomic.c: Remove obsolete ifdefery
Date: Mon, 17 Nov 2014 09:37:43 +0000
Message-ID: <1416217063-12114-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141117093743.lMHX5nYb1SrabzuSmgW_R6TY8B5bygssoo1tlEmSVX4@z>

Having #ifdefs just to guard comments is not really helpful
so drop them. Moreover, the code wasn't really reached anyway
since there is a #ifndef CONFIG_CPU_MIPSR2 on the top of the file.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/lib/mips-atomic.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/mips/lib/mips-atomic.c b/arch/mips/lib/mips-atomic.c
index 57bcdaf1f1c8..be777d9a3f85 100644
--- a/arch/mips/lib/mips-atomic.c
+++ b/arch/mips/lib/mips-atomic.c
@@ -42,15 +42,11 @@ notrace void arch_local_irq_disable(void)
 	__asm__ __volatile__(
 	"	.set	push						\n"
 	"	.set	noat						\n"
-#if   defined(CONFIG_CPU_MIPSR2)
-	/* see irqflags.h for inline function */
-#else
 	"	mfc0	$1,$12						\n"
 	"	ori	$1,0x1f						\n"
 	"	xori	$1,0x1f						\n"
 	"	.set	noreorder					\n"
 	"	mtc0	$1,$12						\n"
-#endif
 	"	" __stringify(__irq_disable_hazard) "			\n"
 	"	.set	pop						\n"
 	: /* no outputs */
@@ -72,15 +68,11 @@ notrace unsigned long arch_local_irq_save(void)
 	"	.set	push						\n"
 	"	.set	reorder						\n"
 	"	.set	noat						\n"
-#if   defined(CONFIG_CPU_MIPSR2)
-	/* see irqflags.h for inline function */
-#else
 	"	mfc0	%[flags], $12					\n"
 	"	ori	$1, %[flags], 0x1f				\n"
 	"	xori	$1, 0x1f					\n"
 	"	.set	noreorder					\n"
 	"	mtc0	$1, $12						\n"
-#endif
 	"	" __stringify(__irq_disable_hazard) "			\n"
 	"	.set	pop						\n"
 	: [flags] "=r" (flags)
@@ -103,18 +95,12 @@ notrace void arch_local_irq_restore(unsigned long flags)
 	"	.set	push						\n"
 	"	.set	noreorder					\n"
 	"	.set	noat						\n"
-#if   defined(CONFIG_CPU_MIPSR2) && defined(CONFIG_IRQ_CPU)
-	/* see irqflags.h for inline function */
-#elif defined(CONFIG_CPU_MIPSR2)
-	/* see irqflags.h for inline function */
-#else
 	"	mfc0	$1, $12						\n"
 	"	andi	%[flags], 1					\n"
 	"	ori	$1, 0x1f					\n"
 	"	xori	$1, 0x1f					\n"
 	"	or	%[flags], $1					\n"
 	"	mtc0	%[flags], $12					\n"
-#endif
 	"	" __stringify(__irq_disable_hazard) "			\n"
 	"	.set	pop						\n"
 	: [flags] "=r" (__tmp1)
@@ -136,18 +122,12 @@ notrace void __arch_local_irq_restore(unsigned long flags)
 	"	.set	push						\n"
 	"	.set	noreorder					\n"
 	"	.set	noat						\n"
-#if   defined(CONFIG_CPU_MIPSR2) && defined(CONFIG_IRQ_CPU)
-	/* see irqflags.h for inline function */
-#elif defined(CONFIG_CPU_MIPSR2)
-	/* see irqflags.h for inline function */
-#else
 	"	mfc0	$1, $12						\n"
 	"	andi	%[flags], 1					\n"
 	"	ori	$1, 0x1f					\n"
 	"	xori	$1, 0x1f					\n"
 	"	or	%[flags], $1					\n"
 	"	mtc0	%[flags], $12					\n"
-#endif
 	"	" __stringify(__irq_disable_hazard) "			\n"
 	"	.set	pop						\n"
 	: [flags] "=r" (__tmp1)
-- 
2.1.3
