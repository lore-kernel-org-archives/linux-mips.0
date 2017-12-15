Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:53114 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990633AbdLOJgxI8un1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Dec 2017 10:36:53 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/2] MIPS: pm-cps: Warn if JTAG presence will block power gating
Date: Fri, 15 Dec 2017 09:34:54 +0000
Message-ID: <1513330494-21249-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513330494-21249-1-git-send-email-matt.redfearn@mips.com>
References: <1513330494-21249-1-git-send-email-matt.redfearn@mips.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, jhogan@kernel.org
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Dengcheng Zhu <dengcheng.zhu@mips.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Paul Burton <paul.burton@mips.com>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20171215093454.VP1gCDJP878vjTe9_JFWMa3P23G1aD4eGwlPeOaqfb8@z>

If a JTAG probe is connected to a MIPS cluster, then the CPC detects it
and latches the CPC.STAT_CONF.EJTAG_PROBE bit to 1. While set,
attempting to send a power-down command to a core will be blocked, and
the CPC will instead send the core to clock-off state. This can
interfere with systems fully entering a low power state where all cores,
CM, GIC, etc are powered down.

Detect that a JTAG probe is / has been connected to the cluster and emit
a warning that the attempted power down will fail, to aid debugging
system suspend where it is not currently obvious that a core has not
really powered down and will block a full power down of the cluster. We
use a ratelimited pr_warn since this path will also be hit by cpu idle
if it attempts to put cores into the powered down state.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/kernel/pm-cps.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 421e06dfee72..45776613a5be 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -11,6 +11,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/init.h>
 #include <linux/percpu.h>
+#include <linux/ratelimit.h>
 #include <linux/slab.h>
 
 #include <asm/asm-offsets.h>
@@ -143,6 +144,18 @@ int cps_pm_enter_state(enum cps_pm_state state)
 
 	/* Setup the VPE to run mips_cps_pm_restore when started again */
 	if (IS_ENABLED(CONFIG_CPU_PM) && state == CPS_PM_POWER_GATED) {
+		unsigned int stat = read_cpc_cl_stat_conf();
+
+		if (stat & CPC_Cx_STAT_CONF_EJTAG_PROBE) {
+			/*
+			 * If we're attempting to gate power to the core, the
+			 * JTAG detect bit indicates that the CPC will instead
+			 * put the core into clock-off state. Emit a warning.
+			 */
+			pr_warn_ratelimited("JTAG probe present - core%d will clock off instead of powering down\n",
+					    core);
+		}
+
 		/* Power gating relies upon CPS SMP */
 		if (!mips_cps_smp_in_use())
 			return -EINVAL;
-- 
2.7.4
