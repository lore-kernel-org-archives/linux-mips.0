Received: from mailapp01.imgtec.com ([195.89.28.114]:37387 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837171AbaDPNGUAWHNZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 15:06:20 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 7D1CD575374BF
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 14:06:10 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 35/39] MIPS: cpuidle wait instruction state
Date: Wed, 16 Apr 2014 14:06:09 +0100
Message-ID: <1397653569-4813-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416130609.Zy1QzAScuVbIsVd-Qk_COIL2YxQccRlUnQxPmil1Qwg@z>

Defines a macro intended to allow trivial use of the regular MIPS wait
instruction from cpuidle drivers, which may simply invoke the macro
within their array of states.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/idle.h | 14 ++++++++++++++
 arch/mips/kernel/idle.c      | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
index d192158..d9f932d 100644
--- a/arch/mips/include/asm/idle.h
+++ b/arch/mips/include/asm/idle.h
@@ -1,6 +1,7 @@
 #ifndef __ASM_IDLE_H
 #define __ASM_IDLE_H
 
+#include <linux/cpuidle.h>
 #include <linux/linkage.h>
 
 extern void (*cpu_wait)(void);
@@ -20,4 +21,17 @@ static inline int address_is_in_r4k_wait_irqoff(unsigned long addr)
 	       addr < (unsigned long)__pastwait;
 }
 
+extern int mips_cpuidle_wait_enter(struct cpuidle_device *dev,
+				   struct cpuidle_driver *drv, int index);
+
+#define MIPS_CPUIDLE_WAIT_STATE {\
+	.enter			= mips_cpuidle_wait_enter,\
+	.exit_latency		= 1,\
+	.target_residency	= 1,\
+	.power_usage		= UINT_MAX,\
+	.flags			= CPUIDLE_FLAG_TIME_VALID,\
+	.name			= "wait",\
+	.desc			= "MIPS wait",\
+}
+
 #endif /* __ASM_IDLE_H  */
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 837ff27..2879e2e 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -250,3 +250,14 @@ void arch_cpu_idle(void)
 	else
 		local_irq_enable();
 }
+
+#ifdef CONFIG_CPU_IDLE
+
+int mips_cpuidle_wait_enter(struct cpuidle_device *dev,
+			    struct cpuidle_driver *drv, int index)
+{
+	arch_cpu_idle();
+	return index;
+}
+
+#endif
-- 
1.8.5.3
