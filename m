Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:55173 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990409AbeC2MYFQQr5S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Mar 2018 14:24:05 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/2] MIPS: memset.S: Fix return of __clear_user from Lpartial_fixup
Date: Thu, 29 Mar 2018 10:28:24 +0100
Message-ID: <1522315704-31641-3-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
References: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20180329092824.RTJqHu16fDuWI5wEfRDfrCooDIDOEz4I--IUmlCwCQI@z>

The __clear_user function is defined to return the number of bytes that
could not be cleared. From the underlying memset / bzero implementation
this means setting register a2 to that number on return. Currently if a
page fault is triggered within the memset_partial block, the value
loaded into a2 on return is meaningless.

The label .Lpartial_fixup\@ is jumped to on page fault. Currently it
masks the remaining count of bytes (a2) with STORMASK, meaning that the
least significant 2 (32bit) or 3 (64bit) bits of the remaining count are
always clear.
Secondly, .Lpartial_fixup\@ expects t1 to contain the end address of the
copy. This is set up by the initial block:
	PTR_ADDU	t1, a0			/* end address */
However, the .Lmemset_partial\@ block then reuses register t1 to
calculate a jump through a block of word copies. This leaves it no
longer containing the end address of the copy operation if a page fault
occurs, and the remaining bytes calculation is incorrect.

Fix these issues by removing the and of a2 with STORMASK, and replace t1
with register t2 in the .Lmemset_partial\@ block.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/lib/memset.S | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index 90bcdf1224ee..3257dca58cad 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -161,19 +161,19 @@
 
 .Lmemset_partial\@:
 	R10KCBARRIER(0(ra))
-	PTR_LA		t1, 2f			/* where to start */
+	PTR_LA		t2, 2f			/* where to start */
 #ifdef CONFIG_CPU_MICROMIPS
 	LONG_SRL	t7, t0, 1
 #endif
 #if LONGSIZE == 4
-	PTR_SUBU	t1, FILLPTRG
+	PTR_SUBU	t2, FILLPTRG
 #else
 	.set		noat
 	LONG_SRL	AT, FILLPTRG, 1
-	PTR_SUBU	t1, AT
+	PTR_SUBU	t2, AT
 	.set		at
 #endif
-	jr		t1
+	jr		t2
 	PTR_ADDU	a0, t0			/* dest ptr */
 
 	.set		push
@@ -250,7 +250,6 @@
 
 .Lpartial_fixup\@:
 	PTR_L		t0, TI_TASK($28)
-	andi		a2, STORMASK
 	LONG_L		t0, THREAD_BUADDR(t0)
 	LONG_ADDU	a2, t1
 	jr		ra
-- 
2.7.4
