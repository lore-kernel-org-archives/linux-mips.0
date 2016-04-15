Received: from mailapp01.imgtec.com ([195.59.15.196]:16991 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026671AbcDOKkMTBLje (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Apr 2016 12:40:12 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 11/12] MIPS: mm: Simplify build_update_entries
Date: Fri, 15 Apr 2016 11:36:59 +0100
Message-ID: <1460716620-13382-12-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1460716620-13382-1-git-send-email-paul.burton@imgtec.com>
References: <1460716620-13382-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Huacai Chen <chenhc@lemote.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160415103659.POxTQgENBblHvlw3O10UZRLM4wP8TGQ4jR9bFBpbxc0@z>

We can simplify build_update_entries by unifying the code for the 36 bit
physical addressing with MIPS32 case with the general case, by using
pte_off_ variables in all cases & handling the trivial
_PAGE_GLOBAL_SHIFT == 0 case in build_convert_pte_to_entrylo. This
leaves XPA as the only special case.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mm/tlbex.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 0bd3755..45234ad 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -626,6 +626,11 @@ static void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 static __maybe_unused void build_convert_pte_to_entrylo(u32 **p,
 							unsigned int reg)
 {
+	if (_PAGE_GLOBAL_SHIFT == 0) {
+		/* pte_t is already in EntryLo format */
+		return;
+	}
+
 	if (cpu_has_rixi && _PAGE_NO_EXEC) {
 		if (fill_includes_sw_bits) {
 			UASM_i_ROTR(p, reg, reg, ilog2(_PAGE_GLOBAL));
@@ -1003,10 +1008,17 @@ static void build_get_ptep(u32 **p, unsigned int tmp, unsigned int ptr)
 
 static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 {
-	if (config_enabled(CONFIG_XPA)) {
-		int pte_off_even = sizeof(pte_t) / 2;
-		int pte_off_odd = pte_off_even + sizeof(pte_t);
+	int pte_off_even = 0;
+	int pte_off_odd = sizeof(pte_t);
+
+	if (config_enabled(CONFIG_PHYS_ADDR_T_64BIT) &&
+	    config_enabled(CONFIG_32BIT)) {
+		/* The low 32 bits of EntryLo is stored in pte_high */
+		pte_off_even += offsetof(pte_t, pte_high);
+		pte_off_odd += offsetof(pte_t, pte_high);
+	}
 
+	if (config_enabled(CONFIG_XPA)) {
 		uasm_i_lw(p, tmp, pte_off_even, ptep); /* even pte */
 		UASM_i_ROTR(p, tmp, tmp, ilog2(_PAGE_GLOBAL));
 		UASM_i_MTC0(p, tmp, C0_ENTRYLO0);
@@ -1025,24 +1037,8 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 		return;
 	}
 
-	/*
-	 * 64bit address support (36bit on a 32bit CPU) in a 32bit
-	 * Kernel is a special case. Only a few CPUs use it.
-	 */
-	if (config_enabled(CONFIG_PHYS_ADDR_T_64BIT) && !cpu_has_64bits) {
-		int pte_off_even = sizeof(pte_t) / 2;
-		int pte_off_odd = pte_off_even + sizeof(pte_t);
-
-		uasm_i_lw(p, tmp, pte_off_even, ptep); /* even pte */
-		UASM_i_MTC0(p, tmp, C0_ENTRYLO0);
-
-		uasm_i_lw(p, ptep, pte_off_odd, ptep); /* odd pte */
-		UASM_i_MTC0(p, ptep, C0_ENTRYLO1);
-		return;
-	}
-
-	UASM_i_LW(p, tmp, 0, ptep); /* get even pte */
-	UASM_i_LW(p, ptep, sizeof(pte_t), ptep); /* get odd pte */
+	UASM_i_LW(p, tmp, pte_off_even, ptep); /* get even pte */
+	UASM_i_LW(p, ptep, pte_off_odd, ptep); /* get odd pte */
 	if (r45k_bvahwbug())
 		build_tlb_probe_entry(p);
 	build_convert_pte_to_entrylo(p, tmp);
-- 
2.8.0
