Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:47463 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990506AbdKFVQxYtopl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 6 Nov 2017 22:16:53 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH BACKPORT 4.1..4.9] MIPS: SMP: Fix deadlock & online race
Date: Mon, 6 Nov 2017 21:15:14 +0000
Message-ID: <20171106211514.29104-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: stable@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, James Hogan <james.hogan@mips.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>, James Hogan <jhogan@kernel.org>
Message-ID: <20171106211514.52NEVs-BTWnT7nQqmtB9-r3oly931Rmmy2XzpBYAVAM@z>

From: Matt Redfearn <matt.redfearn@imgtec.com>

commit 9e8c399a88f0b87e41a894911475ed2a8f8dff9e upstream.

Commit 6f542ebeaee0 ("MIPS: Fix race on setting and getting
cpu_online_mask") effectively reverted commit 8f46cca1e6c06 ("MIPS: SMP:
Fix possibility of deadlock when bringing CPUs online") and thus has
reinstated the possibility of deadlock.

The commit was based on testing of kernel v4.4, where the CPU hotplug
core code issued a BUG() if the starting CPU is not marked online when
the boot CPU returns from __cpu_up. The commit fixes this race (in
v4.4), but re-introduces the deadlock situation.

As noted in the commit message, upstream differs in this area. Commit
8df3e07e7f21f ("cpu/hotplug: Let upcoming cpu bring itself fully up")
adds a completion event in the CPU hotplug core code, making this race
impossible. However, people were unhappy with relying on the core code
to do the right thing.

To address the issues both commits were trying to fix, add a second
completion event in the MIPS smp hotplug path. It removes the
possibility of a race, since the MIPS smp hotplug code now synchronises
both the boot and secondary CPUs before they return to the hotplug core
code. It also addresses the deadlock by ensuring that the secondary CPU
is not marked online before it's counters are synchronised.

This fix should also be backported to fix the race condition introduced
by the backport of commit 8f46cca1e6c06 ("MIPS: SMP: Fix possibility of
deadlock when bringing CPUs online"), through really that race only
existed before commit 8df3e07e7f21f ("cpu/hotplug: Let upcoming cpu
bring itself fully up").

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Fixes: 6f542ebeaee0 ("MIPS: Fix race on setting and getting cpu_online_mask")
CC: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
Cc: <stable@vger.kernel.org> # v4.1+: 8f46cca1e6c0: "MIPS: SMP: Fix possibility of deadlock when bringing CPUs online"
Cc: <stable@vger.kernel.org> # v4.1+: a00eeede507c: "MIPS: SMP: Use a completion event to signal CPU up"
Cc: <stable@vger.kernel.org> # v4.1+: 6f542ebeaee0: "MIPS: Fix race on setting and getting cpu_online_mask"
Cc: <stable@vger.kernel.org> # v4.1+
Patchwork: https://patchwork.linux-mips.org/patch/17376/
Signed-off-by: James Hogan <jhogan@kernel.org>
[jhogan@kernel.org: Backported 4.1..4.9]
---
 arch/mips/kernel/smp.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 61d5248382f0..95ba4271af6a 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -68,6 +68,7 @@ EXPORT_SYMBOL(cpu_sibling_map);
 cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_core_map);
 
+static DECLARE_COMPLETION(cpu_starting);
 static DECLARE_COMPLETION(cpu_running);
 
 /*
@@ -371,6 +372,12 @@ asmlinkage void start_secondary(void)
 	cpumask_set_cpu(cpu, &cpu_coherent_mask);
 	notify_cpu_starting(cpu);
 
+	/* Notify boot CPU that we're starting & ready to sync counters */
+	complete(&cpu_starting);
+
+	synchronise_count_slave(cpu);
+
+	/* The CPU is running and counters synchronised, now mark it online */
 	set_cpu_online(cpu, true);
 
 	set_cpu_sibling_map(cpu);
@@ -378,8 +385,11 @@ asmlinkage void start_secondary(void)
 
 	calculate_cpu_foreign_map();
 
+	/*
+	 * Notify boot CPU that we're up & online and it can safely return
+	 * from __cpu_up
+	 */
 	complete(&cpu_running);
-	synchronise_count_slave(cpu);
 
 	/*
 	 * irq will be enabled in ->smp_finish(), enabling it too early
@@ -438,17 +448,17 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
 	mp_ops->boot_secondary(cpu, tidle);
 
-	/*
-	 * We must check for timeout here, as the CPU will not be marked
-	 * online until the counters are synchronised.
-	 */
-	if (!wait_for_completion_timeout(&cpu_running,
+	/* Wait for CPU to start and be ready to sync counters */
+	if (!wait_for_completion_timeout(&cpu_starting,
 					 msecs_to_jiffies(1000))) {
 		pr_crit("CPU%u: failed to start\n", cpu);
 		return -EIO;
 	}
 
 	synchronise_count_master(cpu);
+
+	/* Wait for CPU to finish startup & mark itself online before return */
+	wait_for_completion(&cpu_running);
 	return 0;
 }
 
-- 
2.14.1
