Received: from mailapp01.imgtec.com ([195.59.15.196]:24579 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013085AbbESVN5oy1Lf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 23:13:57 +0200
Subject: [PATCH 1/2] MIPS: MSA: bugfix - disable MSA during thread switch
 correctly
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Tue, 19 May 2015 14:13:51 -0700
Message-ID: <20150519211351.35859.80332.stgit@ubuntu-yegoshin>
In-Reply-To: <20150519211222.35859.52798.stgit@ubuntu-yegoshin>
References: <20150519211222.35859.52798.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, paul.burton@imgtec.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, ralf@linux-mips.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150519211351.TpKEbLCREY6q_VMfSZydCOpfuF7XeC-bFCgudDsYj-I@z>

During thread cloning the new (child) thread should have MSA disabled even
at first thread entry. So, the code to disable MSA is moved from macro
'switch_to' to assembler function 'resume' before it switches kernel stack
to 'next' (new) thread. Call of 'disable_msa' after 'resume' in 'switch_to'
macro never called a first time entry into thread.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/switch_to.h |    1 -
 arch/mips/kernel/r4k_switch.S     |    6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index e92d6c4b5ed1..0d0f7f8f8b3a 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -104,7 +104,6 @@ do {									\
 	if (test_and_clear_tsk_thread_flag(prev, TIF_USEDMSA))		\
 		__fpsave = FP_SAVE_VECTOR;				\
 	(last) = resume(prev, next, task_thread_info(next), __fpsave);	\
-	disable_msa();							\
 } while (0)
 
 #define finish_arch_switch(prev)					\
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 04cbbde3521b..7dbb64656bfe 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -25,6 +25,7 @@
 /* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
 #undef fp
 
+#define t4  $12
 /*
  * Offset to the current process status flags, the first 32 bytes of the
  * stack are not used.
@@ -73,6 +74,11 @@
 	cfc1	t1, fcr31
 	msa_save_all	a0
 	.set pop	/* SET_HARDFLOAT */
+	li      t4, MIPS_CONF5_MSAEN
+	mfc0    t3, CP0_CONFIG, 5
+	or      t3, t3, t4
+	xor     t3, t3, t4
+	mtc0    t3, CP0_CONFIG, 5
 
 	sw	t1, THREAD_FCR31(a0)
 	b	2f
