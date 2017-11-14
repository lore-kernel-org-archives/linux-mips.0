Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:48767 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991978AbdKNMC3B9FkY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 13:02:29 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH] MIPS: CPS: Fix r1 .set mt assembler warning
Date: Tue, 14 Nov 2017 12:01:20 +0000
Message-ID: <20171114120120.7020-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
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
Cc: James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Message-ID: <20171114120120.xSm4F3lgrxmTLGDpGe8WsRqfkhbZxGn0V95KQ6Mpsp8@z>

From: James Hogan <jhogan@kernel.org>

MIPS CPS has a build warning on kernels configured for MIPS32R1 or
MIPS64R1, due to the use of .set mt without a prior .set mips{32,64}r2:

arch/mips/kernel/cps-vec.S Assembler messages:
arch/mips/kernel/cps-vec.S:238: Warning: the `mt' extension requires MIPS32 revision 2 or greater

Add .set MIPS_ISA_LEVEL_RAW before .set mt to silence the warning.

Fixes: 245a7868d2f2 ("MIPS: smp-cps: rework core/VPE initialisation")
Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/cps-vec.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index c7ed26029cbb..e68e6e04063a 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -235,6 +235,7 @@ LEAF(mips_cps_core_init)
 	has_mt	t0, 3f
 
 	.set	push
+	.set	MIPS_ISA_LEVEL_RAW
 	.set	mt
 
 	/* Only allow 1 TC per VPE to execute... */
@@ -388,6 +389,7 @@ LEAF(mips_cps_boot_vpes)
 #elif defined(CONFIG_MIPS_MT)
 
 	.set	push
+	.set	MIPS_ISA_LEVEL_RAW
 	.set	mt
 
 	/* If the core doesn't support MT then return */
-- 
2.14.1
