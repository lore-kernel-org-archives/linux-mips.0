Received: from mailapp01.imgtec.com ([195.59.15.196]:20489 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008252AbbCGScLY28Kc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Mar 2015 19:32:11 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 10/17] MIPS: csrc-ioasic: Implement read_sched_clock
Date: Sat, 7 Mar 2015 10:30:28 -0800
Message-ID: <1425753035-17087-11-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20150307183028.yVUzJUbUx0EG0uiwfQzlYGEhvYkKVBCUk5BRfW4AvkI@z>

Use DEC I/O ASIC's free-running counter for sched_clock source. This
implementation will give high resolution cputime accounting.

Acked-by: Maciej W. Rozycki <macro@linux-mips.org>
Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-ioasic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/kernel/csrc-ioasic.c b/arch/mips/kernel/csrc-ioasic.c
index 54e394d..722f558 100644
--- a/arch/mips/kernel/csrc-ioasic.c
+++ b/arch/mips/kernel/csrc-ioasic.c
@@ -14,6 +14,7 @@
  *  GNU General Public License for more details.
  */
 #include <linux/clocksource.h>
+#include <linux/sched_clock.h>
 #include <linux/init.h>
 
 #include <asm/ds1287.h>
@@ -33,6 +34,11 @@ static struct clocksource clocksource_dec = {
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 notrace dec_ioasic_read_sched_clock(void)
+{
+	return ioasic_read(IO_REG_FCTR);
+}
+
 int __init dec_ioasic_clocksource_init(void)
 {
 	unsigned int freq;
@@ -61,5 +67,8 @@ int __init dec_ioasic_clocksource_init(void)
 
 	clocksource_dec.rating = 200 + freq / 10000000;
 	clocksource_register_hz(&clocksource_dec, freq);
+
+	sched_clock_register(dec_ioasic_read_sched_clock, 32, freq);
+
 	return 0;
 }
-- 
2.3.2
