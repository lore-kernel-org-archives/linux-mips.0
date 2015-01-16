Received: from mailapp01.imgtec.com ([195.59.15.196]:15271 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010933AbbAPKxhwf0xo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:37 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 37DD772F0526F
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:30 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 50/70] MIPS: kernel: branch: Prevent BNEL emulation for MIPS R6
Date: Fri, 16 Jan 2015 10:49:29 +0000
Message-ID: <1421405389-15512-51-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104929.O4B0SI2Nl0dGeOMsz2R7YusvMclkVRx1VtUUobQDUXo@z>

MIPS R6 removed the BNEL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c   | 4 ++++
 arch/mips/math-emu/cp1emu.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index a21bbda1ea9e..b71eff60543d 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -585,6 +585,10 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 
 	case bne_op:
 	case bnel_op:
+		if (NO_R6EMU && (insn.i_format.opcode == bnel_op)) {
+			ret = -SIGILL;
+			break;
+		}
 		if (regs->regs[insn.i_format.rs] !=
 		    regs->regs[insn.i_format.rt]) {
 			epc = epc + 4 + (insn.i_format.simmediate << 2);
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index c8ab23e96310..05982b631d7c 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -537,6 +537,9 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		return 1;
 	case bne_op:
 	case bnel_op:
+		if (NO_R6EMU && (insn.i_format.opcode == bnel_op))
+			break;
+
 		if (regs->regs[insn.i_format.rs] !=
 		    regs->regs[insn.i_format.rt])
 			*contpc = regs->cp0_epc +
-- 
2.2.1
