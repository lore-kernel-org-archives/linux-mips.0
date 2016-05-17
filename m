Received: from exsmtp01.microchip.com ([198.175.253.37]:22124 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27029446AbcEQFI3hQrA6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 07:08:29 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 04/11] irqchip: irq-pic32-evic: Fix bug with external interrupts.
Date: Tue, 17 May 2016 10:35:53 +0530
Message-ID: <1463461560-9629-4-git-send-email-purna.mandal@microchip.com>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Purna.Mandal@microchip.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Joshua Henderson <digitalpeer@digitalpeer.com>, Purna Chandra Mandal <purna.mandal@microchip.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20160517050553.RITuna3lXpnQCOXobaUHgosEqm4yoRo5oWCgt4K6drQ@z>

From: Joshua Henderson <digitalpeer@digitalpeer.com>

The wrong external interrupt bits are being set, offset by 1.

Signed-off-by: Joshua Henderson <digitalpeer@digitalpeer.com>
Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>

---

 drivers/irqchip/irq-pic32-evic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
index e7155db..73addb4 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -91,7 +91,7 @@ static int pic32_set_type_edge(struct irq_data *data,
 	/* set polarity for external interrupts only */
 	for (i = 0; i < ARRAY_SIZE(priv->ext_irqs); i++) {
 		if (priv->ext_irqs[i] == data->hwirq) {
-			ret = pic32_set_ext_polarity(i + 1, flow_type);
+			ret = pic32_set_ext_polarity(i, flow_type);
 			if (ret)
 				return ret;
 		}
-- 
1.8.3.1
