Received: from 20pmail.ess.barracuda.com ([64.235.154.233]:42784 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990414AbdJSMBQt5RMI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Oct 2017 14:01:16 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/3] clockevents: Retry programming min delta up to 10 times
Date: Thu, 19 Oct 2017 12:55:33 +0100
Message-ID: <1508414135-29123-1-git-send-email-matt.redfearn@mips.com>
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
Cc: James Hogan <james.hogan@mips.com>, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>, Matt Redfearn <matt.redfearn@mips.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-kernel@vger.kernel.org
Message-ID: <20171019115533.vKKzxIxVJ3x24lj7GCL3LSRjlCkI_AK6rnqEFXnKrCo@z>

From: James Hogan <jhogan@kernel.org>

When CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=n, the call path
hrtimer_reprogram -> clockevents_program_event ->
clockevents_program_min_delta will not retry if the clock event driver
returns -ETIME.

If the driver could not satisfy the program_min_delta for any reason,
the lack of a retry means the CPU may not receive a tick interrupt,
potentially until the counter does a full period. This leads to
rcu_sched timeout messages as the stalled CPU is detected by other CPUs,
and other issues if the CPU is holding locks or other resources at the
point at which it stalls.

There have been a couple of observed mechanisms through which a clock
event driver could not satisfy the requested min_delta and return
-ETIME.

With the MIPS GIC driver, the shared execution resource within MT cores
means inconventient latency due to execution of instructions from other
hardware threads in the core, within gic_next_event, can result in an
event being set in the past.

Additionally under virtualisation it is possible to get unexpected
latency during a clockevent device's set_next_event() callback which can
make it return -ETIME even for a delta based on min_delta_ns.

It isn't appropriate to use MIN_ADJUST in the virtualisation case as
occasional hypervisor induced high latency will cause min_delta_ns to
quickly increase to the maximum.

Instead, borrow the retry pattern from the MIN_ADJUST case, but without
making adjustments. We retry up to 10 times before giving up.

Signed-off-by: James Hogan <jhogan@kernel.org>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
---

 kernel/time/clockevents.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index 4237e0744e26..9e5b7ed22dfd 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -281,16 +281,28 @@ static int clockevents_program_min_delta(struct clock_event_device *dev)
 {
 	unsigned long long clc;
 	int64_t delta;
+	int i;
 
-	delta = dev->min_delta_ns;
-	dev->next_event = ktime_add_ns(ktime_get(), delta);
+	for (i = 0;;) {
+		delta = dev->min_delta_ns;
+		dev->next_event = ktime_add_ns(ktime_get(), delta);
 
-	if (clockevent_state_shutdown(dev))
-		return 0;
+		if (clockevent_state_shutdown(dev))
+			return 0;
 
-	dev->retries++;
-	clc = ((unsigned long long) delta * dev->mult) >> dev->shift;
-	return dev->set_next_event((unsigned long) clc, dev);
+		dev->retries++;
+		clc = ((unsigned long long) delta * dev->mult) >> dev->shift;
+		if (dev->set_next_event((unsigned long) clc, dev) == 0)
+			return 0;
+
+		if (++i > 9) {
+			/*
+			 * We tried 10 times to program the device with the
+			 * given min_delta_ns. Get out of here.
+			 */
+			return -ETIME;
+		}
+	}
 }
 
 #endif /* CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST */
-- 
2.7.4
