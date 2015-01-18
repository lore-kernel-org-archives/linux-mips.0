Received: from mailapp01.imgtec.com ([195.59.15.196]:16516 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010992AbbARWaIXNisM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:30:08 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/36] MIPS: irq_cpu: declare irqchip table entry
Date: Sun, 18 Jan 2015 14:27:14 -0800
Message-ID: <1421620067-23933-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20150118222714.O_Yf9z3YJJyqp1rPlXZNZ98QcGpQdJ8otoiWSOUkKHI@z>

Allow the MIPS CPU interrupt controller to be probed from DT using the
generic __irqchip_of_table for platforms which use irqchip_init. This
will avoid such platforms needing to duplicate the compatible string &
init function pointer.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/kernel/irq_cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/irq_cpu.c b/arch/mips/kernel/irq_cpu.c
index 590c2c9..981d6a3 100644
--- a/arch/mips/kernel/irq_cpu.c
+++ b/arch/mips/kernel/irq_cpu.c
@@ -38,6 +38,8 @@
 #include <asm/mipsmtregs.h>
 #include <asm/setup.h>
 
+#include "../../drivers/irqchip/irqchip.h"
+
 static inline void unmask_mips_irq(struct irq_data *d)
 {
 	set_c0_status(0x100 << (d->irq - MIPS_CPU_IRQ_BASE));
@@ -163,3 +165,4 @@ int __init mips_cpu_irq_of_init(struct device_node *of_node,
 	__mips_cpu_irq_init(of_node);
 	return 0;
 }
+IRQCHIP_DECLARE(cpu_intc, "mti,cpu-interrupt-controller", mips_cpu_irq_of_init);
-- 
2.2.1
