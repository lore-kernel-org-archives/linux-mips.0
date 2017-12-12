Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:40299 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994630AbdLLKAxJ48UC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 11:00:53 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 10/16] MIPS: Move the CONFIG_CPU_JUMP_WORKAROUNDS into setup_kernel_mode
Date: Tue, 12 Dec 2017 09:57:56 +0000
Message-ID: <1513072682-1371-11-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
References: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095756.ZNnEQ42L1hNfI23YH8FT3lZ1Nn-079uRUmDA36jNKWQ@z>

This workaround is necessary on certain CPUs when switching from user
mode to kernel mode. Move it from its slightly odd location in the
middle of get_saved_sp (which it is unrelated to) into the
setup_kernel_mode macro.

Since the setup_kernel_mode is a new self contained macro, we can ensure
that reordering is on and drop the NOP delay slot fillers.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/stackframe.h | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 494fe41f5619..a47a9f5591a3 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -49,6 +49,24 @@
 #endif
 
 		.macro setup_kernel_mode docfi=0
+		.set	push
+		.set	reorder
+
+#if !defined(CONFIG_SMP) && defined(CONFIG_CPU_JUMP_WORKAROUNDS)
+		/*
+		 * Clear BTB (branch target buffer), forbid RAS (return address
+		 * stack) to workaround the Out-of-order Issue in Loongson2F
+		 * via its diagnostic register.
+		 */
+		move	k0, ra
+		jal	1f
+1:		jal	1f
+1:		jal	1f
+1:		jal	1f
+1:		move	ra, k0
+		li	k0, 3
+		mtc0	k0, $22
+#endif /* !CONFIG_SMP && CONFIG_CPU_JUMP_WORKAROUNDS */
 
 		/* Set thread_info if we're coming from user mode */
 		ori	$28, sp, _THREAD_MASK
@@ -59,6 +77,7 @@
 		pref	0, 0($28)       /* Prefetch the current pointer */
 		.set	pop
 #endif
+		.set	pop
 		.endm
 
 		.macro	SAVE_AT docfi=0
@@ -160,25 +179,6 @@
 #else /* !CONFIG_SMP */
 		/* Uniprocessor variation */
 		.macro	get_saved_sp docfi=0 tosp=0
-#ifdef CONFIG_CPU_JUMP_WORKAROUNDS
-		/*
-		 * Clear BTB (branch target buffer), forbid RAS (return address
-		 * stack) to workaround the Out-of-order Issue in Loongson2F
-		 * via its diagnostic register.
-		 */
-		move	k0, ra
-		jal	1f
-		 nop
-1:		jal	1f
-		 nop
-1:		jal	1f
-		 nop
-1:		jal	1f
-		 nop
-1:		move	ra, k0
-		li	k0, 3
-		mtc0	k0, $22
-#endif /* CONFIG_CPU_JUMP_WORKAROUNDS */
 #if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
 		lui	k1, %hi(kernelsp)
 #else
-- 
2.7.4
