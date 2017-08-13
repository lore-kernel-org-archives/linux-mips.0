Received: from mailapp01.imgtec.com ([195.59.15.196]:24003 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993934AbdHMEqeX9bdd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:46:34 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 30/38] MIPS: Remove unnecessary inclusions of linux/irqchip/mips-gic.h
Date: Sat, 12 Aug 2017 21:36:38 -0700
Message-ID: <20170813043646.25821-31-paul.burton@imgtec.com>
In-Reply-To: <20170813043646.25821-1-paul.burton@imgtec.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170813043638.IHc_4YT5eAa769Ehk8UBkXyHAiCuVanYwtjA-Sa2kBI@z>

linux/irqchip/mips-gic.h is included in a few files that don't actually
use it at all. Remove these unnecessary inclusions in preparation for
removing the header.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/smp-cmp.c | 1 -
 arch/mips/kernel/smp-cps.c | 1 -
 arch/mips/pistachio/irq.c  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
index 04b21deea4f2..05295a4909f1 100644
--- a/arch/mips/kernel/smp-cmp.c
+++ b/arch/mips/kernel/smp-cmp.c
@@ -24,7 +24,6 @@
 #include <linux/cpumask.h>
 #include <linux/interrupt.h>
 #include <linux/compiler.h>
-#include <linux/irqchip/mips-gic.h>
 
 #include <linux/atomic.h>
 #include <asm/cacheflush.h>
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index c316a0f9e6fb..0063122c85da 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -11,7 +11,6 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/irqchip/mips-gic.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/hotplug.h>
 #include <linux/slab.h>
diff --git a/arch/mips/pistachio/irq.c b/arch/mips/pistachio/irq.c
index 0a6b24c24652..709a8219073a 100644
--- a/arch/mips/pistachio/irq.c
+++ b/arch/mips/pistachio/irq.c
@@ -10,7 +10,6 @@
 
 #include <linux/init.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/mips-gic.h>
 #include <linux/kernel.h>
 
 #include <asm/cpu-features.h>
-- 
2.14.0
