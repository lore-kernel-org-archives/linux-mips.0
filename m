Received: from multi.imgtec.com ([194.200.65.239]:44794 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870564AbaA0U0TPPJRA (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:26:19 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 49/58] MIPS: mm: c-r4k: Add support for flushing user pages from cache
Date: Mon, 27 Jan 2014 20:19:36 +0000
Message-ID: <1390853985-14246-50-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201936.KEwoeB_x8HOMGugitr43GxvWaHaApH-PJUtuBsNTikE@z>

Use the userspace cache flushing functions if the interrupted
process is a userspace one.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/c-r4k.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 0c9c693..5f8da6a 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -555,7 +555,8 @@ static inline void local_r4k_flush_cache_page(void *args)
 	}
 
 	if (cpu_has_dc_aliases || (exec && !cpu_has_ic_fills_f_dc)) {
-		r4k_blast_dcache_page(addr);
+		vaddr ? r4k_blast_dcache_page(addr) :
+			r4k_blast_dcache_user_page(addr);
 		if (exec && !cpu_icache_snoops_remote_store)
 			r4k_blast_scache_page(addr);
 	}
@@ -566,7 +567,8 @@ static inline void local_r4k_flush_cache_page(void *args)
 			if (cpu_context(cpu, mm) != 0)
 				drop_mmu_context(mm, cpu);
 		} else
-			r4k_blast_icache_page(addr);
+			vaddr ? r4k_blast_icache_page(addr) :
+				r4k_blast_icache_user_page(addr);
 	}
 
 	if (vaddr) {
-- 
1.8.5.3
