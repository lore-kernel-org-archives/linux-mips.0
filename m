Received: from exsmtp01.microchip.com ([198.175.253.37]:21924 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27029438AbcEQFH7vYwV6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 07:07:59 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 01/11] clk: microchip: use readl_poll_timeout() in pbclk_set_rate().
Date: Tue, 17 May 2016 10:35:50 +0530
Message-ID: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
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
Message-ID: <20160517050550.ejkOl1JUxSaecr1YtknHrXwlkkVcxk0DZtxjmjTA8kM@z>

pbclk_set_rate() is using readl_poll_timeout_atomic() even
though spinlock is released. Fix it by replacing with
readl_poll_timeout().

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---
Note: Please pull this complete series through the MIPS tree.

---

 drivers/clk/microchip/clk-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index ca85cea..c3b3014 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -199,9 +199,9 @@ static int pbclk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_unlock_irqrestore(&pb->core->reg_lock, flags);
 
-	/* wait again, for pbdivready */
-	err = readl_poll_timeout_atomic(pb->ctrl_reg, v, v & PB_DIV_READY,
-					1, LOCK_TIMEOUT_US);
+	/* wait again for DIV_READY */
+	err = readl_poll_timeout(pb->ctrl_reg, v, v & PB_DIV_READY,
+				 1, LOCK_TIMEOUT_US);
 	if (err)
 		return err;
 
-- 
1.8.3.1
