Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:44944 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993124AbdLLKAspSzyC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 11:00:48 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 09/16] MIPS: Introduce setup_kernel_mode macro
Date: Tue, 12 Dec 2017 09:57:55 +0000
Message-ID: <1513072682-1371-10-git-send-email-matt.redfearn@mips.com>
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
Message-ID: <20171212095755.gnrj2Q-ANOi3kHx5StslsVo8Ag0e3nAaAUxOknXauSM@z>

There are several actions that need to be done on entry into the kernel.
Currently these actions are performed in a mix of get_saved_sp and
SAVE_SOME. This commit introduces a macro named setup_kernel_mode which
will eventually contain all of the necessary steps to be taken on entry
into the kernel from user mode. For a start, we need to set register $28
to its kernel conventional usage of the current thread info. Move this
from SAVE_SOME into setup_kernel_mode and invoke it in its place.

As part of the move, ensure that the Octeon code does not leave the .set
mips64 active by adding a .set push & .set pop around it.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/stackframe.h | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 2161357cc68f..494fe41f5619 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -48,6 +48,19 @@
 #define STATMASK 0x1f
 #endif
 
+		.macro setup_kernel_mode docfi=0
+
+		/* Set thread_info if we're coming from user mode */
+		ori	$28, sp, _THREAD_MASK
+		xori	$28, _THREAD_MASK
+#ifdef CONFIG_CPU_CAVIUM_OCTEON
+		.set	push
+		.set	mips64
+		pref	0, 0($28)       /* Prefetch the current pointer */
+		.set	pop
+#endif
+		.endm
+
 		.macro	SAVE_AT docfi=0
 		.set	push
 		.set	noat
@@ -273,17 +286,12 @@
 		cfi_st	$25, PT_R25, \docfi
 		cfi_st	$28, PT_R28, \docfi
 
-		/* Set thread_info if we're coming from user mode */
+		/* Set up kernel mode if we're coming from user */
 		mfc0	k0, CP0_STATUS
 		sll	k0, 3		/* extract cu0 bit */
 		bltz	k0, 9f
 
-		ori	$28, sp, _THREAD_MASK
-		xori	$28, _THREAD_MASK
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
-		.set    mips64
-		pref    0, 0($28)       /* Prefetch the current pointer */
-#endif
+		setup_kernel_mode \docfi
 9:
 		.set	pop
 		.endm
-- 
2.7.4
