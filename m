Received: from mailapp01.imgtec.com ([195.59.15.196]:22485 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990557AbdDGLki7e9gW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Apr 2017 13:40:38 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH v2] MIPS: Use common outgoing-CPU-notification code
Date: Fri, 7 Apr 2017 13:40:28 +0200
Message-ID: <1491565228-24218-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170407114028.l3bwz5oHH3WvmYeIZah_2VGmfswLUuNWGnMJ7aX2E28@z>

Replace the open-coded CPU-offline notification with common code.
In particular avoid calling scheduler code using RCU from an offline CPU
that RCU is ignoring.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>

---
v2: improved commit message
---
 arch/mips/kernel/smp-cps.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 6d45f05..0aee71b 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -408,7 +408,6 @@ static int cps_cpu_disable(void)
 	return 0;
 }
 
-static DECLARE_COMPLETION(cpu_death_chosen);
 static unsigned cpu_death_sibling;
 static enum {
 	CPU_DEATH_HALT,
@@ -444,7 +443,7 @@ void play_dead(void)
 	}
 
 	/* This CPU has chosen its way out */
-	complete(&cpu_death_chosen);
+	(void)cpu_report_death();
 
 	if (cpu_death == CPU_DEATH_HALT) {
 		vpe_id = cpu_vpe_id(&cpu_data[cpu]);
@@ -493,8 +492,7 @@ static void cps_cpu_die(unsigned int cpu)
 	int err;
 
 	/* Wait for the cpu to choose its way out */
-	if (!wait_for_completion_timeout(&cpu_death_chosen,
-					 msecs_to_jiffies(5000))) {
+	if (!cpu_wait_death(cpu, 5)) {
 		pr_err("CPU%u: didn't offline\n", cpu);
 		return;
 	}
-- 
2.7.4
