Received: from mx1.netlogicmicro.com ([12.203.210.36]:2291 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1903959Ab1KKLiw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Nov 2011 12:38:52 +0100
Date: Fri, 11 Nov 2011 17:10:49 +0530
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 11/12] MIPS: Netlogic: Add support for XLP 3XX cores
Message-ID: <1ed9fc3cf14aeb0d62cc24ca79a5bd96c61d39c8.1321011002.git.jayachandranc@netlogicmicro.com>
References: <cover.1321010998.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1321010998.git.jayachandranc@netlogicmicro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20111111114049.B0Ezi8DqjsI6EsnHdKB28lUbLQRqk9KGLgTkzpOcQhA@z>

Add new processor ID to asm/cpu.h and kernel/cpu-probe.c.
Update to new CPU frequency detection code which works on XLP 3XX
and 8XX.

Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/include/asm/cpu.h      |    4 +++-
 arch/mips/kernel/cpu-probe.c     |    3 ++-
 arch/mips/netlogic/xlp/nlm_hal.c |   26 ++++++++++++++++----------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 54e35ad..f9fa2a4 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -171,7 +171,9 @@
 #define PRID_IMP_NETLOGIC_XLS404B	0x4f00
 #define PRID_IMP_NETLOGIC_AU13XX	0x8000
 
-#define PRID_IMP_NETLOGIC_XLP832	0x1000
+#define PRID_IMP_NETLOGIC_XLP8XX	0x1000
+#define PRID_IMP_NETLOGIC_XLP3XX	0x1100
+
 /*
  * Definitions for 7:0 on legacy processors
  */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 906e916..0bab464 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1032,7 +1032,8 @@ static inline void cpu_probe_netlogic(struct cpuinfo_mips *c, int cpu)
 			MIPS_CPU_LLSC);
 
 	switch (c->processor_id & 0xff00) {
-	case PRID_IMP_NETLOGIC_XLP832:
+	case PRID_IMP_NETLOGIC_XLP8XX:
+	case PRID_IMP_NETLOGIC_XLP3XX:
 		c->cputype = CPU_XLP;
 		__cpu_name[cpu] = "Netlogic XLP";
 		break;
diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index 885f687..9428e71 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -86,20 +86,26 @@ int nlm_irt_to_irq(int irt)
 	}
 }
 
-unsigned int nlm_get_cpu_frequency(void)
+unsigned int nlm_get_core_frequency(int core)
 {
-	unsigned int pll_divf, pll_divr, dfs_div, denom;
-	unsigned int val;
+	unsigned int pll_divf, pll_divr, dfs_div, ext_div;
+	unsigned int rstval, dfsval, denom;
 	uint64_t num;
 
-	val = nlm_read_sys_reg(nlm_sys_base, SYS_POWER_ON_RESET_CFG);
-	pll_divf = (val >> 10) & 0x7f;
-	pll_divr = (val >> 8)  & 0x3;
-	dfs_div  = (val >> 17) & 0x3;
+	rstval = nlm_read_sys_reg(nlm_sys_base, SYS_POWER_ON_RESET_CFG);
+	dfsval = nlm_read_sys_reg(nlm_sys_base, SYS_CORE_DFS_DIV_VALUE);
+	pll_divf = ((rstval >> 10) & 0x7f) + 1;
+	pll_divr = ((rstval >> 8)  & 0x3) + 1;
+	ext_div  = ((rstval >> 30) & 0x3) + 1;
+	dfs_div  = ((dfsval >> (core * 4)) & 0xf) + 1;
 
-	num = pll_divf + 1;
-	denom = 3 * (pll_divr + 1) * (1 << (dfs_div + 1));
-	num = num * 800000000ULL;
+	num = 800000000ULL * pll_divf;
+	denom = 3 * pll_divr * ext_div * dfs_div;
 	do_div(num, denom);
 	return (unsigned int)num;
 }
+
+unsigned int nlm_get_cpu_frequency(void)
+{
+	return nlm_get_core_frequency(0);
+}
-- 
1.7.5.4
