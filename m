Received: from mailapp01.imgtec.com ([195.59.15.196]:55814 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860063AbaGILvTYQcsI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Jul 2014 13:51:19 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 1B40A39AB24BD
        for <linux-mips@linux-mips.org>; Wed,  9 Jul 2014 12:51:10 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 5/5] MIPS: smp-cps: fix entry code cache flush for systems with coherent I/O
Date: Wed, 9 Jul 2014 12:51:05 +0100
Message-ID: <1404906665-10825-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
References: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140709115105.Q4Utj6w6bZ-toSgJCLwH9nEZ2hvyYNSvpZqnIEg5HWQ@z>

The dma_cache_wback_inv function performs exactly as is required here,
unless the system has coherent I/O in which case it's a no-op. Call the
underlying cache writeback functions directly, which is arguably clearer
anyway given that the code doesn't actually have anything to do with
DMA in a strict sense.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/smp-cps.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index f9b53b4..e6e16a1 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -14,13 +14,14 @@
 #include <linux/smp.h>
 #include <linux/types.h>
 
-#include <asm/cacheflush.h>
+#include <asm/bcache.h>
 #include <asm/gic.h>
 #include <asm/mips-cm.h>
 #include <asm/mips-cpc.h>
 #include <asm/mips_mt.h>
 #include <asm/mipsregs.h>
 #include <asm/pm-cps.h>
+#include <asm/r4kcache.h>
 #include <asm/smp-cps.h>
 #include <asm/time.h>
 #include <asm/uasm.h>
@@ -132,8 +133,11 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	entry_code = (u32 *)&mips_cps_core_entry;
 	UASM_i_LA(&entry_code, 3, (long)mips_cm_base);
 	uasm_i_addiu(&entry_code, 16, 0, cca);
-	dma_cache_wback_inv((unsigned long)&mips_cps_core_entry,
-			    (void *)entry_code - (void *)&mips_cps_core_entry);
+	blast_dcache_range((unsigned long)&mips_cps_core_entry,
+			   (unsigned long)entry_code);
+	bc_wback_inv((unsigned long)&mips_cps_core_entry,
+		     (void *)entry_code - (void *)&mips_cps_core_entry);
+	__sync();
 
 	/* Allocate core boot configuration structs */
 	mips_cps_core_bootcfg = kcalloc(ncores, sizeof(*mips_cps_core_bootcfg),
-- 
2.0.1
