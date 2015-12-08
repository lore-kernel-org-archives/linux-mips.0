Received: from mailapp01.imgtec.com ([195.59.15.196]:6885 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013396AbbLHNVu0H20Z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Dec 2015 14:21:50 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v4 18/19] MIPS: Delete smp-gic.c
Date: Tue, 8 Dec 2015 13:20:29 +0000
Message-ID: <1449580830-23652-19-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1449580830-23652-1-git-send-email-qais.yousef@imgtec.com>
References: <1449580830-23652-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, lisa.parratt@imgtec.com, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151208132029.kzF6QgRvNQc6IvGYvhxJicQreiMls9mNf_rQ9wbSd8c@z>

We now have a generic IPI layer that will use GIC automatically
if it's compiled in.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/Kconfig         | 6 ------
 arch/mips/kernel/Makefile | 1 -
 2 files changed, 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 71683a853372..ff13d823fe95 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2155,7 +2155,6 @@ config MIPS_MT_SMP
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
 	select SYNC_R4K
-	select MIPS_GIC_IPI
 	select MIPS_MT
 	select SMP
 	select SMP_UP
@@ -2253,7 +2252,6 @@ config MIPS_VPE_APSP_API_MT
 config MIPS_CMP
 	bool "MIPS CMP framework support (DEPRECATED)"
 	depends on SYS_SUPPORTS_MIPS_CMP && !CPU_MIPSR6
-	select MIPS_GIC_IPI
 	select SMP
 	select SYNC_R4K
 	select SYS_SUPPORTS_SMP
@@ -2273,7 +2271,6 @@ config MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPC
 	select MIPS_CPS_PM if HOTPLUG_CPU
-	select MIPS_GIC_IPI
 	select SMP
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
@@ -2291,9 +2288,6 @@ config MIPS_CPS_PM
 	select MIPS_CPC
 	bool
 
-config MIPS_GIC_IPI
-	bool
-
 config MIPS_CM
 	bool
 
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 68e2b7db9348..b0988fd62fcc 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -52,7 +52,6 @@ obj-$(CONFIG_MIPS_MT_SMP)	+= smp-mt.o
 obj-$(CONFIG_MIPS_CMP)		+= smp-cmp.o
 obj-$(CONFIG_MIPS_CPS)		+= smp-cps.o cps-vec.o
 obj-$(CONFIG_MIPS_CPS_NS16550)	+= cps-vec-ns16550.o
-obj-$(CONFIG_MIPS_GIC_IPI)	+= smp-gic.o
 obj-$(CONFIG_MIPS_SPRAM)	+= spram.o
 
 obj-$(CONFIG_MIPS_VPE_LOADER)	+= vpe.o
-- 
2.1.0
