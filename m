Received: from mailapp01.imgtec.com ([195.59.15.196]:7388 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010939AbbHEWn5rkqD8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 00:43:57 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/6] MIPS: CPS: don't include MT code in non-MT kernels
Date: Wed, 5 Aug 2015 15:42:37 -0700
Message-ID: <1438814560-19821-4-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150805224237.EGli8VpSC2PrlWGPAXMKVU3fVIsjRXza_ggT2psfepw@z>

The MT-specific code in mips_cps_boot_vpes can safely be omitted from
kernels which don't support MT, with the default VPE==0 case being used
as it would be after the has_mt (Config3.MT) check failed at runtime.
Discarding the code entirely will save us a few bytes & allow cleaner
handling of MT ASE instructions by later patches.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: <stable@vger.kernel.org> # 3.16+
---

 arch/mips/kernel/cps-vec.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index fa159aa..57642f5 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -311,6 +311,7 @@ LEAF(mips_cps_boot_vpes)
 
 	/* Calculate this VPEs ID. If the core doesn't support MT use 0 */
 	li	t9, 0
+#ifdef CONFIG_MIPS_MT
 	has_mt	ta2, 1f
 
 	/* Find the number of VPEs present in the core */
@@ -330,6 +331,7 @@ LEAF(mips_cps_boot_vpes)
 	/* Retrieve the VPE ID from EBase.CPUNum */
 	mfc0	t9, $15, 1
 	and	t9, t9, t1
+#endif
 
 1:	/* Calculate a pointer to this VPEs struct vpe_boot_config */
 	li	t1, VPEBOOTCFG_SIZE
-- 
2.5.0
