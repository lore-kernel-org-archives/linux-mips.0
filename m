Received: from mx1.netlogicmicro.com ([12.203.210.36]:3555 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1491055Ab1JWNoO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 23 Oct 2011 15:44:14 +0200
Date: Sun, 23 Oct 2011 19:13:40 +0530
From: Hillf Danton <dhillf@gmail.com>
Subject: [PATCH 12/12] MIPS: Netlogic: Mark Netlogic chips as SMT capable
Message-ID: <20111023134334.GA29864@jayachandranc.netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20111023134340.2k7bqHoOzfq0y_Yhk5dnGqMnUpS-abLY-ME9GTza0q8@z>

Netlogic XLR chip has multiple cores. Each core includes four integrated
hardware threads, and they share L1 data and instruction caches.

If the chip is marked to be SMT capable, scheduler then could do more, say,
idle load balancing.

Changes are now confined only to the code of XLR, and hardware is probed
to get core ID for correct setup.

[jayachandranc: simplified and adapted for new merged XLR/XLP code]

Signed-off-by: Hillf Danton <dhillf@gmail.com>
Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/netlogic/common/smp.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/mips/netlogic/common/smp.c b/arch/mips/netlogic/common/smp.c
index 4657fe8..7249f93 100644
--- a/arch/mips/netlogic/common/smp.c
+++ b/arch/mips/netlogic/common/smp.c
@@ -108,9 +108,16 @@ void nlm_early_init_secondary(int cpu)
  */
 static void __cpuinit nlm_init_secondary(void)
 {
+	current_cpu_data.core = hard_smp_processor_id() / 4;
 	nlm_smp_irq_init();
 }
 
+void nlm_prepare_cpus(unsigned int max_cpus)
+{
+	/* declare we are SMT capable */
+	smp_num_siblings = nlm_threads_per_core;
+}
+
 void nlm_smp_finish(void)
 {
 #ifdef notyet
@@ -179,10 +186,6 @@ void __init nlm_smp_setup(void)
 	nlm_set_nmi_handler(nlm_boot_secondary_cpus);
 }
 
-void nlm_prepare_cpus(unsigned int max_cpus)
-{
-}
-
 static int nlm_parse_cpumask(u32 cpu_mask)
 {
 	uint32_t core0_thr_mask, core_thr_mask;
-- 
1.7.4.1
