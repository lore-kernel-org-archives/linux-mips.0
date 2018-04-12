Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:59071 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993256AbeDLJhlLynHO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 Apr 2018 11:37:41 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v2 1/6] MIPS: perf: More robustly probe for the presence of per-tc counters
Date: Thu, 12 Apr 2018 10:36:21 +0100
Message-ID: <1523525786-29153-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1523525786-29153-1-git-send-email-matt.redfearn@mips.com>
References: <1523525786-29153-1-git-send-email-matt.redfearn@mips.com>
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
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Namhyung Kim <namhyung@kernel.org>, "Maciej W. Rozycki" <macro@mips.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Message-ID: <20180412093621.g64jAdH46KXXng0HQZchsUNcQ801q3OI4M4Uy6P37o8@z>

Processors implementing the MIPS MT ASE may have performance counters
implemented per core or per TC. Processors implemented by MIPS
Technologies signify presence per TC through a bit in the implementation
specific Config7 register. Currently the code which probes for their
presence blindly reads a magic number corresponding to this bit, despite
it potentially having a different meaning in the CPU implementation.

The test of Config7.PTC was previously enabled when CONFIG_BMIPS5000 was
enabled. However, according to [florian], the BMIPS5000 manual does not
define this bit, so we can assume it is 0 and the feature is not
supported.

Introduce probe_mipsmt_pertccounters() to probe for the presence of per
TC counters. This detects the ases implemented in the CPU, and reads any
implementation specific bit flagging their presence. In the case of MIPS
implementations, this bit is Config7.PTC. A definition of this bit is
added in mipsregs.h for MIPS Technologies. No other implementations
support this feature.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/mipsregs.h     |  5 +++++
 arch/mips/kernel/perf_event_mipsxx.c | 29 ++++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 858752dac337..a4baaaa02bc8 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -684,6 +684,11 @@
 #define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
 #define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
 
+/* Config7 Bits specific to MIPS Technologies. */
+
+/* Performance counters implemented Per TC */
+#define MTI_CONF7_PTC		(_ULCAST_(1) << 19)
+
 /* WatchLo* register definitions */
 #define MIPS_WATCHLO_IRW	(_ULCAST_(0x7) << 0)
 
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 6668f67a61c3..f3ec4a36921d 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -1708,6 +1708,33 @@ static const struct mips_perf_event *xlp_pmu_map_raw_event(u64 config)
 	return &raw_event;
 }
 
+#ifdef CONFIG_MIPS_PERF_SHARED_TC_COUNTERS
+/*
+ * The MIPS MT ASE specifies that performance counters may be implemented
+ * per core or per TC. If implemented per TC then all Linux CPUs have their
+ * own unique counters. If implemented per core, then VPEs in the core must
+ * treat the counters as a shared resource.
+ * Probe for the presence of per-TC counters
+ */
+static int probe_mipsmt_pertccounters(void)
+{
+	struct cpuinfo_mips *c = &current_cpu_data;
+
+	/* Non-MT cores by definition cannot implement per-TC counters */
+	if (!cpu_has_mipsmt)
+		return 0;
+
+	switch (c->processor_id & PRID_COMP_MASK) {
+	case PRID_COMP_MIPS:
+		/* MTI implementations use CONFIG7.PTC to signify presence */
+		return read_c0_config7() & MTI_CONF7_PTC;
+	default:
+		break;
+	}
+	return 0;
+}
+#endif /* CONFIG_MIPS_PERF_SHARED_TC_COUNTERS */
+
 static int __init
 init_hw_perf_events(void)
 {
@@ -1723,7 +1750,7 @@ init_hw_perf_events(void)
 	}
 
 #ifdef CONFIG_MIPS_PERF_SHARED_TC_COUNTERS
-	cpu_has_mipsmt_pertccounters = read_c0_config7() & (1<<19);
+	cpu_has_mipsmt_pertccounters = probe_mipsmt_pertccounters();
 	if (!cpu_has_mipsmt_pertccounters)
 		counters = counters_total_to_per_cpu(counters);
 #endif
-- 
2.7.4
