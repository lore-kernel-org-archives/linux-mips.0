Received: from mailapp01.imgtec.com ([195.59.15.196]:15662 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861334AbaGRJv7aN2XG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 11:51:59 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id B79977CDF7D77
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 10:51:50 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/4] MIPS: pgtable-bits: Move the CCA bits out of the core's ifdef blocks
Date: Fri, 18 Jul 2014 10:51:30 +0100
Message-ID: <1405677093-22591-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
References: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140718095130.THvRBjd4zC-YhgEhuDfvZGbOW1rnYfTkgrhXZoCwsQY@z>

Define all the CCA bits outside the ifdef blocks for specific cores
but also allow cores to override them if necessary.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/pgtable-bits.h | 41 ++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index e592f3687d6f..011b0dcf306e 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -224,38 +224,47 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 
 #define _CACHE_CACHABLE_NONCOHERENT 0
+#define _CACHE_UNCACHED_ACCELERATED _CACHE_UNCACHED
 
 #elif defined(CONFIG_CPU_SB1)
 
 /* No penalty for being coherent on the SB1, so just
    use it for "noncoherent" spaces, too.  Shouldn't hurt. */
 
-#define _CACHE_UNCACHED		    (2<<_CACHE_SHIFT)
-#define _CACHE_CACHABLE_COW	    (5<<_CACHE_SHIFT)
 #define _CACHE_CACHABLE_NONCOHERENT (5<<_CACHE_SHIFT)
-#define _CACHE_UNCACHED_ACCELERATED (7<<_CACHE_SHIFT)
 
 #elif defined(CONFIG_CPU_LOONGSON3)
 
 /* Using COHERENT flag for NONCOHERENT doesn't hurt. */
 
-#define _CACHE_UNCACHED             (2<<_CACHE_SHIFT)  /* LOONGSON       */
 #define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* LOONGSON       */
 #define _CACHE_CACHABLE_COHERENT    (3<<_CACHE_SHIFT)  /* LOONGSON-3     */
-#define _CACHE_UNCACHED_ACCELERATED (7<<_CACHE_SHIFT)  /* LOONGSON       */
 
-#else
-
-#define _CACHE_CACHABLE_NO_WA	    (0<<_CACHE_SHIFT)  /* R4600 only	  */
-#define _CACHE_CACHABLE_WA	    (1<<_CACHE_SHIFT)  /* R4600 only	  */
-#define _CACHE_UNCACHED		    (2<<_CACHE_SHIFT)  /* R4[0246]00	  */
-#define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* R4[0246]00	  */
-#define _CACHE_CACHABLE_CE	    (4<<_CACHE_SHIFT)  /* R4[04]00MC only */
-#define _CACHE_CACHABLE_COW	    (5<<_CACHE_SHIFT)  /* R4[04]00MC only */
-#define _CACHE_CACHABLE_COHERENT    (5<<_CACHE_SHIFT)  /* MIPS32R2 CMP	  */
-#define _CACHE_CACHABLE_CUW	    (6<<_CACHE_SHIFT)  /* R4[04]00MC only */
-#define _CACHE_UNCACHED_ACCELERATED (7<<_CACHE_SHIFT)  /* R10000 only	  */
+#endif
 
+#ifndef _CACHE_CACHABLE_NO_WA
+#define _CACHE_CACHABLE_NO_WA		(0<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_CACHABLE_WA
+#define _CACHE_CACHABLE_WA		(1<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_UNCACHED
+#define _CACHE_UNCACHED			(2<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_CACHABLE_NONCOHERENT
+#define _CACHE_CACHABLE_NONCOHERENT	(3<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_CACHABLE_CE
+#define _CACHE_CACHABLE_CE		(4<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_CACHABLE_COW
+#define _CACHE_CACHABLE_COW		(5<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_CACHABLE_CUW
+#define _CACHE_CACHABLE_CUW		(6<<_CACHE_SHIFT)
+#endif
+#ifndef _CACHE_UNCACHED_ACCELERATED
+#define _CACHE_UNCACHED_ACCELERATED	(7<<_CACHE_SHIFT)
 #endif
 
 #define __READABLE	(_PAGE_SILENT_READ | _PAGE_ACCESSED | (cpu_has_rixi ? 0 : _PAGE_READ))
-- 
2.0.0
