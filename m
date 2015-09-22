Received: from mailapp01.imgtec.com ([195.59.15.196]:45834 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVSoSZ1E2P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:44:18 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/6] MIPS: tlbex: share MIPS32 32 bit phys & MIPS64 64 bit phys code
Date: Tue, 22 Sep 2015 11:42:50 -0700
Message-ID: <1442947373-13345-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
References: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922184250.dmlnQQlWy9O_Qp-_CbBjF2D2kGyaM5-6FJjdY9fZk5s@z>

The code in build_update_entries for 64 bit physical addresses on a
MIPS64 CPU and 32 bit physical addresses on a MIPS32 CPU is now
identical, with the exception of r4k bug workaround in the latter which
would simply not apply to the former. Remove the duplication and some

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mm/tlbex.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index ce5a0ec..bc829fc 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1005,15 +1005,7 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 	 * 64bit address support (36bit on a 32bit CPU) in a 32bit
 	 * Kernel is a special case. Only a few CPUs use it.
 	 */
-#ifdef CONFIG_PHYS_ADDR_T_64BIT
-	if (cpu_has_64bits) {
-		uasm_i_ld(p, tmp, 0, ptep); /* get even pte */
-		uasm_i_ld(p, ptep, sizeof(pte_t), ptep); /* get odd pte */
-		build_convert_pte_to_entrylo(p, tmp);
-		UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-		build_convert_pte_to_entrylo(p, ptep);
-		UASM_i_MTC0(p, ptep, C0_ENTRYLO1); /* load it */
-	} else {
+	if (config_enabled(CONFIG_PHYS_ADDR_T_64BIT) && !cpu_has_64bits) {
 		int pte_off_even = sizeof(pte_t) / 2;
 		int pte_off_odd = pte_off_even + sizeof(pte_t);
 #ifdef CONFIG_XPA
@@ -1037,8 +1029,9 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 		uasm_i_mthc0(p, tmp, C0_ENTRYLO0);
 		uasm_i_mthc0(p, ptep, C0_ENTRYLO1);
 #endif
+		return;
 	}
-#else
+
 	UASM_i_LW(p, tmp, 0, ptep); /* get even pte */
 	UASM_i_LW(p, ptep, sizeof(pte_t), ptep); /* get odd pte */
 	if (r45k_bvahwbug())
@@ -1053,7 +1046,6 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 	if (r4k_250MHZhwbug())
 		UASM_i_MTC0(p, 0, C0_ENTRYLO1);
 	UASM_i_MTC0(p, ptep, C0_ENTRYLO1); /* load it */
-#endif
 }
 
 struct mips_huge_tlb_info {
-- 
2.5.3
