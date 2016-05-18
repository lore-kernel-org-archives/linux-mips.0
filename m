Received: from mailapp01.imgtec.com ([195.59.15.196]:52377 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27030081AbcERQMtKPD18 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 May 2016 18:12:49 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 2/2] MIPS: CPS: Copy EVA configuration when starting secondary VPs.
Date: Wed, 18 May 2016 17:12:36 +0100
Message-ID: <1463587956-9160-2-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1463587956-9160-1-git-send-email-matt.redfearn@imgtec.com>
References: <1463587956-9160-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160518161236.NLfFDvHQ_d2wwnC_sfTVwH_aqi37eczGgWZvU73xyoQ@z>

When starting secondary VPEs which support EVA and the SegCtl registers,
copy the memory segmentation configuration from the running VPE to ensure
that all VPEs in the core have a consistent virtual memory map.

The EVA configuration of secondary cores is dealt with when starting the
core via the CM.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v2:
- Skip check for config3 existing - we know it must to be doing
multithreading
- Use a unique lable name in the function

 arch/mips/kernel/cps-vec.S | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index ac81edd44563..f8eae9189e38 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -431,6 +431,21 @@ LEAF(mips_cps_boot_vpes)
 	mfc0	t0, CP0_CONFIG
 	mttc0	t0, CP0_CONFIG
 
+	/*
+	 * Copy the EVA config from this VPE if the CPU supports it.
+	 * CONFIG3 must exist to be running MT startup - just read it.
+	 */
+	mfc0	t0, CP0_CONFIG, 3
+	and	t0, t0, MIPS_CONF3_SC
+	beqz	t0, 3f
+	 nop
+	mfc0    t0, CP0_SEGCTL0
+	mttc0	t0, CP0_SEGCTL0
+	mfc0    t0, CP0_SEGCTL1
+	mttc0	t0, CP0_SEGCTL1
+	mfc0    t0, CP0_SEGCTL2
+	mttc0	t0, CP0_SEGCTL2
+3:
 	/* Ensure no software interrupts are pending */
 	mttc0	zero, CP0_CAUSE
 	mttc0	zero, CP0_STATUS
-- 
2.5.0
