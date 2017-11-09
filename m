Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:36420 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990593AbdKILD3os8sx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Nov 2017 12:03:29 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/2] irqchip: mips-gic: Print warning if inherited GIC base is used
Date: Thu, 9 Nov 2017 11:02:45 +0000
Message-ID: <1510225365-2584-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1510225365-2584-1-git-send-email-matt.redfearn@mips.com>
References: <1510225365-2584-1-git-send-email-matt.redfearn@mips.com>
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
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org
Message-ID: <20171109110245.4HK5f2ecszTXqUMJa2vIMt2qz-f_Bk__T7IdtzhZ298@z>

If the physical address of the GIC resource cannot be read from device
tree, then the code falls back to reading it from the gcr_gic_base
register. Hopefully this has been set to a sane value by the bootloader
or some platform code, but is defined by the hardware manual to have
"undefined" reset state. Using it as the address at which the GIC will
be mapped into physical memory space can therefore be risky if it has
not been initialised, since it may result in the GIC being mapped to an
effectively random address anywhere in physical memory, where it might
conflict with peripherals or RAM and lead to weird crashes.

Since a "sane value" is very platform specific because it is particular
to the platform's memory map, it is difficult to test for. At the very
least, a warning message should be printed in the case that we trust the
inherited value.

Reported-by: Amit Kama <amit.kama@satixfy.com>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Reviewed-by: Paul Burton <paul.burton@mips.com>

---

 drivers/irqchip/irq-mips-gic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 9b768899f07b..ef92a4d2038e 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -701,6 +701,8 @@ static int __init gic_of_init(struct device_node *node,
 			gic_base = read_gcr_gic_base() &
 				~CM_GCR_GIC_BASE_GICEN;
 			gic_len = 0x20000;
+			pr_warn("Using inherited base address %pa\n",
+				&gic_base);
 		} else {
 			pr_err("Failed to get memory range\n");
 			return -ENODEV;
-- 
2.7.4
