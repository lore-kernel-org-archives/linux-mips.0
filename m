Received: from mailapp01.imgtec.com ([195.59.15.196]:37928 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992285AbcIMQ5jeNxce (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Sep 2016 18:57:39 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/2] clocksource: mips-gic-timer: Stop checking cpu_has_counter
Date: Tue, 13 Sep 2016 17:56:44 +0100
Message-ID: <20160913165644.627-2-paul.burton@imgtec.com>
In-Reply-To: <20160913165644.627-1-paul.burton@imgtec.com>
References: <20160913165644.627-1-paul.burton@imgtec.com>
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
Message-ID: <20160913165644.zt0_pfWhqa360deCt6CawWvkm9rPP8cYnnIe58Y_r80@z>

The cpu_has_counter macro indicates whether the current CPU has a
working coprocessor 0 count & compare registers, and has no bearing on
the GIC. Stop checking it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 drivers/clocksource/mips-gic-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 802055b..7a960cd 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -109,7 +109,7 @@ static int gic_clockevent_init(void)
 {
 	int ret;
 
-	if (!cpu_has_counter || !gic_frequency)
+	if (!gic_frequency)
 		return -ENXIO;
 
 	ret = setup_percpu_irq(gic_timer_irq, &gic_compare_irqaction);
-- 
2.9.3
