Received: from multi.imgtec.com ([194.200.65.239]:31458 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825711AbaAUOvL3Kg0d (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 21 Jan 2014 15:51:11 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Add P5600 PRid and probe support
Date: Tue, 21 Jan 2014 14:50:20 +0000
Message-ID: <1390315820-15723-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>
Message-ID: <20140121145020.PMAcDqcRnlTM8Zz9h6DCZqJ42GaU01IUexKgFR2hXeI@z>

Add a Processor ID for the P5600 core and a case in cpu_probe_mips() for
it. The cputype is set to CPU_PROAPTIV for now as it is in the same
range of cores as proAptiv and doesn't currently need to be
distinguished from it in the kernel.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/cpu.h  | 1 +
 arch/mips/kernel/cpu-probe.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 76411df3d971..b69e7306cdb1 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -115,6 +115,7 @@
 #define PRID_IMP_INTERAPTIV_MP	0xa100
 #define PRID_IMP_PROAPTIV_UP	0xa200
 #define PRID_IMP_PROAPTIV_MP	0xa300
+#define PRID_IMP_P5600		0xa800
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_SIBYTE
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 530f832de02c..7bf4634ff045 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -825,6 +825,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_PROAPTIV;
 		__cpu_name[cpu] = "MIPS proAptiv (multi)";
 		break;
+	case PRID_IMP_P5600:
+		c->cputype = CPU_PROAPTIV;
+		__cpu_name[cpu] = "MIPS P5600";
+		break;
 	}
 
 	decode_configs(c);
-- 
1.8.1.2
