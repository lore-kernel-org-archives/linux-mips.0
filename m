Received: from mailapp01.imgtec.com ([195.59.15.196]:60320 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007115AbbCMJSXw8yQX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Mar 2015 10:18:23 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: mm: tlbex: Replace cpu_has_mips_r2_exec_hazard with cpu_has_mips_r2_r6
Date: Fri, 13 Mar 2015 09:18:08 +0000
Message-ID: <1426238288-15560-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1424731974-27926-1-git-send-email-ddaney.cavm@gmail.com>
References: <1424731974-27926-1-git-send-email-ddaney.cavm@gmail.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20150313091808.76aO9yB22S0X9rtujjIU5t9HxyJK4IZCOW3_z-0Z4vM@z>

Commit 77f3ee59ee7cf ("MIPS: mm: tlbex: Use cpu_has_mips_r2_exec_hazard
for the EHB instruction") replaced cpu_has_mips_r2 with
cpu_has_mips_r2_exec_hazard to indicate whether the ISA has the EHB
instruction. However, the meaning of the cpu_has_mips_r2_exec_hazard
is different. It was meant to be used as an indication on whether the
running processor needs to run the EHB instruction instead of checking
whether the EHB is available on the ISA. This broke processors that do
not define cpu_has_mips_r2_exec_hazard. We fix this by replacing the
said macro with cpu_has_mips_r2_r6 which covers R2 and R6 processors.

Fixes: 77f3ee59ee7cf ("MIPS: mm: tlbex: Use cpu_has_mips_r2_exec_hazard for the EHB instruction")
Cc: David Daney <david.daney@cavium.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/tlbex.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index d75ff73a2012..e38d21b62d0f 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -501,7 +501,7 @@ static void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 	case tlb_indexed: tlbw = uasm_i_tlbwi; break;
 	}
 
-	if (cpu_has_mips_r2_exec_hazard) {
+	if (cpu_has_mips_r2_r6) {
 		/*
 		 * The architecture spec says an ehb is required here,
 		 * but a number of cores do not have the hazard and
@@ -1953,7 +1953,7 @@ static void build_r4000_tlb_load_handler(void)
 
 		switch (current_cpu_type()) {
 		default:
-			if (cpu_has_mips_r2_exec_hazard) {
+			if (cpu_has_mips_r2_r6) {
 				uasm_i_ehb(&p);
 
 		case CPU_CAVIUM_OCTEON:
@@ -2020,7 +2020,7 @@ static void build_r4000_tlb_load_handler(void)
 
 		switch (current_cpu_type()) {
 		default:
-			if (cpu_has_mips_r2_exec_hazard) {
+			if (cpu_has_mips_r2_r6) {
 				uasm_i_ehb(&p);
 
 		case CPU_CAVIUM_OCTEON:
-- 
2.3.1
