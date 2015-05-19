Received: from mailapp01.imgtec.com ([195.59.15.196]:54995 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013516AbbESIwSA0Jkh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 10:52:18 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 05/10] MIPS: dump_tlb: Refactor TLB matching
Date: Tue, 19 May 2015 09:50:33 +0100
Message-ID: <1432025438-26431-6-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>
Message-ID: <20150519085033.zspUKi8r8G9Sj-u5-4luKn8y6hNKTISf2PEB4gdlxbU@z>

Refactor the TLB matching code in dump_tlb() slightly so that the
conditions which can cause a TLB entry to be skipped can be more easily
extended. This should prevent the match condition getting unwieldy once
it is updated to take further conditions into account.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/lib/dump_tlb.c | 65 ++++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index a62dfacb60f7..17d05caa776d 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -46,6 +46,11 @@ static void dump_tlb(int first, int last)
 	unsigned long s_entryhi, entryhi, asid;
 	unsigned long long entrylo0, entrylo1;
 	unsigned int s_index, s_pagemask, pagemask, c0, c1, i;
+#ifdef CONFIG_32BIT
+	int width = 8;
+#else
+	int width = 11;
+#endif
 
 	s_pagemask = read_c0_pagemask();
 	s_entryhi = read_c0_entryhi();
@@ -62,38 +67,38 @@ static void dump_tlb(int first, int last)
 		entrylo0 = read_c0_entrylo0();
 		entrylo1 = read_c0_entrylo1();
 
-		/* Unused entries have a virtual address of CKSEG0.  */
-		if ((entryhi & ~0x1ffffUL) != CKSEG0
-		    && (entryhi & 0xff) == asid) {
-#ifdef CONFIG_32BIT
-			int width = 8;
-#else
-			int width = 11;
-#endif
-			/*
-			 * Only print entries in use
-			 */
-			printk("Index: %2d pgmask=%s ", i, msk2str(pagemask));
+		/*
+		 * Prior to tlbinv, unused entries have a virtual address of
+		 * CKSEG0.
+		 */
+		if ((entryhi & ~0x1ffffUL) == CKSEG0)
+			continue;
+		if ((entryhi & 0xff) != asid)
+			continue;
 
-			c0 = (entrylo0 >> 3) & 7;
-			c1 = (entrylo1 >> 3) & 7;
+		/*
+		 * Only print entries in use
+		 */
+		printk("Index: %2d pgmask=%s ", i, msk2str(pagemask));
 
-			printk("va=%0*lx asid=%02lx\n",
-			       width, (entryhi & ~0x1fffUL),
-			       entryhi & 0xff);
-			printk("\t[pa=%0*llx c=%d d=%d v=%d g=%d] ",
-			       width,
-			       (entrylo0 << 6) & PAGE_MASK, c0,
-			       (entrylo0 & 4) ? 1 : 0,
-			       (entrylo0 & 2) ? 1 : 0,
-			       (entrylo0 & 1) ? 1 : 0);
-			printk("[pa=%0*llx c=%d d=%d v=%d g=%d]\n",
-			       width,
-			       (entrylo1 << 6) & PAGE_MASK, c1,
-			       (entrylo1 & 4) ? 1 : 0,
-			       (entrylo1 & 2) ? 1 : 0,
-			       (entrylo1 & 1) ? 1 : 0);
-		}
+		c0 = (entrylo0 >> 3) & 7;
+		c1 = (entrylo1 >> 3) & 7;
+
+		printk("va=%0*lx asid=%02lx\n",
+		       width, (entryhi & ~0x1fffUL),
+		       entryhi & 0xff);
+		printk("\t[pa=%0*llx c=%d d=%d v=%d g=%d] ",
+		       width,
+		       (entrylo0 << 6) & PAGE_MASK, c0,
+		       (entrylo0 & 4) ? 1 : 0,
+		       (entrylo0 & 2) ? 1 : 0,
+		       (entrylo0 & 1) ? 1 : 0);
+		printk("[pa=%0*llx c=%d d=%d v=%d g=%d]\n",
+		       width,
+		       (entrylo1 << 6) & PAGE_MASK, c1,
+		       (entrylo1 & 4) ? 1 : 0,
+		       (entrylo1 & 2) ? 1 : 0,
+		       (entrylo1 & 1) ? 1 : 0);
 	}
 	printk("\n");
 
-- 
2.3.6
