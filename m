Received: from mailapp01.imgtec.com ([195.59.15.196]:8045 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVSn6sEl4P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:43:58 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/6] MIPS: tlbex: remove some RIXI redundancy
Date: Tue, 22 Sep 2015 11:42:49 -0700
Message-ID: <1442947373-13345-3-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922184249.8ajykUrPrtisdo-wBwYD3mGsV8F_6a-CejwqozBiPlE@z>

The cpu_has_rixi cases in build_update_entries are now identical to the
non-RIXI cases with the one exception of the r45k_bvahwbug case which is
hardcoded as never happening anyway & presumably was either missed from
the RIXI path or would never happen on a CPU with RIXI support. Remove
the redundant checks & duplication.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mm/tlbex.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 0dd24b0..ce5a0ec 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1009,15 +1009,9 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 	if (cpu_has_64bits) {
 		uasm_i_ld(p, tmp, 0, ptep); /* get even pte */
 		uasm_i_ld(p, ptep, sizeof(pte_t), ptep); /* get odd pte */
-		if (cpu_has_rixi) {
-			build_convert_pte_to_entrylo(p, tmp);
-			UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-			build_convert_pte_to_entrylo(p, ptep);
-		} else {
-			build_convert_pte_to_entrylo(p, tmp);
-			UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-			build_convert_pte_to_entrylo(p, ptep);
-		}
+		build_convert_pte_to_entrylo(p, tmp);
+		UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
+		build_convert_pte_to_entrylo(p, ptep);
 		UASM_i_MTC0(p, ptep, C0_ENTRYLO1); /* load it */
 	} else {
 		int pte_off_even = sizeof(pte_t) / 2;
@@ -1049,21 +1043,13 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 	UASM_i_LW(p, ptep, sizeof(pte_t), ptep); /* get odd pte */
 	if (r45k_bvahwbug())
 		build_tlb_probe_entry(p);
-	if (cpu_has_rixi) {
-		build_convert_pte_to_entrylo(p, tmp);
-		if (r4k_250MHZhwbug())
-			UASM_i_MTC0(p, 0, C0_ENTRYLO0);
-		UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-		build_convert_pte_to_entrylo(p, ptep);
-	} else {
-		build_convert_pte_to_entrylo(p, tmp);
-		if (r4k_250MHZhwbug())
-			UASM_i_MTC0(p, 0, C0_ENTRYLO0);
-		UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-		build_convert_pte_to_entrylo(p, ptep);
-		if (r45k_bvahwbug())
-			uasm_i_mfc0(p, tmp, C0_INDEX);
-	}
+	build_convert_pte_to_entrylo(p, tmp);
+	if (r4k_250MHZhwbug())
+		UASM_i_MTC0(p, 0, C0_ENTRYLO0);
+	UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
+	build_convert_pte_to_entrylo(p, ptep);
+	if (r45k_bvahwbug())
+		uasm_i_mfc0(p, tmp, C0_INDEX);
 	if (r4k_250MHZhwbug())
 		UASM_i_MTC0(p, 0, C0_ENTRYLO1);
 	UASM_i_MTC0(p, ptep, C0_ENTRYLO1); /* load it */
-- 
2.5.3
