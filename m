Received: from fep19.mx.upcmail.net ([62.179.121.39]:39614 "EHLO
        fep19.mx.upcmail.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6871923Ab3LYOHpliEnh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Dec 2013 15:07:45 +0100
From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <petr.pisar@atlas.cz>
Subject: [PATCH 2/2] Fix page fault handling on Loongson 2
Date: Wed, 25 Dec 2013 15:04:22 +0100
Message-ID: <1387980262-2250-3-git-send-email-petr.pisar@atlas.cz>
In-Reply-To: <1387980262-2250-1-git-send-email-petr.pisar@atlas.cz>
References: <1387980262-2250-1-git-send-email-petr.pisar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-Path: <petr.pisar@atlas.cz>
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
Cc: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <petr.pisar@atlas.cz>
Message-ID: <20131225140422.Oqi2mdbVndmOHYZMTVBAKTIsJJ1IUiFJwC56CfYJwls@z>

This bug was introduced by not fully covered Loongson/R4K schism of
Hit_Invalidate_I macro in commit 14bd8c082016cd1f67fdfd702e4cf6367869a712
(MIPS: Loongson: Get rid of Loongson 2 #ifdefery all over arch/mips).

The system paniced on first user space page fault, e.g. on executing
init, in blast_icache32_page().

Signed-off-by: Petr Písař <petr.pisar@atlas.cz>
---
 arch/mips/include/asm/r4kcache.h | 12 ++++++++++++
 arch/mips/mm/c-r4k.c             |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 34d1a19..b6f25a1 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -411,13 +411,25 @@ static inline void blast_##pfx##cache##lsize##_page_indexed(unsigned long page)
 }
 
 __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16)
+#if defined(CONFIG_CPU_LOONGSON2)
+__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I_Loongson23, 16)
+#else
 __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16)
+#endif
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16)
 __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 32)
+#if defined(CONFIG_CPU_LOONGSON2)
+__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I_Loongson23, 32)
+#else
 __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 32)
+#endif
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 32)
 __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 64)
+#if defined(CONFIG_CPU_LOONGSON2)
+__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I_Loongson23, 64)
+#else
 __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64)
+#endif
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 64)
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 128)
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 1c2029d..c511fd7 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -718,7 +718,12 @@ static void local_r4k_flush_cache_sigtramp(void * arg)
 			"1:\n\t"
 			".set pop"
 			:
-			: "i" (Hit_Invalidate_I));
+#if defined(CONFIG_CPU_LOONGSON2)
+			: "i" (Hit_Invalidate_I_Loongson23)
+#else
+			: "i" (Hit_Invalidate_I)
+#endif
+        );
 	}
 	if (MIPS_CACHE_SYNC_WAR)
 		__asm__ __volatile__ ("sync");
-- 
1.8.5.1
