Received: from mailapp01.imgtec.com ([195.59.15.196]:35706 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028414AbcEROqx0rvJY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 May 2016 16:46:53 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/2] MIPS: CPS: Copy EVA configuration when starting secondary VPs.
Date: Wed, 18 May 2016 15:45:22 +0100
Message-ID: <1463582722-31420-2-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1463582722-31420-1-git-send-email-matt.redfearn@imgtec.com>
References: <1463582722-31420-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20160518144522.4rvaVZDqq41vmOTv144Qeyg0ZP9_kKV-ntduDS13_mI@z>

When starting secondary VPEs which support EVA and the SegCtl registers,
copy the memory segmentation configuration from the running VPE to ensure
that all VPEs in the core have a consitent virtual memory map.

The EVA configuration of secondary cores is dealt with when starting the
core via the CM.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/cps-vec.S | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index ac81edd44563..07b3274c8ae1 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -431,6 +431,22 @@ LEAF(mips_cps_boot_vpes)
 	mfc0	t0, CP0_CONFIG
 	mttc0	t0, CP0_CONFIG
 
+	/* Copy the EVA config from this VPE if the CPU supports it */
+	mfc0	t0, CP0_CONFIG, 1
+	bgez	t0, 1f
+	 mfc0	t0, CP0_CONFIG, 2
+	bgez	t0, 1f
+	 mfc0	t0, CP0_CONFIG, 3
+	and	t0, t0, MIPS_CONF3_SC
+	beqz	t0, 1f
+	 nop
+	mfc0    t0, CP0_SEGCTL0
+	mttc0	t0, CP0_SEGCTL0
+	mfc0    t0, CP0_SEGCTL1
+	mttc0	t0, CP0_SEGCTL1
+	mfc0    t0, CP0_SEGCTL2
+	mttc0	t0, CP0_SEGCTL2
+1:
 	/* Ensure no software interrupts are pending */
 	mttc0	zero, CP0_CAUSE
 	mttc0	zero, CP0_STATUS
-- 
2.5.0
