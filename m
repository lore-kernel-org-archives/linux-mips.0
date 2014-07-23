Received: from mail-we0-f172.google.com ([74.125.82.172]:61082 "EHLO
        mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6826470AbaGWNm4aHOpt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 15:42:56 +0200
Received: by mail-we0-f172.google.com with SMTP id x48so1224831wes.3
        for <linux-mips@linux-mips.org>; Wed, 23 Jul 2014 06:42:51 -0700 (PDT)
From: Alex Smith <alex@alex-smith.me.uk>
Subject: [PATCH 02/11] MIPS: ptrace: Test correct task's flags in task_user_regset_view()
Date: Wed, 23 Jul 2014 14:40:07 +0100
Message-ID: <1406122816-2424-3-git-send-email-alex@alex-smith.me.uk>
In-Reply-To: <1406122816-2424-1-git-send-email-alex@alex-smith.me.uk>
References: <1406122816-2424-1-git-send-email-alex@alex-smith.me.uk>
Return-Path: <alex@alex-smith.me.uk>
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
Cc: Alex Smith <alex@alex-smith.me.uk>, stable@vger.kernel.org
Message-ID: <20140723134007.W5HOwrXhKehJQS2ODV1u_lXPuY862JSRzBl1xOO1SBA@z>

task_user_regset_view() should test for TIF_32BIT_REGS in the flags of
the specified task, not of the current task.

Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
Cc: <stable@vger.kernel.org> # v3.13+
---
 arch/mips/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 6063b11..8f2130a 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -398,7 +398,7 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 #endif
 
 #ifdef CONFIG_MIPS32_O32
-		if (test_thread_flag(TIF_32BIT_REGS))
+		if (test_tsk_thread_flag(task, TIF_32BIT_REGS))
 			return &user_mips_view;
 #endif
 
-- 
1.9.1
