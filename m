Received: from mailapp01.imgtec.com ([195.59.15.196]:36517 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011303AbbG0T72sksyX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 21:59:28 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 02/16] MIPS: simplify EVA FP context handling code
Date: Mon, 27 Jul 2015 12:58:13 -0700
Message-ID: <1438027107-24420-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
References: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Andy Lutomirski <luto@amacapital.net>, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@codesourcery.com>
Message-ID: <20150727195813.h3uyIHsLZVB3RLN-saqf6MfcBsOUCnb0meuComd1eZk@z>

The protected_{save,restore}_fp_context functions had effectively
different implementations for EVA. Simplify & unify the code somewhat
such that EVA configurations simply guarantee the FPU-not-owned path
through the standard code path.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
---

Changes in v2: None

 arch/mips/kernel/signal.c | 44 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 6a28c79..796c7d8 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -101,7 +101,14 @@ static int copy_fp_from_sigcontext(struct sigcontext __user *sc)
 static int protected_save_fp_context(struct sigcontext __user *sc)
 {
 	int err;
-#ifndef CONFIG_EVA
+
+	/*
+	 * EVA does not have userland equivalents of ldc1 or sdc1, so
+	 * save to the kernel FP context & copy that to userland below.
+	 */
+	if (config_enabled(CONFIG_EVA))
+		lose_fpu(1);
+
 	while (1) {
 		lock_fpu_owner();
 		if (is_fpu_owner()) {
@@ -120,21 +127,22 @@ static int protected_save_fp_context(struct sigcontext __user *sc)
 		if (err)
 			break;	/* really bad sigcontext */
 	}
-#else
-	/*
-	 * EVA does not have FPU EVA instructions so saving fpu context directly
-	 * does not work.
-	 */
-	lose_fpu(1);
-	err = save_fp_context(sc); /* this might fail */
-#endif
+
 	return err;
 }
 
 static int protected_restore_fp_context(struct sigcontext __user *sc)
 {
 	int err, tmp __maybe_unused;
-#ifndef CONFIG_EVA
+
+	/*
+	 * EVA does not have userland equivalents of ldc1 or sdc1, so we
+	 * disable the FPU here such that the code below simply copies to
+	 * the kernel FP context.
+	 */
+	if (config_enabled(CONFIG_EVA))
+		lose_fpu(0);
+
 	while (1) {
 		lock_fpu_owner();
 		if (is_fpu_owner()) {
@@ -153,14 +161,7 @@ static int protected_restore_fp_context(struct sigcontext __user *sc)
 		if (err)
 			break;	/* really bad sigcontext */
 	}
-#else
-	/*
-	 * EVA does not have FPU EVA instructions so restoring fpu context
-	 * directly does not work.
-	 */
-	lose_fpu(0);
-	err = restore_fp_context(sc); /* this might fail */
-#endif
+
 	return err;
 }
 
@@ -629,7 +630,6 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
 }
 
 #ifdef CONFIG_SMP
-#ifndef CONFIG_EVA
 static int smp_save_fp_context(struct sigcontext __user *sc)
 {
 	return raw_cpu_has_fpu
@@ -643,12 +643,10 @@ static int smp_restore_fp_context(struct sigcontext __user *sc)
 	       ? _restore_fp_context(sc)
 	       : copy_fp_from_sigcontext(sc);
 }
-#endif /* CONFIG_EVA */
 #endif
 
 static int signal_setup(void)
 {
-#ifndef CONFIG_EVA
 #ifdef CONFIG_SMP
 	/* For now just do the cpu_has_fpu check when the functions are invoked */
 	save_fp_context = smp_save_fp_context;
@@ -662,10 +660,6 @@ static int signal_setup(void)
 		restore_fp_context = copy_fp_from_sigcontext;
 	}
 #endif /* CONFIG_SMP */
-#else
-	save_fp_context = copy_fp_to_sigcontext;
-	restore_fp_context = copy_fp_from_sigcontext;
-#endif
 
 	return 0;
 }
-- 
2.4.6
