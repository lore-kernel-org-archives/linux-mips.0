Received: from mailapp01.imgtec.com ([195.59.15.196]:20388 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009194AbaLRPNGG2RwX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:06 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id CD92910C791F4
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:12:57 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 45/67] MIPS: kernel: branch: Prevent BLTZAL emulation for MIPS R6
Date: Thu, 18 Dec 2014 15:09:54 +0000
Message-ID: <1418915416-3196-46-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150954.fSFokGDBrQ_-rVv3irZecgdDmJ0IXekPZsF7X8NgmlQ@z>

MIPS R6 removed the BLTZAL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 592db72123f2..f1f8ee374f14 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -471,7 +471,29 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 
 		case bltzal_op:
 		case bltzall_op:
+			if (NO_R6EMU && (insn.i_format.rs ||
+			    insn.i_format.rt == bltzall_op)) {
+				ret = -SIGILL;
+				break;
+			}
 			regs->regs[31] = epc + 8;
+			/*
+			 * OK we are here either because we hit a NAL
+			 * instruction or because we are emulating an
+			 * old bltzal{,l} one. Lets figure out what the
+			 * case really is.
+			 */
+			if (!insn.i_format.rs) {
+				/*
+				 * NAL or BLTZAL with rs == 0
+				 * Doesn't matter if we are R6 or not. The
+				 * result is the same
+				 */
+				regs->cp0_epc += 4 +
+					(insn.i_format.simmediate << 2);
+				break;
+			}
+			/* Now do the real thing for non-R6 BLTZAL{,L} */
 			if ((long)regs->regs[insn.i_format.rs] < 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
 				if (insn.i_format.rt == bltzall_op)
-- 
2.2.0
