Received: from mailapp01.imgtec.com ([195.59.15.196]:9317 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993006AbcLMK7TvGbbS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Dec 2016 11:59:19 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 3/5] MIPS: Only change $28 to thread_info if coming from user mode
Date: Tue, 13 Dec 2016 10:59:03 +0000
Message-ID: <1481626745-4290-4-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1481626745-4290-1-git-send-email-matt.redfearn@imgtec.com>
References: <1481626745-4290-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161213105903.G4OM4vA1Syyh150_R7LTq2Aad8hH8X8n18SFS691aEk@z>

The SAVE_SOME macro is used to save the execution context on all
exceptions.
If an exception occurs while executing user code, the stack is switched
to the kernel's stack for the current task, and register $28 is switched
to point to the current_thread_info, which is at the bottom of the stack
region.
If the exception occurs while executing kernel code, the stack is left,
and this change ensures that register $28 is not updated. This is the
correct behaviour when the kernel can be executing on the separate irq
stack, because the thread_info will not be at the base of it.

With this change, register $28 is only switched to it's kernel
conventional usage of the currrent thread info pointer at the point at
which execution enters kernel space. Doing it on every exception was
redundant, but OK without an IRQ stack, but will be erroneous once that
is introduced.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

Changes in v2:
Drop .set reorder/noreorder when updating $28

 arch/mips/include/asm/stackframe.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index eebf39549606..e13164daf9c2 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -216,12 +216,20 @@
 		LONG_S	$25, PT_R25(sp)
 		LONG_S	$28, PT_R28(sp)
 		LONG_S	$31, PT_R31(sp)
+
+		/* Set thread_info if we're coming from user mode */
+		mfc0	k0, CP0_STATUS
+		sll	k0, 3		/* extract cu0 bit */
+		bltz	k0, 9f
+		 nop
+
 		ori	$28, sp, _THREAD_MASK
 		xori	$28, _THREAD_MASK
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 		.set    mips64
 		pref    0, 0($28)       /* Prefetch the current pointer */
 #endif
+9:
 		.set	pop
 		.endm
 
-- 
2.7.4
