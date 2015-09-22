Received: from mailapp01.imgtec.com ([195.59.15.196]:16874 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVSnkh3kyP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:43:40 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/6] MIPS: tlbex: stop open-coding build_convert_pte_to_entrylo
Date: Tue, 22 Sep 2015 11:42:48 -0700
Message-ID: <1442947373-13345-2-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150922184248.agVk6bV4FSl52I9gpeCcFHGrXM5IdJhntRSv-OolF5Q@z>

Make use of build_convert_pte_to_entrylo in the RIXI cases within
build_update_entries rather than open-coding it 4 times.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mm/tlbex.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 323d1d3..0dd24b0 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1010,13 +1010,13 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 		uasm_i_ld(p, tmp, 0, ptep); /* get even pte */
 		uasm_i_ld(p, ptep, sizeof(pte_t), ptep); /* get odd pte */
 		if (cpu_has_rixi) {
-			UASM_i_ROTR(p, tmp, tmp, ilog2(_PAGE_GLOBAL));
+			build_convert_pte_to_entrylo(p, tmp);
 			UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-			UASM_i_ROTR(p, ptep, ptep, ilog2(_PAGE_GLOBAL));
+			build_convert_pte_to_entrylo(p, ptep);
 		} else {
-			uasm_i_dsrl_safe(p, tmp, tmp, ilog2(_PAGE_GLOBAL)); /* convert to entrylo0 */
+			build_convert_pte_to_entrylo(p, tmp);
 			UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-			uasm_i_dsrl_safe(p, ptep, ptep, ilog2(_PAGE_GLOBAL)); /* convert to entrylo1 */
+			build_convert_pte_to_entrylo(p, ptep);
 		}
 		UASM_i_MTC0(p, ptep, C0_ENTRYLO1); /* load it */
 	} else {
@@ -1050,17 +1050,17 @@ static void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep)
 	if (r45k_bvahwbug())
 		build_tlb_probe_entry(p);
 	if (cpu_has_rixi) {
-		UASM_i_ROTR(p, tmp, tmp, ilog2(_PAGE_GLOBAL));
+		build_convert_pte_to_entrylo(p, tmp);
 		if (r4k_250MHZhwbug())
 			UASM_i_MTC0(p, 0, C0_ENTRYLO0);
 		UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-		UASM_i_ROTR(p, ptep, ptep, ilog2(_PAGE_GLOBAL));
+		build_convert_pte_to_entrylo(p, ptep);
 	} else {
-		UASM_i_SRL(p, tmp, tmp, ilog2(_PAGE_GLOBAL)); /* convert to entrylo0 */
+		build_convert_pte_to_entrylo(p, tmp);
 		if (r4k_250MHZhwbug())
 			UASM_i_MTC0(p, 0, C0_ENTRYLO0);
 		UASM_i_MTC0(p, tmp, C0_ENTRYLO0); /* load it */
-		UASM_i_SRL(p, ptep, ptep, ilog2(_PAGE_GLOBAL)); /* convert to entrylo1 */
+		build_convert_pte_to_entrylo(p, ptep);
 		if (r45k_bvahwbug())
 			uasm_i_mfc0(p, tmp, C0_INDEX);
 	}
-- 
2.5.3
