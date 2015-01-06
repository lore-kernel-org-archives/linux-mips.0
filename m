Received: from mail-ie0-f181.google.com ([209.85.223.181]:56511 "EHLO
        mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026740AbbAFSmfFR3TI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Jan 2015 19:42:35 +0100
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH] MIPS: Fix C0_Pagegrain[IEC] support.
Date: Tue,  6 Jan 2015 10:42:23 -0800
Message-ID: <1420569743-13104-1-git-send-email-ddaney.cavm@gmail.com>
Return-Path: <ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>, stable@vger.kernel.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20150106184223.mUOrdmyYIqGEjK0Ykuf32sli9KcsYFLbQ8H2Cz1ndX0@z>

From: David Daney <david.daney@cavium.com>

The following commits:

  5890f70f15c52d (MIPS: Use dedicated exception handler if CPU supports RI/XI exceptions)
  6575b1d4173eae (MIPS: kernel: cpu-probe: Detect unique RI/XI exceptions)

break the kernel for *all* existing MIPS CPUs that implement the
CP0_PageGrain[IEC] bit.  They cause the TLB exception handlers to be
generated without the legacy execute-inhibit handling, but never set
the CP0_PageGrain[IEC] bit to activate the use of dedicated exception
vectors for execute-inhibit exceptions.  The result is that upon
detection of an execute-inhibit violation, we loop forever in the TLB
exception handlers instead of sending SIGSEGV to the task.

If we are generating TLB exception handlers expecting separate
vectors, we must also enable the CP0_PageGrain[IEC] feature.

The bug was introduced in kernel version 3.17.

Cc: <stable@vger.kernel.org>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: David Daney <david.daney@cavium.com>
---

This is the same patch sent 19/12/2014 with an improved changlog and Cc list.

 arch/mips/mm/tlb-r4k.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index e90b2e8..30639a6 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -489,6 +489,8 @@ static void r4k_tlb_configure(void)
 #ifdef CONFIG_64BIT
 		pg |= PG_ELPA;
 #endif
+		if (cpu_has_rixiex)
+			pg |= PG_IEC;
 		write_c0_pagegrain(pg);
 	}
 
-- 
1.7.11.7
