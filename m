Received: from nf-out-0910.google.com ([64.233.182.187]:52479 "EHLO
	nf-out-0910.google.com") by ftp.linux-mips.org with ESMTP
	id S20022227AbXJIUh6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 9 Oct 2007 21:37:58 +0100
Received: by nf-out-0910.google.com with SMTP id c10so1328075nfd
        for <linux-mips@linux-mips.org>; Tue, 09 Oct 2007 13:37:56 -0700 (PDT)
Message-ID: <470BE68F.5090000@gmail.com>
Date: Tue, 09 Oct 2007 22:37:35 +0200
From: Franck Bui-Huu <fbuihuu@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] tlbex.c: remove final_handler[] from init.data section
References: <Pine.LNX.4.64N.0710021447470.32726@blysk.ds.pg.gda.pl> <20071002141125.GC16772@networkno.de> <20071002154918.GA11312@linux-mips.org> <47038874.9050704@gmail.com> <20071003131158.GL16772@networkno.de> <4703F155.4000301@gmail.com> <20071003201800.GP16772@networkno.de> <47049734.6050802@gmail.com> <20071004121557.GA28928@linux-mips.org> <4705004C.5000705@gmail.com> <20071005115151.GA16145@linux-mips.org> <470BE58A.9070709@gmail.com>
In-Reply-To: <470BE58A.9070709@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <fbuihuu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Thiemo Seufer <ths@networkno.de>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20071009203735.J_8NDEBexE4BgZNARVnceUahhyyn7_xlJjmyn42kl18@z>

This patch uses 256 stack bytes and decreases the kernel image
of the same size.

Signed-off-by: Franck Bui-Huu <fbuihuu@gmail.com>
---
 arch/mips/mm/tlbex.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index cbcb320..6991b89 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1248,15 +1248,12 @@ static void __init build_update_entries(u32 **p, unsigned int tmp,
  * other one.To keep things simple, we first assume linear space,
  * then we relocate it to the final handler layout as needed.
  */
-static u32 final_handler[64] __initdata;
-
-
 static void __init build_r4000_tlb_refill_handler(void)
 {
 	u32 tlb_handler[128], *p = tlb_handler;
+	u32 final_handler[64], *f;
 	struct label labels[128], *l = labels;
 	struct reloc relocs[128], *r = relocs;
-	u32 *f;
 	unsigned int final_len;
 	int i;
 
-- 
1.5.3.3
