Received: from mailapp01.imgtec.com ([195.59.15.196]:8954 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992111AbdF2JM6kFJiW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jun 2017 11:12:58 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/4] MIPS: Negate error syscall return in trace
Date: Thu, 29 Jun 2017 10:12:34 +0100
Message-ID: <5d53ddca0af9b10c154ce3ce2d732b7c4a55f5ec.1498727356.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.7467c3bd7867c61afc334e409c93dac28541f5e6.1498727356.git-series.james.hogan@imgtec.com>
References: <cover.7467c3bd7867c61afc334e409c93dac28541f5e6.1498727356.git-series.james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170629091234.vRWD6nsj1-3rn9FeUP96RAjwTN_m09S6S8Erj_IvIuA@z>

The sys_exit trace event takes a single return value for the system
call, which MIPS passes the value of the $v0 (result) register, however
MIPS returns positive error codes in $v0 with $a3 specifying that $v0
contains an error code. As a result erroring system calls are traced
returning positive error numbers that can't always be distinguished from
success.

Use regs_return_value() to negate the error code if $a3 is set.

Fixes: 1d7bf993e073 ("MIPS: ftrace: Add support for syscall tracepoints.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.13+
---
 arch/mips/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index ba3b1f771256..8e2ea86dc23e 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -913,7 +913,7 @@ asmlinkage void syscall_trace_leave(struct pt_regs *regs)
 	audit_syscall_exit(regs);
 
 	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_exit(regs, regs->regs[2]);
+		trace_sys_exit(regs, regs_return_value(regs));
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, 0);
-- 
git-series 0.8.10
