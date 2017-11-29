Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:40803 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990513AbdK2PXSUNuro (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Nov 2017 16:23:18 +0100
Date: Wed, 29 Nov 2017 15:21:14 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH 4/5] MIPS: Execute any partial write of the last register
 with PTRACE_SETREGSET
In-Reply-To: <alpine.DEB.2.00.1711290152040.31156@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1711291226320.31156@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1711290152040.31156@tp.orcam.me.uk>
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
Message-ID: <20171129152114.i31bl7blpupB6lgl_y58Pz0E37n5zXnPO_FsRw7r9r4@z>

Fix a commit d614fd58a283 ("mips/ptrace: Preserve previous registers for 
short regset write") bug and allow the last register requested with a 
ptrace(2) PTRACE_SETREGSET call to be partially written if supplied this 
way by the caller, like with other register sets.

Cc: stable@vger.kernel.org # v4.11+
Fixes: d614fd58a283 ("mips/ptrace: Preserve previous registers for short regset write")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
 arch/mips/kernel/ptrace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-nt-prfpreg-count.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-11-21 22:12:00.000000000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-11-21 22:13:13.471970000 +0000
@@ -484,7 +484,7 @@ static int fpr_set_msa(struct task_struc
 	int err;
 
 	BUILD_BUG_ON(sizeof(fpr_val) != sizeof(elf_fpreg_t));
-	for (i = 0; i < NUM_FPU_REGS && *count >= sizeof(elf_fpreg_t); i++) {
+	for (i = 0; i < NUM_FPU_REGS && *count > 0; i++) {
 		err = user_regset_copyin(pos, count, kbuf, ubuf,
 					 &fpr_val, i * sizeof(elf_fpreg_t),
 					 (i + 1) * sizeof(elf_fpreg_t));
