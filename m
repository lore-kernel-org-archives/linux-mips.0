Received: from mailapp01.imgtec.com ([195.59.15.196]:58793 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012661AbbCGScVl9pB6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:21 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 13/17] MIPS: jz4740: Implement read_sched_clock
Date: Sat, 7 Mar 2015 10:30:31 -0800
Message-ID: <1425753035-17087-14-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183031.lAo_wckLJ0w3N3axUgOgR9MSu2IWJuBZr2JUhVIz9DI@z>

Use jz4740 timer counter for sched_clock source. This implementation will
give high resolution cputime accounting.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/jz4740/time.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index 5e430ce..72b0cecb 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -18,6 +18,7 @@
 #include <linux/time.h>
 
 #include <linux/clockchips.h>
+#include <linux/sched_clock.h>
 
 #include <asm/mach-jz4740/irq.h>
 #include <asm/mach-jz4740/timer.h>
@@ -43,6 +44,11 @@ static struct clocksource jz4740_clocksource = {
 	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 notrace jz4740_read_sched_clock(void)
+{
+	return jz4740_timer_get_count(TIMER_CLOCKSOURCE);
+}
+
 static irqreturn_t jz4740_clockevent_irq(int irq, void *devid)
 {
 	struct clock_event_device *cd = devid;
@@ -126,6 +132,8 @@ void __init plat_time_init(void)
 	if (ret)
 		printk(KERN_ERR "Failed to register clocksource: %d\n", ret);
 
+	sched_clock_register(jz4740_read_sched_clock, 16, clk_rate);
+
 	setup_irq(JZ4740_IRQ_TCU0, &timer_irqaction);
 
 	ctrl = JZ_TIMER_CTRL_PRESCALE_16 | JZ_TIMER_CTRL_SRC_EXT;
-- 
2.3.2
