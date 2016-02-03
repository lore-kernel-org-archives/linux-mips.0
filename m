Received: from mailapp01.imgtec.com ([195.59.15.196]:18690 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012378AbcBCQSqCUGOQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 17:18:46 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/3] MIPS: Probe the M6250 CPU
Date: Wed, 3 Feb 2016 16:17:30 +0000
Message-ID: <1454516250-9395-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454516250-9395-1-git-send-email-paul.burton@imgtec.com>
References: <1454516250-9395-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160203161730.bW6qQj90fAHlElL_onwbPKum84vL_ye-4mSs0PddN30@z>

Support probing the M6250 CPU now that cases for handling it have been
added where required in the core MIPS kernel code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/kernel/cpu-probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 92cc4d8..429e2e1 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1327,6 +1327,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_M5150;
 		__cpu_name[cpu] = "MIPS M5150";
 		break;
+	case PRID_IMP_M6250:
+		c->cputype = CPU_M6250;
+		__cpu_name[cpu] = "MIPS M6250";
+		break;
 	}
 
 	decode_configs(c);
-- 
2.7.0
