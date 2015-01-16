Received: from mailapp01.imgtec.com ([195.59.15.196]:49233 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010912AbbAPKxeDctG9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:34 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 756AE62BE1C0
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:31 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 51/70] MIPS: kernel: branch: Prevent BLEZL emulation for MIPS R6
Date: Fri, 16 Jan 2015 10:49:30 +0000
Message-ID: <1421405389-15512-52-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104930.YvdHeGB1sfD9jVH5TCMTPLnwakhXFHSoNPqsHX-LrWM@z>

MIPS R6 removed the BLEZL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c   | 5 +++++
 arch/mips/math-emu/cp1emu.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index b71eff60543d..bf5754ac9c14 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -601,6 +601,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 
 	case blez_op: /* not really i_format */
 	case blezl_op:
+		if (NO_R6EMU && (insn.i_format.opcode == blezl_op)) {
+			/* not emulating the branch likely for R6 */
+			ret = -SIGILL;
+			break;
+		}
 		/* rt field assumed to be zero */
 		if ((long)regs->regs[insn.i_format.rs] <= 0) {
 			epc = epc + 4 + (insn.i_format.simmediate << 2);
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 05982b631d7c..41516e2f08c7 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -552,6 +552,9 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		return 1;
 	case blez_op:
 	case blezl_op:
+		if (NO_R6EMU && (insn.i_format.opcode == blezl_op))
+			break;
+
 		if ((long)regs->regs[insn.i_format.rs] <= 0)
 			*contpc = regs->cp0_epc +
 				dec_insn.pc_inc +
-- 
2.2.1
