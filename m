Received: from 20pmail.ess.barracuda.com ([64.235.154.233]:53767 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992197AbdJKOEvzWeVr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Oct 2017 16:04:51 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/3] clocksource/mips-gic-timer: Ensure IRQs disabled for read-update-write
Date: Wed, 11 Oct 2017 15:01:13 +0100
Message-ID: <1507730474-8577-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1507730474-8577-1-git-send-email-matt.redfearn@mips.com>
References: <1507730474-8577-1-git-send-email-matt.redfearn@mips.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20171011140113.SxQYQGqWX0vEpEJOIGrf72YwlCmdgGmEDv1LeMflccI@z>

The sequence of reading the current count, adding an offset and writing
back to the compare register is timing critical.
Commit e07127a077c7 ("clocksource: mips-gic-timer: Use new GIC accessor
functions") added a local_irq_save / local_irq_restore to protect the
mapping of another VPs registers through the VP redirect region, but
given the timing critical nature of this code it just feels right to
protect the whole read-update-write section, so move the local_irq_save
before the current count is read.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 drivers/clocksource/mips-gic-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 6c94a74682a2..dadac9f3e9c4 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -43,9 +43,9 @@ static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
 	u64 cnt;
 	int res;
 
+	local_irq_save(flags);
 	cnt = gic_read_count();
 	cnt += (u64)delta;
-	local_irq_save(flags);
 	write_gic_vl_other(mips_cm_vp_id(cpumask_first(evt->cpumask)));
 	write_gic_vo_compare(cnt);
 	local_irq_restore(flags);
-- 
2.7.4
