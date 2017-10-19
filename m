Received: from 20pmail.ess.barracuda.com ([64.235.154.232]:50861 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992604AbdJSMCkOu0XI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Oct 2017 14:02:40 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/3] clocksource/mips-gic-timer: Remove pointless irq_save,restore
Date: Thu, 19 Oct 2017 12:55:34 +0100
Message-ID: <1508414135-29123-2-git-send-email-matt.redfearn@mips.com>
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
Message-ID: <20171019115534.l6BNkap3zbFuXEJVzuAqkOMp0-GmBfWqAskErIbPjdc@z>

gic_next_event is always called with interrupts disabled, so the save /
restore is pointless - remove it.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
---

 drivers/clocksource/mips-gic-timer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index ae3167c28b12..8e8e3aa25b3f 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -45,10 +45,8 @@ static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
 
 	cnt = gic_read_count();
 	cnt += (u64)delta;
-	local_irq_save(flags);
 	write_gic_vl_other(mips_cm_vp_id(cpumask_first(evt->cpumask)));
 	write_gic_vo_compare(cnt);
-	local_irq_restore(flags);
 	res = ((int)(gic_read_count() - cnt) >= 0) ? -ETIME : 0;
 	return res;
 }
-- 
2.7.4
