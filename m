Received: from mailapp01.imgtec.com ([195.59.15.196]:44973 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012612AbbHEWoNwDA38 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 00:44:13 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/6] MIPS: CPS: #ifdef on CONFIG_MIPS_MT_SMP rather than CONFIG_MIPS_MT
Date: Wed, 5 Aug 2015 15:42:38 -0700
Message-ID: <1438814560-19821-5-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150805224238.pD7gx72xjnj5IPSniy_Qe2UnyFHhWr5fJEy1NyNSOfY@z>

The CONFIG_MIPS_MT symbol can be selected by CONFIG_MIPS_VPE_LOADER in
addition to CONFIG_MIPS_MT_SMP. We only want MT code in the CPS SMP boot
vector if we're using MT for SMP. Thus switch the config symbol we ifdef
against to CONFIG_MIPS_MT_SMP.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: <stable@vger.kernel.org> # 3.16+
---

 arch/mips/kernel/cps-vec.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 57642f5..209ded1 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -224,7 +224,7 @@ LEAF(excep_ejtag)
 	END(excep_ejtag)
 
 LEAF(mips_cps_core_init)
-#ifdef CONFIG_MIPS_MT
+#ifdef CONFIG_MIPS_MT_SMP
 	/* Check that the core implements the MT ASE */
 	has_mt	t0, 3f
 
@@ -311,7 +311,7 @@ LEAF(mips_cps_boot_vpes)
 
 	/* Calculate this VPEs ID. If the core doesn't support MT use 0 */
 	li	t9, 0
-#ifdef CONFIG_MIPS_MT
+#ifdef CONFIG_MIPS_MT_SMP
 	has_mt	ta2, 1f
 
 	/* Find the number of VPEs present in the core */
@@ -339,7 +339,7 @@ LEAF(mips_cps_boot_vpes)
 	PTR_L	ta3, COREBOOTCFG_VPECONFIG(t0)
 	PTR_ADDU v0, v0, ta3
 
-#ifdef CONFIG_MIPS_MT
+#ifdef CONFIG_MIPS_MT_SMP
 
 	/* If the core doesn't support MT then return */
 	bnez	ta2, 1f
@@ -453,7 +453,7 @@ LEAF(mips_cps_boot_vpes)
 
 2:	.set	pop
 
-#endif /* CONFIG_MIPS_MT */
+#endif /* CONFIG_MIPS_MT_SMP */
 
 	/* Return */
 	jr	ra
-- 
2.5.0
