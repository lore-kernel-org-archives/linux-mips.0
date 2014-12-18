Received: from mailapp01.imgtec.com ([195.59.15.196]:2312 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009199AbaLRPNKua-MG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:10 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 4E46E186E381C
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:01 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 47/67] MIPS: kernel: branch: Prevent BEQL emulation for MIPS R6
Date: Thu, 18 Dec 2014 15:09:56 +0000
Message-ID: <1418915416-3196-48-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150956.Rk-JY7hrOuJAEDrMj0CupfZYPXf6FvoTuescOU2REtM@z>

MIPS R6 removed the BEQL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 5f2a168c37fd..539d059ba4fb 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -572,6 +572,10 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	 */
 	case beq_op:
 	case beql_op:
+		if (NO_R6EMU && insn.i_format.opcode == beql_op) {
+			ret = -SIGILL;
+			break;
+		}
 		if (regs->regs[insn.i_format.rs] ==
 		    regs->regs[insn.i_format.rt]) {
 			epc = epc + 4 + (insn.i_format.simmediate << 2);
-- 
2.2.0
