Received: from mailapp01.imgtec.com ([195.59.15.196]:17611 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010905AbbAPKxbuLxmJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:31 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 1F174F6945A6A
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:24 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 45/70] MIPS: kernel: branch: Prevent BLTZL emulation for MIPS R6
Date: Fri, 16 Jan 2015 10:49:24 +0000
Message-ID: <1421405389-15512-46-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104924.arrRVMGL98pWbglPGz1yVlbHb-soT5bcwxgKMx6WIzw@z>

MIPS R6 removed the BLTZL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c   | 5 +++++
 arch/mips/math-emu/cp1emu.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 9b622ca391d8..502bf2aeb834 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -436,6 +436,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		switch (insn.i_format.rt) {
 		case bltz_op:
 		case bltzl_op:
+			if (NO_R6EMU && (insn.i_format.rt == bltzl_op)) {
+				ret = -SIGILL;
+				/* not emulating the branch likely for R6 */
+				break;
+			}
 			if ((long)regs->regs[insn.i_format.rs] < 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
 				if (insn.i_format.rt == bltzl_op)
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 9707af43913f..e70513d552f6 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -465,6 +465,8 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			/* Fall through */
 		case bltz_op:
 		case bltzl_op:
+			if (NO_R6EMU && (insn.i_format.rt == bltzl_op))
+				break;
 			if ((long)regs->regs[insn.i_format.rs] < 0)
 				*contpc = regs->cp0_epc +
 					dec_insn.pc_inc +
-- 
2.2.1
