Received: from mailapp01.imgtec.com ([195.59.15.196]:32594 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011386AbcBCD1pXDBdQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:27:45 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/3] MIPS: Probe the P6600 core
Date: Wed, 3 Feb 2016 03:26:39 +0000
Message-ID: <1454469999-17818-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469999-17818-1-git-send-email-paul.burton@imgtec.com>
References: <1454469999-17818-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160203032639.F4GctQue03d1vHDk_qqWGW86VR3Ik_s9kNHCRUgXXno@z>

Support probing the P6600 core now that cases for handling it have been
added throughout the core MIPS kernel code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/cpu-probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index bc54458..92cc4d8 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1315,6 +1315,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_P5600;
 		__cpu_name[cpu] = "MIPS P5600";
 		break;
+	case PRID_IMP_P6600:
+		c->cputype = CPU_P6600;
+		__cpu_name[cpu] = "MIPS P6600";
+		break;
 	case PRID_IMP_I6400:
 		c->cputype = CPU_I6400;
 		__cpu_name[cpu] = "MIPS I6400";
-- 
2.7.0
