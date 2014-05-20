Received: from mail-bl2lp0208.outbound.protection.outlook.com ([207.46.163.208]:26693
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855085AbaETOtCVq67k (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:49:02 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 06/15] MIPS: Add minimal support for OCTEON3 to c-r4k.c
Date: Tue, 20 May 2014 16:47:07 +0200
Message-ID: <1400597236-11352-7-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140520144707.h_1zjlskjaRYSiMvNqPeefyWqyyGX_lK_sl_BUolnJs@z>

From: David Daney <david.daney@cavium.com>

These are needed to boot a generic mips64r2 kernel on OCTEONIII.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/r4kcache.h |    2 ++
 arch/mips/mm/c-r4k.c             |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index ca64cbe..1d86791 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -524,6 +524,8 @@ __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 32,
 __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 64, )
 __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64, )
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 64, )
+__BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 128, )
+__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 128, )
 __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 128, )
 
 __BUILD_BLAST_CACHE(inv_d, dcache, Index_Writeback_Inv_D, Hit_Invalidate_D, 16, )
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 1c74a6a..789ede9 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -109,6 +109,12 @@ static inline void r4k_blast_dcache_page_dc64(unsigned long addr)
 	blast_dcache64_page(addr);
 }
 
+static inline void r4k_blast_dcache_page_dc128(unsigned long addr)
+{
+	R4600_HIT_CACHEOP_WAR_IMPL;
+	blast_dcache128_page(addr);
+}
+
 static void r4k_blast_dcache_page_setup(void)
 {
 	unsigned long  dc_lsize = cpu_dcache_line_size();
@@ -121,6 +127,8 @@ static void r4k_blast_dcache_page_setup(void)
 		r4k_blast_dcache_page = r4k_blast_dcache_page_dc32;
 	else if (dc_lsize == 64)
 		r4k_blast_dcache_page = r4k_blast_dcache_page_dc64;
+	else if (dc_lsize == 128)
+		r4k_blast_dcache_page = r4k_blast_dcache_page_dc128;
 }
 
 #ifndef CONFIG_EVA
@@ -159,6 +167,8 @@ static void r4k_blast_dcache_page_indexed_setup(void)
 		r4k_blast_dcache_page_indexed = blast_dcache32_page_indexed;
 	else if (dc_lsize == 64)
 		r4k_blast_dcache_page_indexed = blast_dcache64_page_indexed;
+	else if (dc_lsize == 128)
+		r4k_blast_dcache_page_indexed = blast_dcache128_page_indexed;
 }
 
 void (* r4k_blast_dcache)(void);
@@ -176,6 +186,8 @@ static void r4k_blast_dcache_setup(void)
 		r4k_blast_dcache = blast_dcache32;
 	else if (dc_lsize == 64)
 		r4k_blast_dcache = blast_dcache64;
+	else if (dc_lsize == 128)
+		r4k_blast_dcache = blast_dcache128;
 }
 
 /* force code alignment (used for TX49XX_ICACHE_INDEX_INV_WAR) */
@@ -265,6 +277,8 @@ static void r4k_blast_icache_page_setup(void)
 		r4k_blast_icache_page = blast_icache32_page;
 	else if (ic_lsize == 64)
 		r4k_blast_icache_page = blast_icache64_page;
+	else if (ic_lsize == 128)
+		r4k_blast_icache_page = blast_icache128_page;
 }
 
 #ifndef CONFIG_EVA
@@ -338,6 +352,8 @@ static void r4k_blast_icache_setup(void)
 			r4k_blast_icache = blast_icache32;
 	} else if (ic_lsize == 64)
 		r4k_blast_icache = blast_icache64;
+	else if (ic_lsize == 128)
+		r4k_blast_icache = blast_icache128;
 }
 
 static void (* r4k_blast_scache_page)(unsigned long addr);
@@ -1094,6 +1110,21 @@ static void probe_pcache(void)
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
@@ -1414,6 +1445,7 @@ static void setup_scache(void)
 		loongson3_sc_init();
 		return;
 
+	case CPU_CAVIUM_OCTEON3:
 	case CPU_XLP:
 		/* don't need to worry about L2, fully coherent */
 		return;
-- 
1.7.9.5
