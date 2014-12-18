Received: from nivc-ms1.auriga.com ([80.240.102.146]:48865 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009080AbaLRKVkkVwD0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 11:21:40 +0100
From: Aleksey Makarov <aleksey.makarov@auriga.com>
Subject: [PATCH v2 05/12] MIPS: OCTEON: Delete unused COP2 saving code
Date: Thu, 18 Dec 2014 13:17:57 +0300
Message-ID: <1418897888-17669-6-git-send-email-aleksey.makarov@auriga.com>
In-Reply-To: <1418897888-17669-1-git-send-email-aleksey.makarov@auriga.com>
References: <1418897888-17669-1-git-send-email-aleksey.makarov@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20141218101757.msUkiGFkJY80X36IX8pvVqNpE2npSYkTQTB7nZFbY40@z>

Commit 2c952e06e4f5 ("MIPS: Move cop2 save/restore to switch_to()")
removes assembler code to store COP2 registers.  Commit
a36d8225bceb ("MIPS: OCTEON: Enable use of FPU") mistakenly
restores it

Fixes: a36d8225bceb ("MIPS: OCTEON: Enable use of FPU")
Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
---
 arch/mips/kernel/octeon_switch.S | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/mips/kernel/octeon_switch.S b/arch/mips/kernel/octeon_switch.S
index f0a699d..423ae83 100644
--- a/arch/mips/kernel/octeon_switch.S
+++ b/arch/mips/kernel/octeon_switch.S
@@ -52,32 +52,6 @@
 	.set pop
 1:
 
-	/* check if we need to save COP2 registers */
-	LONG_L	t0, ST_OFF(t3)
-	bbit0	t0, 30, 1f
-
-	/* Disable COP2 in the stored process state */
-	li	t1, ST0_CU2
-	xor	t0, t1
-	LONG_S	t0, ST_OFF(t3)
-
-	/* Enable COP2 so we can save it */
-	mfc0	t0, CP0_STATUS
-	or	t0, t1
-	mtc0	t0, CP0_STATUS
-
-	/* Save COP2 */
-	daddu	a0, THREAD_CP2
-	jal octeon_cop2_save
-	dsubu	a0, THREAD_CP2
-
-	/* Disable COP2 now that we are done */
-	mfc0	t0, CP0_STATUS
-	li	t1, ST0_CU2
-	xor	t0, t1
-	mtc0	t0, CP0_STATUS
-
-1:
 #if CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 	/* Check if we need to store CVMSEG state */
 	dmfc0	t0, $11,7	/* CvmMemCtl */
-- 
2.1.3
