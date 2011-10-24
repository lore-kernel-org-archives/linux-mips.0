Received: from dns1.mips.com ([12.201.5.69]:55746 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491073Ab1JXK5N (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 24 Oct 2011 12:57:13 +0200
From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: [PATCH 2/4] MIPS/Perf-events: remove erroneous check on active_events
Date: Mon, 24 Oct 2011 18:56:00 +0800
Message-ID: <1319453762-12962-3-git-send-email-dczhu@mips.com>
In-Reply-To: <1319453762-12962-1-git-send-email-dczhu@mips.com>
References: <1319453762-12962-1-git-send-email-dczhu@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Deng-Cheng Zhu <dczhu@mips.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, David Daney <david.daney@cavium.com>
Message-ID: <20111024105600.18dmC29wL27oGanl0DsAIyp9TaKDic_esY_xp3FXH9w@z>

Port the following patch for ARM by Mark Rutland:

- 57ce9bb39b476accf8fba6e16aea67ed76ea523d
    ARM: 6902/1: perf: Remove erroneous check on active_events

    When initialising a PMU, there is a check to protect against races with
    other CPUs filling all of the available event slots. Since armpmu_add
    checks that an event can be scheduled, we do not need to do this at
    initialisation time. Furthermore the current code is broken because it
    assumes that atomic_inc_not_zero will unconditionally increment
    active_counts and then tries to decrement it again on failure.

    This patch removes the broken, redundant code.

Signed-off-by: Deng-Cheng Zhu <dczhu@mips.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: David Daney <david.daney@cavium.com>
---
 arch/mips/kernel/perf_event.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/perf_event.c b/arch/mips/kernel/perf_event.c
index 0aee944..b1d51b5 100644
--- a/arch/mips/kernel/perf_event.c
+++ b/arch/mips/kernel/perf_event.c
@@ -385,11 +385,6 @@ static int mipspmu_event_init(struct perf_event *event)
 		return -ENODEV;
 
 	if (!atomic_inc_not_zero(&active_events)) {
-		if (atomic_read(&active_events) > MIPS_MAX_HWEVENTS) {
-			atomic_dec(&active_events);
-			return -ENOSPC;
-		}
-
 		mutex_lock(&pmu_reserve_mutex);
 		if (atomic_read(&active_events) == 0)
 			err = mipspmu_get_irq();
-- 
1.7.1
