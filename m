Received: from mailapp01.imgtec.com ([195.59.15.196]:9658 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011124AbbAZJlWftMas (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 10:41:22 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/3] MIPS: asm: pgtable: Prevent HTW race when updating PTEs
Date: Mon, 26 Jan 2015 09:40:36 +0000
Message-ID: <1422265236-29290-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com>
References: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150126094036.AO1K4Z-AoSda3Q8sVCYCNPTmHwnROKCQjSJubXNGexQ@z>

Whenever we modify a page table entry, we need to ensure that the HTW
will not fetch a stable entry. And for that to happen we need to ensure
that HTW is stopped before we modify the said entry otherwise the HTW
may already be in the process of reading that entry and fetching the
old information. As a result of which, we replace the htw_reset() calls
with htw_{stop,start} in more appropriate places. This also removes the
remaining users of htw_reset() and as a result we drop that macro

Cc: <stable@vger.kernel.org> # 3.17+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/pgtable.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index d2c7e9e7447e..4f92607ce36e 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -127,14 +127,6 @@ do {									\
 } while(0)
 
 
-#define htw_reset()							\
-do {									\
-	if (cpu_has_htw) {						\
-		htw_stop();						\
-		htw_start();						\
-	}								\
-} while(0)
-
 extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	pte_t pteval);
 
@@ -166,12 +158,13 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 {
 	pte_t null = __pte(0);
 
+	htw_stop();
 	/* Preserve global status for the pair */
 	if (ptep_buddy(ptep)->pte_low & _PAGE_GLOBAL)
 		null.pte_low = null.pte_high = _PAGE_GLOBAL;
 
 	set_pte_at(mm, addr, ptep, null);
-	htw_reset();
+	htw_start();
 }
 #else
 
@@ -201,6 +194,7 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 
 static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
+	htw_stop();
 #if !defined(CONFIG_CPU_R3000) && !defined(CONFIG_CPU_TX39XX)
 	/* Preserve global status for the pair */
 	if (pte_val(*ptep_buddy(ptep)) & _PAGE_GLOBAL)
@@ -208,7 +202,7 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 	else
 #endif
 		set_pte_at(mm, addr, ptep, __pte(0));
-	htw_reset();
+	htw_start();
 }
 #endif
 
-- 
2.2.2
