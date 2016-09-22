Received: from mailapp02.imgtec.com ([217.156.133.132]:62363 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992196AbcIVOsOv9hLD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Sep 2016 16:48:14 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Fix delay slot emulation count in debugfs
Date: Thu, 22 Sep 2016 15:47:40 +0100
Message-ID: <20160922144740.4273-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160922144740.g_UZWjoa0Nt2gSYozwRiMciifPqxbY3qfT3yh4AF16A@z>

Commit 432c6bacbd0c ("MIPS: Use per-mm page to execute branch delay slot
instructions") accidentally removed use of the MIPS_FPU_EMU_INC_STATS
macro from do_dsemulret, leading to the ds_emul file in debugfs always
returning zero even though we perform delay slot emulations.

Fix this by re-adding the use of the MIPS_FPU_EMU_INC_STATS macro.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: 432c6bacbd0c ("MIPS: Use per-mm page to execute branch delay slot instructions")
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/math-emu/dsemul.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/math-emu/dsemul.c b/arch/mips/math-emu/dsemul.c
index 72a4642..4a094f7 100644
--- a/arch/mips/math-emu/dsemul.c
+++ b/arch/mips/math-emu/dsemul.c
@@ -298,5 +298,6 @@ bool do_dsemulret(struct pt_regs *xcp)
 	/* Set EPC to return to post-branch instruction */
 	xcp->cp0_epc = current->thread.bd_emu_cont_pc;
 	pr_debug("dsemulret to 0x%08lx\n", xcp->cp0_epc);
+	MIPS_FPU_EMU_INC_STATS(ds_emul);
 	return true;
 }
-- 
2.10.0
