Received: from 20pmail.ess.barracuda.com ([64.235.154.233]:45512 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990414AbdJSMChvrdfI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Oct 2017 14:02:37 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH V2 3/3] clocksource: mips-gic-timer: Add fastpath for local timer updates
Date: Thu, 19 Oct 2017 12:55:35 +0100
Message-ID: <1508414135-29123-3-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1508414135-29123-1-git-send-email-matt.redfearn@mips.com>
References: <1508414135-29123-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: James Hogan <james.hogan@mips.com>, linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20171019115535.1bTX_Wg131UhVERnLlFqWLkDqJVo4maQEhhn8-UKt6w@z>

Always accessing the compare register via the CM redirect region is
(relatively) slow. If the timer being updated is the current CPUs
then this can be shortcutted by writing to the CM VP local region.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 drivers/clocksource/mips-gic-timer.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 8e8e3aa25b3f..e8dee5491227 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -39,14 +39,19 @@ static u64 notrace gic_read_count(void)
 
 static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
 {
+	int cpu = cpumask_first(evt->cpumask);
 	unsigned long flags;
 	u64 cnt;
 	int res;
 
 	cnt = gic_read_count();
 	cnt += (u64)delta;
-	write_gic_vl_other(mips_cm_vp_id(cpumask_first(evt->cpumask)));
-	write_gic_vo_compare(cnt);
+	if (cpu == raw_smp_processor_id()) {
+		write_gic_vl_compare(cnt);
+	} else {
+		write_gic_vl_other(mips_cm_vp_id(cpu));
+		write_gic_vo_compare(cnt);
+	}
 	res = ((int)(gic_read_count() - cnt) >= 0) ? -ETIME : 0;
 	return res;
 }
-- 
2.7.4
