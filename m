Received: from mailapp01.imgtec.com ([195.59.15.196]:43542 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008860AbbGAIOEb4Sp4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Jul 2015 10:14:04 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/7] MIPS: kernel: smp-cps: Fix 64-bit compatibility errors due to pointer casting
Date: Wed, 1 Jul 2015 09:13:28 +0100
Message-ID: <1435738414-30944-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
References: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150701081328.0Cl9sJE8tqMO9yR6YgJLdixVb3GQUBzSWH_kVR-LJCM@z>

Commit 1d8f1f5a780a ("MIPS: smp-cps: hotplug support") added hotplug
support in the SMP/CPS implementation but it introduced a few build problems
on 64-bit kernels due to pointer being casted to and from 'int' C types. We
fix this problem by using 'unsigned long' instead which should match the size
of the pointers in 32/64-bit kernels. Finally, we fix the comment since the
CM base address is loaded to v1($3) instead of v0.

Fixes the following build problems:

arch/mips/kernel/smp-cps.c: In function 'wait_for_sibling_halt':
arch/mips/kernel/smp-cps.c:366:17: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
[...]
arch/mips/kernel/smp-cps.c: In function 'cps_cpu_die':
arch/mips/kernel/smp-cps.c:427:13: error: cast to pointer
from integer of different size [-Werror=int-to-pointer-cast]

cc1: all warnings being treated as errors

Fixes: 1d8f1f5a780a ("MIPS: smp-cps: hotplug support")
Cc: <stable@vger.kernel.org> # 3.16+
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/smp-cps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 4251d390b5b6..c88937745b4e 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -133,7 +133,7 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	/*
 	 * Patch the start of mips_cps_core_entry to provide:
 	 *
-	 * v0 = CM base address
+	 * v1 = CM base address
 	 * s0 = kseg0 CCA
 	 */
 	entry_code = (u32 *)&mips_cps_core_entry;
@@ -369,7 +369,7 @@ void play_dead(void)
 
 static void wait_for_sibling_halt(void *ptr_cpu)
 {
-	unsigned cpu = (unsigned)ptr_cpu;
+	unsigned cpu = (unsigned long)ptr_cpu;
 	unsigned vpe_id = cpu_vpe_id(&cpu_data[cpu]);
 	unsigned halted;
 	unsigned long flags;
@@ -430,7 +430,7 @@ static void cps_cpu_die(unsigned int cpu)
 		 */
 		err = smp_call_function_single(cpu_death_sibling,
 					       wait_for_sibling_halt,
-					       (void *)cpu, 1);
+					       (void *)(unsigned long)cpu, 1);
 		if (err)
 			panic("Failed to call remote sibling CPU\n");
 	}
-- 
2.4.5
