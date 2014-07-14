Received: from mailapp01.imgtec.com ([195.59.15.196]:31061 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6815921AbaGNPjnichk2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Jul 2014 17:39:43 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH] mips: fix a warning for virt_to_page
Date: Mon, 14 Jul 2014 16:39:19 +0100
Message-ID: <1405352359-15277-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20140714153919.SCF5vD0Yne_A0_Cu_DNVHOciXrodcJY5MPcPEDbxgqI@z>

Compiling mm/highmem.c gives a warning: passing argument 1 of
'virt_to_phys' makes pointer from integer without a cast

Fixed by casting to void*

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 arch/mips/include/asm/page.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 5699ec3..fd0347d 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -223,7 +223,8 @@ static inline int pfn_valid(unsigned long pfn)
 
 #endif
 
-#define virt_to_page(kaddr)	pfn_to_page(PFN_DOWN(virt_to_phys(kaddr)))
+#define virt_to_page(kaddr)	pfn_to_page(PFN_DOWN(virt_to_phys((void *)     \
+								  (kaddr))))
 
 extern int __virt_addr_valid(const volatile void *kaddr);
 #define virt_addr_valid(kaddr)						\
-- 
1.9.1
