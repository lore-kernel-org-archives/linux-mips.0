Received: from mailapp01.imgtec.com ([195.59.15.196]:19609 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010061AbbGJPC0bLU9p (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:02:26 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/16] MIPS: move FP usage checks into protected_{save,restore}_fp_context
Date: Fri, 10 Jul 2015 16:00:14 +0100
Message-ID: <1436540426-10021-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
References: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Andy Lutomirski <luto@amacapital.net>, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@codesourcery.com>
Message-ID: <20150710150014.CxL_PnB3nZ7lhkv4XuwBSrW2t5mAujSqI1IItvrgZTg@z>

In preparation for sharing protected_{save,restore}_fp_context with
compat ABIs, move the FP usage checks into said functions. This will
both enable that code to be shared, and allow for extensions of it in
further patches to also be shared.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/signal.c | 73 ++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 10f7dbc..76f9136 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -127,8 +127,15 @@ static int protected_save_fp_context(void __user *sc)
 	struct mips_abi *abi = current->thread.abi;
 	uint64_t __user *fpregs = sc + abi->off_sc_fpregs;
 	uint32_t __user *csr = sc + abi->off_sc_fpc_csr;
+	uint32_t __user *used_math = sc + abi->off_sc_used_math;
+	unsigned int used;
 	int err;
 
+	used = !!used_math();
+	err = __put_user(used, used_math);
+	if (err || !used)
+		return err;
+
 	/*
 	 * EVA does not have userland equivalents of ldc1 or sdc1, so
 	 * save to the kernel FP context & copy that to userland below.
@@ -163,7 +170,25 @@ static int protected_restore_fp_context(void __user *sc)
 	struct mips_abi *abi = current->thread.abi;
 	uint64_t __user *fpregs = sc + abi->off_sc_fpregs;
 	uint32_t __user *csr = sc + abi->off_sc_fpc_csr;
-	int err, tmp __maybe_unused;
+	uint32_t __user *used_math = sc + abi->off_sc_used_math;
+	unsigned int used;
+	int err, sig, tmp __maybe_unused;
+
+	err = __get_user(used, used_math);
+	conditional_used_math(used);
+
+	/*
+	 * The signal handler may have used FPU; give it up if the program
+	 * doesn't want it following sigreturn.
+	 */
+	if (err || !used)
+		lose_fpu(0);
+	if (err)
+		return err;
+
+	err = sig = fpcsr_pending(csr);
+	if (err < 0)
+		return err;
 
 	/*
 	 * EVA does not have userland equivalents of ldc1 or sdc1, so we
@@ -192,14 +217,13 @@ static int protected_restore_fp_context(void __user *sc)
 			break;	/* really bad sigcontext */
 	}
 
-	return err;
+	return err ?: sig;
 }
 
 int setup_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
 {
 	int err = 0;
 	int i;
-	unsigned int used_math;
 
 	err |= __put_user(regs->cp0_epc, &sc->sc_pc);
 
@@ -222,16 +246,13 @@ int setup_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
 		err |= __put_user(rddsp(DSP_MASK), &sc->sc_dsp);
 	}
 
-	used_math = !!used_math();
-	err |= __put_user(used_math, &sc->sc_used_math);
 
-	if (used_math) {
-		/*
-		 * Save FPU state to signal context. Signal handler
-		 * will "inherit" current FPU state.
-		 */
-		err |= protected_save_fp_context(sc);
-	}
+	/*
+	 * Save FPU state to signal context. Signal handler
+	 * will "inherit" current FPU state.
+	 */
+	err |= protected_save_fp_context(sc);
+
 	return err;
 }
 
@@ -254,22 +275,8 @@ int fpcsr_pending(unsigned int __user *fpcsr)
 	return err ?: sig;
 }
 
-static int
-check_and_restore_fp_context(void __user *sc)
-{
-	struct mips_abi *abi = current->thread.abi;
-	int err, sig;
-
-	err = sig = fpcsr_pending(sc + abi->off_sc_fpc_csr);
-	if (err > 0)
-		err = 0;
-	err |= protected_restore_fp_context(sc);
-	return err ?: sig;
-}
-
 int restore_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
 {
-	unsigned int used_math;
 	unsigned long treg;
 	int err = 0;
 	int i;
@@ -297,19 +304,7 @@ int restore_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
 	for (i = 1; i < 32; i++)
 		err |= __get_user(regs->regs[i], &sc->sc_regs[i]);
 
-	err |= __get_user(used_math, &sc->sc_used_math);
-	conditional_used_math(used_math);
-
-	if (used_math) {
-		/* restore fpu context if we have used it before */
-		if (!err)
-			err = check_and_restore_fp_context(sc);
-	} else {
-		/* signal handler may have used FPU.  Give it up. */
-		lose_fpu(0);
-	}
-
-	return err;
+	return err ?: protected_restore_fp_context(sc);
 }
 
 void __user *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
-- 
2.4.4
