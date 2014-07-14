Received: from mailapp01.imgtec.com ([195.59.15.196]:44707 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860415AbaGNJOePLRsf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Jul 2014 11:14:34 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 1AE9EFF5B545E
        for <linux-mips@linux-mips.org>; Mon, 14 Jul 2014 10:14:26 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/5] MIPS: cpu: Add new cpu option for HardWare Table Walker.
Date: Mon, 14 Jul 2014 10:14:03 +0100
Message-ID: <1405329246-21643-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405329246-21643-1-git-send-email-markos.chandras@imgtec.com>
References: <1405329246-21643-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140714091403.-L7gHlUEEyVIESjF7zJiFjs1aDTL3reGploQrZjILCU@z>

Also set the type of previous options to 'unsigned long long' to avoid
potential problems on arithmetic operations.
Moreover, report hardware page table walker support as 'hwtw' in the ASE
list of /proc/cpuinfo, if the core imlements this feature.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu-features.h | 4 ++++
 arch/mips/include/asm/cpu.h          | 1 +
 arch/mips/kernel/proc.c              | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index c7d8c997d93e..231e3159d331 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -29,6 +29,10 @@
 #ifndef cpu_has_eva
 #define cpu_has_eva		(cpu_data[0].options & MIPS_CPU_EVA)
 #endif
+#ifndef cpu_has_hwtw
+#define cpu_has_hwtw		(cpu_data[0].options & MIPS_CPU_HWTW)
+#endif
+
 
 /*
  * For the moment we don't consider R6000 and R8000 so we can assume that
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 3b8d993d9d8d..da79367d3882 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -363,6 +363,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_TLBINV		0x02000000ull /* CPU supports TLBINV/F */
 #define MIPS_CPU_SEGMENTS	0x04000000ull /* CPU supports Segmentation Control registers */
 #define MIPS_CPU_EVA		0x80000000ull /* CPU supports Enhanced Virtual Addressing */
+#define MIPS_CPU_HWTW		0x100000000ull /* CPU support HardWare Page Table Walker */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 037a44d962f3..56b44a355af2 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -113,6 +113,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_vz)		seq_printf(m, "%s", " vz");
 	if (cpu_has_msa)	seq_printf(m, "%s", " msa");
 	if (cpu_has_eva)	seq_printf(m, "%s", " eva");
+	if (cpu_has_hwtw)	seq_printf(m, "%s", " hwtw");
 	seq_printf(m, "\n");
 
 	if (cpu_has_mmips) {
-- 
2.0.0
