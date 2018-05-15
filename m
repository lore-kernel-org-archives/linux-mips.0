Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:55919 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992781AbeEOOocf59dF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 15 May 2018 16:44:32 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v4] MIPS: perf: Fix BMIPS5000 system mode counting
Date: Tue, 15 May 2018 15:44:16 +0100
Message-ID: <1526395456-23723-1-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1524219789-31241-8-git-send-email-matt.redfearn@mips.com>
References: <1524219789-31241-8-git-send-email-matt.redfearn@mips.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Namhyung Kim <namhyung@kernel.org>, "Maciej W. Rozycki" <macro@mips.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Message-ID: <20180515144416.C0UbQmd0i0BsRK_gxus051kPiOFLNbJN97W8YixcH70@z>

When perf is used in system mode, i.e. specifying a set of CPUs to
count (perf -a -C cpu), event->cpu is set to the CPU number on which
events should be counted. The current BMIPS500 variation of
mipsxx_pmu_enable_event only over sets the counter to count the current
CPU, so system mode does not work.

Fix this by removing this BMIPS5000 specific path and integrating it
with the generic one. Since BMIPS5000 uses specific extensions to the
perf control register, different fields must be set up to count the
relevant CPU.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>

---

Changes in v4:
Fix compiler error from BRCM_PERFCTRL_VPEID flagged by Florian.

Changes in v2:
New patch to fix BMIPS5000 system mode perf.

 arch/mips/include/asm/mipsregs.h     |  1 +
 arch/mips/kernel/perf_event_mipsxx.c | 17 ++++++-----------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index a4baaaa02bc..6b0b06d2683 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -735,6 +735,7 @@
 #define MIPS_PERFCTRL_MT_EN_TC	(_ULCAST_(2) << 20)
 
 /* PerfCnt control register MT extensions used by BMIPS5000 */
+#define BRCM_PERFCTRL_VPEID(v)	(_ULCAST_(1) << (12 + (v)))
 #define BRCM_PERFCTRL_TC	(_ULCAST_(1) << 30)
 
 /* PerfCnt control register MT extensions used by Netlogic XLR */
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 5b8811643e6..77d7167e303 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -364,16 +364,7 @@ static void mipsxx_pmu_enable_event(struct hw_perf_event *evt, int idx)
 		/* Make sure interrupt enabled. */
 		MIPS_PERFCTRL_IE;
 
-#ifdef CONFIG_CPU_BMIPS5000
-	{
-		/* enable the counter for the calling thread */
-		unsigned int vpe_id;
-
-		vpe_id = smp_processor_id() & MIPS_CPUID_TO_COUNTER_MASK;
-		cpuc->saved_ctrl[idx] |= BIT(12 + vpe_id) | BRCM_PERFCTRL_TC;
-	}
-#else
-#ifdef CONFIG_MIPS_MT_SMP
+#if defined(CONFIG_MIPS_MT_SMP) && !defined(CONFIG_CPU_BMIPS5000)
 	if (range > V) {
 		/* The counter is processor wide. Set it up to count all TCs. */
 		pr_debug("Enabling perf counter for all TCs\n");
@@ -390,12 +381,16 @@ static void mipsxx_pmu_enable_event(struct hw_perf_event *evt, int idx)
 		 */
 		cpu = (event->cpu >= 0) ? event->cpu : smp_processor_id();
 
+#if defined(CONFIG_CPU_BMIPS5000)
+		ctrl = BRCM_PERFCTRL_VPEID(cpu & MIPS_CPUID_TO_COUNTER_MASK);
+		ctrl |= BRCM_PERFCTRL_TC;
+#else
 		ctrl = M_PERFCTL_VPEID(cpu_vpe_id(&cpu_data[cpu]));
 		ctrl |= M_TC_EN_VPE;
+#endif
 		cpuc->saved_ctrl[idx] |= ctrl;
 		pr_debug("Enabling perf counter for CPU%d\n", cpu);
 	}
-#endif /* CONFIG_CPU_BMIPS5000 */
 	/*
 	 * We do not actually let the counter run. Leave it until start().
 	 */
-- 
2.7.4
