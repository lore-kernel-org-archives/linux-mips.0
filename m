Received: from mailapp01.imgtec.com ([195.59.15.196]:54142 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009208AbaLRPNYOSaGN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:24 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 17DE52F9F6A5D
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:21 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 59/67] MIPS: kernel: branch: Emulate the BEQZC and JIC instructions
Date: Thu, 18 Dec 2014 15:10:08 +0000
Message-ID: <1418915416-3196-60-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151008.SnoA699UPIuQnNg1TqA5j42he3ozWtLmBxw7kph7yVk@z>

MIPS R6 uses the <R6 ldc2 opcode for the new BEQZC and JIC instructions

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 426f876403d0..4473c23cacf2 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -802,6 +802,15 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		epc = epc + 4 + (insn.i_format.simmediate << 2);
 		regs->cp0_epc = epc;
 		break;
+	case ldc2_or_bzcjic_op:
+		/* Compact branch: BEQZC || JIC */
+		if (insn.i_format.rs) /* BEQZC */
+			epc = epc + 8;
+		else /* JIC */
+			epc = regs->regs[insn.i_format.rt] +
+				insn.i_format.simmediate;
+		regs->cp0_epc = epc;
+		break;
 #endif
 	}
 
-- 
2.2.0
