Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:53984 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990656AbeAEKdqZoLbu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 5 Jan 2018 11:33:46 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 4/6] irqchip/mips-gic: Always attempt to enable EIC mode
Date: Fri, 5 Jan 2018 10:31:08 +0000
Message-ID: <1515148270-9391-5-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1515148270-9391-1-git-send-email-matt.redfearn@mips.com>
References: <1515148270-9391-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org
Message-ID: <20180105103108.0FXRpP-4G_u_lq1yvXc3wwXfw5LzfHV-f2lNXg738w8@z>

The MIPS GIC supports running in External Interrupt Controller (EIC)
mode, in which the GIC can raise up to 64 separate interrupts rather
than the usual 6. This mode is enabled by setting bit GIC_VL_CTL.EIC. If
the bit sticks, then EIC mode is present and becomes enabled. Otherwise
this bit is read-only 0 and setting it will have no effect.
The CP0 register Config3 bit VEIC indicates the status of EIC mode, and
effectively reflects GIC_VL_CTL.EIC. After attempting to enable EIC
mode, read back Config3.VEIC to determine if VEIC mode is present and
has been activated. If so, update the boot CPU flags to reflect that
VEIC mode is now active.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 drivers/irqchip/irq-mips-gic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index ef92a4d2038e..ee391f42e97d 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -725,6 +725,9 @@ static int __init gic_of_init(struct device_node *node,
 	gic_shared_intrs >>= __ffs(GIC_CONFIG_NUMINTERRUPTS);
 	gic_shared_intrs = (gic_shared_intrs + 1) * 8;
 
+	/* Enable EIC mode if supported. */
+	mips_gic_enable_eic();
+
 	if (cpu_has_veic) {
 		/* Always use vector 1 in EIC mode */
 		gic_cpu_pin = 0;
-- 
2.7.4
