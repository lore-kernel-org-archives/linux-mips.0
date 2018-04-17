Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:42346 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990498AbeDQOHdMD0bo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Apr 2018 16:07:33 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 3/3] MIPS: memset.S: Reinstate delay slot indentation
Date: Tue, 17 Apr 2018 15:06:12 +0100
Message-ID: <1523973972-25633-3-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1523973972-25633-1-git-send-email-matt.redfearn@mips.com>
References: <1523973972-25633-1-git-send-email-matt.redfearn@mips.com>
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
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20180417140612.iWbMUcQNVr2XnzvwSbeZJlX--I0sonBpKvGUJ6zU77g@z>

Assembly language within the MIPS kernel conventionally indents
instructions which are in a branch delay slot to make them easier to
see. Commit 8483b14aaa81 ("MIPS: lib: memset: Whitespace fixes") rather
inexplicably removed all of these indentations from memset.S. Reinstate
the convention for all instructions in a branch delay slot. This
effectively reverts the above commit, plus other locations introduced
with MIPSR6 support.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/lib/memset.S | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index 84e91f4fdf53..085cc86f624f 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -95,7 +95,7 @@
 
 	sltiu		t0, a2, STORSIZE	/* very small region? */
 	bnez		t0, .Lsmall_memset\@
-	andi		t0, a0, STORMASK	/* aligned? */
+	 andi		t0, a0, STORMASK	/* aligned? */
 
 #ifdef CONFIG_CPU_MICROMIPS
 	move		t8, a1			/* used by 'swp' instruction */
@@ -103,12 +103,12 @@
 #endif
 #ifndef CONFIG_CPU_DADDI_WORKAROUNDS
 	beqz		t0, 1f
-	PTR_SUBU	t0, STORSIZE		/* alignment in bytes */
+	 PTR_SUBU	t0, STORSIZE		/* alignment in bytes */
 #else
 	.set		noat
 	li		AT, STORSIZE
 	beqz		t0, 1f
-	PTR_SUBU	t0, AT			/* alignment in bytes */
+	 PTR_SUBU	t0, AT			/* alignment in bytes */
 	.set		at
 #endif
 
@@ -149,7 +149,7 @@
 1:	ori		t1, a2, 0x3f		/* # of full blocks */
 	xori		t1, 0x3f
 	beqz		t1, .Lmemset_partial\@	/* no block to fill */
-	andi		t0, a2, 0x40-STORSIZE
+	 andi		t0, a2, 0x40-STORSIZE
 
 	PTR_ADDU	t1, a0			/* end address */
 	.set		reorder
@@ -174,7 +174,7 @@
 	.set		at
 #endif
 	jr		t1
-	PTR_ADDU	a0, t0			/* dest ptr */
+	 PTR_ADDU	a0, t0			/* dest ptr */
 
 	.set		push
 	.set		noreorder
@@ -186,7 +186,7 @@
 
 	beqz		a2, 1f
 #ifndef CONFIG_CPU_MIPSR6
-	PTR_ADDU	a0, a2			/* What's left */
+	 PTR_ADDU	a0, a2			/* What's left */
 	R10KCBARRIER(0(ra))
 #ifdef __MIPSEB__
 	EX(LONG_S_R, a1, -1(a0), .Llast_fixup\@)
@@ -194,7 +194,7 @@
 	EX(LONG_S_L, a1, -1(a0), .Llast_fixup\@)
 #endif
 #else
-	PTR_SUBU	t0, $0, a2
+	 PTR_SUBU	t0, $0, a2
 	PTR_ADDIU	t0, 1
 	STORE_BYTE(0)
 	STORE_BYTE(1)
@@ -210,11 +210,11 @@
 0:
 #endif
 1:	jr		ra
-	move		a2, zero
+	 move		a2, zero
 
 .Lsmall_memset\@:
 	beqz		a2, 2f
-	PTR_ADDU	t1, a0, a2
+	 PTR_ADDU	t1, a0, a2
 
 1:	PTR_ADDIU	a0, 1			/* fill bytewise */
 	R10KCBARRIER(0(ra))
@@ -222,7 +222,7 @@
 	 EX(sb, a1, -1(a0), .Lsmall_fixup\@)
 
 2:	jr		ra			/* done */
-	move		a2, zero
+	 move		a2, zero
 	.if __memset == 1
 	END(memset)
 	.set __memset, 0
@@ -238,7 +238,7 @@
 
 .Lfirst_fixup\@:
 	jr	ra
-	nop
+	 nop
 
 .Lfwd_fixup\@:
 	PTR_L		t0, TI_TASK($28)
@@ -246,7 +246,7 @@
 	LONG_L		t0, THREAD_BUADDR(t0)
 	LONG_ADDU	a2, t1
 	jr		ra
-	LONG_SUBU	a2, t0
+	 LONG_SUBU	a2, t0
 
 .Lpartial_fixup\@:
 	PTR_L		t0, TI_TASK($28)
@@ -278,7 +278,7 @@
 LEAF(memset)
 EXPORT_SYMBOL(memset)
 	beqz		a1, 1f
-	move		v0, a0			/* result */
+	 move		v0, a0			/* result */
 
 	andi		a1, 0xff		/* spread fillword */
 	LONG_SLL		t1, a1, 8
-- 
2.7.4
