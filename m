Received: from multi.imgtec.com ([194.200.65.239]:24642 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870557AbaAVOl4wW-cf (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 22 Jan 2014 15:41:56 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 5/8] MIPS: ptrace: Move away from secure_computing_strict
Date: Wed, 22 Jan 2014 14:40:01 +0000
Message-ID: <1390401604-11830-6-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
References: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140122144001.a69BgxaKzeqzuL4dxqkaF5ktDS0v909V3y84J34Gwks@z>

MIPS now has the infrastructure for dynamic seccomp-bpf
filtering

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/ptrace.h |  2 +-
 arch/mips/kernel/ptrace.c      | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index 7bba9da..84257df 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -82,7 +82,7 @@ static inline long regs_return_value(struct pt_regs *regs)
 #define instruction_pointer(regs) ((regs)->cp0_epc)
 #define profile_pc(regs) instruction_pointer(regs)
 
-extern asmlinkage void syscall_trace_enter(struct pt_regs *regs);
+extern asmlinkage long syscall_trace_enter(struct pt_regs *regs);
 extern asmlinkage void syscall_trace_leave(struct pt_regs *regs);
 
 extern void die(const char *, struct pt_regs *) __noreturn;
diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index fe5af54..7f9bcaa 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -662,13 +662,14 @@ long arch_ptrace(struct task_struct *child, long request,
  * Notification of system call entry/exit
  * - triggered by current->work.syscall_trace
  */
-asmlinkage void syscall_trace_enter(struct pt_regs *regs)
+asmlinkage long syscall_trace_enter(struct pt_regs *regs)
 {
+	long syscall = regs->regs[2];
 	long ret = 0;
 	user_exit();
 
-	/* do the secure computing check first */
-	secure_computing_strict(regs->regs[2]);
+	if (secure_computing(syscall) == -1)
+		return -1;
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
 	    tracehook_report_syscall_entry(regs))
@@ -678,9 +679,10 @@ asmlinkage void syscall_trace_enter(struct pt_regs *regs)
 		trace_sys_enter(regs, regs->regs[2]);
 
 	audit_syscall_entry(syscall_get_arch(current, regs),
-			    regs->regs[2],
+			    syscall,
 			    regs->regs[4], regs->regs[5],
 			    regs->regs[6], regs->regs[7]);
+	return syscall;
 }
 
 /*
-- 
1.8.5.3
