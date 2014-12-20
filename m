Received: from mail-ie0-f181.google.com ([209.85.223.181]:51128 "EHLO
        mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009080AbaLTAdRY0xlH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Dec 2014 01:33:17 +0100
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 1/2] Revert "MIPS: Use dedicated exception handler if CPU supports RI/XI exceptions"
Date: Fri, 19 Dec 2014 16:33:04 -0800
Message-ID: <1419035585-21671-2-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com>
References: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com>
Return-Path: <ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20141220003304.Gl_YVR2qfakAfTGPGhUqJTTqs6Ca7IVKUZe_1unH7UE@z>

From: David Daney <david.daney@cavium.com>

This reverts commit 5890f70f15c52d0204a578422f8da828a0ba1096.

The patch was not tested, It sets PG_IEC in cpu-probe.  But this value
is clobbered in tlb_init() so the system is never configured to take
the RIXI specific exceptions, and we end up in an endless loop in
handle_tlbl because that code is not expecting the XI condition.

Cc: <stable@vger.kernel.org>
Signed-off-by: David Daney <david.daney@cavium.com>
---
 arch/mips/kernel/traps.c | 7 -------
 arch/mips/mm/tlbex.c     | 4 ++--
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index ad3d203..722ed75 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -90,7 +90,6 @@ extern asmlinkage void handle_mt(void);
 extern asmlinkage void handle_dsp(void);
 extern asmlinkage void handle_mcheck(void);
 extern asmlinkage void handle_reserved(void);
-extern void tlb_do_page_fault_0(void);
 
 void (*board_be_init)(void);
 int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
@@ -2205,12 +2204,6 @@ void __init trap_init(void)
 		set_except_vector(15, handle_fpe);
 
 	set_except_vector(16, handle_ftlb);
-
-	if (cpu_has_rixiex) {
-		set_except_vector(19, tlb_do_page_fault_0);
-		set_except_vector(20, tlb_do_page_fault_0);
-	}
-
 	set_except_vector(21, handle_msa);
 	set_except_vector(22, handle_mdmx);
 
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 3978a3d..c9e0150 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1934,7 +1934,7 @@ static void build_r4000_tlb_load_handler(void)
 	if (m4kc_tlbp_war())
 		build_tlb_probe_entry(&p);
 
-	if (cpu_has_rixi && !cpu_has_rixiex) {
+	if (cpu_has_rixi) {
 		/*
 		 * If the page is not _PAGE_VALID, RI or XI could not
 		 * have triggered it.  Skip the expensive test..
@@ -2001,7 +2001,7 @@ static void build_r4000_tlb_load_handler(void)
 	build_pte_present(&p, &r, wr.r1, wr.r2, wr.r3, label_nopage_tlbl);
 	build_tlb_probe_entry(&p);
 
-	if (cpu_has_rixi && !cpu_has_rixiex) {
+	if (cpu_has_rixi) {
 		/*
 		 * If the page is not _PAGE_VALID, RI or XI could not
 		 * have triggered it.  Skip the expensive test..
-- 
1.7.11.7
