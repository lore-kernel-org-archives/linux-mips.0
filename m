Received: from mailapp01.imgtec.com ([195.59.15.196]:58921 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010124AbbGJPDav2Utp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:03:30 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 09/16] MIPS: indicate FP mode in sigcontext sc_used_math
Date: Fri, 10 Jul 2015 16:00:18 +0100
Message-ID: <1436540426-10021-10-git-send-email-paul.burton@imgtec.com>
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
Cc: Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, James Hogan <james.hogan@imgtec.com>, Andy Lutomirski <luto@amacapital.net>, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@codesourcery.com>
Message-ID: <20150710150018.4Cmld6IiuC-tUK89iNekOBRDABn9yDILpt8y2Nq4DK8@z>

The sc_used_math field of struct sigcontext & its variants has
traditionally been used as a boolean value indicating only whether or
not floating point context is saved within the sigcontext. With various
supported FP modes & the ability to switch between them this information
will no longer be enough to decode the meaning of the data stored in the
sc_fpregs fields of struct sigcontext.

To make that possible 3 bits are defined within sc_used_math:

  - Bit 0 (USED_FP) represents whether FP was used, essentially
    providing the boolean flag which sc_used_math as a whole provided
    previously.

  - Bit 1 (USED_FR1) provides the value of the Status.FR bit at the time
    the FP context was saved.

  - Bit 2 (USED_HYBRID_FPRS) indicates whether the FP context was saved
    under the hybrid FPR scheme. Essentially, when set the odd singles
    are located in bits 63:32 of the preceding even indexed sc_fpregs
    element.

Any userland that tests whether the sc_used_math field is zero or
non-zero will continue to function as expected. Having said that, I
could not find any userland which uses the sc_used_math field at all.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/uapi/asm/sigcontext.h |  9 +++++++++
 arch/mips/kernel/signal.c               | 15 +++++++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/uapi/asm/sigcontext.h b/arch/mips/include/uapi/asm/sigcontext.h
index ae78902..f28facd 100644
--- a/arch/mips/include/uapi/asm/sigcontext.h
+++ b/arch/mips/include/uapi/asm/sigcontext.h
@@ -12,6 +12,15 @@
 #include <linux/types.h>
 #include <asm/sgidefs.h>
 
+/* scalar FP context was used */
+#define USED_FP			(1 << 0)
+
+/* the value of Status.FR when context was saved */
+#define USED_FR1		(1 << 1)
+
+/* FR=1, but with odd singles in bits 63:32 of preceding even double */
+#define USED_HYBRID_FPRS	(1 << 2)
+
 #if _MIPS_SIM == _MIPS_SIM_ABI32
 
 struct sigcontext {
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 5b28f67..de0b451 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -133,9 +133,16 @@ int protected_save_fp_context(void __user *sc)
 	unsigned int used;
 	int err;
 
-	used = !!used_math();
+	used = used_math() ? USED_FP : 0;
+	if (used) {
+		if (!test_thread_flag(TIF_32BIT_FPREGS))
+			used |= USED_FR1;
+		if (test_thread_flag(TIF_HYBRID_FPREGS))
+			used |= USED_HYBRID_FPRS;
+	}
+
 	err = __put_user(used, used_math);
-	if (err || !used)
+	if (err || !(used & USED_FP))
 		return err;
 
 	/*
@@ -177,13 +184,13 @@ int protected_restore_fp_context(void __user *sc)
 	int err, sig, tmp __maybe_unused;
 
 	err = __get_user(used, used_math);
-	conditional_used_math(used);
+	conditional_used_math(used & USED_FP);
 
 	/*
 	 * The signal handler may have used FPU; give it up if the program
 	 * doesn't want it following sigreturn.
 	 */
-	if (err || !used)
+	if (err || !(used & USED_FP))
 		lose_fpu(0);
 	if (err)
 		return err;
-- 
2.4.4
