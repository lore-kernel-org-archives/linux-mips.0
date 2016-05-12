Received: from mailapp01.imgtec.com ([195.59.15.196]:24581 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029236AbcELJSmyRwRT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 May 2016 11:18:42 +0200
Date: Thu, 12 May 2016 10:18:27 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 1/2] MIPS: ptrace: Fix FP context restoration FCSR
 regression
In-Reply-To: <alpine.DEB.2.00.1605120014000.6794@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1605120833050.6794@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1605120014000.6794@tp.orcam.me.uk>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20160512091827.XMglidVyVBGu9W3b77SF1H6bQ0qSELjJo4BSrqMOVX8@z>

Fix a floating-point context restoration regression introduced with 
commit 9b26616c8d9d ("MIPS: Respect the ISA level in FCSR handling") 
that causes a Floating Point exception and consequently a kernel oops 
with hard float configurations when one or more FCSR Enable and their 
corresponding Cause bits are set both at a time via a ptrace(2) call.  

To do so reinstate Cause bit masking originally introduced with commit 
b1442d39fac2 ("MIPS: Prevent user from setting FCSR cause bits") to 
address this exact problem and then inadvertently removed from the 
PTRACE_SETFPREGS request with the commit referred above.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
Cc: stable@vger.kernel.org # v4.0+
---
Hi,

 I have verified it with GDB to correctly address the problem.

 I guess I must have missed it, because it doesn't trigger with soft float 
configurations, where our FP emulator does the right thing, that is 
delivers a SIGFPE to the tracee when its execution is resumed.  As this 
mimics what a CTC1 instruction invoked by the tracee to write the same 
value would do and we should allow a debugger to reproduce all the 
register access actions a tracee can make I think eventually we ought to 
correct context restoration code instead to deliver a SIGFPE with hard 
float configurations as well.  But for the time being just strictly revert 
the incorrect change to make the regression go away.

 Therefore, please apply.

  Maciej

linux-mips-ptrace-fcsr-all-x.diff
Index: linux-sfr-test/arch/mips/kernel/ptrace.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/ptrace.c	2016-05-12 00:40:11.579182000 +0100
+++ linux-sfr-test/arch/mips/kernel/ptrace.c	2016-05-12 02:33:36.379981000 +0100
@@ -176,6 +176,7 @@ int ptrace_setfpregs(struct task_struct 
 	}
 
 	__get_user(value, data + 64);
+	value &= ~FPU_CSR_ALL_X;
 	fcr31 = child->thread.fpu.fcr31;
 	mask = boot_cpu_data.fpu_msk31;
 	child->thread.fpu.fcr31 = (value & ~mask) | (fcr31 & mask);
