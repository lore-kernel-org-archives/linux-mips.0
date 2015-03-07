Received: from mailapp01.imgtec.com ([195.59.15.196]:42856 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012507AbbCGScPvYysn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:15 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 11/17] MIPS: sgi-ip27: Implement read_sched_clock
Date: Sat, 7 Mar 2015 10:30:29 -0800
Message-ID: <1425753035-17087-12-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183029.bXnCTw5Ze2B_hkkGnnHU6UEqplNAiCGwMEnKTeFVDuA@z>

Use ip27 hub real time counter for sched_clock source. This implementation
will give high resolution cputime accounting.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/sgi-ip27/ip27-timer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 1d97eab..a6d10f6 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
+#include <linux/sched_clock.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
 #include <linux/param.h>
@@ -159,11 +160,18 @@ struct clocksource hub_rt_clocksource = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 notrace hub_rt_read_sched_clock(void)
+{
+	return REMOTE_HUB_L(cputonasid(0), PI_RT_COUNT);
+}
+
 static void __init hub_rt_clocksource_init(void)
 {
 	struct clocksource *cs = &hub_rt_clocksource;
 
 	clocksource_register_hz(cs, CYCLES_PER_SEC);
+
+	sched_clock_register(hub_rt_read_sched_clock, 52, CYCLES_PER_SEC);
 }
 
 void __init plat_time_init(void)
-- 
2.3.2
