Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:54518 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990488AbdLOJgiIHYp1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Dec 2017 10:36:38 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/2] MIPS: SMP-CPS: Remove duplicate assignment of core in play_dead
Date: Fri, 15 Dec 2017 09:34:53 +0000
Message-ID: <1513330494-21249-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, jhogan@kernel.org
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Dengcheng Zhu <dengcheng.zhu@mips.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@kernel.org>
Message-ID: <20171215093453.sZwWqgZd8ProglwAj9q-sbAcGDOOQee0P6ik5cK3Ojs@z>

The merge of commit f875a832d2028 ("MIPS: Abstract CPU core & VP(E) ID
access through accessor functions") ended up creating a duplicate
assignment of core during the rebase on commit bac06cf0fb9d ("MIPS:
smp-cps: Fix potentially uninitialised value of core"). Remove the
duplicate.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/kernel/smp-cps.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index ecc1a853f48d..03f1026ad148 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -439,8 +439,6 @@ void play_dead(void)
 	pr_debug("CPU%d going offline\n", cpu);
 
 	if (cpu_has_mipsmt || cpu_has_vp) {
-		core = cpu_core(&cpu_data[cpu]);
-
 		/* Look for another online VPE within the core */
 		for_each_online_cpu(cpu_death_sibling) {
 			if (!cpus_are_siblings(cpu, cpu_death_sibling))
-- 
2.7.4
