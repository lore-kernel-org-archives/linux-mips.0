Received: from multi.imgtec.com ([194.200.65.239]:2025 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822674Ab3JHPSDdU1tA (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 8 Oct 2013 17:18:03 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS/Perf-events: Fix 74K cache map
Date: Tue, 8 Oct 2013 16:17:48 +0100
Message-ID: <1381245468-1726-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20131008151748.eT2D7PgnFmboHSazZA2EGagDNaqMy4Ml4Pp1XRBJcQ8@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

According to Software User's Manual, the event of last-level-cache
read/write misses is mapped to even counters. Odd counters of that
event number count miss cycles.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/kernel/perf_event_mipsxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 45f1ffc..24cdf64 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -971,11 +971,11 @@ static const struct mips_perf_event mipsxx74Kcore_cache_map
 [C(LL)] = {
 	[C(OP_READ)] = {
 		[C(RESULT_ACCESS)]	= { 0x1c, CNTR_ODD, P },
-		[C(RESULT_MISS)]	= { 0x1d, CNTR_EVEN | CNTR_ODD, P },
+		[C(RESULT_MISS)]	= { 0x1d, CNTR_EVEN, P },
 	},
 	[C(OP_WRITE)] = {
 		[C(RESULT_ACCESS)]	= { 0x1c, CNTR_ODD, P },
-		[C(RESULT_MISS)]	= { 0x1d, CNTR_EVEN | CNTR_ODD, P },
+		[C(RESULT_MISS)]	= { 0x1d, CNTR_EVEN, P },
 	},
 },
 [C(ITLB)] = {
-- 
1.8.3.2
