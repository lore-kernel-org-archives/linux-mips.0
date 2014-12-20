Received: from mail-ie0-f172.google.com ([209.85.223.172]:58122 "EHLO
        mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009241AbaLTAdRfJaGr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Dec 2014 01:33:17 +0100
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 2/2] Revert "MIPS: kernel: cpu-probe: Detect unique RI/XI exceptions"
Date: Fri, 19 Dec 2014 16:33:05 -0800
Message-ID: <1419035585-21671-3-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com>
References: <1419035585-21671-1-git-send-email-ddaney.cavm@gmail.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20141220003305.r3tosQQl7YgDjsZx2d97guWgFiNr3hgIdq9iYk5qVZc@z>

From: David Daney <david.daney@cavium.com>

This reverts commit 6575b1d4173eaeff6742a2c6dcbd835bb052952b.

It sets PG_IEC in cpu-probe.  But this value is clobbered in
tlb_init() so the system is never configured to take the RIXI specific
exceptions.  Caos ensues.

Cc: <stable@vger.kernel.org>
Signed-off-by: David Daney <david.daney@cavium.com>
---
 arch/mips/include/asm/mipsregs.h | 1 -
 arch/mips/kernel/cpu-probe.c     | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 5e4aef3..dfdca76 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -265,7 +265,6 @@
 #define PG_XIE		(_ULCAST_(1) <<	 30)
 #define PG_ELPA		(_ULCAST_(1) <<	 29)
 #define PG_ESP		(_ULCAST_(1) <<	 28)
-#define PG_IEC		(_ULCAST_(1) <<  27)
 
 /*
  * R4x00 interrupt enable / cause bits
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 5342674..63ace78 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -531,15 +531,6 @@ static void decode_configs(struct cpuinfo_mips *c)
 
 	mips_probe_watch_registers(c);
 
-	if (cpu_has_rixi) {
-		/* Enable the RIXI exceptions */
-		write_c0_pagegrain(read_c0_pagegrain() | PG_IEC);
-		back_to_back_c0_hazard();
-		/* Verify the IEC bit is set */
-		if (read_c0_pagegrain() & PG_IEC)
-			c->options |= MIPS_CPU_RIXIEX;
-	}
-
 #ifndef CONFIG_MIPS_CPS
 	if (cpu_has_mips_r2) {
 		c->core = get_ebase_cpunum();
-- 
1.7.11.7
