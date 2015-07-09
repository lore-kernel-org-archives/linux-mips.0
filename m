Received: from mailapp01.imgtec.com ([195.59.15.196]:12566 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009981AbbGIJl7srwhh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:59 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D30B5E1017A9F
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:51 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 19/19] MIPS: Set up FTLB probability for I6400
Date: Thu, 9 Jul 2015 10:40:53 +0100
Message-ID: <1436434853-30001-20-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150709094053.ESXZswlUuqp7jaFZemTfoHMAFFlVY9dK_LqOzBtG6Yk@z>

Set up the I6400 FTLB probability similar to P5600 and proAptiv.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/mipsregs.h |  2 ++
 arch/mips/kernel/cpu-probe.c     | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index c5b0956a8530..723ee3c7849d 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -579,6 +579,8 @@
 
 #define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
 #define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
+/* FTLB probability bits for R6 */
+#define MIPS_CONF7_FTLBP_SHIFT	(18)
 
 /* MAAR bit definitions */
 #define MIPS_MAAR_ADDR		((BIT_ULL(BITS_PER_LONG - 12) - 1) << 12)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 62dae429fe70..4e39b340f3b7 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -369,25 +369,33 @@ static unsigned int calculate_ftlb_probability(struct cpuinfo_mips *c)
 
 static int set_ftlb_enable(struct cpuinfo_mips *c, int enable)
 {
-	unsigned int config6;
+	unsigned int config;
 
 	/* It's implementation dependent how the FTLB can be enabled */
 	switch (c->cputype) {
 	case CPU_PROAPTIV:
 	case CPU_P5600:
 		/* proAptiv & related cores use Config6 to enable the FTLB */
-		config6 = read_c0_config6();
+		config = read_c0_config6();
 		/* Clear the old probability value */
-		config6 &= ~(3 << MIPS_CONF6_FTLBP_SHIFT);
+		config &= ~(3 << MIPS_CONF6_FTLBP_SHIFT);
 		if (enable)
 			/* Enable FTLB */
-			write_c0_config6(config6 |
+			write_c0_config6(config |
 					 (calculate_ftlb_probability(c)
 					  << MIPS_CONF6_FTLBP_SHIFT)
 					 | MIPS_CONF6_FTLBEN);
 		else
 			/* Disable FTLB */
-			write_c0_config6(config6 &  ~MIPS_CONF6_FTLBEN);
+			write_c0_config6(config &  ~MIPS_CONF6_FTLBEN);
+		break;
+	case CPU_I6400:
+		/* I6400 & related cores use Config7 to configure FTLB */
+		config = read_c0_config7();
+		/* Clear the old probability value */
+		config &= ~(3 << MIPS_CONF7_FTLBP_SHIFT);
+		write_c0_config7(config | (calculate_ftlb_probability(c)
+					   << MIPS_CONF7_FTLBP_SHIFT));
 		break;
 	default:
 		return 1;
-- 
2.4.5
