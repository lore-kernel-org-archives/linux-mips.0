Received: from mailapp01.imgtec.com ([195.59.15.196]:27809 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992886AbcJaQZ6TelE1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 31 Oct 2016 17:25:58 +0100
Date: Mon, 31 Oct 2016 16:25:44 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 1/4] MIPS: Fix ISA I FP sigcontext access violation
 handling
In-Reply-To: <alpine.DEB.2.00.1610310319010.31859@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1610310325060.31859@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1610310319010.31859@tp.orcam.me.uk>
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
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20161031162544.TdztMqkyKF5QGBIxZd8Hb3sJz5HIXOUDG1Kozw-FleM@z>

Complement commit 0ae8dceaebe3 ("Merge with 2.3.10.") and use the local 
`fault' handler to recover from FP sigcontext access violation faults, 
like corresponding code does in r4k_fpu.S.  The `bad_stack' handler is 
in syscall.c and is not suitable here as we want to propagate the error 
condition up through the caller rather than killing the thread outright.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
 I guess it hardly ever triggers and code still builds, so it has aged so
well...

  Maciej

linux-mips-isa1-sig-fp-context-fault.patch
Index: linux-sfr-test/arch/mips/kernel/r2300_fpu.S
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/r2300_fpu.S	2016-10-22 02:36:46.000000000 +0100
+++ linux-sfr-test/arch/mips/kernel/r2300_fpu.S	2016-10-22 02:37:20.891186000 +0100
@@ -21,7 +21,7 @@
 #define EX(a,b)							\
 9:	a,##b;							\
 	.section __ex_table,"a";				\
-	PTR	9b,bad_stack;					\
+	PTR	9b,fault;					\
 	.previous
 
 	.set	noreorder
