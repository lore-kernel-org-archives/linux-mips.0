Received: from multi.imgtec.com ([194.200.65.239]:1075 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6865323Ab3KNQM637d17 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 14 Nov 2013 17:12:58 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 08/12] MIPS: kernel: cpu-probe: Add support for probing proAptiv cores
Date: Thu, 14 Nov 2013 16:12:28 +0000
Message-ID: <1384445552-30573-9-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1384445552-30573-1-git-send-email-markos.chandras@imgtec.com>
References: <1384445552-30573-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20131114161228.yB4iwk0DvLsY6vVh1zBH_96Nxwg4Bsh04Qh1K4HLGbA@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b534d33..3f2468f 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -746,6 +746,14 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_74K;
 		__cpu_name[cpu] = "MIPS 1074Kc";
 		break;
+	case PRID_IMP_PROAPTIV_UP:
+		c->cputype = CPU_PROAPTIV;
+		__cpu_name[cpu] = "MIPS proAptiv";
+		break;
+	case PRID_IMP_PROAPTIV_MP:
+		c->cputype = CPU_PROAPTIV;
+		__cpu_name[cpu] = "MIPS proAptiv (multi)";
+		break;
 	}
 
 	spram_config();
-- 
1.8.4.3
