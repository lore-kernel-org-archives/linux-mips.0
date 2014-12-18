Received: from mailapp01.imgtec.com ([195.59.15.196]:9051 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009189AbaLRPNE425U8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:04 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 368D48D3D0A7B
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:12:54 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 43/67] MIPS: kernel: branch: Prevent BLTZL emulation for MIPS R6
Date: Thu, 18 Dec 2014 15:09:52 +0000
Message-ID: <1418915416-3196-44-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150952.lGwy4_LzYugxOCWCWH1Jqe5-60xFLK7d1cHltsb38E0@z>

MIPS R6 removed the BLTZL instruction so do not try to emulate it
if the R2-to-R6 emulator is not present.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/branch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 3df013ef7622..964ee68dcfe6 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -439,6 +439,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		switch (insn.i_format.rt) {
 		case bltz_op:
 		case bltzl_op:
+			if (NO_R6EMU && insn.i_format.rt == bltzl_op) {
+				ret = -SIGILL;
+				/* not emulating the branch likely for R6 */
+				break;
+			}
 			if ((long)regs->regs[insn.i_format.rs] < 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
 				if (insn.i_format.rt == bltzl_op)
-- 
2.2.0
