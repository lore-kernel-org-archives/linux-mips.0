Received: from mailapp01.imgtec.com ([195.59.15.196]:1234 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994787AbdFOXIqLMSFr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 01:08:46 +0200
Date: Fri, 16 Jun 2017 00:08:29 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH v2 04/10] MIPS: Send SIGILL for BPOSGE32 in
 `__compute_return_epc_for_insn'
In-Reply-To: <alpine.DEB.2.00.1706150032240.23046@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706150136340.23046@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1706150032240.23046@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170615230829.ML0tpzv12zc5fAXiag1XBozH60xFQTnTd099aCTlARk@z>

Fix commit e50c0a8fa60d ("Support the MIPS32 / MIPS64 DSP ASE.") and 
send SIGILL rather than SIGBUS whenever an unimplemented BPOSGE32 DSP 
ASE instruction has been encountered in `__compute_return_epc_for_insn' 
as our Reserved Instruction exception handler would in response to an 
attempt to actually execute the instruction.  Sending SIGBUS only makes 
sense for the unaligned PC case, since moved to `__compute_return_epc'.  
Adjust function documentation accordingly, correct formatting and use
`pr_info' rather than `printk' as the other exit path already does.

Cc: stable@vger.kernel.org # 2.6.14+
Fixes: e50c0a8fa60d ("Support the MIPS32 / MIPS64 DSP ASE.")
Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
Unchanged from v1.

linux-mips-epc-for-insn-sigill-dsp.diff
Index: linux-sfr-test/arch/mips/kernel/branch.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/branch.c	2017-06-01 06:30:07.969735000 +0100
+++ linux-sfr-test/arch/mips/kernel/branch.c	2017-06-01 06:33:27.149519000 +0100
@@ -399,7 +399,7 @@ int __MIPS16e_compute_return_epc(struct 
  *
  * @regs:	Pointer to pt_regs
  * @insn:	branch instruction to decode
- * @returns:	-EFAULT on error and forces SIGBUS, and on success
+ * @returns:	-EFAULT on error and forces SIGILL, and on success
  *		returns 0 or BRANCH_LIKELY_TAKEN as appropriate after
  *		evaluating the branch.
  *
@@ -830,8 +830,9 @@ int __compute_return_epc_for_insn(struct
 	return ret;
 
 sigill_dsp:
-	printk("%s: DSP branch but not DSP ASE - sending SIGBUS.\n", current->comm);
-	force_sig(SIGBUS, current);
+	pr_info("%s: DSP branch but not DSP ASE - sending SIGILL.\n",
+		current->comm);
+	force_sig(SIGILL, current);
 	return -EFAULT;
 sigill_r6:
 	pr_info("%s: R2 branch but r2-to-r6 emulator is not preset - sending SIGILL.\n",
