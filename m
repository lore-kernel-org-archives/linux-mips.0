Received: from mailapp01.imgtec.com ([195.59.15.196]:25575 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010481AbbAPKxq6NpXb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:46 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id F0465C7290619
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:38 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 55/70] MIPS: Emulate the new MIPS R6 B{L,G}T{Z,}{AL,}C instructions
Date: Fri, 16 Jan 2015 10:49:34 +0000
Message-ID: <1421405389-15512-56-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104934.wQrmhmha8_lIA3QoBSU_Jfh0OQR13zKsfMtcJTP6mAI@z>

MIPS R6 added the following four instructions which share the
BGTZ and BGTZL opcode:

BLTZALC: Compact branch-and-link if GPR rt is < to zero
BGTZALC: Compact branch-and-link if GPR rt is > to zero
BLTZL  : Compact branch if GPR rt is < to zero
BGTZL  : Compact branch if GPR rt is > to zero
BLTC   : Compact branch if GPR rs is less than GPR rt
BLTUC  : Similar to BLTC but unsigned

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c   | 22 ++++++++++++++++++++++
 arch/mips/math-emu/cp1emu.c | 24 ++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 174d2f74f28c..713d72561f97 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -654,6 +654,28 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 			ret = -SIGILL;
 			break;
 		}
+		/*
+		 * Compact branches for R6 for the
+		 * bgtz and bgtzl opcodes.
+		 * BGTZ  | rs = 0 | rt != 0  == BGTZALC
+		 * BGTZ  | rs = rt != 0      == BLTZALC
+		 * BGTZ  | rs != 0 | rt != 0 == BLTUC
+		 * BGTZL | rs = 0 | rt != 0  == BGTZC
+		 * BGTZL | rs = rt != 0      == BLTZC
+		 * BGTZL | rs != 0 | rt != 0 == BLTC
+		 *
+		 * *ZALC varint for BGTZ &&& rt != 0
+		 * For real GTZ{,L}, rt is always 0.
+		 */
+		if (cpu_has_mips_r6 && insn.i_format.rt) {
+			if ((insn.i_format.opcode == blez_op) &&
+			    ((!insn.i_format.rs && insn.i_format.rt) ||
+			    (insn.i_format.rs == insn.i_format.rt)))
+				regs->regs[31] = epc + 4;
+			regs->cp0_epc += 8;
+			break;
+		}
+
 		/* rt field assumed to be zero */
 		if ((long)regs->regs[insn.i_format.rs] > 0) {
 			epc = epc + 4 + (insn.i_format.simmediate << 2);
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 0697bab067c0..29d1621bdefd 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -591,6 +591,30 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case bgtzl_op:
 		if (NO_R6EMU && (insn.i_format.opcode == bgtzl_op))
 			break;
+		/*
+		 * Compact branches for R6 for the
+		 * bgtz and bgtzl opcodes.
+		 * BGTZ  | rs = 0 | rt != 0  == BGTZALC
+		 * BGTZ  | rs = rt != 0      == BLTZALC
+		 * BGTZ  | rs != 0 | rt != 0 == BLTUC
+		 * BGTZL | rs = 0 | rt != 0  == BGTZC
+		 * BGTZL | rs = rt != 0      == BLTZC
+		 * BGTZL | rs != 0 | rt != 0 == BLTC
+		 *
+		 * *ZALC varint for BGTZ &&& rt != 0
+		 * For real GTZ{,L}, rt is always 0.
+		 */
+		if (cpu_has_mips_r6 && insn.i_format.rt) {
+			if ((insn.i_format.opcode == blez_op) &&
+			    ((!insn.i_format.rs && insn.i_format.rt) ||
+			     (insn.i_format.rs == insn.i_format.rt)))
+				regs->regs[31] = regs->cp0_epc +
+					dec_insn.pc_inc;
+			*contpc = regs->cp0_epc + dec_insn.pc_inc +
+				dec_insn.next_pc_inc;
+
+			return 1;
+		}
 
 		if ((long)regs->regs[insn.i_format.rs] > 0)
 			*contpc = regs->cp0_epc +
-- 
2.2.1
