Received: from mailapp01.imgtec.com ([195.89.28.114]:44148 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6824789AbaCDNfMqdtsp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Mar 2014 14:35:12 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 49F02F067CB0B
        for <linux-mips@linux-mips.org>; Tue,  4 Mar 2014 13:35:04 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/3] MIPS: kernel: cpu-probe: Add support for probing M5150 cores
Date: Tue, 4 Mar 2014 13:34:44 +0000
Message-ID: <1393940084-29518-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
References: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140304133444.jbbCBLOaOyh5Y73Hcdb5s8HjBu-qg8Rt1pJOXlzQJyE@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e225b0d..f422954 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -853,6 +853,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_P5600;
 		__cpu_name[cpu] = "MIPS P5600";
 		break;
+	case PRID_IMP_M5150:
+		c->cputype = CPU_M5150;
+		__cpu_name[cpu] = "MIPS M5150";
+		break;
 	}
 
 	decode_configs(c);
-- 
1.9.0
