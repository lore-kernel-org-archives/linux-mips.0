Received: from mailapp01.imgtec.com ([195.59.15.196]:7075 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014503AbbCWMc0xuYUb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Mar 2015 13:32:26 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/3] clocksource: mips-gic-timer: Ensure GIC counter is running
Date: Mon, 23 Mar 2015 12:32:02 +0000
Message-ID: <1427113923-9840-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1427113923-9840-1-git-send-email-markos.chandras@imgtec.com>
References: <1427113923-9840-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Message-ID: <20150323123202.Gxlc7fgKHw6Z-maj6PvTo3UbmaPOURRI4CC6oCtTP6E@z>

Start the GIC counter after configuring the clocksource since there
are no guarantees the counter will be running after a CPU reset.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: <linux-kernel@vger.kernel.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 drivers/clocksource/mips-gic-timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 3bd31b1321f6..16adbc1fa4c1 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -133,6 +133,9 @@ static void __init __gic_clocksource_init(void)
 	clocksource_register_hz(&gic_clocksource, gic_frequency);
 
 	gic_clockevent_init();
+
+	/* And finally start the counter */
+	gic_start_count();
 }
 
 void __init gic_clocksource_init(unsigned int frequency)
-- 
2.3.3
