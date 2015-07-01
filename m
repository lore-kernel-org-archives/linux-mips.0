Received: from mailapp01.imgtec.com ([195.59.15.196]:25017 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009476AbbGAIOOd5-b4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Jul 2015 10:14:14 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/7] MIPS: kernel: cps-vec: Replace mips32r2 ISA level with mips64r2
Date: Wed, 1 Jul 2015 09:13:30 +0100
Message-ID: <1435738414-30944-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
References: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150701081330.AAwSctpExmQbtyQ1BZlESRh8aGfw5iQaFg6QRHDtvbo@z>

mips32r2 is a subset of mips64r2, so we replace mips32r2 with mips64r2
in preparation for 64-bit CPS support.

Cc: <stable@vger.kernel.org> # 3.16+
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cps-vec.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index a4b2d81f45dd..bbbd88e994f0 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -229,7 +229,7 @@ LEAF(mips_cps_core_init)
 	 nop
 
 	.set	push
-	.set	mips32r2
+	.set	mips64r2
 	.set	mt
 
 	/* Only allow 1 TC per VPE to execute... */
@@ -346,7 +346,7 @@ LEAF(mips_cps_boot_vpes)
 	 nop
 
 	.set	push
-	.set	mips32r2
+	.set	mips64r2
 	.set	mt
 
 1:	/* Enter VPE configuration state */
-- 
2.4.5
