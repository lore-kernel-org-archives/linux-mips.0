Received: from mailapp01.imgtec.com ([195.59.15.196]:54290 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025505AbbEMKwPcDpA4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 May 2015 12:52:15 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/9] MIPS: dump_tlb: Use tlbr hazard macros
Date: Wed, 13 May 2015 11:50:49 +0100
Message-ID: <1431514255-3030-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1431514255-3030-1-git-send-email-james.hogan@imgtec.com>
References: <1431514255-3030-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>
Message-ID: <20150513105049.ZQ2wSlZOdQHLAgddpGS-1KEBbMt9DJ7AJwOqhNmD3XI@z>

Use the new tlb read hazard macros from <asm/hazards.h> rather than the
local BARRIER() macro which uses 7 ops regardless of the kernel
configuration.

We use mtc0_tlbr_hazard for the hazard between mtc0 to the index
register and the tlbr, and tlb_read_hazard for the hazard between the
tlbr and the mfc0 of the TLB registers written by tlbr.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/lib/dump_tlb.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 32b9f21bfd85..a62dfacb60f7 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 
+#include <asm/hazards.h>
 #include <asm/mipsregs.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
@@ -40,12 +41,6 @@ static inline const char *msk2str(unsigned int mask)
 	return "";
 }
 
-#define BARRIER()					\
-	__asm__ __volatile__(				\
-		".set\tnoreorder\n\t"			\
-		"nop;nop;nop;nop;nop;nop;nop\n\t"	\
-		".set\treorder");
-
 static void dump_tlb(int first, int last)
 {
 	unsigned long s_entryhi, entryhi, asid;
@@ -59,9 +54,9 @@ static void dump_tlb(int first, int last)
 
 	for (i = first; i <= last; i++) {
 		write_c0_index(i);
-		BARRIER();
+		mtc0_tlbr_hazard();
 		tlb_read();
-		BARRIER();
+		tlb_read_hazard();
 		pagemask = read_c0_pagemask();
 		entryhi	 = read_c0_entryhi();
 		entrylo0 = read_c0_entrylo0();
-- 
2.3.6
