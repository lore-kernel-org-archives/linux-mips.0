Received: from mailapp01.imgtec.com ([195.59.15.196]:51062 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993894AbdFEXSJDZw3M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Jun 2017 01:18:09 +0200
Date: Tue, 6 Jun 2017 00:17:53 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 5/9] MIPS: Rename `sigill_r6' to `sigill_r2r6' in
 `__compute_return_epc_for_insn'
In-Reply-To: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706051739400.21750@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170605231753.zxBB41c_Vb9Mad4vhncEnXeNMy-iNDKE1nFZBe1jTo8@z>

Cc: stable@vger.kernel.org # 3.19+
Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
 Not a fix by itself, but needed for the next 2 changes.

  Maciej

linux-mips-epc-for-insn-sigill-r6-to-r2r6.diff
Index: linux-sfr-test/arch/mips/kernel/branch.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/branch.c	2017-06-01 06:33:27.149519000 +0100
+++ linux-sfr-test/arch/mips/kernel/branch.c	2017-06-01 06:33:32.663567000 +0100
@@ -431,7 +431,7 @@ int __compute_return_epc_for_insn(struct
 			/* Fall through */
 		case jr_op:
 			if (NO_R6EMU && insn.r_format.func == jr_op)
-				goto sigill_r6;
+				goto sigill_r2r6;
 			regs->cp0_epc = regs->regs[insn.r_format.rs];
 			break;
 		}
@@ -446,7 +446,7 @@ int __compute_return_epc_for_insn(struct
 		switch (insn.i_format.rt) {
 		case bltzl_op:
 			if (NO_R6EMU)
-				goto sigill_r6;
+				goto sigill_r2r6;
 		case bltz_op:
 			if ((long)regs->regs[insn.i_format.rs] < 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
@@ -459,7 +459,7 @@ int __compute_return_epc_for_insn(struct
 
 		case bgezl_op:
 			if (NO_R6EMU)
-				goto sigill_r6;
+				goto sigill_r2r6;
 		case bgez_op:
 			if ((long)regs->regs[insn.i_format.rs] >= 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
@@ -574,7 +570,7 @@ int __compute_return_epc_for_insn(struct
 	 */
 	case beql_op:
 		if (NO_R6EMU)
-			goto sigill_r6;
+			goto sigill_r2r6;
 	case beq_op:
 		if (regs->regs[insn.i_format.rs] ==
 		    regs->regs[insn.i_format.rt]) {
@@ -588,7 +584,7 @@ int __compute_return_epc_for_insn(struct
 
 	case bnel_op:
 		if (NO_R6EMU)
-			goto sigill_r6;
+			goto sigill_r2r6;
 	case bne_op:
 		if (regs->regs[insn.i_format.rs] !=
 		    regs->regs[insn.i_format.rt]) {
@@ -602,7 +598,7 @@ int __compute_return_epc_for_insn(struct
 
 	case blezl_op: /* not really i_format */
 		if (!insn.i_format.rt && NO_R6EMU)
-			goto sigill_r6;
+			goto sigill_r2r6;
 	case blez_op:
 		/*
 		 * Compact branches for R6 for the
@@ -637,7 +633,7 @@ int __compute_return_epc_for_insn(struct
 
 	case bgtzl_op:
 		if (!insn.i_format.rt && NO_R6EMU)
-			goto sigill_r6;
+			goto sigill_r2r6;
 	case bgtz_op:
 		/*
 		 * Compact branches for R6 for the
@@ -834,7 +830,7 @@ int __compute_return_epc_for_insn(struct
 		current->comm);
 	force_sig(SIGILL, current);
 	return -EFAULT;
-sigill_r6:
+sigill_r2r6:
 	pr_info("%s: R2 branch but r2-to-r6 emulator is not preset - sending SIGILL.\n",
 		current->comm);
 	force_sig(SIGILL, current);
