Received: from multi.imgtec.com ([194.200.65.239]:4441 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823097AbaA0P1PYMtWC (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 16:27:15 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/15] mips: don't assume 64-bit FP registers for dump_{,task_}fpu
Date: Mon, 27 Jan 2014 15:23:06 +0000
Message-ID: <1390836194-26286-8-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
References: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140127152306.4hIFxN46TZ6GHyhFDUpHLUwvuY7nWc4aNpKSuxaHz8M@z>

This code assumed that saved FP registers are 64 bits wide, an
assumption which will no longer be true once MSA is introduced. This
patch modifies the code to copy the lower 64 bits of each register in
turn, which is safe for any FP register width >= 64 bits.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/process.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 6ae540e..2f01f3d 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -157,7 +157,13 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 /* Fill in the fpu structure for a core dump.. */
 int dump_fpu(struct pt_regs *regs, elf_fpregset_t *r)
 {
-	memcpy(r, &current->thread.fpu, sizeof(current->thread.fpu));
+	int i;
+
+	for (i = 0; i < NUM_FPU_REGS; i++)
+		memcpy(&r[i], &current->thread.fpu.fpr[i], sizeof(*r));
+
+	memcpy(&r[NUM_FPU_REGS], &current->thread.fpu.fcr31,
+	       sizeof(current->thread.fpu.fcr31));
 
 	return 1;
 }
@@ -192,7 +198,13 @@ int dump_task_regs(struct task_struct *tsk, elf_gregset_t *regs)
 
 int dump_task_fpu(struct task_struct *t, elf_fpregset_t *fpr)
 {
-	memcpy(fpr, &t->thread.fpu, sizeof(current->thread.fpu));
+	int i;
+
+	for (i = 0; i < NUM_FPU_REGS; i++)
+		memcpy(&fpr[i], &t->thread.fpu.fpr[i], sizeof(*fpr));
+
+	memcpy(&fpr[NUM_FPU_REGS], &t->thread.fpu.fcr31,
+	       sizeof(t->thread.fpu.fcr31));
 
 	return 1;
 }
-- 
1.8.5.3
