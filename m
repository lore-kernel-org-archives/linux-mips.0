Received: from mailapp01.imgtec.com ([195.59.15.196]:33443 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993873AbdFEXUpLg1qM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Jun 2017 01:20:45 +0200
Date: Tue, 6 Jun 2017 00:20:30 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 9/9] MIPS: math-emu: For MFHC1/MTHC1 also return SIGILL right
 away
In-Reply-To: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706051834110.21750@tp.orcam.me.uk>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170605232030.Ij0Z5EBGEzp4af4ZuDk8uVWzhuvaJrATxTyKwP-c2IA@z>

Update commit 1ac944007bed ("MIPS: math-emu: Add mfhc1 & mthc1 
support.") and like done throughout `cop1Emulate' for other cases also 
for the MFHC1 and MTHC1 instructions return SIGILL right away rather 
than jumping to a single `return' statement.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
 No functional change, just a coding consistency fix, so no need to 
backport.

  Maciej

linux-mips-cp1emu-sigill.diff
Index: linux-sfr-test/arch/mips/math-emu/cp1emu.c
===================================================================
--- linux-sfr-test.orig/arch/mips/math-emu/cp1emu.c	2017-06-05 05:11:05.344496000 +0100
+++ linux-sfr-test/arch/mips/math-emu/cp1emu.c	2017-06-05 05:22:21.552958000 +0100
@@ -1142,7 +1142,7 @@ static int cop1Emulate(struct pt_regs *x
 
 		case mfhc_op:
 			if (!cpu_has_mips_r2_r6)
-				goto sigill;
+				return SIGILL;
 
 			/* copregister rd -> gpr[rt] */
 			if (MIPSInst_RT(ir) != 0) {
@@ -1153,7 +1153,7 @@ static int cop1Emulate(struct pt_regs *x
 
 		case mthc_op:
 			if (!cpu_has_mips_r2_r6)
-				goto sigill;
+				return SIGILL;
 
 			/* copregister rd <- gpr[rt] */
 			SITOHREG(xcp->regs[MIPSInst_RT(ir)], MIPSInst_RD(ir));
@@ -1376,7 +1376,6 @@ static int cop1Emulate(struct pt_regs *x
 				xcp->regs[MIPSInst_RS(ir)];
 		break;
 	default:
-sigill:
 		return SIGILL;
 	}
 
