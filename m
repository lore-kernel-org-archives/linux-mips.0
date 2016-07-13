Received: from mailapp01.imgtec.com ([195.59.15.196]:51954 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993264AbcGMNNkHcNKh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 Jul 2016 15:13:40 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 06/13] MIPS: c-r4k: Avoid dcache flush for sigtramps
Date: Wed, 13 Jul 2016 14:12:49 +0100
Message-ID: <1468415576-12600-7-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1468415576-12600-1-git-send-email-james.hogan@imgtec.com>
References: <1468415576-12600-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160713131249.YLbLb5DsnuGHB2104iuOJBXiFKFBLIF-60uEXvG--ns@z>

Avoid the dcache and scache flush in local_r4k_flush_cache_sigtramp() if
the icache fills straight from the dcache.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mm/c-r4k.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 600b0ad48319..58b810e67bba 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -841,12 +841,16 @@ static void local_r4k_flush_cache_sigtramp(void *args)
 	}
 
 	R4600_HIT_CACHEOP_WAR_IMPL;
-	if (dc_lsize)
-		vaddr ? flush_dcache_line(addr & ~(dc_lsize - 1))
-		      : protected_writeback_dcache_line(addr & ~(dc_lsize - 1));
-	if (!cpu_icache_snoops_remote_store && scache_size)
-		vaddr ? flush_scache_line(addr & ~(sc_lsize - 1))
-		      : protected_writeback_scache_line(addr & ~(sc_lsize - 1));
+	if (!cpu_has_ic_fills_f_dc) {
+		if (dc_lsize)
+			vaddr ? flush_dcache_line(addr & ~(dc_lsize - 1))
+			      : protected_writeback_dcache_line(
+							addr & ~(dc_lsize - 1));
+		if (!cpu_icache_snoops_remote_store && scache_size)
+			vaddr ? flush_scache_line(addr & ~(sc_lsize - 1))
+			      : protected_writeback_scache_line(
+							addr & ~(sc_lsize - 1));
+	}
 	if (ic_lsize)
 		vaddr ? flush_icache_line(addr & ~(ic_lsize - 1))
 		      : protected_flush_icache_line(addr & ~(ic_lsize - 1));
-- 
2.4.10
