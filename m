Received: from multi.imgtec.com ([194.200.65.239]:43124 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823923Ab3KTKsKs7ZcT (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 20 Nov 2013 11:48:10 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/3] MIPS: kernel: cpu-probe: Add support for probing interAptiv cores
Date: Wed, 20 Nov 2013 10:46:02 +0000
Message-ID: <1384944362-7197-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1384944362-7197-1-git-send-email-markos.chandras@imgtec.com>
References: <1384944362-7197-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20131120104602.Zvad6HhzzHw5I79dqsq2yhZcT-t2BLMt2uphR1ppqb4@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 5487822..fba3709 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -809,6 +809,14 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_74K;
 		__cpu_name[cpu] = "MIPS 1074Kc";
 		break;
+	case PRID_IMP_INTERAPTIV_UP:
+		c->cputype = CPU_INTERAPTIV;
+		__cpu_name[cpu] = "MIPS interAptiv";
+		break;
+	case PRID_IMP_INTERAPTIV_MP:
+		c->cputype = CPU_INTERAPTIV;
+		__cpu_name[cpu] = "MIPS interAptiv (multi)";
+		break;
 	case PRID_IMP_PROAPTIV_UP:
 		c->cputype = CPU_PROAPTIV;
 		__cpu_name[cpu] = "MIPS proAptiv";
-- 
1.8.4.3
