Received: from mailapp01.imgtec.com ([195.59.15.196]:62399 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026803AbbEVPx12otlq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 17:53:27 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/15] irqchip: mips-gic: register IRQ domain with MIPS_GIC_IRQ_BASE
Date: Fri, 22 May 2015 16:51:04 +0100
Message-ID: <1432309875-9712-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Message-ID: <20150522155104.AJdzRrTl-IQhzFz5Sl7SEzR5OvOdJzhFr7OeAHoRoLs@z>

On Malta, some IRQs are still referenced by hardcoded numbers relative
to MIPS_GIC_IRQ_BASE. When gic_init is called to register the GIC
without using device tree the irqbase argument allows this base to be
used. When the GIC is probed using device tree however the base is not
specified. This leads to conflicts between the GIC interrupts and other
interrupt controllers.

TODO: convert Malta (& SEAD3) to drop the hardcoded numbers instead

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/irqchip/irq-mips-gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 57f09cb..697f340 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -858,7 +858,7 @@ static int __init gic_of_init(struct device_node *node,
 		write_gcr_gic_base(gic_base | CM_GCR_GIC_BASE_GICEN_MSK);
 	gic_present = true;
 
-	__gic_init(gic_base, gic_len, cpu_vec, 0, node);
+	__gic_init(gic_base, gic_len, cpu_vec, MIPS_GIC_IRQ_BASE, node);
 
 	return 0;
 }
-- 
2.4.1
