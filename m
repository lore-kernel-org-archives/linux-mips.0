Received: from [69.28.251.93] ([69.28.251.93]:51561 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1492058Ab0KWSex (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 23 Nov 2010 19:34:53 +0100
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH RESEND 5/7] MIPS: Install handlers for BMIPS software IRQs
Date: Tue, 23 Nov 2010 10:26:43 -0800
Message-ID: <3adc7e6dd933a5bc8295e7bb687f2907@localhost>
In-Reply-To: <8a8eee995454c8b271cceb440e31699a@localhost>
References: <8a8eee995454c8b271cceb440e31699a@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20101123182643.oBCKOSClBRz7PzLsJESymi1Ylr_S9mPneBAH_xUwPLI@z>

BMIPS4350/4380/5000 CMT/SMT all use SW INT0/INT1 for inter-thread
signaling.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/kernel/irq_cpu.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/irq_cpu.c b/arch/mips/kernel/irq_cpu.c
index 0262abe..70d4736 100644
--- a/arch/mips/kernel/irq_cpu.c
+++ b/arch/mips/kernel/irq_cpu.c
@@ -107,14 +107,12 @@ void __init mips_cpu_irq_init(void)
 	clear_c0_status(ST0_IM);
 	clear_c0_cause(CAUSEF_IP);
 
-	/*
-	 * Only MT is using the software interrupts currently, so we just
-	 * leave them uninitialized for other processors.
-	 */
-	if (cpu_has_mipsmt)
-		for (i = irq_base; i < irq_base + 2; i++)
-			set_irq_chip_and_handler(i, &mips_mt_cpu_irq_controller,
-						 handle_percpu_irq);
+	/* Software interrupts are used for MT/CMT IPI */
+	for (i = irq_base; i < irq_base + 2; i++)
+		set_irq_chip_and_handler(i, cpu_has_mipsmt ?
+					 &mips_mt_cpu_irq_controller :
+					 &mips_cpu_irq_controller,
+					 handle_percpu_irq);
 
 	for (i = irq_base + 2; i < irq_base + 8; i++)
 		set_irq_chip_and_handler(i, &mips_cpu_irq_controller,
-- 
1.7.0.4
