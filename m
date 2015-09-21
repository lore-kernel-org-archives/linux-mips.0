Received: from mailapp01.imgtec.com ([195.59.15.196]:38322 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008722AbbIURIakaXoX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Sep 2015 19:08:30 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/2] MIPS: Fix R2300 FP context switch handling
Date: Mon, 21 Sep 2015 10:07:42 -0700
Message-ID: <1442855262-25416-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442855262-25416-1-git-send-email-paul.burton@imgtec.com>
References: <1442855262-25416-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20150921170742.v-Cmb2N2W4HhvmI3vtVwjndhHoJIiJ8hOXpeTx_E4cY@z>

Commit 1a3d59579b9f ("MIPS: Tidy up FPU context switching") removed FP
context saving from the asm-written resume function in favour of reusing
existing code to perform the same task. However it only removed the FP
context saving code from the r4k_switch.S implementation of resume.
Remove it from the r2300_switch.S implementation too in order to prevent
attempting to save the FP context twice, which would likely lead to an
exception from the second save because the FPU had already been disabled
by the first save.

This patch has only been build tested, using rbtx49xx_defconfig.

Fixes: 1a3d59579b9f ("MIPS: Tidy up FPU context switching")
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/r2300_switch.S | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/mips/kernel/r2300_switch.S b/arch/mips/kernel/r2300_switch.S
index 5087a4b7..ac27ef7 100644
--- a/arch/mips/kernel/r2300_switch.S
+++ b/arch/mips/kernel/r2300_switch.S
@@ -31,18 +31,8 @@
 #define ST_OFF (_THREAD_SIZE - 32 - PT_SIZE + PT_STATUS)
 
 /*
- * FPU context is saved iff the process has used it's FPU in the current
- * time slice as indicated by TIF_USEDFPU.  In any case, the CU1 bit for user
- * space STATUS register should be 0, so that a process *always* starts its
- * userland with FPU disabled after each context switch.
- *
- * FPU will be enabled as soon as the process accesses FPU again, through
- * do_cpu() trap.
- */
-
-/*
  * task_struct *resume(task_struct *prev, task_struct *next,
- *		       struct thread_info *next_ti, int usedfpu)
+ *		       struct thread_info *next_ti)
  */
 LEAF(resume)
 	mfc0	t1, CP0_STATUS
@@ -50,22 +40,6 @@ LEAF(resume)
 	cpu_save_nonscratch a0
 	sw	ra, THREAD_REG31(a0)
 
-	beqz	a3, 1f
-
-	PTR_L	t3, TASK_THREAD_INFO(a0)
-
-	/*
-	 * clear saved user stack CU1 bit
-	 */
-	lw	t0, ST_OFF(t3)
-	li	t1, ~ST0_CU1
-	and	t0, t0, t1
-	sw	t0, ST_OFF(t3)
-
-	fpu_save_single a0, t0			# clobbers t0
-
-1:
-
 #if defined(CONFIG_CC_STACKPROTECTOR) && !defined(CONFIG_SMP)
 	PTR_LA	t8, __stack_chk_guard
 	LONG_L	t9, TASK_STACK_CANARY(a1)
-- 
2.5.3
