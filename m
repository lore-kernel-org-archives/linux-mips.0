Received: from mailapp02.imgtec.com ([217.156.133.132]:38711 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992309AbcJLHdG600tX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Oct 2016 09:33:06 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: ptrace: fix regs_return_value for kernel context
Date: Wed, 12 Oct 2016 09:32:56 +0200
Message-ID: <1476257576-4748-1-git-send-email-marcin.nowakowski@imgtec.com>
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
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20161012073256.ffS11BHqGFoS-yfRxeGK05d4dIF1qDG6QckRX87rT8M@z>

Currently regs_return_value always negates reg[2] if it determines
the syscall has failed, but when called in kernel context this check is
invalid and may result in returning a wrong value.

This fixes errors reported by CONFIG_KPROBES_SANITY_TEST

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index f6fc6aa..b657861 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -152,7 +152,7 @@ static inline int is_syscall_success(struct pt_regs *regs)
 
 static inline long regs_return_value(struct pt_regs *regs)
 {
-	if (is_syscall_success(regs))
+	if (is_syscall_success(regs) || !user_mode(regs))
 		return regs->regs[2];
 	else
 		return -regs->regs[2];
-- 
2.7.4
