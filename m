Received: from mailapp01.imgtec.com ([195.59.15.196]:18904 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994800AbdFOXS1ajz7r (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 01:18:27 +0200
Date: Fri, 16 Jun 2017 00:18:11 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH v2 10/10] MIPS: Use `pr_debug' for messages from
 `__compute_return_epc_for_insn'
In-Reply-To: <alpine.DEB.2.00.1706150032240.23046@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706150201350.23046@tp.orcam.me.uk>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170615231811.XP8TV_yHnrLaUawdqOiKRHYcrZS_9JEXtpOLjfF5YK4@z>

Reduce the log level for branch emulation error messages issued before 
sending SIGILL by `__compute_return_epc_for_insn' as these are triggered 
by user software and are not an event that would normally require any 
attention.  The same signal sent from elsewhere does not actually leave
any trace in the kernel log at all.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
New in v2.

linux-mips-epc-for-insn-sigill-pr-debug.diff
Index: linux-sfr-test/arch/mips/kernel/branch.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/branch.c	2017-06-05 19:40:09.000000000 +0100
+++ linux-sfr-test/arch/mips/kernel/branch.c	2017-06-15 00:42:08.603934000 +0100
@@ -816,18 +816,18 @@ int __compute_return_epc_for_insn(struct
 	return ret;
 
 sigill_dsp:
-	pr_info("%s: DSP branch but not DSP ASE - sending SIGILL.\n",
-		current->comm);
+	pr_debug("%s: DSP branch but not DSP ASE - sending SIGILL.\n",
+		 current->comm);
 	force_sig(SIGILL, current);
 	return -EFAULT;
 sigill_r2r6:
-	pr_info("%s: R2 branch but r2-to-r6 emulator is not present - sending SIGILL.\n",
-		current->comm);
+	pr_debug("%s: R2 branch but r2-to-r6 emulator is not present - sending SIGILL.\n",
+		 current->comm);
 	force_sig(SIGILL, current);
 	return -EFAULT;
 sigill_r6:
-	pr_info("%s: R6 branch but no MIPSr6 ISA support - sending SIGILL.\n",
-		current->comm);
+	pr_debug("%s: R6 branch but no MIPSr6 ISA support - sending SIGILL.\n",
+		 current->comm);
 	force_sig(SIGILL, current);
 	return -EFAULT;
 }
