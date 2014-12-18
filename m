Received: from mailapp01.imgtec.com ([195.59.15.196]:1193 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009139AbaLRPKydeTX1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:10:54 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C191D5F18000
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:10:45 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 03/67] MIPS: Add MIPS QEMUR6 probe support
Date: Thu, 18 Dec 2014 15:09:12 +0000
Message-ID: <1418915416-3196-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150912.CdFNt4uOIQfvMMlOGTtGESM0qhekaJlUtrbXm7ORlnQ@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Add a case in cpu_probe_mips for the MIPS QEMUR6 processor ID.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index dc49cf30c2db..08574035b239 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -836,6 +836,11 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 	switch (c->processor_id & PRID_IMP_MASK) {
+	case PRID_IMP_QEMUR6:
+		c->writecombine = _CACHE_UNCACHED;
+		c->cputype = CPU_QEMUR6;
+		__cpu_name[cpu] = "MIPS QEMU R6";
+		break;
 	case PRID_IMP_4KC:
 		c->cputype = CPU_4KC;
 		c->writecombine = _CACHE_UNCACHED;
-- 
2.2.0
