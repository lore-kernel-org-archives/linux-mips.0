Received: from mailapp01.imgtec.com ([195.59.15.196]:14407 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013593AbbEUVmYF6o68 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 May 2015 23:42:24 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 1/7] clocksource: mips-gic: Enable the clock before using it
Date: Thu, 21 May 2015 18:37:34 -0300
Message-ID: <1432244260-14908-2-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ezequiel.Garcia@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Damien.Horsley@imgtec.com, Govindraj.Raja@imgtec.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150521213734.uuCflePtQqI_J9Vvgon-_BZDaJuhXXQ8tTNMgemnQSs@z>

For the clock to be used (e.g. get its rate through clk_get_rate)
it should be prepared and enabled first.

Also, while the clock is enabled the driver must hold a reference to it,
so let's remove the call to clk_put.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/clocksource/mips-gic-timer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b81ed1a..913585d 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -158,8 +158,13 @@ static void __init gic_clocksource_of_init(struct device_node *node)
 
 	clk = of_clk_get(node, 0);
 	if (!IS_ERR(clk)) {
+		if (clk_prepare_enable(clk) < 0) {
+			pr_err("GIC failed to enable clock\n");
+			clk_put(clk);
+			return;
+		}
+
 		gic_frequency = clk_get_rate(clk);
-		clk_put(clk);
 	} else if (of_property_read_u32(node, "clock-frequency",
 					&gic_frequency)) {
 		pr_err("GIC frequency not specified.\n");
-- 
2.3.3
