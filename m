Received: from mailapp01.imgtec.com ([195.59.15.196]:36327 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013542AbbESIvNLZAjP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 10:51:13 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 06/10] MIPS: dump_tlb: Make use of EntryLo bit definitions
Date: Tue, 19 May 2015 09:50:34 +0100
Message-ID: <1432025438-26431-7-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20150519085034.pyk_zinkBdGotbZLHu7-Whd4Z1fbFojGc6QelitVluE@z>

Make use of recently added EntryLo bit definitions in mipsregs.h when
dumping TLB contents.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
Changes in v2:
- New patch (Maciej).
---
 arch/mips/lib/dump_tlb.c     | 16 ++++++++--------
 arch/mips/lib/r3k_dump_tlb.c |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 17d05caa776d..f02cc554d720 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -81,8 +81,8 @@ static void dump_tlb(int first, int last)
 		 */
 		printk("Index: %2d pgmask=%s ", i, msk2str(pagemask));
 
-		c0 = (entrylo0 >> 3) & 7;
-		c1 = (entrylo1 >> 3) & 7;
+		c0 = (entrylo0 & MIPS_ENTRYLO_C) >> MIPS_ENTRYLO_C_SHIFT;
+		c1 = (entrylo1 & MIPS_ENTRYLO_C) >> MIPS_ENTRYLO_C_SHIFT;
 
 		printk("va=%0*lx asid=%02lx\n",
 		       width, (entryhi & ~0x1fffUL),
@@ -90,15 +90,15 @@ static void dump_tlb(int first, int last)
 		printk("\t[pa=%0*llx c=%d d=%d v=%d g=%d] ",
 		       width,
 		       (entrylo0 << 6) & PAGE_MASK, c0,
-		       (entrylo0 & 4) ? 1 : 0,
-		       (entrylo0 & 2) ? 1 : 0,
-		       (entrylo0 & 1) ? 1 : 0);
+		       (entrylo0 & MIPS_ENTRYLO_D) ? 1 : 0,
+		       (entrylo0 & MIPS_ENTRYLO_V) ? 1 : 0,
+		       (entrylo0 & MIPS_ENTRYLO_G) ? 1 : 0);
 		printk("[pa=%0*llx c=%d d=%d v=%d g=%d]\n",
 		       width,
 		       (entrylo1 << 6) & PAGE_MASK, c1,
-		       (entrylo1 & 4) ? 1 : 0,
-		       (entrylo1 & 2) ? 1 : 0,
-		       (entrylo1 & 1) ? 1 : 0);
+		       (entrylo1 & MIPS_ENTRYLO_D) ? 1 : 0,
+		       (entrylo1 & MIPS_ENTRYLO_V) ? 1 : 0,
+		       (entrylo1 & MIPS_ENTRYLO_G) ? 1 : 0);
 	}
 	printk("\n");
 
diff --git a/arch/mips/lib/r3k_dump_tlb.c b/arch/mips/lib/r3k_dump_tlb.c
index 975a13855116..e210f04b2bc3 100644
--- a/arch/mips/lib/r3k_dump_tlb.c
+++ b/arch/mips/lib/r3k_dump_tlb.c
@@ -47,10 +47,10 @@ static void dump_tlb(int first, int last)
 			       entryhi & PAGE_MASK,
 			       entryhi & ASID_MASK,
 			       entrylo0 & PAGE_MASK,
-			       (entrylo0 & (1 << 11)) ? 1 : 0,
-			       (entrylo0 & (1 << 10)) ? 1 : 0,
-			       (entrylo0 & (1 << 9)) ? 1 : 0,
-			       (entrylo0 & (1 << 8)) ? 1 : 0);
+			       (entrylo0 & R3K_ENTRYLO_N) ? 1 : 0,
+			       (entrylo0 & R3K_ENTRYLO_D) ? 1 : 0,
+			       (entrylo0 & R3K_ENTRYLO_V) ? 1 : 0,
+			       (entrylo0 & R3K_ENTRYLO_G) ? 1 : 0);
 		}
 	}
 	printk("\n");
-- 
2.3.6
