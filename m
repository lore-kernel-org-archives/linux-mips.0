Received: from mailapp01.imgtec.com ([195.59.15.196]:15642 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010959AbbHEWnldckq8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 00:43:41 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/6] MIPS: CPS: stop dangling delay slot from has_mt
Date: Wed, 5 Aug 2015 15:42:36 -0700
Message-ID: <1438814560-19821-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438814560-19821-1-git-send-email-paul.burton@imgtec.com>
References: <1438814560-19821-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150805224236.dny2lpinLddF161-Dsx99KY2i1G_qb6LiDvXQY9_ks8@z>

The has_mt macro ended with a branch, leaving its callers with a delay
slot that would be executed if Config3.MT is not set. However it would
not be executed if Config3 (or earlier Config registers) don't exist
which makes it somewhat inconsistent at best. Fill the delay slot in the
macro & fix the mips_cps_boot_vpes caller appropriately.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: <stable@vger.kernel.org> # 3.16+
---

 arch/mips/kernel/cps-vec.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 9f71c06..fa159aa 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -39,6 +39,7 @@
 	 mfc0	\dest, CP0_CONFIG, 3
 	andi	\dest, \dest, MIPS_CONF3_MT
 	beqz	\dest, \nomt
+	 nop
 	.endm
 
 .section .text.cps-vec
@@ -226,7 +227,6 @@ LEAF(mips_cps_core_init)
 #ifdef CONFIG_MIPS_MT
 	/* Check that the core implements the MT ASE */
 	has_mt	t0, 3f
-	 nop
 
 	.set	push
 	.set	mips64r2
@@ -310,8 +310,8 @@ LEAF(mips_cps_boot_vpes)
 	PTR_ADDU t0, t0, t1
 
 	/* Calculate this VPEs ID. If the core doesn't support MT use 0 */
+	li	t9, 0
 	has_mt	ta2, 1f
-	 li	t9, 0
 
 	/* Find the number of VPEs present in the core */
 	mfc0	t1, CP0_MVPCONF0
-- 
2.5.0
