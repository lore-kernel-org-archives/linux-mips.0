Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:48572 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991258AbdLKWwgOFFSt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Dec 2017 23:52:36 +0100
Date: Mon, 11 Dec 2017 22:52:15 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH v2 2/6] MIPS: Guard against any partial write attempt with
 PTRACE_SETREGSET
In-Reply-To: <alpine.DEB.2.00.1712111833360.4584@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1712111837230.4584@tp.orcam.me.uk>
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
Message-ID: <20171211225215.3K8l92C-pWYhAimFX7K2dd8OiIWvfvLotsWZdN0yDKg@z>

Complement commit d614fd58a283 ("mips/ptrace: Preserve previous 
registers for short regset write") and ensure that no partial register 
write attempt is made with PTRACE_SETREGSET, as we do not preinitialize 
any temporaries used to hold incoming register data and consequently 
random data could be written.

It is the responsibility of the caller, such as `ptrace_regset', to 
arrange for writes to span whole registers only, so here we only assert 
that it has indeed happened.

Cc: stable@vger.kernel.org # v3.15+
Fixes: 72b22bbad1e7 ("MIPS: Don't assume 64-bit FP registers for FP regset")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---

New in v2.

---
 arch/mips/kernel/ptrace.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

linux-mips-nt-prfpreg-size-bug.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-12-08 16:21:09.783307000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-12-08 16:21:19.498382000 +0000
@@ -507,7 +507,15 @@ static int fpr_set_msa(struct task_struc
 	return 0;
 }
 
-/* Copy the supplied NT_PRFPREG buffer to the floating-point context.  */
+/*
+ * Copy the supplied NT_PRFPREG buffer to the floating-point context.
+ *
+ * We optimize for the case where `count % sizeof(elf_fpreg_t) == 0',
+ * which is supposed to have been guaranteed by the kernel before
+ * calling us, e.g. in `ptrace_regset'.  We enforce that requirement,
+ * so that we can safely avoid preinitializing temporaries for
+ * partial register writes.
+ */
 static int fpr_set(struct task_struct *target,
 		   const struct user_regset *regset,
 		   unsigned int pos, unsigned int count,
@@ -515,6 +523,8 @@ static int fpr_set(struct task_struct *t
 {
 	int err;
 
+	BUG_ON(count % sizeof(elf_fpreg_t));
+
 	/* XXX fcr31  */
 
 	init_fp_ctx(target);
