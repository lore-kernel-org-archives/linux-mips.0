Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:48553 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992891AbeEOWfnbCqcS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 May 2018 00:35:43 +0200
Date: Tue, 15 May 2018 23:34:28 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH 3/3] MIPS: Add DSP ASE regset support
In-Reply-To: <alpine.DEB.2.00.1804301557320.11756@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1805102034040.10896@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1804301557320.11756@tp.orcam.me.uk>
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
To: Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-fsdevel@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180515223428.u6-PCVJ0C3tRgunv8q6oSP6q4RuIOTZZ7NnUSdzxEpc@z>

Define an NT_MIPS_DSP core file note type and implement a corresponding 
regset holding the DSP ASE register context, following the layout of the 
`mips_dsp_state' structure, except for the DSPControl register stored as 
a 64-bit rather than 32-bit quantity in a 64-bit note.

The lack of DSP ASE register saving to core files can be considered a 
design flaw with commit e50c0a8fa60d ("Support the MIPS32 / MIPS64 DSP 
ASE."), leading to an incomplete state being saved.  Consequently no DSP 
ASE regset has been created with commit 7aeb753b5353 ("MIPS: Implement 
task_user_regset_view."), when regset support was added to the MIPS 
port.

Additionally there is no way for ptrace(2) to correctly access the DSP 
accumulator registers in n32 processes with the existing interfaces.  
This is due to 32-bit truncation of data passed with PTRACE_PEEKUSR and 
PTRACE_POKEUSR requests, which cannot be avoided owing to how the data 
types for ptrace(3) have been defined.  This new NT_MIPS_DSP regset 
fills the missing interface gap.

Cc: <stable@vger.kernel.org> # 3.13+
Fixes: 7aeb753b5353 ("MIPS: Implement task_user_regset_view.")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
Hi,

 This was verified with 32-bit DSP and non-DSP hardware configurations by 
dumping cores and examining, with `readelf', the notes created.  In the 
former case DSP registers were filled with patterns by the program being 
crashed and the patterns verified in the core file produced.  I have no 
64-bit DSP hardware handy, but the same code has been used, except for the 
data type holding register data, for both 32-bit and 64-bit notes, so it 
should be obviously correct.

 As noted in the commit description I consider it a design flaw and 
therefore I think it makes sense to backport this change and propose doing 
so.

  Maciej 
---
 arch/mips/kernel/ptrace.c |  189 ++++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h  |    1 
 2 files changed, 190 insertions(+)

linux-mips-regset-dsp.diff
Index: linux-jhogan-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-jhogan-test.orig/arch/mips/kernel/ptrace.c	2018-05-09 23:26:36.787614000 +0100
+++ linux-jhogan-test/arch/mips/kernel/ptrace.c	2018-05-09 23:53:18.864657000 +0100
@@ -41,6 +41,7 @@
 #include <asm/mipsmtregs.h>
 #include <asm/pgtable.h>
 #include <asm/page.h>
+#include <asm/processor.h>
 #include <asm/syscall.h>
 #include <linux/uaccess.h>
 #include <asm/bootinfo.h>
@@ -589,9 +590,179 @@ static int fpr_set(struct task_struct *t
 	return err;
 }
 
+#if defined(CONFIG_32BIT) || defined(CONFIG_MIPS32_O32)
+
+/*
+ * Copy the DSP context to the supplied 32-bit NT_MIPS_DSP buffer.
+ */
+static int dsp32_get(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     void *kbuf, void __user *ubuf)
+{
+	unsigned int start, num_regs, i;
+	u32 dspregs[NUM_DSP_REGS + 1];
+
+	BUG_ON(count % sizeof(u32));
+
+	if (!cpu_has_dsp)
+		return -EIO;
+
+	start = pos / sizeof(u32);
+	num_regs = count / sizeof(u32);
+
+	if (start + num_regs > NUM_DSP_REGS + 1)
+		return -EIO;
+
+	for (i = start; i < num_regs; i++)
+		switch (i) {
+		case 0 ... NUM_DSP_REGS - 1:
+			dspregs[i] = target->thread.dsp.dspr[i];
+			break;
+		case NUM_DSP_REGS:
+			dspregs[i] = target->thread.dsp.dspcontrol;
+			break;
+		}
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, dspregs, 0,
+				   sizeof(dspregs));
+}
+
+/*
+ * Copy the supplied 32-bit NT_MIPS_DSP buffer to the DSP context.
+ */
+static int dsp32_set(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf)
+{
+	unsigned int start, num_regs, i;
+	u32 dspregs[NUM_DSP_REGS + 1];
+	int err;
+
+	BUG_ON(count % sizeof(u32));
+
+	if (!cpu_has_dsp)
+		return -EIO;
+
+	start = pos / sizeof(u32);
+	num_regs = count / sizeof(u32);
+
+	if (start + num_regs > NUM_DSP_REGS + 1)
+		return -EIO;
+
+	err = user_regset_copyin(&pos, &count, &kbuf, &ubuf, dspregs, 0,
+				 sizeof(dspregs));
+	if (err)
+		return err;
+
+	for (i = start; i < num_regs; i++)
+		switch (i) {
+		case 0 ... NUM_DSP_REGS - 1:
+			target->thread.dsp.dspr[i] = (s32)dspregs[i];
+			break;
+		case NUM_DSP_REGS:
+			target->thread.dsp.dspcontrol = (s32)dspregs[i];
+			break;
+		}
+
+	return 0;
+}
+
+#endif /* CONFIG_32BIT || CONFIG_MIPS32_O32 */
+
+#ifdef CONFIG_64BIT
+
+/*
+ * Copy the DSP context to the supplied 64-bit NT_MIPS_DSP buffer.
+ */
+static int dsp64_get(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     void *kbuf, void __user *ubuf)
+{
+	unsigned int start, num_regs, i;
+	u64 dspregs[NUM_DSP_REGS + 1];
+
+	BUG_ON(count % sizeof(u64));
+
+	if (!cpu_has_dsp)
+		return -EIO;
+
+	start = pos / sizeof(u64);
+	num_regs = count / sizeof(u64);
+
+	if (start + num_regs > NUM_DSP_REGS + 1)
+		return -EIO;
+
+	for (i = start; i < num_regs; i++)
+		switch (i) {
+		case 0 ... NUM_DSP_REGS - 1:
+			dspregs[i] = target->thread.dsp.dspr[i];
+			break;
+		case NUM_DSP_REGS:
+			dspregs[i] = target->thread.dsp.dspcontrol;
+			break;
+		}
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, dspregs, 0,
+				   sizeof(dspregs));
+}
+
+/*
+ * Copy the supplied 64-bit NT_MIPS_DSP buffer to the DSP context.
+ */
+static int dsp64_set(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf)
+{
+	unsigned int start, num_regs, i;
+	u64 dspregs[NUM_DSP_REGS + 1];
+	int err;
+
+	BUG_ON(count % sizeof(u64));
+
+	if (!cpu_has_dsp)
+		return -EIO;
+
+	start = pos / sizeof(u64);
+	num_regs = count / sizeof(u64);
+
+	if (start + num_regs > NUM_DSP_REGS + 1)
+		return -EIO;
+
+	err = user_regset_copyin(&pos, &count, &kbuf, &ubuf, dspregs, 0,
+				 sizeof(dspregs));
+	if (err)
+		return err;
+
+	for (i = start; i < num_regs; i++)
+		switch (i) {
+		case 0 ... NUM_DSP_REGS - 1:
+			target->thread.dsp.dspr[i] = dspregs[i];
+			break;
+		case NUM_DSP_REGS:
+			target->thread.dsp.dspcontrol = dspregs[i];
+			break;
+		}
+
+	return 0;
+}
+
+#endif /* CONFIG_64BIT */
+
+/*
+ * Determine whether the DSP context is present.
+ */
+static int dsp_active(struct task_struct *target,
+		      const struct user_regset *regset)
+{
+	return cpu_has_dsp ? NUM_DSP_REGS + 1 : -ENODEV;
+}
+
 enum mips_regset {
 	REGSET_GPR,
 	REGSET_FPR,
+	REGSET_DSP,
 };
 
 struct pt_regs_offset {
@@ -697,6 +868,15 @@ static const struct user_regset mips_reg
 		.get		= fpr_get,
 		.set		= fpr_set,
 	},
+	[REGSET_DSP] = {
+		.core_note_type	= NT_MIPS_DSP,
+		.n		= NUM_DSP_REGS + 1,
+		.size		= sizeof(u32),
+		.align		= sizeof(u32),
+		.get		= dsp32_get,
+		.set		= dsp32_set,
+		.active		= dsp_active,
+	},
 };
 
 static const struct user_regset_view user_mips_view = {
@@ -728,6 +908,15 @@ static const struct user_regset mips64_r
 		.get		= fpr_get,
 		.set		= fpr_set,
 	},
+	[REGSET_DSP] = {
+		.core_note_type	= NT_MIPS_DSP,
+		.n		= NUM_DSP_REGS + 1,
+		.size		= sizeof(u64),
+		.align		= sizeof(u64),
+		.get		= dsp64_get,
+		.set		= dsp64_set,
+		.active		= dsp_active,
+	},
 };
 
 static const struct user_regset_view user_mips64_view = {
Index: linux-jhogan-test/include/uapi/linux/elf.h
===================================================================
--- linux-jhogan-test.orig/include/uapi/linux/elf.h	2018-05-09 23:22:44.799797000 +0100
+++ linux-jhogan-test/include/uapi/linux/elf.h	2018-05-09 23:51:32.646880000 +0100
@@ -424,6 +424,7 @@ typedef struct elf64_shdr {
 #define NT_METAG_RPIPE	0x501		/* Metag read pipeline state */
 #define NT_METAG_TLS	0x502		/* Metag TLS pointer */
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
+#define NT_MIPS_DSP	0x700		/* MIPS DSP ASE registers */
 
 /* Note header in a PT_NOTE section */
 typedef struct elf32_note {
