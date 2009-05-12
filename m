Received: from mail-px0-f119.google.com ([209.85.216.119]:61018 "EHLO
	mail-px0-f119.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20026315AbZELDC7 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 12 May 2009 04:02:59 +0100
Subject: [PATCH] Fix warning: incompatible argument type of virt_to_phys
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 May 2009 11:02:43 +0800
Message-ID: <1242097363.4890.4.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, zhangfx@lemote.com, yanh@lemote.com
Message-ID: <20090512030243.2vsjPFetAtRW7KHfWiSVb40KugdZz9u8wxhwKNMH3uU@z>

From f326164c8ef7950abc1e7bbe0a7490d6d69e2f73 Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Tue, 12 May 2009 10:46:07 +0800
Subject: [PATCH 2/2] Fix warning: incompatible argument type of
virt_to_phys
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

mm/page_alloc.c:1760: warning: passing argument 1 of ‘virt_to_phys’
makes pointer from integer without a cast

mm/page_alloc.c:1760
	...
	unsigned long addr;
	...
	split_page(virt_to_page(addr), order);

arch/mips/include/asm/page.h

	#define virt_to_page(kaddr) pfn_to_page(PFN_DOWN(virt_to_phys(kaddr)))
	#define virt_addr_valid(kaddr)
pfn_valid(PFN_DOWN(virt_to_phys(kaddr)))

arch/mips/include/asm/io.h
	static inline unsigned long virt_to_phys(volatile const void *address)
---
 arch/mips/include/asm/page.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index fe7a88e..15d93ec 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -176,8 +176,8 @@ typedef struct { unsigned long pgprot; } pgprot_t;
 
 #endif
 
-#define virt_to_page(kaddr)	pfn_to_page(PFN_DOWN(virt_to_phys(kaddr)))
-#define virt_addr_valid(kaddr)	pfn_valid(PFN_DOWN(virt_to_phys(kaddr)))
+#define virt_to_page(kaddr)	pfn_to_page(PFN_DOWN(virt_to_phys((void
*)kaddr)))
+#define virt_addr_valid(kaddr)	pfn_valid(PFN_DOWN(virt_to_phys((void
*)kaddr)))
 
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-- 
1.6.2.1
