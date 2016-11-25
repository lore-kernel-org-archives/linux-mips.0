Received: from mailapp01.imgtec.com ([195.59.15.196]:3410 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993179AbcKYSqzdCLGI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Nov 2016 19:46:55 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/3] MIPS: WARN_ON invalid DMA cache maintenance, not BUG_ON
Date: Fri, 25 Nov 2016 18:46:09 +0000
Message-ID: <20161125184611.28396-2-paul.burton@imgtec.com>
In-Reply-To: <20161125184611.28396-1-paul.burton@imgtec.com>
References: <20161125184611.28396-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161125184609.BrH5ONv5pDfkMxFTP5ztUkZMF91Gs0GZNJhD5XG79Fc@z>

If a driver causes DMA cache maintenance with a zero length then we
currently BUG and kill the kernel. As this is a scenario that we may
well be able to recover from, WARN & return in the condition instead.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/mm/c-r4k.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index af7621c..20c4c5f 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -840,7 +840,8 @@ static void r4k_flush_icache_user_range(unsigned long start, unsigned long end)
 static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 {
 	/* Catch bad driver code */
-	BUG_ON(size == 0);
+	if (WARN_ON(size == 0))
+		return;
 
 	preempt_disable();
 	if (cpu_has_inclusive_pcaches) {
@@ -873,7 +874,8 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 {
 	/* Catch bad driver code */
-	BUG_ON(size == 0);
+	if (WARN_ON(size == 0))
+		return;
 
 	preempt_disable();
 	if (cpu_has_inclusive_pcaches) {
-- 
2.10.2
