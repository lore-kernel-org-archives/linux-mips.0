Received: from mail-cys01nam02on0047.outbound.protection.outlook.com ([104.47.37.47]:32616
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992509AbcHZTCThKSwY (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 26 Aug 2016 21:02:19 +0200
Subject: [PATCH v2] MIPS: Octeon: mark GPIO controller node not populated
 after IRQ init.
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <57C0922C.40907@cavium.com>
Date: Fri, 26 Aug 2016 14:02:04 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
Message-ID: <20160826190204.Ls5fbzz03UVuMXyEdFowhzaT9GoVm_3QBEp58naNHBU@z>

We clear the OF_POPULATED flag for the GPIO controller node on Octeon
processors. Otherwise, none of the devices hanging on the GPIO lines
are probed. The 'gpio-leds' driver on OCTEON failed to probe in addition
to other devices on Cavium 71xx and 78xx development boards.

Fixes: 15cc2ed6dcf9 ("of/irq: Mark initialised interrupt controllers as populated")
Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/mips/cavium-octeon/octeon-irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index 5a9b87b..c1eb1ff 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1619,6 +1619,12 @@ static int __init octeon_irq_init_gpio(
 		return -ENOMEM;
 	}

+	/*
+	 * Clear the OF_POPULATED flag that was set by of_irq_init()
+	 * so that all GPIO devices will be probed.
+	 */
+	of_node_clear_flag(gpio_node, OF_POPULATED);
+
 	return 0;
 }
 /*
-- 
1.9.1
