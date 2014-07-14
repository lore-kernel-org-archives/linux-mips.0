Received: from mailapp01.imgtec.com ([195.59.15.196]:46272 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860902AbaGNJOr2Hi2X (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Jul 2014 11:14:47 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3C60CDCD78169
        for <linux-mips@linux-mips.org>; Mon, 14 Jul 2014 10:14:39 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 4/5] MIPS: kernel: cpu-probe: Add support for the HardWare Table Walker
Date: Mon, 14 Jul 2014 10:14:05 +0100
Message-ID: <1405329246-21643-5-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405329246-21643-1-git-send-email-markos.chandras@imgtec.com>
References: <1405329246-21643-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140714091405.9-iC8QoKo6QXzDcASbwHaAzm6eO90gMlzzlIemA-s_w@z>

Detect if the core implements the HWTW and set the option accordingly.
Also, add a new kernel parameter called 'nohwtw' allowing
the user to disable the hwtw support and fallback to the software
refill handler.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index d74f957c561e..4982e21bb1fa 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -54,6 +54,20 @@ static int __init dsp_disable(char *s)
 
 __setup("nodsp", dsp_disable);
 
+static int mips_hwtw_disabled;
+
+static int __init hwtw_disable(char *s)
+{
+	mips_hwtw_disabled = 1;
+	cpu_data[0].options &= ~MIPS_CPU_HWTW;
+	write_c0_pwctl(read_c0_pwctl() &
+		       ~(1 << MIPS_PWCTL_PWEN_SHIFT));
+
+	return 1;
+}
+
+__setup("nohwtw", hwtw_disable);
+
 static inline void check_errata(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
@@ -321,6 +335,9 @@ static inline unsigned int decode_config3(struct cpuinfo_mips *c)
 		c->options |= MIPS_CPU_SEGMENTS;
 	if (config3 & MIPS_CONF3_MSA)
 		c->ases |= MIPS_ASE_MSA;
+	/* Only tested on 32-bit cores */
+	if ((config3 & MIPS_CONF3_PW) && config_enabled(CONFIG_32BIT))
+		c->options |= MIPS_CPU_HWTW;
 
 	return config3 & MIPS_CONF_M;
 }
@@ -1187,6 +1204,12 @@ void cpu_probe(void)
 	if (mips_dsp_disabled)
 		c->ases &= ~(MIPS_ASE_DSP | MIPS_ASE_DSP2P);
 
+	if (mips_hwtw_disabled) {
+		c->options &= ~MIPS_CPU_HWTW;
+		write_c0_pwctl(read_c0_pwctl() &
+			       ~(1 << MIPS_PWCTL_PWEN_SHIFT));
+	}
+
 	if (c->options & MIPS_CPU_FPU) {
 		c->fpu_id = cpu_get_fpu_id();
 
-- 
2.0.0
