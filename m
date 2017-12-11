Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:54076 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990793AbdLKW4Aig7Ft (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Dec 2017 23:56:00 +0100
Date: Mon, 11 Dec 2017 22:55:40 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH v2 5/6] MIPS: Also verify sizeof `elf_fpreg_t' with
 PTRACE_SETREGSET
In-Reply-To: <alpine.DEB.2.00.1712111833360.4584@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1712111839220.4584@tp.orcam.me.uk>
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
Message-ID: <20171211225540.WrjO_zSNm855AgOnWNp5MWtOieASgiNy6N5AexR88Ow@z>

Complement commit d614fd58a283 ("mips/ptrace: Preserve previous 
registers for short regset write") and like with the PTRACE_GETREGSET 
ptrace(2) request also apply a BUILD_BUG_ON check for the size of the 
`elf_fpreg_t' type in the PTRACE_SETREGSET request handler.

Cc: stable@vger.kernel.org # v4.11+
Fixes: d614fd58a283 ("mips/ptrace: Preserve previous registers for short regset write")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---

No changes from v1.

---
 arch/mips/kernel/ptrace.c |    1 +
 1 file changed, 1 insertion(+)

linux-mips-nt-prfpreg-build-bug.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-11-28 23:33:33.395023000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-11-28 23:52:34.944549000 +0000
@@ -438,6 +438,7 @@ static int fpr_get_msa(struct task_struc
 	u64 fpr_val;
 	int err;
 
+	BUILD_BUG_ON(sizeof(fpr_val) != sizeof(elf_fpreg_t));
 	for (i = 0; i < NUM_FPU_REGS; i++) {
 		fpr_val = get_fpr64(&target->thread.fpu.fpr[i], 0);
 		err = user_regset_copyout(pos, count, kbuf, ubuf,
