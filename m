Received: from mailapp01.imgtec.com ([195.59.15.196]:15906 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992815AbcGHNGMBwCIV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 Jul 2016 15:06:12 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: tlbex: Avoid duplicated single_insn_swpd
Date: Fri, 8 Jul 2016 14:05:56 +0100
Message-ID: <1467983156-30230-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, David Daney <ddaney@caviumnetworks.com>, linux-mips@linux-mips.org
Message-ID: <20160708130556.BhCMdHaxaLruXoImo6eTX_WoAIbcXfF0TvBsm9puEKQ@z>

The expression "uasm_in_compat_space_p(swpd) && !uasm_rel_lo(swpd)" is
used twice in build_get_pgd_vmalloc64(), one of which is assigned to the
local variable single_insn_swpd. Update the other use to just use
single_insn_swpd instead to remove the duplication.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mm/tlbex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 4004b659ce50..7886cce9ebe2 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -888,7 +888,7 @@ build_get_pgd_vmalloc64(u32 **p, struct uasm_label **l, struct uasm_reloc **r,
 		}
 	}
 	if (!did_vmalloc_branch) {
-		if (uasm_in_compat_space_p(swpd) && !uasm_rel_lo(swpd)) {
+		if (single_insn_swpd) {
 			uasm_il_b(p, r, label_vmalloc_done);
 			uasm_i_lui(p, ptr, uasm_rel_hi(swpd));
 		} else {
-- 
2.4.10
