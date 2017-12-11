Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:37155 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990793AbdLKWxiDK-ft (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Dec 2017 23:53:38 +0100
Date: Mon, 11 Dec 2017 22:53:14 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH v2 3/6] MIPS: Consistently handle buffer counter with
 PTRACE_SETREGSET
In-Reply-To: <alpine.DEB.2.00.1712111833360.4584@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1712111837550.4584@tp.orcam.me.uk>
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
Message-ID: <20171211225314.abYABNku-woLHInfUWbyoOUvBXGLp3iYUQ2WWiCS_WE@z>

Update commit d614fd58a283 ("mips/ptrace: Preserve previous registers 
for short regset write") bug and consistently consume all data supplied 
to `fpr_set_msa' with the ptrace(2) PTRACE_SETREGSET request, such that 
a zero data buffer counter is returned where insufficient data has been 
given to fill a whole number of FP general registers.

In reality this is not going to happen, as the caller is supposed to 
only supply data covering a whole number of registers and it is verified 
in `ptrace_regset' and again asserted in `fpr_set', however structuring 
code such that the presence of trailing partial FP general register data 
causes `fpr_set_msa' to return with a non-zero data buffer counter makes 
it appear that this trailing data will be used if there are subsequent 
writes made to FP registers, which is going to be the case with the FCSR 
once the missing write to that register has been fixed.

Cc: stable@vger.kernel.org # v4.11+
Fixes: d614fd58a283 ("mips/ptrace: Preserve previous registers for short regset write")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---

Changes from v1:

- reordered in the series,

- heading and description updated to better reflect reality.

---
 arch/mips/kernel/ptrace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-nt-prfpreg-count.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-12-08 15:43:29.956644000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-12-08 15:44:14.013974000 +0000
@@ -495,7 +495,7 @@ static int fpr_set_msa(struct task_struc
 	int err;
 
 	BUILD_BUG_ON(sizeof(fpr_val) != sizeof(elf_fpreg_t));
-	for (i = 0; i < NUM_FPU_REGS && *count >= sizeof(elf_fpreg_t); i++) {
+	for (i = 0; i < NUM_FPU_REGS && *count > 0; i++) {
 		err = user_regset_copyin(pos, count, kbuf, ubuf,
 					 &fpr_val, i * sizeof(elf_fpreg_t),
 					 (i + 1) * sizeof(elf_fpreg_t));
