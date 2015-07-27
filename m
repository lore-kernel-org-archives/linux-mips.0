Received: from mailapp01.imgtec.com ([195.59.15.196]:47418 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011315AbbG0OBaZa91d (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 16:01:30 +0200
From: Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH v4 3/7] clocksource: mips-gic: Split clocksource and clockevent initialization
Date: Mon, 27 Jul 2015 15:00:14 +0100
Message-ID: <1438005618-27003-4-git-send-email-govindraj.raja@imgtec.com>
In-Reply-To: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com>
References: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Govindraj.Raja@imgtec.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150727140014.KspHl1sx0ZlrZYcD416AS8A7lhDUiFuY1JaWKoiNW2Y@z>

From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

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
1.9.1
