Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:53488 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992521AbeEWNuYGgCCL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 May 2018 15:50:24 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v3 2/2] MIPS: memset.S: Add comments to fault fixup handlers
Date: Wed, 23 May 2018 14:39:59 +0100
Message-ID: <1527082799-14704-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1527082799-14704-1-git-send-email-matt.redfearn@mips.com>
References: <1527082799-14704-1-git-send-email-matt.redfearn@mips.com>
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
Message-ID: <20180523133959.HYtUoeqtfGfFWc43hffQP1bn7tfd7qaiVBOO5MZXnqA@z>

It is not immediately obvious what the expected inputs to these fault
handlers is and how they calculate the number of unset bytes. Having
stared deeply at this in order to fix some corner cases, add some
comments to assist those who follow.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

Changes in v3:
- Update comment on .Lbyte_fixup to reflect corrected behavior

Changes in v2:
- Add comments to fault handlers in new, separate, patch.

 arch/mips/lib/memset.S | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index fac26ce64b2..3a6f34ef5ff 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -232,16 +232,25 @@
 
 #ifdef CONFIG_CPU_MIPSR6
 .Lbyte_fixup\@:
+	/*
+	 * unset_bytes = (#bytes - (#unaligned bytes)) - (-#unaligned bytes remaining + 1) + 1
+	 *      a2     =             a2                -              t0                   + 1
+	 */
 	PTR_SUBU	a2, t0
 	jr		ra
 	 PTR_ADDIU	a2, 1
 #endif /* CONFIG_CPU_MIPSR6 */
 
 .Lfirst_fixup\@:
+	/* unset_bytes already in a2 */
 	jr	ra
 	 nop
 
 .Lfwd_fixup\@:
+	/*
+	 * unset_bytes = partial_start_addr +  #bytes   -     fault_addr
+	 *      a2     =         t1         + (a2 & 3f) - $28->task->BUADDR
+	 */
 	PTR_L		t0, TI_TASK($28)
 	andi		a2, 0x3f
 	LONG_L		t0, THREAD_BUADDR(t0)
@@ -250,6 +259,10 @@
 	 LONG_SUBU	a2, t0
 
 .Lpartial_fixup\@:
+	/*
+	 * unset_bytes = partial_end_addr +      #bytes     -     fault_addr
+	 *      a2     =       a0         + (a2 & STORMASK) - $28->task->BUADDR
+	 */
 	PTR_L		t0, TI_TASK($28)
 	andi		a2, STORMASK
 	LONG_L		t0, THREAD_BUADDR(t0)
@@ -258,10 +271,15 @@
 	 LONG_SUBU	a2, t0
 
 .Llast_fixup\@:
+	/* unset_bytes already in a2 */
 	jr		ra
 	 nop
 
 .Lsmall_fixup\@:
+	/*
+	 * unset_bytes = end_addr - current_addr + 1
+	 *      a2     =    t1    -      a0      + 1
+	 */
 	PTR_SUBU	a2, t1, a0
 	jr		ra
 	 PTR_ADDIU	a2, 1
-- 
2.7.4
