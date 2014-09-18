Received: from mailapp01.imgtec.com ([195.59.15.196]:64173 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009142AbaIRPKBU2rrZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Sep 2014 17:10:01 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 344CE7A207C49
        for <linux-mips@linux-mips.org>; Thu, 18 Sep 2014 16:09:51 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Add missing MIPS_CPS dependencies to PM and cpuidle
Date: Thu, 18 Sep 2014 16:09:49 +0100
Message-ID: <1411052989-15235-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140918150949.ukd6yaVm8NNmYQdVXE9UG-9fPesxHX3Tnbnda48DHuA@z>

The MIPS_CPS_PM and MIPS_CPS_CPUIDLE implementation should depend
on the MIPS_CPS symbol to avoid the following build problem

arch/mips/kernel/pm-cps.c: In function 'cps_pm_enter_state':
arch/mips/kernel/pm-cps.c:164:26: error: 'cpu_coherent_mask' undeclared
(first use in this function)
cpumask_clear_cpu(cpu, &cpu_coherent_mask);
                            ^
Cc: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig            | 1 +
 drivers/cpuidle/Kconfig.mips | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 37c272cb633d..b59202a8411c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2066,6 +2066,7 @@ config MIPS_CPS
 	  support is unavailable.
 
 config MIPS_CPS_PM
+	depends on MIPS_CPS
 	select MIPS_CPC
 	bool
 
diff --git a/drivers/cpuidle/Kconfig.mips b/drivers/cpuidle/Kconfig.mips
index 0e70ee28a5ca..4102be01d06a 100644
--- a/drivers/cpuidle/Kconfig.mips
+++ b/drivers/cpuidle/Kconfig.mips
@@ -3,7 +3,7 @@
 #
 config MIPS_CPS_CPUIDLE
 	bool "CPU Idle driver for MIPS CPS platforms"
-	depends on CPU_IDLE
+	depends on CPU_IDLE && MIPS_CPS
 	depends on SYS_SUPPORTS_MIPS_CPS
 	select ARCH_NEEDS_CPU_IDLE_COUPLED if MIPS_MT
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
-- 
2.1.0
