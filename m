Received: from mailapp01.imgtec.com ([195.59.15.196]:41030 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994787AbdFOXGgCi9xr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 01:06:36 +0200
Date: Fri, 16 Jun 2017 00:06:19 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH v2 02/10] MIPS: Actually decode JALX in
 `__compute_return_epc_for_insn'
In-Reply-To: <alpine.DEB.2.00.1706150032240.23046@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1706150124350.23046@tp.orcam.me.uk>
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
Message-ID: <20170615230619.ObDJoS4w4tM9NBmAhELBd3qUb3N-0jec0xJeOkz4liE@z>

Complement commit fb6883e5809c ("MIPS: microMIPS: Support handling of 
delay slots.") and actually decode the regular MIPS JALX major 
instruction opcode, the handling of which has been added with the said 
commit for EPC calculation in `__compute_return_epc_for_insn'.

Cc: stable@vger.kernel.org # 3.9+
Fixes: fb6883e5809c ("MIPS: microMIPS: Support handling of delay slots.")
Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
Unchanged from v1.

linux-mips-epc-jalx.diff
Index: linux-sfr-test/arch/mips/kernel/branch.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/branch.c	2017-06-01 03:32:07.000000000 +0100
+++ linux-sfr-test/arch/mips/kernel/branch.c	2017-06-01 03:38:34.417710000 +0100
@@ -556,6 +556,7 @@ int __compute_return_epc_for_insn(struct
 	/*
 	 * These are unconditional and in j_format.
 	 */
+	case jalx_op:
 	case jal_op:
 		regs->regs[31] = regs->cp0_epc + 8;
 	case j_op:
