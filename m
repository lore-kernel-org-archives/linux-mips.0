Received: from mailapp01.imgtec.com ([195.89.28.115]:44992 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823020AbaCXKUbVSPuY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Mar 2014 11:20:31 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3CEA98828D281
        for <linux-mips@linux-mips.org>; Mon, 24 Mar 2014 10:20:24 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/12] MIPS: fix core number detection for MT cores
Date: Mon, 24 Mar 2014 10:19:26 +0000
Message-ID: <1395656375-9300-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
References: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140324101926.qDDTwuIOt4cMjsZP2DcXTdgOGvah6SvS7q3gnEvR8Mo@z>

In cores which implement the MT ASE, the CPUNum in the EBase register is
a concatenation of the core number & the VPE ID within that core. In
order to retrieve the correct core number CPUNum must be shifted
appropriately to remove the VPE ID bits.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 34df5af..79526b2 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -421,8 +421,11 @@ static void decode_configs(struct cpuinfo_mips *c)
 	mips_probe_watch_registers(c);
 
 #ifndef CONFIG_MIPS_CPS
-	if (cpu_has_mips_r2)
+	if (cpu_has_mips_r2) {
 		c->core = read_c0_ebase() & 0x3ff;
+		if (cpu_has_mipsmt)
+			c->core >>= fls(smp_num_siblings) - 1;
+	}
 #endif
 }
 
-- 
1.8.5.3
