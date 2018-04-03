Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:51026 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993599AbeDCMdd6t5Vw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Apr 2018 14:33:33 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/5] MIPS: perf: Use correct VPE ID when setting up VPE tracing
Date: Tue, 3 Apr 2018 13:31:28 +0100
Message-ID: <1522758691-17003-3-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1522758691-17003-1-git-send-email-matt.redfearn@mips.com>
References: <1522758691-17003-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Message-ID: <20180403123128.1nPG9o7EHbGTcbraPD17KtsXd9ISN7u341Q6b-ri4ME@z>

There are a couple of FIXME's in the perf code which state that
cpu_data[event->cpu].vpe_id reports 0 for both CPUs. This is no longer
the case, since the vpe_id is used extensively by SMP CPS.

VPE local counting gets around this by using smp_processor_id() instead.
As it happens this does work correctly to count events on the right VPE,
but relies on 2 assumptions:
a) Always having 2 VPEs / core.
b) The hardware only paying attention to the least significant bit of
the PERFCTL.VPEID field.
If either of these assumptions change then the incorrect VPEs events
will be counted.

Fix this by replacing smp_processor_id() with
cpu_vpe_id(&current_cpu_data), in the vpe_id() macro, and pass vpe_id()
to M_PERFCTL_VPEID() when setting up PERFCTL.VPEID. The FIXME's can also
be removed since they no longer apply.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/kernel/perf_event_mipsxx.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 3308b35d6680..bb8c6783e9a5 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -137,12 +137,8 @@ static DEFINE_RWLOCK(pmuint_rwlock);
 #define vpe_id()	(cpu_has_mipsmt_pertccounters ? \
 			 0 : (smp_processor_id() & MIPS_CPUID_TO_COUNTER_MASK))
 #else
-/*
- * FIXME: For VSMP, vpe_id() is redefined for Perf-events, because
- * cpu_data[cpuid].vpe_id reports 0 for _both_ CPUs.
- */
 #define vpe_id()	(cpu_has_mipsmt_pertccounters ? \
-			 0 : smp_processor_id())
+			 0 : cpu_vpe_id(&current_cpu_data))
 #endif
 
 /* Copied from op_model_mipsxx.c */
@@ -1279,11 +1275,7 @@ static void check_and_calc_range(struct perf_event *event,
 			 */
 			hwc->config_base |= M_TC_EN_ALL;
 		} else {
-			/*
-			 * FIXME: cpu_data[event->cpu].vpe_id reports 0
-			 * for both CPUs.
-			 */
-			hwc->config_base |= M_PERFCTL_VPEID(event->cpu);
+			hwc->config_base |= M_PERFCTL_VPEID(vpe_id());
 			hwc->config_base |= M_TC_EN_VPE;
 		}
 	} else
-- 
2.7.4
