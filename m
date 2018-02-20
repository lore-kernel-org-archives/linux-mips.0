Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:47672 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993497AbeBTJ6rj00Z1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Feb 2018 10:58:47 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v3] MIPS: pm-cps: Block system suspend when a JTAG probe is present
Date: Tue, 20 Feb 2018 09:58:16 +0000
Message-ID: <1519120696-30658-1-git-send-email-matt.redfearn@mips.com>
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
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, Dengcheng Zhu <dengcheng.zhu@mips.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20180220095816.WjJrYy5GYrlMAvNx0h0c1_reps6lhmJMkHkT6hgxeiU@z>

If a JTAG probe is connected to a MIPS cluster, then the CPC detects it
and latches the CPC.STAT_CONF.EJTAG_PROBE bit to 1. While set,
attempting to send a power-down command to a core will be blocked, and
the CPC will instead send the core to clock-off state. This can
interfere with systems fully entering a low power state where all
cores, CM, GIC, etc are powered down.

Detect that a JTAG probe is / has been connected to the cluster and
block the suspend attempt.

Attempting to suspend the system while a JTAG probe is connected now
yields:
 # echo mem > /sys/power/state
 [   11.654000] PM: Syncing filesystems ... done.
 [   11.658000] JTAG probe is connected - abort suspend
 -sh: echo: write error: Operation not permitted
 #

To restore suspend, the JTAG probe should be disconnected or put into
quiescent state. Platform code can then clear the
CPC.STAT_CONF.EJTAG_PROBE bit.

Reported-by: Ed Blake <ed.blake@sondrel.com>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

series-cc: Ed Blake <ed.blake@sondrel.com>
---

Changes in v3:
Remove #if defined(CONFIG_PM_SLEEP) around cps_pm_power_notifier which
results in build error if CONFIG_PM_SLEEP is not defined. I believed
that the pm_notifier() registration would harmlessly compile out if
!defined(CONFIG_PM_SLEEP). However, it actually casts the fn to void in
that case, resulting in a build error from the missing definition.

Changes in v2:
Fixed CPC_Cx_STAT_CONF_EJTAG_PROBE_MSK -> CPC_Cx_STAT_CONF_EJTAG_PROBE -
thanks kbuild test robot!

 arch/mips/kernel/pm-cps.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 421e06dfee72..55c3fbeb2df6 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/percpu.h>
 #include <linux/slab.h>
+#include <linux/suspend.h>
 
 #include <asm/asm-offsets.h>
 #include <asm/cacheflush.h>
@@ -670,6 +671,34 @@ static int cps_pm_online_cpu(unsigned int cpu)
 	return 0;
 }
 
+static int cps_pm_power_notifier(struct notifier_block *this,
+				 unsigned long event, void *ptr)
+{
+	unsigned int stat;
+
+	switch (event) {
+	case PM_SUSPEND_PREPARE:
+		stat = read_cpc_cl_stat_conf();
+		/*
+		 * If we're attempting to suspend the system and power down all
+		 * of the cores, the JTAG detect bit indicates that the CPC will
+		 * instead put the cores into clock-off state. In this state
+		 * a connected debugger can cause the CPU to attempt
+		 * interactions with the powered down system. At best this will
+		 * fail. At worst, it can hang the NoC, requiring a hard reset.
+		 * To avoid this, just block system suspend if a JTAG probe
+		 * is detected.
+		 */
+		if (stat & CPC_Cx_STAT_CONF_EJTAG_PROBE) {
+			pr_warn("JTAG probe is connected - abort suspend\n");
+			return NOTIFY_BAD;
+		}
+		return NOTIFY_DONE;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
 static int __init cps_pm_init(void)
 {
 	/* A CM is required for all non-coherent states */
@@ -705,6 +734,8 @@ static int __init cps_pm_init(void)
 		pr_warn("pm-cps: no CPC, clock & power gating unavailable\n");
 	}
 
+	pm_notifier(cps_pm_power_notifier, 0);
+
 	return cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mips/cps_pm:online",
 				 cps_pm_online_cpu, NULL);
 }
-- 
2.7.4
