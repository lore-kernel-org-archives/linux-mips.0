Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:44982 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992841AbeEOWkqB5VrS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 May 2018 00:40:46 +0200
Date: Tue, 15 May 2018 23:40:18 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH] MIPS: Add FP_MODE regset support
Message-ID: <alpine.DEB.2.00.1805111326000.10896@tp.orcam.me.uk>
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
To: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <Paul.Burton@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180515224018.Xc6KaFVd77sROOvKInIlJsO5LpL47W5N1ET7ZObH_Uk@z>

Define an NT_MIPS_FP_MODE core file note and implement a corresponding 
regset holding the state handled by PR_SET_FP_MODE and PR_GET_FP_MODE 
prctl(2) requests.  This lets debug software correctly interpret the 
contents of floating-point general registers both in live debugging and 
in core files, and also switch floating-point modes of a live process.

Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
NB due to patch conflicts this change relies on the DSP ASE regset series 
<https://patchwork.kernel.org/patch/10402171/> to be applied first.
---
 arch/mips/kernel/ptrace.c |   63 ++++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h  |    1 
 2 files changed, 64 insertions(+)

linux-mips-nt-fp-mode.diff
Index: linux-jhogan-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-jhogan-test.orig/arch/mips/kernel/ptrace.c	2018-05-09 23:53:34.999776000 +0100
+++ linux-jhogan-test/arch/mips/kernel/ptrace.c	2018-05-09 23:54:22.778128000 +0100
@@ -759,10 +759,57 @@ static int dsp_active(struct task_struct
 	return cpu_has_dsp ? NUM_DSP_REGS + 1 : -ENODEV;
 }
 
+/* Copy the FP mode setting to the supplied NT_MIPS_FP_MODE buffer.  */
+static int fp_mode_get(struct task_struct *target,
+		       const struct user_regset *regset,
+		       unsigned int pos, unsigned int count,
+		       void *kbuf, void __user *ubuf)
+{
+	int fp_mode;
+
+	fp_mode = mips_get_process_fp_mode(target);
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, &fp_mode, 0,
+				   sizeof(fp_mode));
+}
+
+/*
+ * Copy the supplied NT_MIPS_FP_MODE buffer to the FP mode setting.
+ *
+ * We optimize for the case where `count % sizeof(int) == 0', which
+ * is supposed to have been guaranteed by the kernel before calling
+ * us, e.g. in `ptrace_regset'.  We enforce that requirement, so
+ * that we can safely avoid preinitializing temporaries for partial
+ * mode writes.
+ */
+static int fp_mode_set(struct task_struct *target,
+		       const struct user_regset *regset,
+		       unsigned int pos, unsigned int count,
+		       const void *kbuf, const void __user *ubuf)
+{
+	int fp_mode;
+	int err;
+
+	BUG_ON(count % sizeof(int));
+
+	if (pos + count > sizeof(fp_mode))
+		return -EIO;
+
+	err = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fp_mode, 0,
+				 sizeof(fp_mode));
+	if (err)
+		return err;
+
+	if (count > 0)
+		err = mips_set_process_fp_mode(target, fp_mode);
+
+	return err;
+}
+
 enum mips_regset {
 	REGSET_GPR,
 	REGSET_FPR,
 	REGSET_DSP,
+	REGSET_FP_MODE,
 };
 
 struct pt_regs_offset {
@@ -877,6 +924,14 @@ static const struct user_regset mips_reg
 		.set		= dsp32_set,
 		.active		= dsp_active,
 	},
+	[REGSET_FP_MODE] = {
+		.core_note_type	= NT_MIPS_FP_MODE,
+		.n		= 1,
+		.size		= sizeof(int),
+		.align		= sizeof(int),
+		.get		= fp_mode_get,
+		.set		= fp_mode_set,
+	},
 };
 
 static const struct user_regset_view user_mips_view = {
@@ -917,6 +972,14 @@ static const struct user_regset mips64_r
 		.set		= dsp64_set,
 		.active		= dsp_active,
 	},
+	[REGSET_FP_MODE] = {
+		.core_note_type	= NT_MIPS_FP_MODE,
+		.n		= 1,
+		.size		= sizeof(int),
+		.align		= sizeof(int),
+		.get		= fp_mode_get,
+		.set		= fp_mode_set,
+	},
 };
 
 static const struct user_regset_view user_mips64_view = {
Index: linux-jhogan-test/include/uapi/linux/elf.h
===================================================================
--- linux-jhogan-test.orig/include/uapi/linux/elf.h	2018-05-09 23:53:35.003775000 +0100
+++ linux-jhogan-test/include/uapi/linux/elf.h	2018-05-09 23:54:22.787132000 +0100
@@ -425,6 +425,7 @@ typedef struct elf64_shdr {
 #define NT_METAG_TLS	0x502		/* Metag TLS pointer */
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
 #define NT_MIPS_DSP	0x700		/* MIPS DSP ASE registers */
+#define NT_MIPS_FP_MODE	0x701		/* MIPS floating-point mode */
 
 /* Note header in a PT_NOTE section */
 typedef struct elf32_note {
