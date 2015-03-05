Received: from mailapp01.imgtec.com ([195.59.15.196]:14113 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012174AbbCEA7m2W2FL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:42 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 10/15] MIPS: sgi-ip27: Implement read_sched_clock
Date: Wed, 4 Mar 2015 16:58:52 -0800
Message-ID: <1425517137-26463-11-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
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
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150305005852.siFH4q3acbAX9k_QqXMqlrQeiptQrgFoCxak2p0EkRk@z>

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
1.8.5.3
