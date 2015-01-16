Received: from mailapp01.imgtec.com ([195.59.15.196]:2936 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010616AbbAPKwQPGqms (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:16 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 89A16E9B1275
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:08 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 18/70] MIPS: asm: spram: Add MIPS R6 related definitions
Date: Fri, 16 Jan 2015 10:48:57 +0000
Message-ID: <1421405389-15512-19-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104857.Zebujx-RwYzdJFnCBAjNczXMk8FSjMBpd1GypRSSyRA@z>

MIPS R6, just like MIPS R2, can use the spram_config() function
in spram.c

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/spram.h | 4 ++--
 arch/mips/kernel/Makefile     | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/spram.h b/arch/mips/include/asm/spram.h
index 0b89006e4907..e02a1961c542 100644
--- a/arch/mips/include/asm/spram.h
+++ b/arch/mips/include/asm/spram.h
@@ -1,10 +1,10 @@
 #ifndef _MIPS_SPRAM_H
 #define _MIPS_SPRAM_H
 
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 extern __init void spram_config(void);
 #else
 static inline void spram_config(void) { };
-#endif /* CONFIG_CPU_MIPSR2 */
+#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
 
 #endif /* _MIPS_SPRAM_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 92987d1bbe5f..0862ae781339 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_MIPS_CMP)		+= smp-cmp.o
 obj-$(CONFIG_MIPS_CPS)		+= smp-cps.o cps-vec.o
 obj-$(CONFIG_MIPS_GIC_IPI)	+= smp-gic.o
 obj-$(CONFIG_CPU_MIPSR2)	+= spram.o
+obj-$(CONFIG_CPU_MIPSR6)	+= spram.o
 
 obj-$(CONFIG_MIPS_VPE_LOADER)	+= vpe.o
 obj-$(CONFIG_MIPS_VPE_LOADER_CMP) += vpe-cmp.o
-- 
2.2.1
