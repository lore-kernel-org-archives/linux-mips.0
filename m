Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:34716 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992521AbeENPt4nrwro (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 May 2018 17:49:56 +0200
Date: Mon, 14 May 2018 16:49:43 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH] MIPS: Fix ptrace(2) PTRACE_PEEKUSR and PTRACE_POKEUSR accesses
 to o32 FGRs
Message-ID: <alpine.DEB.2.00.1805141537210.10896@tp.orcam.me.uk>
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
To: James Hogan <james.hogan@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180514154943.EpmzCxhj97hl1YLQWIHWyICNEqjxj8155z2vRE4qUrc@z>

Check the TIF_32BIT_FPREGS task setting of the tracee rather than the 
tracer in determining the layout of floating-point general registers in 
the floating-point context, correcting access to odd-numbered registers 
for o32 tracees where the setting disagrees between the two processes.

Cc: stable@vger.kernel.org # 3.14+
Fixes: 597ce1723e0f ("MIPS: Support for 64-bit FP with O32 binaries")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
Hi,

 These are not the usual requests used by GDB to access the floating-point 
context, which is likely why it went unnoticed so long.  They are only 
used as a fallback in the case where PTRACE_GETFPREGS and PTRACE_SETFPREGS 
requests are not supported, i.e. with ancient kernels.

 However to verify an unrelated GDB bug fix I have tweaked GDB to always 
use PTRACE_PEEKUSR and PTRACE_POKEUSR, and then discovered this issue in 
native GDB regression testing, as it showed regressions from corrupt FGR 
contents across numerous tests compared to the usual results.  This fix 
removed those regressions then.

 Not being typically used does not mean we ought to keep the interface 
broken.  Therefore please apply.

  Maciej
---
 arch/mips/kernel/ptrace.c   |    4 ++--
 arch/mips/kernel/ptrace32.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

linux-mips-ptrace-test-thread-flag.diff
Index: linux/arch/mips/kernel/ptrace.c
===================================================================
--- linux.orig/arch/mips/kernel/ptrace.c	2018-05-12 22:52:19.000000000 +0100
+++ linux/arch/mips/kernel/ptrace.c	2018-05-12 22:56:07.893993000 +0100
@@ -1059,7 +1059,7 @@ long arch_ptrace(struct task_struct *chi
 			fregs = get_fpu_regs(child);
 
 #ifdef CONFIG_32BIT
-			if (test_thread_flag(TIF_32BIT_FPREGS)) {
+			if (test_tsk_thread_flag(child, TIF_32BIT_FPREGS)) {
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
@@ -1154,7 +1154,7 @@ long arch_ptrace(struct task_struct *chi
 
 			init_fp_ctx(child);
 #ifdef CONFIG_32BIT
-			if (test_thread_flag(TIF_32BIT_FPREGS)) {
+			if (test_tsk_thread_flag(child, TIF_32BIT_FPREGS)) {
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
Index: linux-mipsswbrd038/arch/mips/kernel/ptrace32.c
===================================================================
--- linux-mipsswbrd038.orig/arch/mips/kernel/ptrace32.c	2018-05-12 22:52:19.000000000 +0100
+++ linux-mipsswbrd038/arch/mips/kernel/ptrace32.c	2018-05-12 22:55:20.906637000 +0100
@@ -99,7 +99,7 @@ long compat_arch_ptrace(struct task_stru
 				break;
 			}
 			fregs = get_fpu_regs(child);
-			if (test_thread_flag(TIF_32BIT_FPREGS)) {
+			if (test_tsk_thread_flag(child, TIF_32BIT_FPREGS)) {
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
@@ -212,7 +212,7 @@ long compat_arch_ptrace(struct task_stru
 				       sizeof(child->thread.fpu));
 				child->thread.fpu.fcr31 = 0;
 			}
-			if (test_thread_flag(TIF_32BIT_FPREGS)) {
+			if (test_tsk_thread_flag(child, TIF_32BIT_FPREGS)) {
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
