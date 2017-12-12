Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:48105 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994628AbdLLKAuxhHZC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 11:00:50 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 08/16] MIPS: compat: Don't use current_thread_info for stack base
Date: Tue, 12 Dec 2017 09:57:54 +0000
Message-ID: <1513072682-1371-9-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
References: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095754.lmjbYqBuESwRhEn0y11TJPYfwMRQfVdkTmlXTday2kc@z>

Once CONFIG_THREAD_INFO_IN_TASK is active, current_thread_info() will no
longer return the base of the stack. As such
arch_compat_alloc_user_space, which uses manual arithmetic based on it
to find the user PT_REGS at the top, will stop working. Replace the open
coded manipulation of the stack address to find the user stack pointer
from PT_REGS with user_stack_pointer(task_pt_regs(current)), which is
tidier anyway.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/compat.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/compat.h
index 49691331ada4..17d74ea00455 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -6,6 +6,7 @@
  */
 #include <linux/thread_info.h>
 #include <linux/types.h>
+#include <linux/sched/task_stack.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 
@@ -219,12 +220,11 @@ static inline compat_uptr_t ptr_to_compat(void __user *uptr)
 	return (u32)(unsigned long)uptr;
 }
 
+#define compat_user_stack_pointer() (user_stack_pointer(task_pt_regs(current)))
+
 static inline void __user *arch_compat_alloc_user_space(long len)
 {
-	struct pt_regs *regs = (struct pt_regs *)
-		((unsigned long) current_thread_info() + THREAD_SIZE - 32) - 1;
-
-	return (void __user *) (regs->regs[29] - len);
+	return (void __user *)compat_user_stack_pointer() - len;
 }
 
 struct compat_ipc64_perm {
-- 
2.7.4
