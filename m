Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:35695 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990520AbeD3O5ExOrcA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Apr 2018 16:57:04 +0200
Date: Mon, 30 Apr 2018 15:56:47 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH] MIPS: ptrace: expose FIR register through FP regset
Message-ID: <alpine.DEB.2.00.1804301510100.11756@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20180430145647.DVTikrVd434_LVSSwNlCi3r8ZyIVwd06uIWxMheXEHU@z>

Correct commit 7aeb753b5353 ("MIPS: Implement task_user_regset_view.") 
and expose the FIR register using the unused 4 bytes at the end of the 
NT_PRFPREG regset.  Without that register included clients cannot use 
the PTRACE_GETREGSET request to retrieve the complete FPU register set
and have to resort to one of the older interfaces, either PTRACE_PEEKUSR 
or PTRACE_GETFPREGS, to retrieve the missing piece of data.  Also the 
register is irreversibly missing from core dumps.

This register is architecturally hardwired and read-only so the write
path does not matter.  Ignore data supplied on writes then.

Cc: stable@vger.kernel.org # v3.13+
Fixes: 7aeb753b5353 ("MIPS: Implement task_user_regset_view.")
Signed-off-by: James Hogan <james.hogan@mips.com>
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
 arch/mips/kernel/ptrace.c |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

linux-mips-nt-prfpreg-fir.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-12-08 16:22:17.000000000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-12-08 16:22:59.299112000 +0000
@@ -454,7 +454,7 @@ static int fpr_get_msa(struct task_struc
 /*
  * Copy the floating-point context to the supplied NT_PRFPREG buffer.
  * Choose the appropriate helper for general registers, and then copy
- * the FCSR register separately.
+ * the FCSR and FIR registers separately.
  */
 static int fpr_get(struct task_struct *target,
 		   const struct user_regset *regset,
@@ -462,6 +462,7 @@ static int fpr_get(struct task_struct *t
 		   void *kbuf, void __user *ubuf)
 {
 	const int fcr31_pos = NUM_FPU_REGS * sizeof(elf_fpreg_t);
+	const int fir_pos = fcr31_pos + sizeof(u32);
 	int err;
 
 	if (sizeof(target->thread.fpu.fpr[0]) == sizeof(elf_fpreg_t))
@@ -474,6 +475,12 @@ static int fpr_get(struct task_struct *t
 	err = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
 				  &target->thread.fpu.fcr31,
 				  fcr31_pos, fcr31_pos + sizeof(u32));
+	if (err)
+		return err;
+
+	err = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &boot_cpu_data.fpu_id,
+				  fir_pos, fir_pos + sizeof(u32));
 
 	return err;
 }
@@ -522,7 +529,8 @@ static int fpr_set_msa(struct task_struc
 /*
  * Copy the supplied NT_PRFPREG buffer to the floating-point context.
  * Choose the appropriate helper for general registers, and then copy
- * the FCSR register separately.
+ * the FCSR register separately.  Ignore the incoming FIR register
+ * contents though, as the register is read-only.
  *
  * We optimize for the case where `count % sizeof(elf_fpreg_t) == 0',
  * which is supposed to have been guaranteed by the kernel before
@@ -536,6 +544,7 @@ static int fpr_set(struct task_struct *t
 		   const void *kbuf, const void __user *ubuf)
 {
 	const int fcr31_pos = NUM_FPU_REGS * sizeof(elf_fpreg_t);
+	const int fir_pos = fcr31_pos + sizeof(u32);
 	u32 fcr31;
 	int err;
 
@@ -563,6 +572,11 @@ static int fpr_set(struct task_struct *t
 		ptrace_setfcr31(target, fcr31);
 	}
 
+	if (count > 0)
+		err = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+						fir_pos,
+						fir_pos + sizeof(u32));
+
 	return err;
 }
 
