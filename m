Received: from mailapp01.imgtec.com ([195.59.15.196]:46582 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010973AbbAPKx706Euh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:59 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id AA2B647D2EBF0
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:51 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 60/70] MIPS: Emulate the new MIPS R6 BEQZC and JIC instructions
Date: Fri, 16 Jan 2015 10:49:39 +0000
Message-ID: <1421405389-15512-61-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104939.60HwYu1WDAFS8M84ipH1c4xGNca4LnQyAwLfqbTyTCA@z>

MIPS R6 uses the <R6 ldc2 opcode for the new BEQZC and JIC instructions

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 2 +-
 arch/mips/kernel/branch.c         | 8 ++++++++
 arch/mips/math-emu/cp1emu.c       | 7 +++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 32063c52f24b..721f8fe705a4 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -32,7 +32,7 @@ enum major_op {
 	sb_op, sh_op, swl_op, sw_op,
 	sdl_op, sdr_op, swr_op, cache_op,
 	ll_op, lwc1_op, lwc2_op, bc6_op = lwc2_op, pref_op,
-	lld_op, ldc1_op, ldc2_op, ld_op,
+	lld_op, ldc1_op, ldc2_op, beqzcjic_op = ldc2_op, ld_op,
 	sc_op, swc1_op, swc2_op, balc6_op = swc2_op, major_3b_op,
 	scd_op, sdc1_op, sdc2_op, sd_op
 };
diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 93e90c27a0cd..c29ceaeaa96e 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -833,6 +833,14 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		epc += 4 + (insn.i_format.simmediate << 2);
 		regs->cp0_epc = epc;
 		break;
+	case beqzcjic_op:
+		if (!cpu_has_mips_r6) {
+			ret = -SIGILL;
+			break;
+		}
+		/* Compact branch: BEQZC || JIC */
+		regs->cp0_epc += 8;
+		break;
 	}
 
 	return ret;
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index b66d77ad5504..2b53036d5f09 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -655,6 +655,13 @@ static int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			dec_insn.next_pc_inc;
 
 		return 1;
+	case beqzcjic_op:
+		if (!cpu_has_mips_r6)
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
