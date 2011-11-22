Received: from dns1.mips.com ([12.201.5.69]:39660 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903706Ab1KVD3j (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2011 04:29:39 +0100
From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: [PATCH v2 4/5] MIPS/Perf-events: Cleanup event->destroy at event init
Date: Tue, 22 Nov 2011 11:28:48 +0800
Message-ID: <1321932528-21098-5-git-send-email-dczhu@mips.com>
In-Reply-To: <1321932528-21098-1-git-send-email-dczhu@mips.com>
References: <1321932528-21098-1-git-send-email-dczhu@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org, linux-mips@linux-mips.org
Cc: eyal@mips.com, zenon@mips.com, Deng-Cheng Zhu <dczhu@mips.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, David Daney <david.daney@cavium.com>
Message-ID: <20111122032848.s2-cWBEH8amEnIraOmjJP21yd7nARCt05qNNE-1ZJP0@z>

Simplify the code by changing the place of event->destroy().

Signed-off-by: Deng-Cheng Zhu <dczhu@mips.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: David Daney <david.daney@cavium.com>
---
 arch/mips/kernel/perf_event_mipsxx.c |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index b22cc5f..bda4bc9 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -633,11 +633,7 @@ static int mipspmu_event_init(struct perf_event *event)
 	if (err)
 		return err;
 
-	err = __hw_perf_event_init(event);
-	if (err)
-		hw_perf_event_destroy(event);
-
-	return err;
+	return __hw_perf_event_init(event);
 }
 
 static struct pmu pmu = {
@@ -1262,13 +1258,14 @@ static int __hw_perf_event_init(struct perf_event *event)
 	}
 
 	err = 0;
-	if (event->group_leader != event) {
+	if (event->group_leader != event)
 		err = validate_group(event);
-		if (err)
-			return -EINVAL;
-	}
 
 	event->destroy = hw_perf_event_destroy;
+
+	if (err)
+		event->destroy(event);
+
 	return err;
 }
 
-- 
1.7.1
