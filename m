Received: from mailapp01.imgtec.com ([195.59.15.196]:57332 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009161AbaLRPLxvpMLu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:11:53 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 5DD39CD8A649B
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:11:43 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 18/67] MIPS: asm: spram: Add MIPS R6 related definitions
Date: Thu, 18 Dec 2014 15:09:27 +0000
Message-ID: <1418915416-3196-19-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150927.5gMykxnvkauW2O5-o08cRNqRyQd6dPqKE563MwzEAts@z>

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
index 008a2fed0584..f6ee8cc1f7c2 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_MIPS_CMP)		+= smp-cmp.o
 obj-$(CONFIG_MIPS_CPS)		+= smp-cps.o cps-vec.o
 obj-$(CONFIG_MIPS_GIC_IPI)	+= smp-gic.o
 obj-$(CONFIG_CPU_MIPSR2)	+= spram.o
+obj-$(CONFIG_CPU_MIPSR6)	+= spram.o
 
 obj-$(CONFIG_MIPS_VPE_LOADER)	+= vpe.o
 obj-$(CONFIG_MIPS_VPE_LOADER_CMP) += vpe-cmp.o
-- 
2.2.0
