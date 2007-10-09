Received: from nf-out-0910.google.com ([64.233.182.189]:44049 "EHLO
	nf-out-0910.google.com") by ftp.linux-mips.org with ESMTP
	id S20022290AbXJIUji (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 9 Oct 2007 21:39:38 +0100
Received: by nf-out-0910.google.com with SMTP id c10so1328417nfd
        for <linux-mips@linux-mips.org>; Tue, 09 Oct 2007 13:39:21 -0700 (PDT)
Message-ID: <470BE6E5.2060707@gmail.com>
Date: Tue, 09 Oct 2007 22:39:01 +0200
From: Franck Bui-Huu <fbuihuu@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] tlbex.c: cleanup include files   
References: <Pine.LNX.4.64N.0710021447470.32726@blysk.ds.pg.gda.pl> <20071002141125.GC16772@networkno.de> <20071002154918.GA11312@linux-mips.org> <47038874.9050704@gmail.com> <20071003131158.GL16772@networkno.de> <4703F155.4000301@gmail.com> <20071003201800.GP16772@networkno.de> <47049734.6050802@gmail.com> <20071004121557.GA28928@linux-mips.org> <4705004C.5000705@gmail.com> <20071005115151.GA16145@linux-mips.org> <470BE58A.9070709@gmail.com>
In-Reply-To: <470BE58A.9070709@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <fbuihuu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Thiemo Seufer <ths@networkno.de>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20071009203901.BvbYp1qzj0D5RoKxb9oc-N88JskdP3IixQ0xZBGxIw0@z>


Signed-off-by: Franck Bui-Huu <fbuihuu@gmail.com>
---
 arch/mips/mm/tlbex.c |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index e725072..05dc390 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -19,20 +19,11 @@
  * (Condolences to Napoleon XIV)
  */
 
-#include <stdarg.h>
-
-#include <linux/mm.h>
 #include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/string.h>
-#include <linux/init.h>
 
-#include <asm/pgtable.h>
-#include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
 #include <asm/inst.h>
 #include <asm/elf.h>
-#include <asm/smp.h>
 #include <asm/war.h>
 
 static inline int r45k_bvahwbug(void)
-- 
1.5.3.3
