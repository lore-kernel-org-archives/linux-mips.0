Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:21202 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27028460AbaHVTTHAzZl2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Aug 2014 21:19:07 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 2/2] MIPS: Move topology macros to topology.h
Date: Fri, 22 Aug 2014 09:48:32 +0530
Message-ID: <1408681112-26744-2-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1408681112-26744-1-git-send-email-jchandra@broadcom.com>
References: <CAAhV-H7x3FDAXYcH6J8mDeBnrgV1CZZtizerjHRa4cj_oZ1PuQ@mail.gmail.com>
 <1408681112-26744-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org, chenhc@lemote.com
Message-ID: <20140822041832.qrsXMjS_agKYLtDi5Q9TeUTZ77uJpu1BIBGW8lxfEz4@z>

commit bda4584cd943 ("MIPS: Support CPU topology files in sysfs")
added MIPS topology related macros to asm/smp.h. Move these to
asm/topology.h.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
[Resending this, looks like linux-mips.org is down]

 arch/mips/include/asm/smp.h      |    5 -----
 arch/mips/include/asm/topology.h |    5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 1e0f20a..eacf865 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -37,11 +37,6 @@ extern int __cpu_logical_map[NR_CPUS];
 
 #define NO_PROC_ID	(-1)
 
-#define topology_physical_package_id(cpu)	(cpu_data[cpu].package)
-#define topology_core_id(cpu)			(cpu_data[cpu].core)
-#define topology_core_cpumask(cpu)		(&cpu_core_map[cpu])
-#define topology_thread_cpumask(cpu)		(&cpu_sibling_map[cpu])
-
 #define SMP_RESCHEDULE_YOURSELF 0x1	/* XXX braindead */
 #define SMP_CALL_FUNCTION	0x2
 /* Octeon - Tell another core to flush its icache */
diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/topology.h
index 20ea485..e012429 100644
--- a/arch/mips/include/asm/topology.h
+++ b/arch/mips/include/asm/topology.h
@@ -10,4 +10,9 @@
 
 #include <topology.h>
 
+#define topology_physical_package_id(cpu)	(cpu_data[cpu].package)
+#define topology_core_id(cpu)			(cpu_data[cpu].core)
+#define topology_core_cpumask(cpu)		(&cpu_core_map[cpu])
+#define topology_thread_cpumask(cpu)		(&cpu_sibling_map[cpu])
+
 #endif /* __ASM_TOPOLOGY_H */
-- 
1.7.9.5
