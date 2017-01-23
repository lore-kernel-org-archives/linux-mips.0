Received: from mailapp01.imgtec.com ([195.59.15.196]:36461 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991957AbdAWJSnI1lNc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Jan 2017 10:18:43 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH v2 1/2] MIPS: ptrace: disallow setting watchpoints in kernel address space
Date: Mon, 23 Jan 2017 10:18:32 +0100
Message-ID: <1485163113-21780-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170123091832.EXrNJhEjrxubLC7K_HUHPG5MG19CWMaG-ODUtcS7csM@z>

With certain EVA configurations it is possible for the kernel address
space to overlap user address space, which allows the user to set
watchpoints on kernel addresses via ptrace.

If a watchpoint is set in the watch exception handling code (after
exception level has been cleared) then the system will hang in an
infinite loop when hitting a watchpoint while trying to process it.

To prevent that simply disallow placing any watchpoints at addresses
above start of kernel that overlap userspace.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>

---

This supersedes "protect watchpoint handling code from setting
watchpoints" which originally would only protect part of the kernel code
most vulnerable. However, that change was incomplete and it is really
difficult to ensure all required sections are properly guarded.
Having selective guards on parts of the kernel address space could also
be used as a method to circumvent KASLR.
---
 arch/mips/kernel/ptrace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index c8ba260..7b87493 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -253,6 +253,11 @@ int ptrace_set_watch_regs(struct task_struct *child,
 #ifdef CONFIG_32BIT
 		if (lt[i] & __UA_LIMIT)
 			return -EINVAL;
+
+#ifdef CONFIG_EVA
+		if (lt[i] >= PAGE_OFFSET)
+			return -EINVAL;
+#endif /* CONFIG_EVA */
 #else
 		if (test_tsk_thread_flag(child, TIF_32BIT_ADDR)) {
 			if (lt[i] & 0xffffffff80000000UL)
-- 
2.7.4
