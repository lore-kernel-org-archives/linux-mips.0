Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:37555 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990435AbeAEKcQQvueu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 5 Jan 2018 11:32:16 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/6] MIPS: CPS: Introduce mips_gic_enable_eic
Date: Fri, 5 Jan 2018 10:31:06 +0000
Message-ID: <1515148270-9391-3-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1515148270-9391-1-git-send-email-matt.redfearn@mips.com>
References: <1515148270-9391-1-git-send-email-matt.redfearn@mips.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Dengcheng Zhu <dengcheng.zhu@mips.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20180105103106.9xpQ_PknBJzNIrfbhYDlc_kfGn48ZNvnVlUByqcGmFg@z>

The MIPS GIC supports running in External Interrupt Controller (EIC)
mode, in which the GIC can raise up to 64 separate interrupts rather
than the usual 6. This mode is enabled by setting bit GIC_VL_CTL.EIC. If
the bit sticks, then EIC mode is present and becomes enabled. Otherwise
this bit is read-only 0 and setting it will have no effect.
The CP0 register Config3 bit VEIC indicates the status of EIC mode, and
effectively reflects GIC_VL_CTL.EIC. After attempting to enable EIC
mode, read back Config3.VEIC to determine if VEIC mode is present and
has been activated. If so, update the boot CPU flags to reflect that
VEIC mode is now active.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/mips-gic.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/include/asm/mips-gic.h b/arch/mips/include/asm/mips-gic.h
index 558059a8f218..b8345b117224 100644
--- a/arch/mips/include/asm/mips-gic.h
+++ b/arch/mips/include/asm/mips-gic.h
@@ -314,6 +314,28 @@ static inline bool mips_gic_present(void)
 	return IS_ENABLED(CONFIG_MIPS_GIC) && mips_gic_base;
 }
 
+
+/**
+ * mips_gic_enable_eic() - Enable EIC mode if supported
+ *
+ * Attempt to enable the GICs EIC mode if supported by the hardware.
+ * EIC is enabled via the GIC CTL register. If the bit sticks, then the mode
+ * is supported and active. CP0.Config3.VEIC reflects this state and is read
+ * to determine if the mode has successfully been activated. If it has, update
+ * the boot cpu flags such that cpu_has_veic reflects the new mode.
+ */
+static inline void mips_gic_enable_eic(void)
+{
+	set_gic_vl_ctl(GIC_VX_CTL_EIC);
+	mb();		/* Ensure write to GIC register completes */
+	ehb();		/* Ensure mfc0 does not start early */
+	if (read_c0_config3() & MIPS_CONF3_VEIC) {
+		/* GIC & CPU now in VEIC mode */
+		pr_debug("GIC EIC mode activated\n");
+		boot_cpu_data.options |= MIPS_CPU_VEIC;
+	}
+}
+
 /**
  * gic_get_c0_compare_int() - Return cp0 count/compare interrupt virq
  *
-- 
2.7.4
