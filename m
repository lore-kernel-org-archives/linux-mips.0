Received: from mailapp01.imgtec.com ([195.59.15.196]:22130 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990510AbcHKHCt3gfMm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Aug 2016 09:02:49 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: uprobes: fix incorrect uprobe brk handling
Date: Thu, 11 Aug 2016 09:02:30 +0200
Message-ID: <1470898950-26077-1-git-send-email-marcin.nowakowski@imgtec.com>
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
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org

When a uprobe-replacement breakpoint instruction is handled, a notifier
is called with DIE_UPROBE argument, but a corresponding exception notify
handler for MIPS attempts to handle DIE_BREAK instead. As a result
the breakpoint instruction isn't handled by the uprobe code and the probed
application terminates with SIGTRAP.
Fix this by changing arch_uprobe_exception_notify code to handle
DIE_UPROBE as a pre-singlestep condition instead of DIE_BREAK.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 8452d93..1149b30 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -222,7 +222,7 @@ int arch_uprobe_exception_notify(struct notifier_block *self,
 		return NOTIFY_DONE;
 
 	switch (val) {
-	case DIE_BREAK:
+	case DIE_UPROBE:
 		if (uprobe_pre_sstep_notifier(regs))
 			return NOTIFY_STOP;
 		break;
-- 
2.7.4
