Received: from mailapp01.imgtec.com ([195.59.15.196]:41381 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008747AbbIVRPqHsN4r (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 19:15:46 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: traps: tidy up ebase calculation
Date: Tue, 22 Sep 2015 10:15:22 -0700
Message-ID: <1442942122-32230-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922171522.EyI4AexCmCGpLMsCky7x0gwy1vVEA3pQ09pC5kcZOek@z>

Rather than #ifdef on CONFIG_KVM_GUEST & redefine the guest kseg0 base
locally, make use of the CAC_BASE macro which has the correct value in
both cases.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>
---

 arch/mips/kernel/traps.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index fdb392b..4e106d5 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -37,6 +37,7 @@
 #include <linux/irq.h>
 #include <linux/perf_event.h>
 
+#include <asm/addrspace.h>
 #include <asm/bootinfo.h>
 #include <asm/branch.h>
 #include <asm/break.h>
@@ -2204,12 +2205,8 @@ void __init trap_init(void)
 		ebase = (unsigned long)
 			__alloc_bootmem(size, 1 << fls(size), 0);
 	} else {
-#ifdef CONFIG_KVM_GUEST
-#define KVM_GUEST_KSEG0     0x40000000
-        ebase = KVM_GUEST_KSEG0;
-#else
-        ebase = CKSEG0;
-#endif
+		ebase = CAC_BASE;
+
 		if (cpu_has_mips_r2_r6)
 			ebase += (read_c0_ebase() & 0x3ffff000);
 	}
-- 
2.5.3
