Received: from mailapp01.imgtec.com ([195.59.15.196]:8394 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993879AbdFEXUGvFg9M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Jun 2017 01:20:06 +0200
Date: Tue, 6 Jun 2017 00:19:51 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 8/9] MIPS: Fix a typo: s/preset/present/ in r2-to-r6 emulation
 error message
In-Reply-To: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706051849410.21750@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1706040314270.10864@tp.orcam.me.uk>
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
Message-ID: <20170605231951.bAD87HgI8T6EJ1veFuP7NiC8HgJDH2zkHO4VxcHRhGU@z>

Cc: stable@vger.kernel.org # 3.19+
Fixes: 5f9f41c474be ("MIPS: kernel: Prepare the JR instruction for emulation on MIPS R6")
Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
 This is a user-visible message, so please backport.

  Maciej

Index: linux-sfr-test/arch/mips/kernel/branch.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/branch.c	2017-06-05 05:11:05.340498000 +0100
+++ linux-sfr-test/arch/mips/kernel/branch.c	2017-06-05 05:30:41.432034000 +0100
@@ -821,7 +821,7 @@ int __compute_return_epc_for_insn(struct
 	force_sig(SIGILL, current);
 	return -EFAULT;
 sigill_r2r6:
-	pr_info("%s: R2 branch but r2-to-r6 emulator is not preset - sending SIGILL.\n",
+	pr_info("%s: R2 branch but r2-to-r6 emulator is not present - sending SIGILL.\n",
 		current->comm);
 	force_sig(SIGILL, current);
 	return -EFAULT;
