Received: from mailapp01.imgtec.com ([195.59.15.196]:5645 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6862647AbaGVNVmU6SWc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Jul 2014 15:21:42 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: prevent user from setting FCSR cause bits
Date: Tue, 22 Jul 2014 14:21:21 +0100
Message-ID: <1406035281-693-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, stable@vger.kernel.org
Message-ID: <20140722132121.tur2XFgGS147ZtSJUVjaH3cg37Po6_6pvWGGWI-hp1E@z>

If one or more matching FCSR cause & enable bits are set in saved thread
context then when that context is restored the kernel will take an FP
exception. This is of course undesirable and considered an oops, leading
to the kernel writing a backtrace to the console and potentially
rebooting depending upon the configuration. Thus the kernel avoids this
situation by clearing the cause bits of the FCSR register when handling
FP exceptions and after emulating FP instructions.

However the kernel does not prevent userland from setting arbitrary FCSR
cause & enable bits via ptrace, using either the PTRACE_POKEUSR or
PTRACE_SETFPREGS requests. This means userland can trivially cause the
kernel to oops on any system with an FPU. Prevent this from happening
by clearing the cause bits when writing to the saved FCSR context via
ptrace.

This problem appears to exist at least back to the beginning of the git
era in the PTRACE_POKEUSR case.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: stable@vger.kernel.org
---
 arch/mips/kernel/ptrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index f639ccd..3a7f7dd 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -151,6 +151,7 @@ int ptrace_setfpregs(struct task_struct *child, __u32 __user *data)
 	}
 
 	__get_user(child->thread.fpu.fcr31, data + 64);
+	child->thread.fpu.fcr31 &= ~FPU_CSR_ALL_X;
 
 	/* FIR may not be written.  */
 
@@ -565,7 +566,7 @@ long arch_ptrace(struct task_struct *child, long request,
 			break;
 #endif
 		case FPC_CSR:
-			child->thread.fpu.fcr31 = data;
+			child->thread.fpu.fcr31 = data & ~FPU_CSR_ALL_X;
 			break;
 		case DSP_BASE ... DSP_BASE + 5: {
 			dspreg_t *dregs;
-- 
2.0.1
