Received: from mailapp01.imgtec.com ([195.59.15.196]:64205 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011567AbbCEA7fFaIyn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:35 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 07/15] MIPS: csrc-bcm1480: Implement read_sched_clock
Date: Wed, 4 Mar 2015 16:58:49 -0800
Message-ID: <1425517137-26463-8-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150305005849.3n__3c1xc2IztOP8I47-YvOfZrPmSofOhzkPW1_zHy4@z>

Use the ZBbus cycle counter for sched_clock source. This implementation
will give high resolution cputime accounting.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-bcm1480.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/csrc-bcm1480.c b/arch/mips/kernel/csrc-bcm1480.c
index 0a20a0f..7f65b53 100644
--- a/arch/mips/kernel/csrc-bcm1480.c
+++ b/arch/mips/kernel/csrc-bcm1480.c
@@ -12,6 +12,7 @@
  * GNU General Public License for more details.
  */
 #include <linux/clocksource.h>
+#include <linux/sched_clock.h>
 
 #include <asm/addrspace.h>
 #include <asm/io.h>
@@ -37,6 +38,11 @@ struct clocksource bcm1480_clocksource = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 notrace sb1480_read_sched_clock(void)
+{
+	return __raw_readq(IOADDR(A_SCD_ZBBUS_CYCLE_COUNT));
+}
+
 void __init sb1480_clocksource_init(void)
 {
 	struct clocksource *cs = &bcm1480_clocksource;
@@ -46,4 +52,6 @@ void __init sb1480_clocksource_init(void)
 	plldiv = G_BCM1480_SYS_PLL_DIV(__raw_readq(IOADDR(A_SCD_SYSTEM_CFG)));
 	zbbus = ((plldiv >> 1) * 50000000) + ((plldiv & 1) * 25000000);
 	clocksource_register_hz(cs, zbbus);
+
+	sched_clock_register(sb1480_read_sched_clock, 64, zbbus);
 }
-- 
1.8.5.3
