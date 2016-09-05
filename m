Received: from mailapp01.imgtec.com ([195.59.15.196]:21943 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992235AbcIEOZ22IiVL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Sep 2016 16:25:28 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: c-r4k: Fix size calc when avoiding IPIs for small icache flushes
Date: Mon, 5 Sep 2016 15:24:54 +0100
Message-ID: <20160905142454.30530-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160905142454.igWBVqQqgrPoIW1ST2Vo6V2MM0OleGrirMwVQxBSJts@z>

Commit f70ddc07b637 ("MIPS: c-r4k: Avoid small flush_icache_range SMP
calls") adds checks to force use of hit-type cache ops for small icache
flushes where they are globalised & index-type cache ops aren't, in
order to avoid the overhead of IPIs in those cases. However it
calculated the size of the region being flushed incorrectly, subtracting
the end address from the start address rather than the reverse. This
would have led to an overflow with size wrapping round to some large
value, and likely to the special case for avoiding IPIs not actually
being hit.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>
Fixes: f70ddc07b637 ("MIPS: c-r4k: Avoid small flush_icache_range SMP calls")
---

 arch/mips/mm/c-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 1af381f..69b1f10 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -811,7 +811,7 @@ static void __r4k_flush_icache_range(unsigned long start, unsigned long end,
 		 * If address-based cache ops don't require an SMP call, then
 		 * use them exclusively for small flushes.
 		 */
-		size = start - end;
+		size = end - start;
 		cache_size = icache_size;
 		if (!cpu_has_ic_fills_f_dc) {
 			size *= 2;
-- 
2.9.3
