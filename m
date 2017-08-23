Received: from mailapp01.imgtec.com ([195.59.15.196]:52564 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990924AbdHWIV2ESRRZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 10:21:28 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: Revert "MIPS: Fix race on setting and getting cpu_online_mask"
Date: Wed, 23 Aug 2017 09:21:15 +0100
Message-ID: <1503476475-21069-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823082115.p-WaGYnLMbJgWstOzCf2PHCdBsdSPmCP2ZSEI4Ss7hE@z>

Commit 6f542ebeaee0 ("MIPS: Fix race on setting and getting
cpu_online_mask") effectively reverted commit 8f46cca1e6c06 ("MIPS: SMP:
Fix possibility of deadlock when bringing CPUs online") and thus has
reinstated the possibility of deadlock.

The commit was based on testing of kernel v4.4, where the CPU hotplug
code issued a BUG() if the starting CPU is not marked online when the
boot CPU returns from __cpu_up. The commit fixes this race, but
re-introduces the deadlock situation.

As noted in the commit message, upstream differs in this area. The
hotplug code now waits on a completion event in bringup_wait_for_ap,
which is set by the starting CPU in cpuhp_online_idle once it calls
cpu_startup_entry. Thus there is no possibility of a race in upstream,
and this commit has only re-introduced the deadlock condition, which can
be observed on multiple platforms when running a heavy load test at the
same time as hotplugging CPUs. See commit 8f46cca1e6c06 ("MIPS: SMP: Fix
possibility of deadlock when bringing CPUs online") for details.

This reverts commit 6f542ebeaee0ee552a902ce3892220fc22c7ec8e.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
CC: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
---

 arch/mips/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 25f6877ce464..603963e1d8e7 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -383,6 +383,9 @@ asmlinkage void start_secondary(void)
 	cpumask_set_cpu(cpu, &cpu_coherent_mask);
 	notify_cpu_starting(cpu);
 
+	complete(&cpu_running);
+	synchronise_count_slave(cpu);
+
 	set_cpu_online(cpu, true);
 
 	set_cpu_sibling_map(cpu);
@@ -390,9 +393,6 @@ asmlinkage void start_secondary(void)
 
 	calculate_cpu_foreign_map();
 
-	complete(&cpu_running);
-	synchronise_count_slave(cpu);
-
 	/*
 	 * irq will be enabled in ->smp_finish(), enabling it too early
 	 * is dangerous.
-- 
2.7.4
