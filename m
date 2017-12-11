Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:58472 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990793AbdLKW5OCoa1t (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 11 Dec 2017 23:57:14 +0100
Date: Mon, 11 Dec 2017 22:56:54 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH v2 6/6] MIPS: Disallow outsized PTRACE_SETREGSET NT_PRFPREG
 regset accesses
In-Reply-To: <alpine.DEB.2.00.1712111833360.4584@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1712111840170.4584@tp.orcam.me.uk>
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
Message-ID: <20171211225654.oYc4McKgmRlDxHk9pqxeNitFGtb-3MtNjZAWPcSLnno@z>

Complement commit c23b3d1a5311 ("MIPS: ptrace: Change GP regset to use 
correct core dump register layout") and also reject outsized 
PTRACE_SETREGSET requests to the NT_PRFPREG regset, like with the 
NT_PRSTATUS regset.

Cc: stable@vger.kernel.org # v3.17+
Fixes: c23b3d1a5311 ("MIPS: ptrace: Change GP regset to use correct core dump register layout")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---

Changes from v1:

- regenerated.

---
 arch/mips/kernel/ptrace.c |    3 +++
 1 file changed, 3 insertions(+)

linux-mips-nt-prfpreg-size.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2017-12-08 16:22:08.062741000 +0000
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2017-12-08 16:22:17.727811000 +0000
@@ -541,6 +541,9 @@ static int fpr_set(struct task_struct *t
 
 	BUG_ON(count % sizeof(elf_fpreg_t));
 
+	if (pos + count > sizeof(elf_fpregset_t))
+		return -EIO;
+
 	init_fp_ctx(target);
 
 	if (sizeof(target->thread.fpu.fpr[0]) == sizeof(elf_fpreg_t))
