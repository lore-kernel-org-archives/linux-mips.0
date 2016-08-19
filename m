Received: from mailapp01.imgtec.com ([195.59.15.196]:23923 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992500AbcHSROjT7IDr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Aug 2016 19:14:39 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/3] MIPS: sc-mips: L2 cache is inclusive of L1 dcache for CM3
Date: Fri, 19 Aug 2016 18:13:36 +0100
Message-ID: <20160819171336.28401-3-paul.burton@imgtec.com>
In-Reply-To: <20160819171336.28401-1-paul.burton@imgtec.com>
References: <20160819171336.28401-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160819171336.NNefVzPYRkJbAk9TOsk5VrW8RI7K9FpLHIeGuoxnelE@z>

In systems with CM3 & higher, the L2 cache is inclusive of the L1
dcache. Indicate this such that cpu_has_inclusive_pcaches evaluates true
& we avoid some unnecessary cache ops during DMA cache maintenance.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/mm/sc-mips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 286a4d5..c909c334 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -181,6 +181,7 @@ static int __init mips_sc_probe_cm3(void)
 
 	if (c->scache.linesz) {
 		c->scache.flags &= ~MIPS_CACHE_NOT_PRESENT;
+		c->options |= MIPS_CPU_INCLUSIVE_CACHES;
 		return 1;
 	}
 
-- 
2.9.3
