Received: from multi.imgtec.com ([194.200.65.239]:51753 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825129Ab3K2RHZPqJs4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 29 Nov 2013 18:07:25 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] MIPS: Malta: remove unused cpu_khz variable
Date: Fri, 29 Nov 2013 17:07:13 +0000
Message-ID: <1385744834-18115-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20131129170713.LHy22MXTWeyVJyyVsutNd61UX8oh8YdUtD_AGFc2mnA@z>

This variable was introduced by commit 96348c8f (of Ralf's historic
Linux/MIPS repository) "Remaining fixes for MIPS's eval boards." but
I don't see any use of it either then or now. Remove it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Reviewed-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/mti-malta/malta-time.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index b0b370e..3190099 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -42,8 +42,6 @@
 #include <asm/mips-boards/generic.h>
 #include <asm/mips-boards/maltaint.h>
 
-unsigned long cpu_khz;
-
 static int mips_cpu_timer_irq;
 static int mips_cpu_perf_irq;
 extern int cp0_perfcount_irq;
@@ -195,7 +193,6 @@ void __init plat_time_init(void)
 	freq = freqround(freq, 5000);
 	printk("CPU frequency %d.%02d MHz\n", freq/1000000,
 	       (freq%1000000)*100/1000000);
-	cpu_khz = freq / 1000;
 
 	mips_scroll_message();
 
-- 
1.8.4.2
