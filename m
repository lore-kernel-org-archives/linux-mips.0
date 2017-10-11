Received: from 20pmail.ess.barracuda.com ([64.235.150.246]:43665 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992214AbdJKODcmx2vr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Oct 2017 16:03:32 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/3] clocksource/mips-gic-timer: Fix rcu_sched timeouts from multithreading
Date: Wed, 11 Oct 2017 15:01:12 +0100
Message-ID: <1507730474-8577-1-git-send-email-matt.redfearn@mips.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Matt Redfearn <matt.redfearn@imgtec.com>, "# v3 . 19 +" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <20171011140112.OFzEmHRId7HfXy1gjncOzHwmYAluopK4BHrGfxbQEzE@z>

When the MIPS GIC clockevent code was written, it appears to have
inherited the 0x300 cycle min delta from the MIPS CPU timer driver. This
is suboptimal for two reasons.

Firstly, the CPU timer counts once every other cycle (i.e. half the
clock rate). The GIC counts once per clock. Assuming that the GIC and
CPU share the same clock this means the GIC is counting twice as fast,
and so the min delta should be (at least) doubled. Fix this by doubling
the min delta to 0x600.

Secondly, the fixed min delta ignores the fact that with MIPS
multithreading active, execution resource within a core is shared
between the hardware threads within that core. An inconvenienly timed
switch of executing thread within gic_next_event, between the read and
write of updated count, can result in the CPU writing an event in the
past, and subsequently not receiving a tick interrupt until the counter
wraps. This stalls the CPU from the RCU scheduler. Other CPUs detect
this and print rcu_sched timeout messages in  the kernel log. It can
lead to other issues as well if the CPU is holding locks or other
resources at the point at which it stalls. Fix this by scaling the min
delta for the timer based on the number of threads in the core
(smp_num_siblings). This accounts for the greater average runtime of
CPUs within a multithreading core.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Fixes: b695d8e6ad6f ("clocksource: mips-gic: Use clockevents_config_and_register")
Cc: <stable@vger.kernel.org> # v3.19 +

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 drivers/clocksource/mips-gic-timer.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index ae3167c28b12..6c94a74682a2 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -72,6 +72,9 @@ struct irqaction gic_compare_irqaction = {
 static void gic_clockevent_cpu_init(unsigned int cpu,
 				    struct clock_event_device *cd)
 {
+	unsigned long max_d = 0x7fffffff;
+	unsigned long min_d = 0x600;
+
 	cd->name		= "MIPS GIC";
 	cd->features		= CLOCK_EVT_FEAT_ONESHOT |
 				  CLOCK_EVT_FEAT_C3STOP;
@@ -81,7 +84,15 @@ static void gic_clockevent_cpu_init(unsigned int cpu,
 	cd->cpumask		= cpumask_of(cpu);
 	cd->set_next_event	= gic_next_event;
 
-	clockevents_config_and_register(cd, gic_frequency, 0x300, 0x7fffffff);
+	/*
+	 * The min_delta is sensitive to the number of hardware threads in
+	 * the core. With more threads each thread will, on average, get
+	 * less instructions executed per clock. To account for this, we
+	 * scale the min delta based on the number of threads per core.
+	 */
+	min_d *= smp_num_siblings;
+
+	clockevents_config_and_register(cd, gic_frequency, min_d, max_d);
 
 	enable_percpu_irq(gic_timer_irq, IRQ_TYPE_NONE);
 }
-- 
2.7.4
