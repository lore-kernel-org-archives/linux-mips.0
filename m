Received: from mailapp01.imgtec.com ([195.59.15.196]:18259 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011094AbbG0Mu7gTrb0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 14:50:59 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: do_mcheck: Fix kernel code dump with EVA
Date: Mon, 27 Jul 2015 13:50:21 +0100
Message-ID: <1438001422-20910-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150727125021.Z5i27GjBYRRuH9RM-dRL4Mvep93ME0ws_CSoAzzXhIo@z>

If a machine check exception is raised in kernel mode, user context,
with EVA enabled, then the do_mcheck handler will attempt to read the
code around the EPC using EVA load instructions, i.e. as if the reads
were from user mode. This will either read random user data if the
process has anything mapped at the same address, or it will cause an
exception which is handled by __get_user, resulting in this output:

 Code: (Bad address in epc)

Fix by setting the current user access mode to kernel if the saved
register context indicates the exception was taken in kernel mode. This
causes __get_user to use normal loads to read the kernel code.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.15+
---
 arch/mips/kernel/traps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index e207a43b5f8f..02484d17fb6f 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1519,6 +1519,7 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 	const int field = 2 * sizeof(unsigned long);
 	int multi_match = regs->cp0_status & ST0_TS;
 	enum ctx_state prev_state;
+	mm_segment_t old_fs = get_fs();
 
 	prev_state = exception_enter();
 	show_regs(regs);
@@ -1540,8 +1541,13 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 		dump_tlb_all();
 	}
 
+	if (!user_mode(regs))
+		set_fs(KERNEL_DS);
+
 	show_code((unsigned int __user *) regs->cp0_epc);
 
+	set_fs(old_fs);
+
 	/*
 	 * Some chips may have other causes of machine check (e.g. SB1
 	 * graduation timer)
-- 
2.3.6
