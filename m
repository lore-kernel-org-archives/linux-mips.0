Received: from mailapp01.imgtec.com ([195.59.15.196]:63047 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992544AbcHIMWMOVJKf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Aug 2016 14:22:12 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/2] MIPS: MAAR: Fix address alignment
Date: Tue, 9 Aug 2016 13:21:49 +0100
Message-ID: <90055c0cfa8675f589aa5cf28e77a38b676881df.1470745146.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.842913b0756706569a896ef308bb5bf98be4f0ce.1470745146.git-series.james.hogan@imgtec.com>
References: <cover.842913b0756706569a896ef308bb5bf98be4f0ce.1470745146.git-series.james.hogan@imgtec.com>
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
Message-ID: <20160809122149.qSO0cgEHiH8XQ2NxPiBJFRIkYEXLeimGZWz4maQPqS4@z>

The alignment of MIPS MAAR region addresses isn't quite right.

- It rounds an already 64 KiB aligned start address up to the next
  64 KiB boundary, e.g. 0x80000000 is rounded up to 0x80010000.

- It assumes the end address is already on a 64 KiB boundary and doesn't
  round it down. Should that not be the case it will hit the second
  BUG_ON() in write_maar_pair().

Both cases are addressed by rounding up and down to 64 KiB boundaries in
the more traditional way of adding 0xffff (for rounding up) and masking
off the low 16 bits.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mm/init.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index a5509e7dcad2..2c3749d98f04 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -261,7 +261,6 @@ unsigned __weak platform_maar_init(unsigned num_pairs)
 {
 	struct maar_config cfg[BOOT_MEM_MAP_MAX];
 	unsigned i, num_configured, num_cfg = 0;
-	phys_addr_t skip;
 
 	for (i = 0; i < boot_mem_map.nr_map; i++) {
 		switch (boot_mem_map.map[i].type) {
@@ -272,14 +271,14 @@ unsigned __weak platform_maar_init(unsigned num_pairs)
 			continue;
 		}
 
-		skip = 0x10000 - (boot_mem_map.map[i].addr & 0xffff);
-
+		/* Round lower up */
 		cfg[num_cfg].lower = boot_mem_map.map[i].addr;
-		cfg[num_cfg].lower += skip;
+		cfg[num_cfg].lower = (cfg[num_cfg].lower + 0xffff) & ~0xffff;
 
-		cfg[num_cfg].upper = cfg[num_cfg].lower;
-		cfg[num_cfg].upper += boot_mem_map.map[i].size - 1;
-		cfg[num_cfg].upper -= skip;
+		/* Round upper down */
+		cfg[num_cfg].upper = boot_mem_map.map[i].addr +
+					boot_mem_map.map[i].size;
+		cfg[num_cfg].upper = (cfg[num_cfg].upper & ~0xffff) - 1;
 
 		cfg[num_cfg].attrs = MIPS_MAAR_S;
 		num_cfg++;
-- 
git-series 0.8.7
