Received: from mailapp01.imgtec.com ([195.59.15.196]:60416 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007580AbbCGScCCHHhG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:02 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 06/17] MIPS: csrc-r4k: Implement read_sched_clock
Date: Sat, 7 Mar 2015 10:30:24 -0800
Message-ID: <1425753035-17087-7-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183024.qrMwWxd35_EAiBgElmXb5-y5oKYd0tofCO0b8MdSvZA@z>

Use c0 count register for sched_clock source. This implementation will give
high resolution cputime accounting.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-r4k.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index decd1fa..e5ed7ad 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -7,6 +7,7 @@
  */
 #include <linux/clocksource.h>
 #include <linux/init.h>
+#include <linux/sched_clock.h>
 
 #include <asm/time.h>
 
@@ -22,6 +23,11 @@ static struct clocksource clocksource_mips = {
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 notrace r4k_read_sched_clock(void)
+{
+	return read_c0_count();
+}
+
 int __init init_r4k_clocksource(void)
 {
 	if (!cpu_has_counter || !mips_hpt_frequency)
@@ -32,5 +38,7 @@ int __init init_r4k_clocksource(void)
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 
+	sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
+
 	return 0;
 }
-- 
2.3.2
