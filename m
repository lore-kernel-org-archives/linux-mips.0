Received: from multi.imgtec.com ([194.200.65.239]:34695 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817546Ab3ISRCE2BZ-s (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 19 Sep 2013 19:02:04 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: kernel: smp-cmp: MIPS MT code needs CONFIG_MIPS_MT
Date: Thu, 19 Sep 2013 18:00:29 +0100
Message-ID: <1379610029-7433-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130919170029.gf_FnR9NfLxcou7ou3ZyOEfBE2OxpYAXKitgWB5ujRo@z>

The mips_mt_* symbols are only built and exported if
CONFIG_MIPS_MT is enabled.

Fixes the following build problem when CONFIG_SMP is enabled
but CONFIG_MIPS_MT is not.

arch/mips/built-in.o: In function `cmp_prepare_cpus':
arch/mips/kernel/smp-cmp.c:197:
undefined reference to `mips_mt_set_cpuoptions'

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/kernel/smp-cmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
index 5969f1e..1b925d8 100644
--- a/arch/mips/kernel/smp-cmp.c
+++ b/arch/mips/kernel/smp-cmp.c
@@ -199,11 +199,14 @@ void __init cmp_prepare_cpus(unsigned int max_cpus)
 	pr_debug("SMPCMP: CPU%d: %s max_cpus=%d\n",
 		 smp_processor_id(), __func__, max_cpus);
 
+#ifdef CONFIG_MIPS_MT
 	/*
 	 * FIXME: some of these options are per-system, some per-core and
 	 * some per-cpu
 	 */
 	mips_mt_set_cpuoptions();
+#endif
+
 }
 
 struct plat_smp_ops cmp_smp_ops = {
-- 
1.8.3.2
