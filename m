Received: from mailapp01.imgtec.com ([195.59.15.196]:16337 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011835AbcCDKLPrz3aD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Mar 2016 11:11:15 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: smp.c: Fix uninitialised temp_foreign_map
Date: Fri, 4 Mar 2016 10:10:51 +0000
Message-ID: <1457086251-6477-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160304101051.5YMr83eO3RGchBsg6siqISD5XDRsvIbEas_r1js5RI4@z>

When calculate_cpu_foreign_map() recalculates the cpu_foreign_map
cpumask it uses the local variable temp_foreign_map without initialising
it to zero. Since the calculation only ever sets bits in this cpumask
any existing bits at that memory location will remain set and find their
way into cpu_foreign_map too. This could potentially lead to cache
operations suboptimally doing smp calls to multiple VPEs in the same
core, even though the VPEs share primary caches.

Therefore initialise temp_foreign_map using cpumask_clear() before use.

Fixes: cccf34e9411c ("MIPS: c-r4k: Fix cache flushing for MT cores")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index bd4385a8e6e8..2b521e07b860 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -121,6 +121,7 @@ static inline void calculate_cpu_foreign_map(void)
 	cpumask_t temp_foreign_map;
 
 	/* Re-calculate the mask */
+	cpumask_clear(&temp_foreign_map);
 	for_each_online_cpu(i) {
 		core_present = 0;
 		for_each_cpu(k, &temp_foreign_map)
-- 
2.4.10
