Received: from mailapp01.imgtec.com ([195.59.15.196]:54142 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009207AbaLRPNXmt7vM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:23 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 896A01A7AC6FE
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:15 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 55/67] MIPS: kernel: branch: Emulate the branch compact (BC) on MIPS R6
Date: Thu, 18 Dec 2014 15:10:04 +0000
Message-ID: <1418915416-3196-56-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151004.9d-TOGVgdMzPM9JPAIZkjeBm49T6BljHJNKATcmpEig@z>

MIPS R6 uses the <R6 LWC2 opcode for the new BC instruction.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index ca102557fa3c..d9e3a0d72a64 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -784,6 +784,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		regs->cp0_epc = epc;
 		break;
 #endif
+#ifdef CONFIG_CPU_MIPSR6
+	case lwc2_or_bc_op:
+		regs->cp0_epc += 8;
+		break;
+#endif
 	}
 
 	return ret;
-- 
2.2.0
