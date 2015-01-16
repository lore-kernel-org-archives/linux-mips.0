Received: from mailapp01.imgtec.com ([195.59.15.196]:57405 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010959AbbAPKxuG8xlH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:50 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 5320B48BFFD25
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:42 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 56/70] MIPS: Emulate the new MIPS R6 branch compact (BC) instruction
Date: Fri, 16 Jan 2015 10:49:35 +0000
Message-ID: <1421405389-15512-57-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104935.iuU74OR6xgyPP3CqwKxdL9xnqVz62o8rRiKaVVUz_t0@z>

MIPS R6 uses the <R6 LWC2 opcode for the new BC instruction.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h |  2 +-
 arch/mips/kernel/branch.c         |  8 ++++++++
 arch/mips/math-emu/cp1emu.c       | 12 ++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 19d3bc1e6510..9ce5e34b9c64 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -31,7 +31,7 @@ enum major_op {
 	lbu_op, lhu_op, lwr_op, lwu_op,
 	sb_op, sh_op, swl_op, sw_op,
 	sdl_op, sdr_op, swr_op, cache_op,
-	ll_op, lwc1_op, lwc2_op, pref_op,
+	ll_op, lwc1_op, lwc2_op, bc6_op = lwc2_op, pref_op,
 	lld_op, ldc1_op, ldc2_op, ld_op,
 	sc_op, swc1_op, swc2_op, major_3b_op,
 	scd_op, sdc1_op, sdc2_op, sd_op
diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 713d72561f97..bf82ec302cff 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -800,6 +800,14 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		regs->cp0_epc = epc;
 		break;
 #endif
+	case bc6_op:
+		/* Only valid for MIPS R6 */
+		if (!cpu_has_mips_r6) {
+			ret = -SIGILL;
+			break;
+		}
+		regs->cp0_epc += 8;
+		break;
 	}
 
 	return ret;
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 29d1621bdefd..ccdd424f2f1d 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -625,6 +625,18 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 				dec_insn.pc_inc +
 				dec_insn.next_pc_inc;
 		return 1;
+	case bc6_op:
+		/*
+		 * Only valid for MIPS R6 but we can still end up
+		 * here from a broken userland so just tell emulator
+		 * this is not a branch and let it break later on.
+		 */
+		if  (!cpu_has_mips_r6)
+			break;
+		*contpc = regs->cp0_epc + dec_insn.pc_inc +
+			dec_insn.next_pc_inc;
+
+		return 1;
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 	case lwc2_op: /* This is bbit0 on Octeon */
 		if ((regs->regs[insn.i_format.rs] & (1ull<<insn.i_format.rt)) == 0)
-- 
2.2.1
