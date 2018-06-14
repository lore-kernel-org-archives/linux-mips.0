Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:42509 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994673AbeFNXxtO26ab (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Jun 2018 01:53:49 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 1/4] MIPS: Add support for restartable sequences
Date: Thu, 14 Jun 2018 16:52:07 -0700
Message-ID: <20180614235211.31357-2-paul.burton@mips.com>
In-Reply-To: <20180614235211.31357-1-paul.burton@mips.com>
References: <20180614235211.31357-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Message-ID: <20180614235207.kyqvOiujdTsLvSl1NYkPlekje2TnjBoF_cYqcYx6Y84@z>

Implement support for restartable sequences on MIPS, which requires 3
simple things:

  - Call rseq_handle_notify_resume() on return to userspace if
    TIF_NOTIFY_RESUME is set.

  - Call rseq_signal_deliver() to fixup the pre-signal stack frame when
    a signal is delivered whilst executing a restartable sequence
    critical section.

  - Select CONFIG_HAVE_RSEQ.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---

 arch/mips/Kconfig         | 1 +
 arch/mips/kernel/signal.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fe98e459a416..afe2b0c867ac 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -66,6 +66,7 @@ config MIPS
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_RSEQ
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN if 64BIT || !SMP
 	select IRQ_FORCED_THREADING
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 9e224469c788..00f2535d2226 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -801,6 +801,8 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 		regs->regs[0] = 0;		/* Don't deal with this again.	*/
 	}
 
+	rseq_signal_deliver(regs);
+
 	if (sig_uses_siginfo(&ksig->ka, abi))
 		ret = abi->setup_rt_frame(vdso + abi->vdso->off_rt_sigreturn,
 					  ksig, regs, oldset);
@@ -868,6 +870,7 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
 	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
 		clear_thread_flag(TIF_NOTIFY_RESUME);
 		tracehook_notify_resume(regs);
+		rseq_handle_notify_resume(regs);
 	}
 
 	user_enter();
-- 
2.17.1
