Received: from mail-io0-f171.google.com ([209.85.223.171]:34695 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012260AbbHDAtH73ubU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Aug 2015 02:49:07 +0200
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH] MIPS: Make set_pte() SMP safe.
Date: Mon,  3 Aug 2015 17:48:43 -0700
Message-ID: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com>
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
Cc: David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20150804004843.nziGhv1gZtqef3zT1TtIv1Uw9xJhlLJaGjHw3PCccW8@z>

From: David Daney <david.daney@cavium.com>

On MIPS the GLOBAL bit of the PTE must have the same value in any
aligned pair of PTEs.  These pairs of PTEs are referred to as
"buddies".  In a SMP system is is possible for two CPUs to be calling
set_pte() on adjacent PTEs at the same time.  There is a race between
setting the PTE and a different CPU setting the GLOBAL bit in its
buddy PTE.

This race can be observed when multiple CPUs are executing
vmap()/vfree() at the same time.

Make setting the buddy PTE's GLOBAL bit an atomic operation to close
the race condition.

The case of CONFIG_64BIT_PHYS_ADDR && CONFIG_CPU_MIPS32 is *not*
handled.

Signed-off-by: David Daney <david.daney@cavium.com>
Cc: <stable@vger.kernel.org>
---
 arch/mips/include/asm/pgtable.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 9d81067..ae85694 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -182,8 +182,39 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 		 * Make sure the buddy is global too (if it's !none,
 		 * it better already be global)
 		 */
+#ifdef CONFIG_SMP
+		/*
+		 * For SMP, multiple CPUs can race, so we need to do
+		 * this atomically.
+		 */
+#ifdef CONFIG_64BIT
+#define LL_INSN "lld"
+#define SC_INSN "scd"
+#else /* CONFIG_32BIT */
+#define LL_INSN "ll"
+#define SC_INSN "sc"
+#endif
+		unsigned long page_global = _PAGE_GLOBAL;
+		unsigned long tmp;
+
+		__asm__ __volatile__ (
+			"	.set	push\n"
+			"	.set	noreorder\n"
+			"1:	" LL_INSN "	%[tmp], %[buddy]\n"
+			"	bnez	%[tmp], 2f\n"
+			"	 or	%[tmp], %[tmp], %[global]\n"
+			"	" SC_INSN "	%[tmp], %[buddy]\n"
+			"	beqz	%[tmp], 1b\n"
+			"	 nop\n"
+			"2:\n"
+			"	.set pop"
+			: [buddy] "+m" (buddy->pte),
+			  [tmp] "=&r" (tmp)
+			: [global] "r" (page_global));
+#else /* !CONFIG_SMP */
 		if (pte_none(*buddy))
 			pte_val(*buddy) = pte_val(*buddy) | _PAGE_GLOBAL;
+#endif /* CONFIG_SMP */
 	}
 #endif
 }
-- 
1.7.11.7
