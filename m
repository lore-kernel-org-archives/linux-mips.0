Received: from smtpout.microchip.com ([198.175.253.82]:15521 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27029443AbcEQFIEMDHd6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 07:08:04 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 02/11] clk: microchip: Initialize SOSC clock rate for PIC32MZDA.
Date: Tue, 17 May 2016 10:35:51 +0530
Message-ID: <1463461560-9629-2-git-send-email-purna.mandal@microchip.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Message-ID: <20160517050551.xF2h3PdrBkvMKSdnpMX6_2Kv6i-fyMhYvUBh1gsB4Lw@z>

Optional SOSC is an external fixed clock running at 32768HZ.
So Initialize SOSC rate as per PIC32MZDA datasheet.

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>

---
Note: Please pull this complete series through the MIPS tree.

---

 drivers/clk/microchip/clk-pic32mzda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
index 020a29a..210694b 100644
--- a/drivers/clk/microchip/clk-pic32mzda.c
+++ b/drivers/clk/microchip/clk-pic32mzda.c
@@ -118,6 +118,7 @@ static const struct pic32_sec_osc_data sosc_clk = {
 	.status_reg = 0x1d0,
 	.enable_mask = BIT(1),
 	.status_mask = BIT(4),
+	.fixed_rate = 32768,
 	.init_data = {
 		.name = "sosc_clk",
 		.parent_names = NULL,
-- 
1.8.3.1
