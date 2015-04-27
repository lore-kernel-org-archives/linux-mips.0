Received: from mailapp01.imgtec.com ([195.59.15.196]:4999 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026171AbbD0OHo0ggf2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Apr 2015 16:07:44 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/4] MIPS: tlbex: Avoid unnecessary _PAGE_PRESENT shifts
Date: Mon, 27 Apr 2015 15:07:18 +0100
Message-ID: <1430143639-22580-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1430143639-22580-1-git-send-email-james.hogan@imgtec.com>
References: <1430143639-22580-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>
Message-ID: <20150427140718.WQG0gbrRxsAL_kI-BCcD6NkReUqV1iDaW1eYNiEFmnA@z>

Commit c5b367835cfc ("MIPS: Add support for XPA.") added generation of a
shift by _PAGE_PRESENT_SHIFT in build_pte_present() and
build_pte_writable(), however except for the XPA case this is always
zero making it unnecessary.

Make the shift conditional upon _PAGE_PRESENT_SHIFT being non-zero to
save an instruction in those cases.

Fixes: c5b367835cfc ("MIPS: Add support for XPA.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mm/tlbex.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index d998fea7fc93..eabd6363934e 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1608,22 +1608,29 @@ build_pte_present(u32 **p, struct uasm_reloc **r,
 		  int pte, int ptr, int scratch, enum label_id lid)
 {
 	int t = scratch >= 0 ? scratch : pte;
+	int cur = pte;
 
 	if (cpu_has_rixi) {
 		if (use_bbit_insns()) {
 			uasm_il_bbit0(p, r, pte, ilog2(_PAGE_PRESENT), lid);
 			uasm_i_nop(p);
 		} else {
-			uasm_i_srl(p, t, pte, _PAGE_PRESENT_SHIFT);
-			uasm_i_andi(p, t, t, 1);
+			if (_PAGE_PRESENT_SHIFT) {
+				uasm_i_srl(p, t, cur, _PAGE_PRESENT_SHIFT);
+				cur = t;
+			}
+			uasm_i_andi(p, t, cur, 1);
 			uasm_il_beqz(p, r, t, lid);
 			if (pte == t)
 				/* You lose the SMP race :-(*/
 				iPTE_LW(p, pte, ptr);
 		}
 	} else {
-		uasm_i_srl(p, t, pte, _PAGE_PRESENT_SHIFT);
-		uasm_i_andi(p, t, t,
+		if (_PAGE_PRESENT_SHIFT) {
+			uasm_i_srl(p, t, cur, _PAGE_PRESENT_SHIFT);
+			cur = t;
+		}
+		uasm_i_andi(p, t, cur,
 			(_PAGE_PRESENT | _PAGE_READ) >> _PAGE_PRESENT_SHIFT);
 		uasm_i_xori(p, t, t,
 			(_PAGE_PRESENT | _PAGE_READ) >> _PAGE_PRESENT_SHIFT);
@@ -1654,9 +1661,13 @@ build_pte_writable(u32 **p, struct uasm_reloc **r,
 		   enum label_id lid)
 {
 	int t = scratch >= 0 ? scratch : pte;
+	int cur = pte;
 
-	uasm_i_srl(p, t, pte, _PAGE_PRESENT_SHIFT);
-	uasm_i_andi(p, t, t,
+	if (_PAGE_PRESENT_SHIFT) {
+		uasm_i_srl(p, t, cur, _PAGE_PRESENT_SHIFT);
+		cur = t;
+	}
+	uasm_i_andi(p, t, cur,
 		    (_PAGE_PRESENT | _PAGE_WRITE) >> _PAGE_PRESENT_SHIFT);
 	uasm_i_xori(p, t, t,
 		    (_PAGE_PRESENT | _PAGE_WRITE) >> _PAGE_PRESENT_SHIFT);
-- 
2.0.5
