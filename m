Received: from mail-bn1lp0139.outbound.protection.outlook.com ([207.46.163.139]:49654
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6816207AbaE1WIzpfaz8 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:08:55 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 06/13] MIPS: Add minimal support for OCTEON3 to c-r4k.c
Date: Wed, 28 May 2014 23:52:09 +0200
Message-ID: <1401313936-11867-7-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215209.ZZgm0LIMH1KB3TRUNuf9lM3T6FABDl2C20ONY7upZsY@z>

From: David Daney <david.daney@cavium.com>

These are needed to boot a generic mips64r2 kernel on OCTEONIII.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/r4kcache.h |    2 ++
 arch/mips/mm/c-r4k.c             |   48 ++++++++++++++++++++++++++++++++++----
 2 files changed, 46 insertions(+), 4 deletions(-)

[andreas.herrmann:
  * Remove R4600_HIT_CACHEOP_WAR_IMPL from r4k_blast_dcache_page_dc128()
  * Use switch statement in r4k_blast_dcache_page_setup()]

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index fe8d1b6..0b8bd28 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -523,6 +523,8 @@ __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 32,
 __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 64, )
 __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64, )
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 64, )
+__BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 128, )
+__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 128, )
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 128, )
 
 __BUILD_BLAST_CACHE(inv_d, dcache, Index_Writeback_Inv_D, Hit_Invalidate_D, 16, )
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5c21282..3eb7270 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -108,18 +108,34 @@ static inline void r4k_blast_dcache_page_dc64(unsigned long addr)
 	blast_dcache64_page(addr);
 }
 
+static inline void r4k_blast_dcache_page_dc128(unsigned long addr)
+{
+	blast_dcache128_page(addr);
+}
+
 static void r4k_blast_dcache_page_setup(void)
 {
 	unsigned long  dc_lsize = cpu_dcache_line_size();
 
-	if (dc_lsize == 0)
+	switch (dc_lsize) {
+	case 0:
 		r4k_blast_dcache_page = (void *)cache_noop;
-	else if (dc_lsize == 16)
+		break;
+	case 16:
 		r4k_blast_dcache_page = blast_dcache16_page;
-	else if (dc_lsize == 32)
+		break;
+	case 32:
 		r4k_blast_dcache_page = r4k_blast_dcache_page_dc32;
-	else if (dc_lsize == 64)
+		break;
+	case 64:
 		r4k_blast_dcache_page = r4k_blast_dcache_page_dc64;
+		break;
+	case 128:
+		r4k_blast_dcache_page = r4k_blast_dcache_page_dc128;
+		break;
+	default:
+		break;
+	}
 }
 
 #ifndef CONFIG_EVA
@@ -158,6 +174,8 @@ static void r4k_blast_dcache_page_indexed_setup(void)
 		r4k_blast_dcache_page_indexed = blast_dcache32_page_indexed;
 	else if (dc_lsize == 64)
 		r4k_blast_dcache_page_indexed = blast_dcache64_page_indexed;
+	else if (dc_lsize == 128)
+		r4k_blast_dcache_page_indexed = blast_dcache128_page_indexed;
 }
 
 void (* r4k_blast_dcache)(void);
@@ -175,6 +193,8 @@ static void r4k_blast_dcache_setup(void)
 		r4k_blast_dcache = blast_dcache32;
 	else if (dc_lsize == 64)
 		r4k_blast_dcache = blast_dcache64;
+	else if (dc_lsize == 128)
+		r4k_blast_dcache = blast_dcache128;
 }
 
 /* force code alignment (used for TX49XX_ICACHE_INDEX_INV_WAR) */
@@ -264,6 +284,8 @@ static void r4k_blast_icache_page_setup(void)
 		r4k_blast_icache_page = blast_icache32_page;
 	else if (ic_lsize == 64)
 		r4k_blast_icache_page = blast_icache64_page;
+	else if (ic_lsize == 128)
+		r4k_blast_icache_page = blast_icache128_page;
 }
 
 #ifndef CONFIG_EVA
@@ -337,6 +359,8 @@ static void r4k_blast_icache_setup(void)
 			r4k_blast_icache = blast_icache32;
 	} else if (ic_lsize == 64)
 		r4k_blast_icache = blast_icache64;
+	else if (ic_lsize == 128)
+		r4k_blast_icache = blast_icache128;
 }
 
 static void (* r4k_blast_scache_page)(unsigned long addr);
@@ -1093,6 +1117,21 @@ static void probe_pcache(void)
 		c->dcache.waybit = 0;
 		break;
 
+	case CPU_CAVIUM_OCTEON3:
+		/* For now lie about the number of ways. */
+		c->icache.linesz = 128;
+		c->icache.sets = 16;
+		c->icache.ways = 8;
+		c->icache.flags |= MIPS_CACHE_VTAG;
+		icache_size = c->icache.sets * c->icache.ways * c->icache.linesz;
+
+		c->dcache.linesz = 128;
+		c->dcache.ways = 8;
+		c->dcache.sets = 8;
+		dcache_size = c->dcache.sets * c->dcache.ways * c->dcache.linesz;
+		c->options |= MIPS_CPU_PREFETCH;
+		break;
+
 	default:
 		if (!(config & MIPS_CONF_M))
 			panic("Don't know how to probe P-caches on this cpu.");
@@ -1413,6 +1452,7 @@ static void setup_scache(void)
 		loongson3_sc_init();
 		return;
 
+	case CPU_CAVIUM_OCTEON3:
 	case CPU_XLP:
 		/* don't need to worry about L2, fully coherent */
 		return;
-- 
1.7.9.5
