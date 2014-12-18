Received: from mailapp01.imgtec.com ([195.59.15.196]:40637 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009211AbaLRPN1qpZq5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:27 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 0AF274809E65F
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:19 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 58/67] MIPS: kernel: branch: Emulate the BALC R6 instruction
Date: Thu, 18 Dec 2014 15:10:07 +0000
Message-ID: <1418915416-3196-59-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151007.GWwzDlsSgPcPIKDidkSLb4VVKX52gEdtKLu2Ke78k0w@z>

MIPS R6 uses the <R6 swc2 opcode for the new BALC instructions.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 4cc9070682e1..426f876403d0 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -796,6 +796,12 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 			regs->regs[31] = epc + 4;
 		regs->cp0_epc += 8;
 		break;
+	case swc2_or_balc_op:
+		/* Compact branch: BALC */
+		regs->regs[31] = epc + 4;
+		epc = epc + 4 + (insn.i_format.simmediate << 2);
+		regs->cp0_epc = epc;
+		break;
 #endif
 	}
 
-- 
2.2.0
