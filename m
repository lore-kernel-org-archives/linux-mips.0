Received: from mailapp01.imgtec.com ([195.59.15.196]:31605 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992544AbcKAAkoA7Xt7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Nov 2016 01:40:44 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Fix max_low_pfn with disabled highmem
Date: Tue, 1 Nov 2016 00:40:29 +0000
Message-ID: <2438a2e32ec8b5d9a8ea053ea483534bb63364a4.1477960419.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20161101004029.bcmp5pRP8DL6tK8PDtRk21IAhmAfKl6NThd7HomV24E@z>

When low memory doesn't reach HIGHMEM_START (e.g. up to 256MB at PA=0 is
common) and highmem is present above HIGHMEM_START (e.g. on Malta the
RAM overlayed by the IO region is aliased at PA=0x90000000), max_low_pfn
will be initially calculated very large and then clipped down to
HIGHMEM_START.

This causes crashes when reading /sys/kernel/mm/page_idle/bitmap
(i.e. CONFIG_IDLE_PAGE_TRACKING=y) when highmem is disabled. pfn_valid()
will compare against max_mapnr which is derived from max_low_pfn when
there is no highend_pfn set up, and will return true for PFNs right up
to HIGHMEM_START, even though they are beyond the end of low memory and
no page structs will actually exist for these PFNs.

This is fixed by skipping high memory regions when initially calculating
max_low_pfn if highmem is disabled, so it doesn't get clipped too high.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/setup.c |  9 +++++++++
 1 file changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 0d57909d9026..cb6e5895bb7e 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -368,6 +368,15 @@ static void __init bootmem_init(void)
 		end = PFN_DOWN(boot_mem_map.map[i].addr
 				+ boot_mem_map.map[i].size);
 
+#ifndef CONFIG_HIGHMEM
+		/*
+		 * Skip highmem here so we get an accurate max_low_pfn if low
+		 * memory stops short of high memory.
+		 */
+		if (start >= PFN_DOWN(HIGHMEM_START))
+			continue;
+#endif
+
 		if (end > max_low_pfn)
 			max_low_pfn = end;
 		if (start < min_low_pfn)
-- 
git-series 0.8.10
