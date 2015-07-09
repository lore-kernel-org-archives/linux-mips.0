Received: from mailapp01.imgtec.com ([195.59.15.196]:48948 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009976AbbGIJl5HBeJh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:57 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3C0B9314913BA
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:49 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 17/19] MIPS: Add default case for the FTLB enable/disable code
Date: Thu, 9 Jul 2015 10:40:51 +0100
Message-ID: <1436434853-30001-18-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150709094051.zDgipLIM4AIYmvT3SssBrBT6aNj3zXPQjBhYB-3LetY@z>

Add a default case for the FTLB enable/disable code. This will be used
to detect that something went wrong in the set_ftlb_enable() function
either because that function knows nothing about the running core, or
simply because the core can't turn its FTLB on/off.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index dc057f37305b..6da5f2db6792 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -188,7 +188,7 @@ __setup("nohtw", htw_disable);
 static int mips_ftlb_disabled;
 static int mips_has_ftlb_configured;
 
-static void set_ftlb_enable(struct cpuinfo_mips *c, int enable);
+static int set_ftlb_enable(struct cpuinfo_mips *c, int enable);
 
 static int __init ftlb_disable(char *s)
 {
@@ -202,7 +202,10 @@ static int __init ftlb_disable(char *s)
 		return 1;
 
 	/* Disable it in the boot cpu */
-	set_ftlb_enable(&cpu_data[0], 0);
+	if (set_ftlb_enable(&cpu_data[0], 0)) {
+		pr_warn("Can't turn FTLB off\n");
+		return 1;
+	}
 
 	back_to_back_c0_hazard();
 
@@ -364,7 +367,7 @@ static unsigned int calculate_ftlb_probability(struct cpuinfo_mips *c)
 		return 3;
 }
 
-static void set_ftlb_enable(struct cpuinfo_mips *c, int enable)
+static int set_ftlb_enable(struct cpuinfo_mips *c, int enable)
 {
 	unsigned int config6;
 
@@ -386,7 +389,11 @@ static void set_ftlb_enable(struct cpuinfo_mips *c, int enable)
 			/* Disable FTLB */
 			write_c0_config6(config6 &  ~MIPS_CONF6_FTLBEN);
 		break;
+	default:
+		return 1;
 	}
+
+	return 0;
 }
 
 static inline unsigned int decode_config0(struct cpuinfo_mips *c)
-- 
2.4.5
