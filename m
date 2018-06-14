Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:46227 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994672AbeFNXxsRb3lb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Jun 2018 01:53:48 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 2/4] MIPS: Add syscall detection for restartable sequences
Date: Thu, 14 Jun 2018 16:52:08 -0700
Message-ID: <20180614235211.31357-3-paul.burton@mips.com>
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
Message-ID: <20180614235208.Np0BwHfn_AoDfP39MnBsj_IPb68v7khP9Km9IEe2nQE@z>

Syscalls are not allowed inside restartable sequences, so add a call to
rseq_syscall() at the very beginning of the system call exit path when
CONFIG_DEBUG_RSEQ=y. This will help us to detect whether there is a
syscall issued erroneously inside a restartable sequence.

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

 arch/mips/kernel/entry.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/entry.S b/arch/mips/kernel/entry.S
index 38a302919e6b..d7de8adcfcc8 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -79,6 +79,10 @@ FEXPORT(ret_from_fork)
 	jal	schedule_tail		# a0 = struct task_struct *prev
 
 FEXPORT(syscall_exit)
+#ifdef CONFIG_DEBUG_RSEQ
+	move	a0, sp
+	jal	rseq_syscall
+#endif
 	local_irq_disable		# make sure need_resched and
 					# signals dont change between
 					# sampling and return
@@ -141,6 +145,10 @@ work_notifysig:				# deal with pending signals and
 	j	resume_userspace_check
 
 FEXPORT(syscall_exit_partial)
+#ifdef CONFIG_DEBUG_RSEQ
+	move	a0, sp
+	jal	rseq_syscall
+#endif
 	local_irq_disable		# make sure need_resched doesn't
 					# change between and return
 	LONG_L	a2, TI_FLAGS($28)	# current->work
-- 
2.17.1
