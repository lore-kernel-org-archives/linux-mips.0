Received: from mailapp01.imgtec.com ([195.59.15.196]:58816 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009984AbbGIJl6UYBlh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:58 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D83E0C259ABE5
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:50 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 18/19] MIPS: kernel: cpu-probe: Fix VTLB/FTLB configuration for R6
Date: Thu, 9 Jul 2015 10:40:52 +0100
Message-ID: <1436434853-30001-19-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150709094052.ioEMFSauAGZ7E2mVOA_jFEhlbvl_K5hTWauD7bRQBwI@z>

R6 has dropped the MMUExtDef field from the config4 register and it
now returns 0. However, the return value means nothing in that case
and the only supported configuration for R6 is the VTLB+FTLB
(MMUextDef == 3). As a result, rework the code so that the correct
value is set for R6 cores.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6da5f2db6792..62dae429fe70 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -546,7 +546,16 @@ static inline unsigned int decode_config4(struct cpuinfo_mips *c)
 	if (cpu_has_tlb) {
 		if (((config4 & MIPS_CONF4_IE) >> 29) == 2)
 			c->options |= MIPS_CPU_TLBINV;
-		mmuextdef = config4 & MIPS_CONF4_MMUEXTDEF;
+		/*
+		 * This is a bit ugly. R6 has dropped that field from
+		 * config4 and the only valid configuration is VTLB+FTLB so
+		 * set a good value for mmuextdef for that case.
+		 */
+		if (cpu_has_mips_r6)
+			mmuextdef = MIPS_CONF4_MMUEXTDEF_VTLBSIZEEXT;
+		else
+			mmuextdef = config4 & MIPS_CONF4_MMUEXTDEF;
+
 		switch (mmuextdef) {
 		case MIPS_CONF4_MMUEXTDEF_MMUSIZEEXT:
 			c->tlbsize += (config4 & MIPS_CONF4_MMUSIZEEXT) * 0x40;
-- 
2.4.5
