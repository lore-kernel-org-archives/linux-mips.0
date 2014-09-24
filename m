Received: from mailapp01.imgtec.com ([195.59.15.196]:5518 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008965AbaIXJtWDnHI9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Sep 2014 11:49:22 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id B8DD5D1B5749A
        for <linux-mips@linux-mips.org>; Wed, 24 Sep 2014 10:49:12 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/11] MIPS: ensure FCSR cause bits are clear after invoking FPU emulator
Date: Wed, 24 Sep 2014 10:45:38 +0100
Message-ID: <1411551942-11153-8-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140924094538.1wUTZshhYZAgFP7v10nRid6Bxu5wqlxcuB4fEILwwPA@z>

When running the emulator to handle an instruction that raised an FP
unimplemented operation exception, the FCSR cause bits were being
cleared. This is done to ensure that the kernel does not take an FP
exception when later restoring FP context to registers. However, this
was not being done when the emulator is invoked in response to a
coprocessor unusable exception. This happens in 2 cases:

  - There is no FPU present in the system. In this case things were
    OK, since the FP context is never restored to hardware registers
    and thus no FP exception may be raised when restoring FCSR.

  - The FPU could not be configured to the mode required by the task.
    In this case it would be possible for the emulator to set cause
    bits which are later restored to hardware if the task migrates
    to a CPU whose associated FPU does support its mode requirements,
    or if the tasks FP mode requirements change.

Consistently clear the cause bits after invoking the emulator, by moving
the clearing to process_fpemu_return and ensuring this is always called
before the tasks FP context is restored. This will make it easier to
catch further paths invoking the emulator in future, as will be
introduced in further patches.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/traps.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 165c275..3ea7f7a 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -700,6 +700,13 @@ asmlinkage void do_ov(struct pt_regs *regs)
 
 int process_fpemu_return(int sig, void __user *fault_addr)
 {
+	/*
+	 * We can't allow the emulated instruction to leave any of the cause
+	 * bits set in FCSR. If they were then the kernel would take an FP
+	 * exception when restoring FP context.
+	 */
+	current->thread.fpu.fcr31 &= ~FPU_CSR_ALL_X;
+
 	if (sig == SIGSEGV || sig == SIGBUS) {
 		struct siginfo si = {0};
 		si.si_addr = fault_addr;
@@ -803,18 +810,12 @@ asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31)
 		sig = fpu_emulator_cop1Handler(regs, &current->thread.fpu, 1,
 					       &fault_addr);
 
-		/*
-		 * We can't allow the emulated instruction to leave any of
-		 * the cause bit set in $fcr31.
-		 */
-		current->thread.fpu.fcr31 &= ~FPU_CSR_ALL_X;
+		/* If something went wrong, signal */
+		process_fpemu_return(sig, fault_addr);
 
 		/* Restore the hardware register state */
 		own_fpu(1);	/* Using the FPU again.	 */
 
-		/* If something went wrong, signal */
-		process_fpemu_return(sig, fault_addr);
-
 		goto out;
 	} else if (fcr31 & FPU_CSR_INV_X)
 		info.si_code = FPE_FLTINV;
-- 
2.0.4
