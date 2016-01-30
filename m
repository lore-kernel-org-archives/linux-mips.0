Received: from mailapp01.imgtec.com ([195.59.15.196]:34383 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010110AbcA3JIt1q-2N (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 30 Jan 2016 10:08:49 +0100
Date: Sat, 30 Jan 2016 09:08:43 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 3/3] MIPS: traps.c: Verify the ISA for microMIPS RDHWR
 emulation
In-Reply-To: <alpine.DEB.2.00.1601300356250.5958@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1601300403230.5958@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1601300356250.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20160130090843.AS8rBdvhqflgcaZo03vcCRigNzSjBzULj5dQmTqnHis@z>

Make sure it's the microMIPS rather than MIPS16 ISA before emulating 
microMIPS RDHWR.  Mostly needed as an optimisation for configurations 
where `cpu_has_mmips' is hardcoded to 0 and also a good measure in case 
we add further microMIPS instructions to emulate in the future, as the 
corresponding MIPS16 encoding is ADDIUSP, not supposed to trap.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-umips-rdhwr-isa.diff
Index: linux-sfr-test/arch/mips/kernel/traps.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/traps.c	2016-01-30 03:42:36.000000000 +0000
+++ linux-sfr-test/arch/mips/kernel/traps.c	2016-01-30 03:42:14.980343000 +0000
@@ -1116,19 +1116,7 @@ asmlinkage void do_ri(struct pt_regs *re
 	if (unlikely(compute_return_epc(regs) < 0))
 		goto out;
 
-	if (get_isa16_mode(regs->cp0_epc)) {
-		unsigned short mmop[2] = { 0 };
-
-		if (unlikely(get_user(mmop[0], (u16 __user *)epc + 0) < 0))
-			status = SIGSEGV;
-		if (unlikely(get_user(mmop[1], (u16 __user *)epc + 1) < 0))
-			status = SIGSEGV;
-		opcode = mmop[0];
-		opcode = (opcode << 16) | mmop[1];
-
-		if (status < 0)
-			status = simulate_rdhwr_mm(regs, opcode);
-	} else {
+	if (!get_isa16_mode(regs->cp0_epc)) {
 		if (unlikely(get_user(opcode, epc) < 0))
 			status = SIGSEGV;
 
@@ -1143,6 +1131,18 @@ asmlinkage void do_ri(struct pt_regs *re
 
 		if (status < 0)
 			status = simulate_fp(regs, opcode, old_epc, old31);
+	} else if (cpu_has_mmips) {
+		unsigned short mmop[2] = { 0 };
+
+		if (unlikely(get_user(mmop[0], (u16 __user *)epc + 0) < 0))
+			status = SIGSEGV;
+		if (unlikely(get_user(mmop[1], (u16 __user *)epc + 1) < 0))
+			status = SIGSEGV;
+		opcode = mmop[0];
+		opcode = (opcode << 16) | mmop[1];
+
+		if (status < 0)
+			status = simulate_rdhwr_mm(regs, opcode);
 	}
 
 	if (status < 0)
