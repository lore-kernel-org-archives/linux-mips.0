Received: from multi.imgtec.com ([194.200.65.239]:43573 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827312AbaA0UVbCzhi3 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:21:31 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 08/58] MIPS: kernel: traps: Whitespace clean up
Date: Mon, 27 Jan 2014 20:18:55 +0000
Message-ID: <1390853985-14246-9-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201855.tI1V0Er7vPUnlKJYzytapQYhVrUMYNT5y0-rAf11OHI@z>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/traps.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index e0b4996..3e5e700 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -10,6 +10,7 @@
  * Kevin D. Kissell, kevink@mips.com and Carsten Langgaard, carstenl@mips.com
  * Copyright (C) 2002, 2003, 2004, 2005, 2007  Maciej W. Rozycki
  * Copyright (C) 2000, 2001, 2012 MIPS Technologies, Inc.  All rights reserved.
+ * Copyright (C) 2014, Imagination Technologies Ltd.
  */
 #include <linux/bug.h>
 #include <linux/compiler.h>
@@ -870,17 +871,19 @@ asmlinkage void do_bp(struct pt_regs *regs)
 			if ((__get_user(instr[0], (u16 __user *)msk_isa16_mode(epc)) ||
 			    (__get_user(instr[1], (u16 __user *)msk_isa16_mode(epc + 2)))))
 				goto out_sigsegv;
-		    opcode = (instr[0] << 16) | instr[1];
+			opcode = (instr[0] << 16) | instr[1];
 		} else {
-		    /* MIPS16e mode */
-		    if (__get_user(instr[0], (u16 __user *)msk_isa16_mode(epc)))
+			/* MIPS16e mode */
+			if (__get_user(instr[0],
+				       (u16 __user *)msk_isa16_mode(epc)))
 				goto out_sigsegv;
-		    bcode = (instr[0] >> 6) & 0x3f;
-		    do_trap_or_bp(regs, bcode, "Break");
-		    goto out;
+			bcode = (instr[0] >> 6) & 0x3f;
+			do_trap_or_bp(regs, bcode, "Break");
+			goto out;
 		}
 	} else {
-		if (__get_user(opcode, (unsigned int __user *) exception_epc(regs)))
+		if (__get_user(opcode,
+			       (unsigned int __user *) exception_epc(regs)))
 			goto out_sigsegv;
 	}
 
-- 
1.8.5.3
