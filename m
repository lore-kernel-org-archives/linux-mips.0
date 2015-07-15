Received: from mailapp01.imgtec.com ([195.59.15.196]:4175 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011207AbbGOPR57VdfK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Jul 2015 17:17:57 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 4/6] MIPS: dump_tlb: Only dump PageGrain if interesting
Date: Wed, 15 Jul 2015 16:17:45 +0100
Message-ID: <1436973467-3877-5-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1436973467-3877-1-git-send-email-james.hogan@imgtec.com>
References: <1436973467-3877-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Joshua Kinard <kumba@gentoo.org>
Message-ID: <20150715151745.2mZ-9fqWrvCnO6zUiq1Q7N0jQQmv3JegNOaR2uFsVqw@z>

The PageGrain register may not exist if certain architectural features
aren't present, therefore only print out its value when dumping the TLB
registers if it is expected to contain fields relevant to the TLB.

Fixes: d1e9a4f54735 ("MIPS: Add SysRq operation to dump TLBs on all CPUs")
Reported-by: Joshua Kinard <kumba@gentoo.org>
Reported-by: Maciej W. Rozycki <macro@linux-mips.org>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Joshua Kinard <kumba@gentoo.org>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/lib/dump_tlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 519ededbf9a4..2ab83be14ffa 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -23,7 +23,8 @@ void dump_tlb_regs(void)
 	pr_info("EntryLo0 : %0*lx\n", field, read_c0_entrylo0());
 	pr_info("EntryLo1 : %0*lx\n", field, read_c0_entrylo1());
 	pr_info("Wired    : %0x\n", read_c0_wired());
-	pr_info("PageGrain: %0x\n", read_c0_pagegrain());
+	if (cpu_has_small_pages || cpu_has_rixi || cpu_has_xpa)
+		pr_info("PageGrain: %0x\n", read_c0_pagegrain());
 	if (cpu_has_htw) {
 		pr_info("PWField  : %0*lx\n", field, read_c0_pwfield());
 		pr_info("PWSize   : %0*lx\n", field, read_c0_pwsize());
-- 
2.3.6
