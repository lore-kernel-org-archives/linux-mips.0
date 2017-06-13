Received: from mailapp01.imgtec.com ([195.59.15.196]:29671 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993867AbdFMJXvL0Sfd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Jun 2017 11:23:51 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: perf: add I6500 handling
Date: Tue, 13 Jun 2017 11:23:39 +0200
Message-ID: <1497345819-27779-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170613092339.boyiL-pxNBBnFpItmfL1zZ0oSLXyl5na6hcPfIaU6wc@z>

Add a definition of the perf registers for the new I6500 core.

Since I6500 has the same event definitions as I6400, re-use the existing
i6400 map structures by renaming them to a slightly more generic
'i6x00_***_map'.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>

---
This patch applies onto current -next and requires
https://patchwork.linux-mips.org/patch/16190/
to be applied

---
 arch/mips/kernel/perf_event_mipsxx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index f3e301f..9e6c74b 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -814,7 +814,7 @@ static const struct mips_perf_event mipsxxcore_event_map2
 	[PERF_COUNT_HW_BRANCH_MISSES] = { 0x27, CNTR_ODD, T },
 };
 
-static const struct mips_perf_event i6400_event_map[PERF_COUNT_HW_MAX] = {
+static const struct mips_perf_event i6x00_event_map[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_CPU_CYCLES]          = { 0x00, CNTR_EVEN | CNTR_ODD },
 	[PERF_COUNT_HW_INSTRUCTIONS]        = { 0x01, CNTR_EVEN | CNTR_ODD },
 	/* These only count dcache, not icache */
@@ -1014,7 +1014,7 @@ static const struct mips_perf_event mipsxxcore_cache_map2
 },
 };
 
-static const struct mips_perf_event i6400_cache_map
+static const struct mips_perf_event i6x00_cache_map
 				[PERF_COUNT_HW_CACHE_MAX]
 				[PERF_COUNT_HW_CACHE_OP_MAX]
 				[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
@@ -1610,6 +1610,7 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
 #endif
 		break;
 	case CPU_I6400:
+	case CPU_I6500:
 		/* 8-bit event numbers */
 		base_id = config & 0xff;
 		raw_event.cntr_mask = CNTR_EVEN | CNTR_ODD;
@@ -1770,8 +1771,13 @@ init_hw_perf_events(void)
 		break;
 	case CPU_I6400:
 		mipspmu.name = "mips/I6400";
-		mipspmu.general_event_map = &i6400_event_map;
-		mipspmu.cache_event_map = &i6400_cache_map;
+		mipspmu.general_event_map = &i6x00_event_map;
+		mipspmu.cache_event_map = &i6x00_cache_map;
+		break;
+	case CPU_I6500:
+		mipspmu.name = "mips/I6500";
+		mipspmu.general_event_map = &i6x00_event_map;
+		mipspmu.cache_event_map = &i6x00_cache_map;
 		break;
 	case CPU_1004K:
 		mipspmu.name = "mips/1004K";
-- 
2.7.4
