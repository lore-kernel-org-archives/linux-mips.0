Received: from mailapp01.imgtec.com ([195.59.15.196]:63122 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010657AbbAPKwimu6Qz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:38 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 7CDE14A43E8F8
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:30 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 26/70] MIPS: kernel: cpu-bugs64: Do not check R6 cores for existing 64-bit bugs
Date: Fri, 16 Jan 2015 10:49:05 +0000
Message-ID: <1421405389-15512-27-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104905.95swp6cfp6c2QAb4sxwa3Ph7VSTT1wnfUpMm2p4-dQ0@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

The current HW bugs checked in cpu-bugs64, do not apply to R6 cores
and they cause compilation problems due to removed <R6 instructions,
so do not check for them for the time being.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-bugs64.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/cpu-bugs64.c b/arch/mips/kernel/cpu-bugs64.c
index 2d80b5f1aeae..09f4034f239f 100644
--- a/arch/mips/kernel/cpu-bugs64.c
+++ b/arch/mips/kernel/cpu-bugs64.c
@@ -244,7 +244,7 @@ static inline void check_daddi(void)
 	panic(bug64hit, !DADDI_WAR ? daddiwar : nowar);
 }
 
-int daddiu_bug	= -1;
+int daddiu_bug	= config_enabled(CONFIG_CPU_MIPSR6) ? 0 : -1;
 
 static inline void check_daddiu(void)
 {
@@ -314,11 +314,14 @@ static inline void check_daddiu(void)
 
 void __init check_bugs64_early(void)
 {
-	check_mult_sh();
-	check_daddiu();
+	if (!config_enabled(CONFIG_CPU_MIPSR6)) {
+		check_mult_sh();
+		check_daddiu();
+	}
 }
 
 void __init check_bugs64(void)
 {
-	check_daddi();
+	if (!config_enabled(CONFIG_CPU_MIPSR6))
+		check_daddi();
 }
-- 
2.2.1
