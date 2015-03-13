Received: from mail-wi0-f179.google.com ([209.85.212.179]:41925 "EHLO
        mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008717AbbCMSPmN6poJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Mar 2015 19:15:42 +0100
From: Alex Dowad <alexinbeijing@gmail.com>
Subject: [PATCH 18/32] mips: copy_thread(): rename 'arg' argument to 'kthread_arg'
Date: Fri, 13 Mar 2015 20:14:41 +0200
Message-ID: <1426270496-26362-8-git-send-email-alexinbeijing@gmail.com>
In-Reply-To: <1426270496-26362-1-git-send-email-alexinbeijing@gmail.com>
References: <1426270496-26362-1-git-send-email-alexinbeijing@gmail.com>
Return-Path: <alexinbeijing@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>, Markos Chandras <markos.chandras@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Eunbong Song <eunb.song@samsung.com>, "open list:MIPS" <linux-mips@linux-mips.org>
Message-ID: <20150313181441.JX8wqY6vZiRuuI5wJfXD7fSeM7YNvEmpmTGAD3awmXc@z>

The 'arg' argument to copy_thread() is only ever used when forking a new
kernel thread. Hence, rename it to 'kthread_arg' for clarity (and consistency
with do_fork() and other arch-specific implementations of copy_thread()).

Signed-off-by: Alex Dowad <alexinbeijing@gmail.com>
---
 arch/mips/kernel/process.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index bf85cc1..d295bd1 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -107,8 +107,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+/*
+ * Copy architecture-specific thread state
+ */
 int copy_thread(unsigned long clone_flags, unsigned long usp,
-	unsigned long arg, struct task_struct *p)
+	unsigned long kthread_arg, struct task_struct *p)
 {
 	struct thread_info *ti = task_thread_info(p);
 	struct pt_regs *childregs, *regs = current_pt_regs();
@@ -123,11 +126,12 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	childksp = (unsigned long) childregs;
 	p->thread.cp0_status = read_c0_status() & ~(ST0_CU2|ST0_CU1);
 	if (unlikely(p->flags & PF_KTHREAD)) {
+		/* kernel thread */
 		unsigned long status = p->thread.cp0_status;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		ti->addr_limit = KERNEL_DS;
 		p->thread.reg16 = usp; /* fn */
-		p->thread.reg17 = arg;
+		p->thread.reg17 = kthread_arg;
 		p->thread.reg29 = childksp;
 		p->thread.reg31 = (unsigned long) ret_from_kernel_thread;
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
@@ -139,6 +143,8 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		childregs->cp0_status = status;
 		return 0;
 	}
+
+	/* user thread */
 	*childregs = *regs;
 	childregs->regs[7] = 0; /* Clear error flag */
 	childregs->regs[2] = 0; /* Child gets zero as return value */
-- 
2.0.0.GIT
