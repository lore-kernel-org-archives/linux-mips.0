Received: from mailapp01.imgtec.com ([195.59.15.196]:44339 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026632AbcDUNINNFPNj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Apr 2016 15:08:13 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 11/11] MIPS: math-emu: Fix jalr emulation when rd == $0
Date: Thu, 21 Apr 2016 14:04:55 +0100
Message-ID: <1461243895-30371-12-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1461243895-30371-1-git-send-email-paul.burton@imgtec.com>
References: <1461243895-30371-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, "stable # v3 . 10" <stable@vger.kernel.org>, "Maciej W. Rozycki" <macro@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160421130455.WUsmEZuRdyqj6KDxmzD3HKhedGG2-2TqjQJTvVXwoq8@z>

When emulating a jalr instruction with rd == $0, the code in
isBranchInstr was incorrectly writing to GPR $0 which should actually
always remain zeroed. This would lead to any further instructions
emulated which use $0 operating on a bogus value until the task is next
context switched, at which point the value of $0 in the task context
would be restored to the correct zero by a store in SAVE_SOME. Fix this
by not writing to rd if it is $0.

Fixes: 102cedc32a6e ("MIPS: microMIPS: Floating point support.")
Cc: stable <stable@vger.kernel.org> # v3.10
Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/math-emu/cp1emu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 85dd174..d96e912 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -445,9 +445,11 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case spec_op:
 		switch (insn.r_format.func) {
 		case jalr_op:
-			regs->regs[insn.r_format.rd] =
-				regs->cp0_epc + dec_insn.pc_inc +
-				dec_insn.next_pc_inc;
+			if (insn.r_format.rd != 0) {
+				regs->regs[insn.r_format.rd] =
+					regs->cp0_epc + dec_insn.pc_inc +
+					dec_insn.next_pc_inc;
+			}
 			/* Fall through */
 		case jr_op:
 			/* For R6, JR already emulated in jalr_op */
-- 
2.8.0
