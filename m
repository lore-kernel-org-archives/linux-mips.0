Received: from mailapp01.imgtec.com ([195.59.15.196]:24972 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008573AbbFXIwXAqGJx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jun 2015 10:52:23 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/2] MIPS: Fix erroneous JR emulation for MIPS R6
Date: Wed, 24 Jun 2015 09:52:01 +0100
Message-ID: <1435135921-7090-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1435135921-7090-1-git-send-email-markos.chandras@imgtec.com>
References: <1435135921-7090-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150624085201.sCE07dmBc1THG-9-MMvJQKdBX5hyvAB4Hu8mctQvjBI@z>

Commit 5f9f41c474befb4ebbc40b27f65bb7d649241581 ("MIPS: kernel: Prepare
the JR instruction for emulation on MIPS R6") added support for
emulating the JR instruction on MIPS R6 cores but that introduced a bug
which could be triggered when hitting a JALR opcode because the code used
the wrong field in the 'r_format' struct to determine the instruction
opcode. This lead to crashes because an emulated JALR instruction was
treated as a JR one when the R6 emulator was turned off.

Fixes: 5f9f41c474be ("MIPS: kernel: Prepare the JR instruction for emulation on MIPS R6")
Cc: <stable@vger.kernel.org> # 4.0+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/math-emu/cp1emu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 00c241ae04ce..712f17a2ecf2 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -451,7 +451,7 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			/* Fall through */
 		case jr_op:
 			/* For R6, JR already emulated in jalr_op */
-			if (NO_R6EMU && insn.r_format.opcode == jr_op)
+			if (NO_R6EMU && insn.r_format.func == jr_op)
 				break;
 			*contpc = regs->regs[insn.r_format.rs];
 			return 1;
-- 
2.4.4
