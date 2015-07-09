Received: from mailapp01.imgtec.com ([195.59.15.196]:11576 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009895AbbGIJlfKauTh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:35 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 72425BE0CD82A
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:27 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 03/19] MIPS: Add MIPS I6400 probe support
Date: Thu, 9 Jul 2015 10:40:37 +0100
Message-ID: <1436434853-30001-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150709094037.-B70mDEaRRVxOMRCLavEHryUb0FrSm37at_x8ozEbWY@z>

Add a case in cpu_probe_mips for the MIPS I6400 processor ID, which sets
the CPU type to the new CPU_I6400.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index dbe0792fc9c1..02b75127dad3 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1121,6 +1121,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_P5600;
 		__cpu_name[cpu] = "MIPS P5600";
 		break;
+	case PRID_IMP_I6400:
+		c->cputype = CPU_I6400;
+		__cpu_name[cpu] = "MIPS I6400";
+		break;
 	case PRID_IMP_M5150:
 		c->cputype = CPU_M5150;
 		__cpu_name[cpu] = "MIPS M5150";
-- 
2.4.5
