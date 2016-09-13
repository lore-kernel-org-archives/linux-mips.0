Received: from mailapp01.imgtec.com ([195.59.15.196]:40105 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991894AbcIMQ5ZYvHSe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Sep 2016 18:57:25 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] clocksource: mips-gic-timer: Print an error if IRQ setup fails
Date: Tue, 13 Sep 2016 17:56:43 +0100
Message-ID: <20160913165644.627-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Message-ID: <20160913165643.p6Wio07x5mxIrYxFw0OxxFLMIRWYMQBq-k7gNzN_2kE@z>

We've checked for errors from setup_irq_percpu since commit f95ac8558b88
("CLOCKSOURCE: mips-gic: Add missing error returns checks") but didn't
print an error message in the failure case. This makes it very easy to
overlook the GIC timer clock event driver not being registered, since
we'll generally just use a different clock event driver if that happens.

Print an error if IRQ setup fails in order to make such problems harder
to miss (ie. not completely silent).

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 drivers/clocksource/mips-gic-timer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b4b3ab5..802055b 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -113,8 +113,11 @@ static int gic_clockevent_init(void)
 		return -ENXIO;
 
 	ret = setup_percpu_irq(gic_timer_irq, &gic_compare_irqaction);
-	if (ret < 0)
+	if (ret < 0) {
+		pr_err("GIC timer IRQ %d setup failed: %d\n",
+		       gic_timer_irq, ret);
 		return ret;
+	}
 
 	cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 			  "AP_MIPS_GIC_TIMER_STARTING", gic_starting_cpu,
-- 
2.9.3
