Received: from mailapp01.imgtec.com ([195.59.15.196]:38792 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991964AbcKGL2gOKcis (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:28:36 +0100
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
        by Forcepoint Email with ESMTPS id 165FD96AA3303
        for <linux-mips@linux-mips.org>; Mon,  7 Nov 2016 11:28:28 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Remove unused HIGHMEM_DEBUG macro
Date: Mon, 7 Nov 2016 11:28:12 +0000
Message-ID: <20161107112812.14328-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161107112812.Nr9Y6OsHOhg9zsn_8wrXZeksVMkhqV3iAoeVQvMEIeo@z>

We have a HIGHMEM_DEBUG macro defined in asm/highmem.h with a comment
stating that it should be removed for production, and no users... Kill
it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/highmem.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 64f2500..d34536e 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -25,9 +25,6 @@
 #include <asm/cpu-features.h>
 #include <asm/kmap_types.h>
 
-/* undef for production */
-#define HIGHMEM_DEBUG 1
-
 /* declarations for highmem.c */
 extern unsigned long highstart_pfn, highend_pfn;
 
-- 
2.10.2
