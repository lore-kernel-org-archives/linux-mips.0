Received: from mailapp01.imgtec.com ([195.59.15.196]:57485 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007278AbbEZSnN0A0rv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 May 2015 20:43:13 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH v2 3/7] clocksource: mips-gic: Split clocksource and clockevent initialization
Date: Tue, 26 May 2015 15:39:04 -0300
Message-ID: <1432665548-16024-4-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1432665548-16024-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432665548-16024-1-git-send-email-ezequiel.garcia@imgtec.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Govindraj.Raja@imgtec.com, Damien.Horsley@imgtec.com, James Hogan <james.hogan@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150526183904.WbLzQXkU0PnL0Ka9odNPX85rAQtwrGcyWERLFZGYw6M@z>

This is preparation work for the introduction of clockevent frequency
update with a clock notifier. This is only possible when the device
is passed a clk struct, so let's split the legacy and devicetree
initialization.

Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/clocksource/mips-gic-timer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index c4352f0..22a4daf 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -142,11 +142,6 @@ static void __init __gic_clocksource_init(void)
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)
 		pr_warn("GIC: Unable to register clocksource\n");
-
-	gic_clockevent_init();
-
-	/* And finally start the counter */
-	gic_start_count();
 }
 
 void __init gic_clocksource_init(unsigned int frequency)
@@ -156,6 +151,10 @@ void __init gic_clocksource_init(unsigned int frequency)
 		GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_COMPARE);
 
 	__gic_clocksource_init();
+	gic_clockevent_init();
+
+	/* And finally start the counter */
+	gic_start_count();
 }
 
 static void __init gic_clocksource_of_init(struct device_node *node)
@@ -187,6 +186,10 @@ static void __init gic_clocksource_of_init(struct device_node *node)
 	}
 
 	__gic_clocksource_init();
+	gic_clockevent_init();
+
+	/* And finally start the counter */
+	gic_start_count();
 }
 CLOCKSOURCE_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
 		       gic_clocksource_of_init);
-- 
2.3.3
