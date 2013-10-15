Received: from multi.imgtec.com ([194.200.65.239]:21811 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823088Ab3JOONjfJgZ4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 15 Oct 2013 16:13:39 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: MT: proc: Add support for printing VPE and TC ids
Date: Tue, 15 Oct 2013 15:13:02 +0100
Message-ID: <1381846382-26437-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20131015141302.QTOM3i7ccVTsSa0DaErG9QMzH2Ax91WoO4QvnWOko5E@z>

Add support for including VPE and TC ids in /proc/cpuinfo output as
appropriate when MT/SMTC is enabled.

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/kernel/proc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 8c58d8a..db49bfa 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -107,7 +107,14 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "kscratch registers\t: %d\n",
 		      hweight8(cpu_data[n].kscratch_mask));
 	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
-
+#if defined(CONFIG_MIPS_MT_SMP) || defined(CONFIG_MIPS_MT_SMTC)
+	if (cpu_has_mipsmt) {
+		seq_printf(m, "VPE\t\t\t: %d\n", cpu_data[n].vpe_id);
+#if defined(CONFIG_MIPS_MT_SMTC)
+		seq_printf(m, "TC\t\t\t: %d\n", cpu_data[n].tc_id);
+#endif
+	}
+#endif
 	sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
 		      cpu_has_vce ? "%u" : "not available");
 	seq_printf(m, fmt, 'D', vced_count);
-- 
1.8.3.2
