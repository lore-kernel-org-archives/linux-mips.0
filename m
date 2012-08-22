Received: from mail-pb0-f49.google.com ([209.85.160.49]:41324 "EHLO
        mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903392Ab2HVDCm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Aug 2012 05:02:42 +0200
MIME-Version: 1.0
Date: Wed, 22 Aug 2012 11:02:34 +0800
Message-ID: <CACV3sb+nocqeDiM+4m+hv1ygu=KAxD6CpR5wQmawkKMdAuXbgA@mail.gmail.com>
Subject: [PATCH] MIPS/mm: add compound tail page _mapcount when mapped
From: Jovi Zhang <bookjovi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>, Andrew Morton <akpm@linux-foundation.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-mips@linux-mips.org, Youquan Song <youquan.song@intel.com>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Message-ID: <20120822030234.6N8pTxGSMkal8WLk5gskdRJFEihIhCYN3Bdb0uFFG4A@z>

From 3dc19ea2b535719d0b4177f17bbbff9cbf257b23 Mon Sep 17 00:00:00 2001
From: Jovi Zhang <bookjovi@gmail.com>
Date: Wed, 22 Aug 2012 10:34:08 +0800
Subject: [PATCH] MIPS/mm: add compound tail page _mapcount when mapped

see commit b6999b191 which target for x86 mm/gup, let it align with
mips architecture.

Quote from commit b6999b191:
    "If compound pages are used and the page is a
    tail page, gup_huge_pmd() increases _mapcount to record tail page are
    mapped while gup_huge_pud does not do that."

Signed-off-by: Jovi Zhang <boojovi@gmail.com>
Cc: Youquan Song <youquan.song@intel.com>
Cc: Andi Kleen <andi@firstfloor.org>
Cc: <stable@vger.kernel.org>
---
 arch/mips/mm/gup.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/mm/gup.c b/arch/mips/mm/gup.c
index 33aadbc..dcfd573 100644
--- a/arch/mips/mm/gup.c
+++ b/arch/mips/mm/gup.c
@@ -152,6 +152,8 @@ static int gup_huge_pud(pud_t pud, unsigned long
addr, unsigned long end,
 	do {
 		VM_BUG_ON(compound_head(page) != head);
 		pages[*nr] = page;
+		if (PageTail(page))
+			get_huge_page_tail(page);
 		(*nr)++;
 		page++;
 		refs++;
-- 
1.7.9.7
