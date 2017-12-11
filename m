Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:37495 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990793AbdLKWyz0Dxft (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Dec 2017 23:54:55 +0100
Date: Mon, 11 Dec 2017 22:54:33 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH v2 4/6] MIPS: Fix an FCSR access API regression with NT_PRFPREG
 and MSA
In-Reply-To: <alpine.DEB.2.00.1712111833360.4584@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1712111838310.4584@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1712111833360.4584@tp.orcam.me.uk>
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
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>
Cc: Paul Burton <Paul.Burton@mips.com>, Alex Smith <alex@alex-smith.me.uk>, Dave Martin <Dave.Martin@arm.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20171211225433.ExXvuw4jC_SYY2-WW_gkMVemWKo2dB4PsUQJZ-eVLYY@z>

Fix a commit 72b22bbad1e7 ("MIPS: Don't assume 64-bit FP registers for 
FP regset") public API regression, then activated by commit 1db1af84d6df 
("MIPS: Basic MSA context switching support"), that caused the FCSR 
register not to be read or written for CONFIG_CPU_HAS_MSA kernel 
configurations (regardless of actual presence or absence of the MSA 
feature in a given processor) with ptrace(2) PTRACE_GETREGSET and 
PTRACE_SETREGSET requests nor recorded in core dumps.

This is because with !CONFIG_CPU_HAS_MSA configurations the whole of 
`elf_fpregset_t' array is bulk-copied as it is, which includes the FCSR 
in one half of the last, 33rd slot, whereas with CONFIG_CPU_HAS_MSA 
configurations array elements are copied individually, and then only the 
leading 32 FGR slots while the remaining slot is ignored.

Correct the code then such that only FGR slots are copied in the 
respective !MSA and MSA helpers an then the FCSR slot is handled 
separately in common code.  Use `ptrace_setfcr31' to update the FCSR 
too, so that the read-only mask is respected.

Retrieving a correct value of FCSR is important in debugging not only 
for the human to be able to get the right interpretation of the 
situation, but for correct operation of GDB as well.  This is because 
the condition code bits in FSCR are used by GDB to determine the 
location to place a breakpoint at when single-stepping through an FPU 
branch instruction.  If such a breakpoint is placed incorrectly (i.e. 
with the condition reversed), then it will be missed, likely causing the 
debuggee to run away from the control of GDB and consequently breaking 
the process of investigation.

Fortunately GDB continues using the older PTRACE_GETFPREGS ptrace(2) 
request which is unaffected, so the regression only really hits with 
post-mortem debug sessions using a core dump file, in which case 
execution, and consequently single-stepping through branches is not 
possible.  Of course core files created by buggy kernels out there will 
have the value of FCSR recorded clobbered, but such core files cannot be 
corrected and the person using them simply will have to be aware that 
the value of FCSR retrieved is not reliable.

Which also means we can likely get away without defining a replacement 
API which would ensure a correct value of FSCR to be retrieved, or none 
at all.

This is based on previous work by Alex Smith, extensively rewritten.

Cc: stable@vger.kernel.org # v3.15+
Fixes: 72b22bbad1e7 ("MIPS: Don't assume 64-bit FP registers for FP regset")
Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
Signed-off-by: James Hogan <james.hogan@mips.com>
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---

 I think the fix to use `ptrace_setfcr31' could be a separate change, but 
given how its absence has been entangled with the inconsistency between
!MSA and MSA I cannot imagine how to do it in a sane manner:

1. If done first, then it would have to be applied to the !MSA case only,
   only to be moved to shared code in the next step.

2. If done second, then new incorrect shared code would have to be written
   only to be fixed in the next step.

So I think it has to go along with the main fix.  Though maybe choosing #2 
would make backporting easier, as `ptrace_setfcr31' is v4.1+ only and:

		target->thread.fpu.fcr31 = fcr31;

has to be used before that (previously the read-only mask wasn't defined
and you could write arbitrary rubbish to FCSR, especially in the emulated
case).

---

Changes from v1:

- regenerated.

---
 arch/mips/kernel/ptrace.c |   47 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

linux-mips-nt-prfpreg-fcsr.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-12-08 16:21:28.000000000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-12-08 16:22:04.167706000 +0000
@@ -413,7 +413,7 @@ static int gpr64_set(struct task_struct 
 /*
  * Copy the floating-point context to the supplied NT_PRFPREG buffer,
  * !CONFIG_CPU_HAS_MSA variant.  FP context's general register slots
- * correspond 1:1 to buffer slots.
+ * correspond 1:1 to buffer slots.  Only general registers are copied.
  */
 static int fpr_get_fpa(struct task_struct *target,
 		       unsigned int *pos, unsigned int *count,
@@ -421,13 +421,14 @@ static int fpr_get_fpa(struct task_struc
 {
 	return user_regset_copyout(pos, count, kbuf, ubuf,
 				   &target->thread.fpu,
-				   0, sizeof(elf_fpregset_t));
+				   0, NUM_FPU_REGS * sizeof(elf_fpreg_t));
 }
 
 /*
  * Copy the floating-point context to the supplied NT_PRFPREG buffer,
  * CONFIG_CPU_HAS_MSA variant.  Only lower 64 bits of FP context's
- * general register slots are copied to buffer slots.
+ * general register slots are copied to buffer slots.  Only general
+ * registers are copied.
  */
 static int fpr_get_msa(struct task_struct *target,
 		       unsigned int *pos, unsigned int *count,
@@ -449,20 +450,29 @@ static int fpr_get_msa(struct task_struc
 	return 0;
 }
 
-/* Copy the floating-point context to the supplied NT_PRFPREG buffer.  */
+/*
+ * Copy the floating-point context to the supplied NT_PRFPREG buffer.
+ * Choose the appropriate helper for general registers, and then copy
+ * the FCSR register separately.
+ */
 static int fpr_get(struct task_struct *target,
 		   const struct user_regset *regset,
 		   unsigned int pos, unsigned int count,
 		   void *kbuf, void __user *ubuf)
 {
+	const int fcr31_pos = NUM_FPU_REGS * sizeof(elf_fpreg_t);
 	int err;
 
-	/* XXX fcr31  */
-
 	if (sizeof(target->thread.fpu.fpr[0]) == sizeof(elf_fpreg_t))
 		err = fpr_get_fpa(target, &pos, &count, &kbuf, &ubuf);
 	else
 		err = fpr_get_msa(target, &pos, &count, &kbuf, &ubuf);
+	if (err)
+		return err;
+
+	err = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.fpu.fcr31,
+				  fcr31_pos, fcr31_pos + sizeof(u32));
 
 	return err;
 }
@@ -470,7 +480,7 @@ static int fpr_get(struct task_struct *t
 /*
  * Copy the supplied NT_PRFPREG buffer to the floating-point context,
  * !CONFIG_CPU_HAS_MSA variant.   Buffer slots correspond 1:1 to FP
- * context's general register slots.
+ * context's general register slots.  Only general registers are copied.
  */
 static int fpr_set_fpa(struct task_struct *target,
 		       unsigned int *pos, unsigned int *count,
@@ -478,13 +488,14 @@ static int fpr_set_fpa(struct task_struc
 {
 	return user_regset_copyin(pos, count, kbuf, ubuf,
 				  &target->thread.fpu,
-				  0, sizeof(elf_fpregset_t));
+				  0, NUM_FPU_REGS * sizeof(elf_fpreg_t));
 }
 
 /*
  * Copy the supplied NT_PRFPREG buffer to the floating-point context,
  * CONFIG_CPU_HAS_MSA variant.  Buffer slots are copied to lower 64
- * bits only of FP context's general register slots.
+ * bits only of FP context's general register slots.  Only general
+ * registers are copied.
  */
 static int fpr_set_msa(struct task_struct *target,
 		       unsigned int *pos, unsigned int *count,
@@ -509,6 +520,8 @@ static int fpr_set_msa(struct task_struc
 
 /*
  * Copy the supplied NT_PRFPREG buffer to the floating-point context.
+ * Choose the appropriate helper for general registers, and then copy
+ * the FCSR register separately.
  *
  * We optimize for the case where `count % sizeof(elf_fpreg_t) == 0',
  * which is supposed to have been guaranteed by the kernel before
@@ -521,18 +534,30 @@ static int fpr_set(struct task_struct *t
 		   unsigned int pos, unsigned int count,
 		   const void *kbuf, const void __user *ubuf)
 {
+	const int fcr31_pos = NUM_FPU_REGS * sizeof(elf_fpreg_t);
+	u32 fcr31;
 	int err;
 
 	BUG_ON(count % sizeof(elf_fpreg_t));
 
-	/* XXX fcr31  */
-
 	init_fp_ctx(target);
 
 	if (sizeof(target->thread.fpu.fpr[0]) == sizeof(elf_fpreg_t))
 		err = fpr_set_fpa(target, &pos, &count, &kbuf, &ubuf);
 	else
 		err = fpr_set_msa(target, &pos, &count, &kbuf, &ubuf);
+	if (err)
+		return err;
+
+	if (count > 0) {
+		err = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &fcr31,
+					 fcr31_pos, fcr31_pos + sizeof(u32));
+		if (err)
+			return err;
+
+		ptrace_setfcr31(target, fcr31);
+	}
 
 	return err;
 }
