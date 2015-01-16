Received: from mailapp01.imgtec.com ([195.59.15.196]:50053 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010937AbbAPKxgjF8xO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:36 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E8CB7201567A8
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:28 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 49/70] MIPS: kernel: branch: Prevent BEQL emulation for MIPS R6
Date: Fri, 16 Jan 2015 10:49:28 +0000
Message-ID: <1421405389-15512-50-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104928.MxV5attBr3AiDb3NCqwmPMq_ibMUiu69WH8vtqmShHM@z>

MIPS R6 removed the BEQL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c   | 4 ++++
 arch/mips/math-emu/cp1emu.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 2273307f7c51..a21bbda1ea9e 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -569,6 +569,10 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	 */
 	case beq_op:
 	case beql_op:
+		if (NO_R6EMU && (insn.i_format.opcode == beql_op)) {
+			ret = -SIGILL;
+			break;
+		}
 		if (regs->regs[insn.i_format.rs] ==
 		    regs->regs[insn.i_format.rt]) {
 			epc = epc + 4 + (insn.i_format.simmediate << 2);
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 8aa6a451104b..c8ab23e96310 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -522,6 +522,9 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		return 1;
 	case beq_op:
 	case beql_op:
+		if (NO_R6EMU && (insn.i_format.opcode == beql_op))
+			break;
+
 		if (regs->regs[insn.i_format.rs] ==
 		    regs->regs[insn.i_format.rt])
 			*contpc = regs->cp0_epc +
-- 
2.2.1
