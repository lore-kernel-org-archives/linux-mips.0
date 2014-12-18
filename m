Received: from mailapp01.imgtec.com ([195.59.15.196]:51614 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009179AbaLRPNAw8IWH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:00 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id A15FB5DB0D35C
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:12:52 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 42/67] MIPS: kernel: branch: Prepare the JR instruction for emulation on MIPS R6
Date: Thu, 18 Dec 2014 15:09:51 +0000
Message-ID: <1418915416-3196-43-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150951.VL1j_4Wi8fmgT3_fvbJ11sUshGEbhwr2GSxx0pvud6o@z>

The MIPS R6 JR instruction is an alias to the JALR one, so it may
needs emulation for non-R6 userlands.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index b7dd0926e87f..3df013ef7622 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -19,6 +19,9 @@
 #include <asm/ptrace.h>
 #include <asm/uaccess.h>
 
+static int mipsr2_emulation = 0;
+#define NO_R6EMU	(cpu_has_mips_r6 && !mipsr2_emulation)
+
 /*
  * Calculate and return exception PC in case of branch delay slot
  * for microMIPS and MIPS16e. It does not clear the ISA mode bit.
@@ -417,6 +420,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 			regs->regs[insn.r_format.rd] = epc + 8;
 			/* Fall through */
 		case jr_op:
+			if (NO_R6EMU && insn.r_format.func == jr_op) {
+				ret = -SIGILL;
+				/* For R6, JR already emulated in jalr_op */
+				break;
+			}
 			regs->cp0_epc = regs->regs[insn.r_format.rs];
 			break;
 		}
-- 
2.2.0
