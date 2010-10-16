Received: from [69.28.251.93] ([69.28.251.93]:52829 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491203Ab0JPVoK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 16 Oct 2010 23:44:10 +0200
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH 4/9] MIPS: Install handlers for software IRQs
Date: Sat, 16 Oct 2010 14:22:33 -0700
Message-ID: <953858e54ceec800464756a0521abea1@localhost>
In-Reply-To: <17ebecce124618ddf83ec6fe8e526f93@localhost>
References: <17ebecce124618ddf83ec6fe8e526f93@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20101016212233.5V0tsrpXyZIpQJEx--WLlTRlRF4iGotgoKgfwCAh3_c@z>

BMIPS4350/4380/5000 CMT/SMT all use SW INT0/INT1 for inter-thread
signaling.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/kernel/irq_cpu.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/irq_cpu.c b/arch/mips/kernel/irq_cpu.c
index 55c8a3c..436bb2d 100644
--- a/arch/mips/kernel/irq_cpu.c
+++ b/arch/mips/kernel/irq_cpu.c
@@ -106,14 +106,12 @@ void __init mips_cpu_irq_init(void)
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
