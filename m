Received: from mailapp01.imgtec.com ([195.59.15.196]:29537 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27027781AbcD2NqSIJOWi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Apr 2016 15:46:18 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 5/5] MIPS: Add perf counter feature
Date: Fri, 29 Apr 2016 14:46:03 +0100
Message-ID: <1461937563-13199-6-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1461937563-13199-1-git-send-email-james.hogan@imgtec.com>
References: <1461937563-13199-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Robert Richter <rric@kernel.org>, linux-mips@linux-mips.org, oprofile-list@lists.sf.net
Message-ID: <20160429134603.3IEgPsjOHm99mWVAsLtp4BXUwWO-_PNfAY4fpcnbzC8@z>

Add CPU feature for standard MIPS r2 performance counters, as determined
by the Config1.PC bit. Both perf_events and oprofile probe this bit, so
lets combine the probing and change both to use cpu_has_perf.

This will also be used for VZ support in KVM to know whether performance
counters exist which can be exposed to guests.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Robert Richter <rric@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: oprofile-list@lists.sf.net
---
 arch/mips/include/asm/cpu-features.h | 4 ++++
 arch/mips/include/asm/cpu.h          | 1 +
 arch/mips/kernel/cpu-probe.c         | 2 ++
 arch/mips/kernel/perf_event_mipsxx.c | 4 +---
 arch/mips/oprofile/op_model_mipsxx.c | 4 +---
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index e29e9841c597..952a2388c22e 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -448,4 +448,8 @@
 # define cpu_has_contextconfig	(cpu_data[0].options & MIPS_CPU_CTXTC)
 #endif
 
+#ifndef cpu_has_perf
+# define cpu_has_perf		(cpu_data[0].options & MIPS_CPU_PERF)
+#endif
+
 #endif /* __ASM_CPU_FEATURES_H */
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 989378d28059..36cf2a717a3d 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -407,6 +407,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_BADINSTR	MBIT_ULL(43)	/* CPU has BadInstr register */
 #define MIPS_CPU_BADINSTRP	MBIT_ULL(44)	/* CPU has BadInstrP register */
 #define MIPS_CPU_CTXTC		MBIT_ULL(45)	/* CPU has [X]ConfigContext registers */
+#define MIPS_CPU_PERF		MBIT_ULL(46)	/* CPU has MIPS performance counters */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b3db08d05483..a0b7ff3353bd 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -648,6 +648,8 @@ static inline unsigned int decode_config1(struct cpuinfo_mips *c)
 
 	if (config1 & MIPS_CONF1_MD)
 		c->ases |= MIPS_ASE_MDMX;
+	if (config1 & MIPS_CONF1_PC)
+		c->options |= MIPS_CPU_PERF;
 	if (config1 & MIPS_CONF1_WR)
 		c->options |= MIPS_CPU_WATCH;
 	if (config1 & MIPS_CONF1_CA)
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 656769c166fc..302af8c975df 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -101,8 +101,6 @@ struct mips_pmu {
 
 static struct mips_pmu mipspmu;
 
-#define M_CONFIG1_PC	(1 << 4)
-
 #define M_PERFCTL_EXL			(1	<<  0)
 #define M_PERFCTL_KERNEL		(1	<<  1)
 #define M_PERFCTL_SUPERVISOR		(1	<<  2)
@@ -754,7 +752,7 @@ static void handle_associated_event(struct cpu_hw_events *cpuc,
 
 static int __n_counters(void)
 {
-	if (!(read_c0_config1() & M_CONFIG1_PC))
+	if (!cpu_has_perf)
 		return 0;
 	if (!(read_c0_perfctrl0() & M_PERFCTL_MORE))
 		return 1;
diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 8f988a61b7a8..45cb27469fba 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -269,11 +269,9 @@ static int mipsxx_perfcount_handler(void)
 	return handled;
 }
 
-#define M_CONFIG1_PC	(1 << 4)
-
 static inline int __n_counters(void)
 {
-	if (!(read_c0_config1() & M_CONFIG1_PC))
+	if (!cpu_has_perf)
 		return 0;
 	if (!(read_c0_perfctrl0() & M_PERFCTL_MORE))
 		return 1;
-- 
2.4.10
