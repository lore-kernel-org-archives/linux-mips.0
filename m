Received: from mailapp01.imgtec.com ([195.59.15.196]:49744 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012753AbbCGScab--8n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:30 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 16/17] MIPS: csrc-sb1250: Implement read_sched_clock
Date: Sat, 7 Mar 2015 10:30:34 -0800
Message-ID: <1425753035-17087-17-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183034.I_vOw3Qgm7EOnDNGxfogwhRkea8KRQwdnUSvd21-OUo@z>

Use sb1250 hpt for sched_clock source. This implementation will give high
resolution cputime accounting.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-sb1250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/csrc-sb1250.c b/arch/mips/kernel/csrc-sb1250.c
index 1ecfa4b..d915652 100644
--- a/arch/mips/kernel/csrc-sb1250.c
+++ b/arch/mips/kernel/csrc-sb1250.c
@@ -12,6 +12,7 @@
  * GNU General Public License for more details.
  */
 #include <linux/clocksource.h>
+#include <linux/sched_clock.h>
 
 #include <asm/addrspace.h>
 #include <asm/io.h>
@@ -53,6 +54,11 @@ struct clocksource bcm1250_clocksource = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 notrace sb1250_read_sched_clock(void)
+{
+	return sb1250_hpt_get_cycles();
+}
+
 void __init sb1250_clocksource_init(void)
 {
 	struct clocksource *cs = &bcm1250_clocksource;
@@ -69,4 +75,6 @@ void __init sb1250_clocksource_init(void)
 						 R_SCD_TIMER_CFG)));
 
 	clocksource_register_hz(cs, V_SCD_TIMER_FREQ);
+
+	sched_clock_register(sb1250_read_sched_clock, 23, V_SCD_TIMER_FREQ);
 }
-- 
2.3.2
