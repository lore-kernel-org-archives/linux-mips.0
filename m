Received: from mailapp01.imgtec.com ([195.59.15.196]:23002 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6859971AbaGONKcGq0rT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 15 Jul 2014 15:10:32 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 7F522ABD5C56D
        for <linux-mips@linux-mips.org>; Tue, 15 Jul 2014 14:10:22 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/3] MIPS: kernel: cpu-probe: Detect unique RI/XI exceptions
Date: Tue, 15 Jul 2014 14:09:57 +0100
Message-ID: <1405429797-18281-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405429797-18281-1-git-send-email-markos.chandras@imgtec.com>
References: <1405429797-18281-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140715130957.ytD6npMrAO4uWc7vVAAWTMKKe3IbEl-13Ipwk-FTNTk@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Detect if the core supports unique exception codes for the
Read-Inhibit and Execute-Inhibit exceptions and set the
option accordingly. The RI/XI exception support is detected
by setting the 27th bit (IEC) of the PageGrain C0 register
and reading back the value of that register to verify the
bit is enabled.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/mipsregs.h | 1 +
 arch/mips/kernel/cpu-probe.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 417125548bde..9775c1aba4d3 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -265,6 +265,7 @@
 #define PG_XIE		(_ULCAST_(1) <<	 30)
 #define PG_ELPA		(_ULCAST_(1) <<	 29)
 #define PG_ESP		(_ULCAST_(1) <<	 28)
+#define PG_IEC		(_ULCAST_(1) <<  27)
 
 /*
  * R4x00 interrupt enable / cause bits
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index eb1920ccd263..5995b19fbd66 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -438,6 +438,15 @@ static void decode_configs(struct cpuinfo_mips *c)
 
 	mips_probe_watch_registers(c);
 
+	if (cpu_has_rixi) {
+		/* Enable the RIXI exceptions */
+		write_c0_pagegrain(read_c0_pagegrain() | PG_IEC);
+		back_to_back_c0_hazard();
+		/* Verify the IEC bit is set */
+		if (read_c0_pagegrain() & PG_IEC)
+			c->options |= MIPS_CPU_RIXIEX;
+	}
+
 #ifndef CONFIG_MIPS_CPS
 	if (cpu_has_mips_r2) {
 		c->core = get_ebase_cpunum();
-- 
2.0.0
