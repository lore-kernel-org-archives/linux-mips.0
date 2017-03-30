Received: from mailapp01.imgtec.com ([195.59.15.196]:45528 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992366AbdC3V13EHldH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 23:27:29 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Remove confusing else statement in __do_page_fault()
Date: Thu, 30 Mar 2017 14:27:02 -0700
Message-ID: <20170330212703.32066-1-paul.burton@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, trivial@kernel.org
Message-ID: <20170330212702.c-whS37lnw_G6jpEbKYVWB_esFE8aKh-_JiWMUOmO0o@z>

Commit 41c594ab65fc ("[MIPS] MT: Improved multithreading support.")
added an else case to an if statement in do_page_fault() (which has
since gained 2 leading underscores) for some unclear reason. If the
condition in the if statement evaluates true then we execute a goto &
branch elsewhere anyway, so the else has no effect. Combined with an #if
0 block with misleading indentation introduced in the same commit it
makes the code less clear than it could be.

Remove the unnecessary else statement & de-indent the printk within
the #if 0 block in order to make the code easier for humans to parse.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: trivial@kernel.org

---

 arch/mips/mm/fault.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 3bef306cdfdb..4f8f5bf46977 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -267,19 +267,19 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 	/* Kernel mode? Handle exceptions or die */
 	if (!user_mode(regs))
 		goto no_context;
-	else
+
 	/*
 	 * Send a sigbus, regardless of whether we were in kernel
 	 * or user mode.
 	 */
 #if 0
-		printk("do_page_fault() #3: sending SIGBUS to %s for "
-		       "invalid %s\n%0*lx (epc == %0*lx, ra == %0*lx)\n",
-		       tsk->comm,
-		       write ? "write access to" : "read access from",
-		       field, address,
-		       field, (unsigned long) regs->cp0_epc,
-		       field, (unsigned long) regs->regs[31]);
+	printk("do_page_fault() #3: sending SIGBUS to %s for "
+	       "invalid %s\n%0*lx (epc == %0*lx, ra == %0*lx)\n",
+	       tsk->comm,
+	       write ? "write access to" : "read access from",
+	       field, address,
+	       field, (unsigned long) regs->cp0_epc,
+	       field, (unsigned long) regs->regs[31]);
 #endif
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 	tsk->thread.cp0_badvaddr = address;
-- 
2.12.1
