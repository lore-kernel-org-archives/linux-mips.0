Received: from mail-we0-f170.google.com ([74.125.82.170]:40561 "EHLO
        mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6842513AbaGWNnRfXuLm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 15:43:17 +0200
Received: by mail-we0-f170.google.com with SMTP id w62so1185917wes.29
        for <linux-mips@linux-mips.org>; Wed, 23 Jul 2014 06:43:10 -0700 (PDT)
From: Alex Smith <alex@alex-smith.me.uk>
Subject: [PATCH 05/11] MIPS: ptrace: Always copy FCSR in FP regset
Date: Wed, 23 Jul 2014 14:40:10 +0100
Message-ID: <1406122816-2424-6-git-send-email-alex@alex-smith.me.uk>
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
Cc: Alex Smith <alex@alex-smith.me.uk>, Paul Burton <paul.burton@imgtec.com>, stable@vger.kernel.org
Message-ID: <20140723134010.8LKNHp4y_Cpg2AqWkO76QHWmj7QNiezLSTsFzK3GwUM@z>

Copy FCSR in the FP regset to match the original pre-regset core dumper.
The code paths for where sizeof(union fpureg) == sizeof(elf_fpreg_t)
already do so, but they actually copy 4 bytes more than they should do
as FCSR is only 32 bits. The not equal code paths do not copy it at all.
Therefore change the copy to be done explicitly (with the correct size)
for both paths.

Additionally, clear the cause bits from FCSR when setting the FP regset
to avoid the possibility of causing an FP exception (and an oops) in the
kernel.

Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: <stable@vger.kernel.org> # v3.13+
---
This patch incorporates a fix for another instance of the bug fixed by
Paul Burton's patch "MIPS: prevent user from setting FCSR cause bits" -
the code path in fpr_set for sizeof(fpureg) == sizeof(elf_fpreg_t)
copied fcr31 without clearing cause bits. I've incorporated a fix for
it into this patch to so that it's easier to apply both patches without
conflicts.
---
 arch/mips/kernel/ptrace.c | 61 +++++++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 8bd13ed..ffc2e37 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -409,23 +409,28 @@ static int fpr_get(struct task_struct *target,
 	int err;
 	u64 fpr_val;
 
-	/* XXX fcr31  */
-
-	if (sizeof(target->thread.fpu.fpr[i]) == sizeof(elf_fpreg_t))
-		return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-					   &target->thread.fpu,
-					   0, sizeof(elf_fpregset_t));
-
-	for (i = 0; i < NUM_FPU_REGS; i++) {
-		fpr_val = get_fpr64(&target->thread.fpu.fpr[i], 0);
+	if (sizeof(target->thread.fpu.fpr[i]) == sizeof(elf_fpreg_t)) {
 		err = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-					  &fpr_val, i * sizeof(elf_fpreg_t),
-					  (i + 1) * sizeof(elf_fpreg_t));
+					  &target->thread.fpu.fpr,
+					  0, NUM_FPU_REGS * sizeof(elf_fpreg_t));
 		if (err)
 			return err;
+	} else {
+		for (i = 0; i < NUM_FPU_REGS; i++) {
+			fpr_val = get_fpr64(&target->thread.fpu.fpr[i], 0);
+			err = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+						  &fpr_val,
+						  i * sizeof(elf_fpreg_t),
+						  (i + 1) * sizeof(elf_fpreg_t));
+			if (err)
+				return err;
+		}
 	}
 
-	return 0;
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+			    &target->thread.fpu.fcr31,
+			    NUM_FPU_REGS * sizeof(elf_fpreg_t),
+			    (NUM_FPU_REGS * sizeof(elf_fpreg_t)) + sizeof(u32));
 }
 
 static int fpr_set(struct task_struct *target,
@@ -436,23 +441,33 @@ static int fpr_set(struct task_struct *target,
 	unsigned i;
 	int err;
 	u64 fpr_val;
+	u32 fcr31;
 
-	/* XXX fcr31  */
-
-	if (sizeof(target->thread.fpu.fpr[i]) == sizeof(elf_fpreg_t))
-		return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					  &target->thread.fpu,
-					  0, sizeof(elf_fpregset_t));
-
-	for (i = 0; i < NUM_FPU_REGS; i++) {
+	if (sizeof(target->thread.fpu.fpr[i]) == sizeof(elf_fpreg_t)) {
 		err = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					 &fpr_val, i * sizeof(elf_fpreg_t),
-					 (i + 1) * sizeof(elf_fpreg_t));
+					 &target->thread.fpu.fpr,
+					 0, NUM_FPU_REGS * sizeof(elf_fpreg_t));
 		if (err)
 			return err;
-		set_fpr64(&target->thread.fpu.fpr[i], 0, fpr_val);
+	} else {
+		for (i = 0; i < NUM_FPU_REGS; i++) {
+			err = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+						 &fpr_val,
+						 i * sizeof(elf_fpreg_t),
+						 (i + 1) * sizeof(elf_fpreg_t));
+			if (err)
+				return err;
+			set_fpr64(&target->thread.fpu.fpr[i], 0, fpr_val);
+		}
 	}
 
+	err = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fcr31,
+			    NUM_FPU_REGS * sizeof(elf_fpreg_t),
+			    (NUM_FPU_REGS * sizeof(elf_fpreg_t)) + sizeof(u32));
+	if (err)
+		return err;
+
+	target->thread.fpu.fcr31 = fcr31 & ~FPU_CSR_ALL_X;
 	return 0;
 }
 
-- 
1.9.1
