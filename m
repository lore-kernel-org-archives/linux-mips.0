Received: from mailapp01.imgtec.com ([195.59.15.196]:37766 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991978AbdHMEhoqudYd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 13 Aug 2017 06:37:44 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 01/38] irqchip: mips-gic: SYNC after enabling GIC region
Date: Sat, 12 Aug 2017 21:36:09 -0700
Message-ID: <20170813043646.25821-2-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20170813043609.kkEEFHRrzNsde0Z5Wul_VU_6LTIiP_WdbJnDZDMrdfU@z>

From: James Hogan <james.hogan@imgtec.com>

A SYNC is required between enabling the GIC region and actually trying
to use it, even if the first access is a read, otherwise its possible
depending on the timing (and in my case depending on the precise
alignment of certain kernel code) to hit CM bus errors on that first
access.

Add the SYNC straight after setting the GIC base.

[paul.burton@imgtec.com:
  Changes later in this series increase our likelihood of hitting this
  by reducing the amount of code that runs between enabling the GIC &
  accessing it.]

Fixes: a7057270c280 ("irqchip: mips-gic: Add device-tree support")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.19.x-
---

 drivers/irqchip/irq-mips-gic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 9e984cefdca0..6841bd79c7c2 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -1022,6 +1022,9 @@ static int __init gic_of_init(struct device_node *node,
 
 	if (mips_cm_present())
 		write_gcr_gic_base(gic_base | CM_GCR_GIC_BASE_GICEN);
+		/* Ensure GIC region is enabled before trying to access it */
+		__sync();
+	}
 	gic_present = true;
 
 	__gic_init(gic_base, gic_len, cpu_vec, 0, node);
-- 
2.14.0
