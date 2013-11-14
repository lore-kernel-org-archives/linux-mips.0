Received: from multi.imgtec.com ([194.200.65.239]:1075 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6860726Ab3KNQM6A9fu9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 14 Nov 2013 17:12:58 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 05/12] MIPS: tlb: Set the EHINV bit for TLBINVF cores when invalidating the TLB
Date: Thu, 14 Nov 2013 16:12:25 +0000
Message-ID: <1384445552-30573-6-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1384445552-30573-1-git-send-email-markos.chandras@imgtec.com>
References: <1384445552-30573-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20131114161225.02zwXIsMqRuAOifIszzYUyh05kMeJ7jea5hUQnjK4nM@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

For MIPS32R3 supported cores, the EHINV bit needs to be set when
invalidating the TLB. This is necessary because the legacy software
method of representing an invalid TLB entry using an unmapped address
value is not guaranteed to work.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/tlb.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/tlb.h b/arch/mips/include/asm/tlb.h
index 235367ce..4a23493 100644
--- a/arch/mips/include/asm/tlb.h
+++ b/arch/mips/include/asm/tlb.h
@@ -18,7 +18,9 @@
  */
 #define tlb_flush(tlb) flush_tlb_mm((tlb)->mm)
 
-#define UNIQUE_ENTRYHI(idx)	(CKSEG0 + ((idx) << (PAGE_SHIFT + 1)))
+#define UNIQUE_ENTRYHI(idx)						\
+		((CKSEG0 + ((idx) << (PAGE_SHIFT + 1))) |		\
+		 (cpu_has_tlbinv ? MIPS_ENTRYHI_EHINV : 0))
 
 #include <asm-generic/tlb.h>
 
-- 
1.8.4.3
