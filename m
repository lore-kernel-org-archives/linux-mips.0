Received: from mailapp01.imgtec.com ([195.59.15.196]:43384 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009178AbaLRPMQlmj6S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:12:16 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 6E52FF13035B1
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:12:08 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 29/67] MIPS: kernel: proc: Add MIPS R6 support to /proc/cpuinfo
Date: Thu, 18 Dec 2014 15:09:38 +0000
Message-ID: <1418915416-3196-30-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141218150938.IkuCyjVx_1t_r49E7LT1CcUizFH6yEMisOGfyoPdbvY@z>

Print 'mips64r6' and/or 'mips32r6' if the kernel is running on
a MIPS R6 core.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/proc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 097fc8d14e42..b2194770878d 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -82,7 +82,10 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "]\n");
 	}
 
-	seq_printf(m, "isa\t\t\t: mips1");
+	if (!cpu_has_mips_r6)
+		seq_printf(m, "isa\t\t\t: mips1");
+	else
+		seq_printf(m, "isa\t\t\t:");
 	if (cpu_has_mips_2)
 		seq_printf(m, "%s", " mips2");
 	if (cpu_has_mips_3)
@@ -95,10 +98,14 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "%s", " mips32r1");
 	if (cpu_has_mips32r2)
 		seq_printf(m, "%s", " mips32r2");
+	if (cpu_has_mips32r6)
+		seq_printf(m, "%s", " mips32r6");
 	if (cpu_has_mips64r1)
 		seq_printf(m, "%s", " mips64r1");
 	if (cpu_has_mips64r2)
 		seq_printf(m, "%s", " mips64r2");
+	if (cpu_has_mips64r6)
+		seq_printf(m, "%s", " mips64r6");
 	seq_printf(m, "\n");
 
 	seq_printf(m, "ASEs implemented\t:");
-- 
2.2.0
