Received: from mailapp01.imgtec.com ([195.59.15.196]:61100 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013562AbbESIwSA0Jkh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 10:52:18 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 09/10] MIPS: dump_tlb: Take RI/XI bits into account
Date: Tue, 19 May 2015 09:50:37 +0100
Message-ID: <1432025438-26431-10-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1432025438-26431-1-git-send-email-james.hogan@imgtec.com>
References: <1432025438-26431-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, David Daney <ddaney@caviumnetworks.com>
Message-ID: <20150519085037.aGU1wG55Wjq6EObXjJjWZXwGcOvoIqaw1Z5kS453Vqs@z>

The RI/XI bits when present are above the PFN field in the EntryLo
registers, at bits 63,62 when read with dmfc0, and bits 31,30 when read
with mfc0. This makes them appear as part of the physical address, since
the other bits are masked with PAGE_MASK, for example:

Index: 253 pgmask=16kb va=77b18000 asid=75
        [pa=1000744000 c=5 d=1 v=1 g=0] [pa=100134c000 c=5 d=1 v=1 g=0]

The physical addresses have bit 36 set, which corresponds to bit 30 of
EntryLo1, the XI bit.

Explicitly mask off the RI and XI bits from the printed physical
address, and print the RI and XI bits separately if they exist, giving
output more like this:

Index: 226 pgmask=16kb va=77be0000 asid=79
        [ri=0 xi=1 pa=01288000 c=5 d=1 v=1 g=0] [ri=0 xi=0 pa=010e4000 c=5 d=0 v=1 g=0]

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
---
Changes in v2:
- mipsregs.h definitions for XI/RI bits moved to new patch 3 with other
  definitions.
---
 arch/mips/lib/dump_tlb.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 3bcdd53c832f..1fefd38aba08 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -44,7 +44,7 @@ static inline const char *msk2str(unsigned int mask)
 static void dump_tlb(int first, int last)
 {
 	unsigned long s_entryhi, entryhi, asid;
-	unsigned long long entrylo0, entrylo1;
+	unsigned long long entrylo0, entrylo1, pa;
 	unsigned int s_index, s_pagemask, pagemask, c0, c1, i;
 #ifdef CONFIG_32BIT
 	int width = 8;
@@ -98,15 +98,28 @@ static void dump_tlb(int first, int last)
 		printk("va=%0*lx asid=%02lx\n",
 		       width, (entryhi & ~0x1fffUL),
 		       entryhi & 0xff);
-		printk("\t[pa=%0*llx c=%d d=%d v=%d g=%d] ",
-		       width,
-		       (entrylo0 << 6) & PAGE_MASK, c0,
+		/* RI/XI are in awkward places, so mask them off separately */
+		pa = entrylo0 & ~(MIPS_ENTRYLO_RI | MIPS_ENTRYLO_XI);
+		pa = (pa << 6) & PAGE_MASK;
+		printk("\t[");
+		if (cpu_has_rixi)
+			printk("ri=%d xi=%d ",
+			       (entrylo0 & MIPS_ENTRYLO_RI) ? 1 : 0,
+			       (entrylo0 & MIPS_ENTRYLO_XI) ? 1 : 0);
+		printk("pa=%0*llx c=%d d=%d v=%d g=%d] [",
+		       width, pa, c0,
 		       (entrylo0 & MIPS_ENTRYLO_D) ? 1 : 0,
 		       (entrylo0 & MIPS_ENTRYLO_V) ? 1 : 0,
 		       (entrylo0 & MIPS_ENTRYLO_G) ? 1 : 0);
-		printk("[pa=%0*llx c=%d d=%d v=%d g=%d]\n",
-		       width,
-		       (entrylo1 << 6) & PAGE_MASK, c1,
+		/* RI/XI are in awkward places, so mask them off separately */
+		pa = entrylo1 & ~(MIPS_ENTRYLO_RI | MIPS_ENTRYLO_XI);
+		pa = (pa << 6) & PAGE_MASK;
+		if (cpu_has_rixi)
+			printk("ri=%d xi=%d ",
+			       (entrylo1 & MIPS_ENTRYLO_RI) ? 1 : 0,
+			       (entrylo1 & MIPS_ENTRYLO_XI) ? 1 : 0);
+		printk("pa=%0*llx c=%d d=%d v=%d g=%d]\n",
+		       width, pa, c1,
 		       (entrylo1 & MIPS_ENTRYLO_D) ? 1 : 0,
 		       (entrylo1 & MIPS_ENTRYLO_V) ? 1 : 0,
 		       (entrylo1 & MIPS_ENTRYLO_G) ? 1 : 0);
-- 
2.3.6
