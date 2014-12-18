Received: from mailapp01.imgtec.com ([195.59.15.196]:55546 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009209AbaLRPNZBHXT8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:25 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 35605EFC98171
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:16 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 56/67] MIPS: kernel: branch: Emulate the BOVC, BEQC and BEQZALC R6 instructions
Date: Thu, 18 Dec 2014 15:10:05 +0000
Message-ID: <1418915416-3196-57-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151005.SPX_y3mU59zSodVFHiUENlnKrsWhJQSvnhu__M4Sajk@z>

MIPS R6 uses the <R6 ADDI opcode for the new BOVC, BEQC and
BEQZALC instructions.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 2 +-
 arch/mips/kernel/branch.c         | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 648addfe1e1c..b95363e0551f 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -21,7 +21,7 @@
 enum major_op {
 	spec_op, bcond_op, j_op, jal_op,
 	beq_op, bne_op, blez_op, bgtz_op,
-	addi_op, addiu_op, slti_op, sltiu_op,
+	addi_or_cbcond0_op, addiu_op, slti_op, sltiu_op,
 	andi_op, ori_op, xori_op, lui_op,
 	cop0_op, cop1_op, cop2_op, cop1x_op,
 	beql_op, bnel_op, blezl_op, bgtzl_op,
diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index d9e3a0d72a64..cf390c76ba95 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -788,6 +788,12 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	case lwc2_or_bc_op:
 		regs->cp0_epc += 8;
 		break;
+	case addi_or_cbcond0_op:
+		/* Compact branches: bovc, beqc, beqzalc */
+		if (insn.i_format.rt && !insn.i_format.rs)
+			regs->regs[31] = epc + 4;
+		regs->cp0_epc += 8;
+		break;
 #endif
 	}
 
-- 
2.2.0
