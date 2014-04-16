Received: from mailapp01.imgtec.com ([195.89.28.115]:58860 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816686AbaDPNGGeyTr4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 15:06:06 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C8822D9B19115
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 14:05:57 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 34/39] MIPS: smp-cps: duplicate core0 CCA on secondary cores
Date: Wed, 16 Apr 2014 14:05:55 +0100
Message-ID: <1397653555-4758-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416130555.BJrt191Zj6oZR4klgPKRAF29Ro4ZkZB80wsMudxLj1o@z>

Rather than hardcoding CCA=0x5 for secondary cores, re-use the CCA from
the boot CPU. This allows overrides of the CCA using the cca= kernel
parameter to take effect on all CPUs for consistency.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cps-vec.S | 11 +++++++----
 arch/mips/kernel/smp-cps.c |  8 +++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 1c865ae..6f4f739 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -45,10 +45,12 @@
 
 LEAF(mips_cps_core_entry)
 	/*
-	 * These first 8 bytes will be patched by cps_smp_setup to load the
-	 * base address of the CM GCRs into register v1.
+	 * These first 12 bytes will be patched by cps_smp_setup to load the
+	 * base address of the CM GCRs into register v1 and the CCA to use into
+	 * register s0.
 	 */
 	.quad	0
+	.word	0
 
 	/* Check whether we're here due to an NMI */
 	mfc0	k0, CP0_STATUS
@@ -139,10 +141,11 @@ icache_done:
 	 add	a0, a0, t0
 dcache_done:
 
-	/* Set Kseg0 cacheable, coherent, write-back, write-allocate */
+	/* Set Kseg0 CCA to that in s0 */
 	mfc0	t0, CP0_CONFIG
 	ori	t0, 0x7
-	xori	t0, 0x2
+	xori	t0, 0x7
+	or	t0, t0, s0
 	mtc0	t0, CP0_CONFIG
 	ehb
 
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index ae7be36..42dd05b 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -123,9 +123,15 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 		}
 	}
 
-	/* Patch the start of mips_cps_core_entry to provide the CM base */
+	/*
+	 * Patch the start of mips_cps_core_entry to provide:
+	 *
+	 * v0 = CM base address
+	 * s0 = kseg0 CCA
+	 */
 	entry_code = (u32 *)&mips_cps_core_entry;
 	UASM_i_LA(&entry_code, 3, (long)mips_cm_base);
+	uasm_i_addiu(&entry_code, 16, 0, cca);
 	local_flush_icache_range((unsigned long)&mips_cps_core_entry,
 				 (unsigned long)entry_code);
 
-- 
1.8.5.3
