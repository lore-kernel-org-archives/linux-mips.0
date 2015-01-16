Received: from mailapp01.imgtec.com ([195.59.15.196]:49233 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010906AbbAPKxdOaqw4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:33 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 8E92CB275932A
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:25 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 46/70] MIPS: kernel: branch: Prevent BGEZL emulation for MIPS R6
Date: Fri, 16 Jan 2015 10:49:25 +0000
Message-ID: <1421405389-15512-47-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104925.Kv6pt0kaK_nhyivlfrGfdZ5ac9NeMeu-yC60Lcsn8eY@z>

MIPS R6 removed the BGEZL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c   | 5 +++++
 arch/mips/math-emu/cp1emu.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 502bf2aeb834..b8cc0a2e20a4 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -452,6 +452,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 
 		case bgez_op:
 		case bgezl_op:
+			if (NO_R6EMU && (insn.i_format.rt == bgezl_op)) {
+				/* not emulating the branch likely for R6 */
+				ret = -SIGILL;
+				break;
+			}
 			if ((long)regs->regs[insn.i_format.rs] >= 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
 				if (insn.i_format.rt == bgezl_op)
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index e70513d552f6..4028d536cd1c 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -484,6 +484,8 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			/* Fall through */
 		case bgez_op:
 		case bgezl_op:
+			if (NO_R6EMU && (insn.i_format.rt == bgezl_op))
+				break;
 			if ((long)regs->regs[insn.i_format.rs] >= 0)
 				*contpc = regs->cp0_epc +
 					dec_insn.pc_inc +
-- 
2.2.1
