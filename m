Received: from mailapp01.imgtec.com ([195.59.15.196]:47464 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993894AbdFEXSp6mCwM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Jun 2017 01:18:45 +0200
Date: Tue, 6 Jun 2017 00:18:30 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 6/9] MIPS: Send SIGILL for linked branches in
 `__compute_return_epc_for_insn'
In-Reply-To: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706051745430.21750@tp.orcam.me.uk>
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
Message-ID: <20170605231830.X0QM3Zo8ddD0-LwKimfyu6TLQUeQNfONKjdY3PLCmsU@z>

Fix commit 319824eabc3f ("MIPS: kernel: branch: Do not emulate the 
branch likelies on MIPS R6") and also send SIGILL rather than returning 
-SIGILL for BLTZAL, BLTZALL, BGEZAL and BGEZALL instruction encodings no 
longer supported in R6, except where emulated.  Returning -SIGILL is 
never correct as the API defines this function's result upon error to be 
-EFAULT and a signal actually issued.

Cc: stable@vger.kernel.org # 3.19+
Fixes: 319824eabc3f ("MIPS: kernel: branch: Do not emulate the branch likelies on MIPS R6")
Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-mips-epc-for-insn-sigill-r2r6.diff
Index: linux-sfr-test/arch/mips/kernel/branch.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/branch.c	2017-06-01 06:33:27.149519000 +0100
+++ linux-sfr-test/arch/mips/kernel/branch.c	2017-06-01 06:33:32.663567000 +0100
@@ -473,10 +473,8 @@ int __compute_return_epc_for_insn(struct
 		case bltzal_op:
 		case bltzall_op:
 			if (NO_R6EMU && (insn.i_format.rs ||
-			    insn.i_format.rt == bltzall_op)) {
-				ret = -SIGILL;
-				break;
-			}
+			    insn.i_format.rt == bltzall_op))
+				goto sigill_r2r6;
 			regs->regs[31] = epc + 8;
 			/*
 			 * OK we are here either because we hit a NAL
@@ -507,10 +505,8 @@ int __compute_return_epc_for_insn(struct
 		case bgezal_op:
 		case bgezall_op:
 			if (NO_R6EMU && (insn.i_format.rs ||
-			    insn.i_format.rt == bgezall_op)) {
-				ret = -SIGILL;
-				break;
-			}
+			    insn.i_format.rt == bgezall_op))
+				goto sigill_r2r6;
 			regs->regs[31] = epc + 8;
 			/*
 			 * OK we are here either because we hit a BAL
