Received: from mailgw02.mediatek.com ([210.61.82.184]:1204 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27007246AbcCNGNOQDqQq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Mar 2016 07:13:14 +0100
From: <miles.chen@mediatek.com>
Subject: [PATCH] MIPS: smp.c: Fix uninitialised temp_foreign_map
Date: Mon, 14 Mar 2016 14:12:58 +0800
Message-ID: <1457935978-16062-1-git-send-email-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <miles.chen@mediatek.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Miles <miles.chen@mediatek.com>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160314061258.6tZ3HLyral4eXH-4CXm1ClWIXIzSf5B98WsXjZy00Pg@z>

From: James Hogan <james.hogan@imgtec.com>

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
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/12759/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index bd4385a..2b521e0 100644
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
1.9.1
