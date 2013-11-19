Received: from multi.imgtec.com ([194.200.65.239]:2613 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817266Ab3KSRcRpU2EL (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Nov 2013 18:32:17 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/6] mips: clean up resume declaration
Date: Tue, 19 Nov 2013 17:30:37 +0000
Message-ID: <1384882239-17965-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
References: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20131119173037.0_QLevlzr517RvHniyGHHEMjXqpzY_KYqwkzVAU9mQI@z>

This patch cleans up the declaration of the resume function by replacing
void pointers with their correct types. The irrelevant & incorrect
comment preceeding the resume function is replaced by one documenting
its function.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/include/asm/switch_to.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index eb0af15..278d45a 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -19,11 +19,19 @@
 
 struct task_struct;
 
-/*
- * switch_to(n) should switch tasks to task nr n, first
- * checking that n isn't the current task, in which case it does nothing.
+/**
+ * resume - resume execution of a task
+ * @prev:	The task previously executed.
+ * @next:	The task to begin executing.
+ * @next_ti:	task_thread_info(next).
+ * @usedfpu:	Non-zero if prev's FP context should be saved.
+ *
+ * This function is used whilst scheduling to save the context of prev & load
+ * the context of next. Returns prev.
  */
-extern asmlinkage void *resume(void *last, void *next, void *next_ti, u32 __usedfpu);
+extern asmlinkage struct task_struct *resume(struct task_struct *prev,
+		struct task_struct *next, struct thread_info *next_ti,
+		u32 usedfpu);
 
 extern unsigned int ll_bit;
 extern struct task_struct *ll_task;
-- 
1.8.4.2
