Received: from nivc-ms1.auriga.com ([80.240.102.146]:17934 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014607AbbAONNMmMgFf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 15 Jan 2015 14:13:12 +0100
From: Aleksey Makarov <aleksey.makarov@auriga.com>
Subject: [PATCH v3 09/15] MIPS: OCTEON: Implement DCache errata workaround for all CN6XXX
Date: Thu, 15 Jan 2015 16:11:13 +0300
Message-ID: <1421327487-28679-10-git-send-email-aleksey.makarov@auriga.com>
In-Reply-To: <1421327487-28679-1-git-send-email-aleksey.makarov@auriga.com>
References: <1421327487-28679-1-git-send-email-aleksey.makarov@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150115131113.e0u8AV5ILcrFEPDMbyGVJCay4BhB8_KhsttYRmHZ9jo@z>

From: David Daney <david.daney@cavium.com>

Make messages refer to all CN6XXX.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
---
 arch/mips/cavium-octeon/setup.c                | 7 ++++---
 arch/mips/include/asm/mach-cavium-octeon/war.h | 3 +++
 arch/mips/mm/uasm.c                            | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 5da0fcc..7ff3def 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1070,7 +1070,7 @@ EXPORT_SYMBOL(prom_putchar);
 
 void prom_free_prom_memory(void)
 {
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX_PASS1_X)) {
+	if (CAVIUM_OCTEON_DCACHE_PREFETCH_WAR) {
 		/* Check for presence of Core-14449 fix.  */
 		u32 insn;
 		u32 *foo;
@@ -1092,8 +1092,9 @@ void prom_free_prom_memory(void)
 			panic("No PREF instruction at Core-14449 probe point.");
 
 		if (((insn >> 16) & 0x1f) != 28)
-			panic("Core-14449 WAR not in place (%04x).\n"
-			      "Please build kernel with proper options (CONFIG_CAVIUM_CN63XXP1).", insn);
+			panic("OCTEON II DCache prefetch workaround not in place (%04x).\n"
+			      "Please build kernel with proper options (CONFIG_CAVIUM_CN63XXP1).",
+			      insn);
 	}
 }
 
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index eb72b35..35c80be 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -22,4 +22,7 @@
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
+#define CAVIUM_OCTEON_DCACHE_PREFETCH_WAR	\
+	OCTEON_IS_MODEL(OCTEON_CN6XXX)
+
 #endif /* __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H */
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index 4adf302..c28b6d4 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -330,7 +330,7 @@ I_u3u1u2(_ldx)
 void ISAFUNC(uasm_i_pref)(u32 **buf, unsigned int a, signed int b,
 			    unsigned int c)
 {
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX_PASS1_X) && a <= 24 && a != 5)
+	if (CAVIUM_OCTEON_DCACHE_PREFETCH_WAR && a <= 24 && a != 5)
 		/*
 		 * As per erratum Core-14449, replace prefetches 0-4,
 		 * 6-24 with 'pref 28'.
-- 
2.2.2
