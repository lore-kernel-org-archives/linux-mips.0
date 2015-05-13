Received: from mailapp01.imgtec.com ([195.59.15.196]:49905 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013296AbbEMKvQsg4YH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 May 2015 12:51:16 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 9/9] MIPS: tlb-r4k: Fix PG_ELPA comment
Date: Wed, 13 May 2015 11:50:55 +0100
Message-ID: <1431514255-3030-10-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, David Daney <ddaney@caviumnetworks.com>
Message-ID: <20150513105055.L7-pnIJ08zf0WYCsEu6ambWO5FRAyx4eIb75tte_Kbo@z>

The ELPA bit in PageGrain is all about large *physical* addresses, so
correct the reference to "large virtual address" in the comment above
where it is set for MIPS64.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mm/tlb-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index a27a088e6f9f..08318ecb803a 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -495,7 +495,7 @@ static void r4k_tlb_configure(void)
 
 	if (cpu_has_rixi) {
 		/*
-		 * Enable the no read, no exec bits, and enable large virtual
+		 * Enable the no read, no exec bits, and enable large physical
 		 * address.
 		 */
 #ifdef CONFIG_64BIT
-- 
2.3.6
