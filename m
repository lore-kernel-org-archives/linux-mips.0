Received: from mailapp01.imgtec.com ([195.59.15.196]:11117 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007380AbbCGScSqMsvp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:18 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 12/17] MIPS: cevt-txx9: Implement read_sched_clock
Date: Sat, 7 Mar 2015 10:30:30 -0800
Message-ID: <1425753035-17087-13-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425753035-17087-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425753035-17087-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: macro@linux-mips.org, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150307183030.uMV2rb32YtedxUPd9fC1QpVjDA8SZDkVmEaLl_6IGKA@z>

Use txx9 up-counter for sched_clock source. This implementation will give
high resolution cputime accounting.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/cevt-txx9.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/kernel/cevt-txx9.c b/arch/mips/kernel/cevt-txx9.c
index 2ae0846..7239324 100644
--- a/arch/mips/kernel/cevt-txx9.c
+++ b/arch/mips/kernel/cevt-txx9.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/sched_clock.h>
 #include <asm/time.h>
 #include <asm/txx9tmr.h>
 
@@ -46,6 +47,11 @@ static struct txx9_clocksource txx9_clocksource = {
 	},
 };
 
+static u64 notrace txx9_read_sched_clock(void)
+{
+	return __raw_readl(&txx9_clocksource.tmrptr->trr);
+}
+
 void __init txx9_clocksource_init(unsigned long baseaddr,
 				  unsigned int imbusclk)
 {
@@ -61,6 +67,9 @@ void __init txx9_clocksource_init(unsigned long baseaddr,
 	__raw_writel(1 << TXX9_CLOCKSOURCE_BITS, &tmrptr->cpra);
 	__raw_writel(TCR_BASE | TXx9_TMTCR_TCE, &tmrptr->tcr);
 	txx9_clocksource.tmrptr = tmrptr;
+
+	sched_clock_register(txx9_read_sched_clock, TXX9_CLOCKSOURCE_BITS,
+			     TIMER_CLK(imbusclk));
 }
 
 struct txx9_clock_event_device {
-- 
2.3.2
