Received: from mailapp01.imgtec.com ([195.59.15.196]:26749 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009210AbaLRPN0E71P6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:26 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C8E45B2D1B468
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:17 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 57/67] MIPS: kernel: branch: Emulate the BNVC, BNEC and BNEZLAC R6 instructions
Date: Thu, 18 Dec 2014 15:10:06 +0000
Message-ID: <1418915416-3196-58-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151006.GjNzIDJNL0Wd_RbNAPpBACJhtGvSnFg1VfkjbQYtXZs@z>

MIPS R6 uses the <R6 DADDI opcode for the new BNVC, BNEC and
BNEZLAC instructions.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 2 +-
 arch/mips/kernel/branch.c         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index b95363e0551f..096f32153ce2 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -25,7 +25,7 @@ enum major_op {
 	andi_op, ori_op, xori_op, lui_op,
 	cop0_op, cop1_op, cop2_op, cop1x_op,
 	beql_op, bnel_op, blezl_op, bgtzl_op,
-	daddi_op, daddiu_op, ldl_op, ldr_op,
+	daddi_or_cbcond1_op, daddiu_op, ldl_op, ldr_op,
 	spec2_op, jalx_op, mdmx_op, spec3_op,
 	lb_op, lh_op, lwl_op, lw_op,
 	lbu_op, lhu_op, lwr_op, lwu_op,
diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index cf390c76ba95..4cc9070682e1 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -790,6 +790,8 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		break;
 	case addi_or_cbcond0_op:
 		/* Compact branches: bovc, beqc, beqzalc */
+	case daddi_or_cbcond1_op:
+		/* Compact branches: bnvc, bnec, bnezlac */
 		if (insn.i_format.rt && !insn.i_format.rs)
 			regs->regs[31] = epc + 4;
 		regs->cp0_epc += 8;
-- 
2.2.0
