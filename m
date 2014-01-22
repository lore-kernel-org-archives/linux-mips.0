Received: from multi.imgtec.com ([194.200.65.239]:24638 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827391AbaAVOlnrw2aK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 22 Jan 2014 15:41:43 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/8] MIPS: asm: syscall: Add the syscall_rollback function
Date: Wed, 22 Jan 2014 14:39:58 +0000
Message-ID: <1390401604-11830-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
References: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140122143958.uH7bPxiiWW53KlY4lYmN9gFH78s3crGLPVE8qs9XOfs@z>

The syscall_rollback function is used by seccomp-bpf but it was never
added for MIPS. It doesn't need to do anything as none of the registers
are clobbered if the system call has been denied by the seccomp filter.

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/syscall.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index 10d98b9..e3e2f76 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -65,6 +65,12 @@ static inline long syscall_get_return_value(struct task_struct *task,
 	return regs->regs[2];
 }
 
+static inline void syscall_rollback(struct task_struct *task,
+				    struct pt_regs *regs)
+{
+	/* Do nothing */
+}
+
 static inline void syscall_set_return_value(struct task_struct *task,
 					    struct pt_regs *regs,
 					    int error, long val)
-- 
1.8.5.3
