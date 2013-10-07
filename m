Received: from multi.imgtec.com ([194.200.65.239]:33683 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6868725Ab3JGJnePYnQ1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 7 Oct 2013 11:43:34 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: kernel: cpu-probe: Report CPU id during probe
Date: Mon, 7 Oct 2013 10:43:32 +0100
Message-ID: <1381139012-27471-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20131007094332.6cQHV9P87I7L9IOpas-146EXHsBS2C0fixAnViGof9A@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 040b83d..c814287 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1099,8 +1099,8 @@ void cpu_report(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
 
-	printk(KERN_INFO "CPU revision is: %08x (%s)\n",
-	       c->processor_id, cpu_name_string());
+	pr_info("CPU%d revision is: %08x (%s)\n",
+		smp_processor_id(), c->processor_id, cpu_name_string());
 	if (c->options & MIPS_CPU_FPU)
 		printk(KERN_INFO "FPU revision is: %08x\n", c->fpu_id);
 }
-- 
1.8.3.2
