Received: from mailapp01.imgtec.com ([195.59.15.196]:53432 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011931AbbA0VqXQd0e0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Jan 2015 22:46:23 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 6/9] MIPS: cevt-r4k: Make interrupt handler shared
Date: Tue, 27 Jan 2015 21:45:52 +0000
Message-ID: <1422395155-16511-7-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422395155-16511-1-git-send-email-james.hogan@imgtec.com>
References: <1422395155-16511-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20150127214552.Sr7q5ZipjenmMAEaqhYpK4CxgZplqdJ2Kv-ouGfaFVs@z>

Make the cevt-r4k interrupt handler shared so that other interrupt
handlers (specifically the performance counter overflow handler and fast
debug channel interrupt handler) can share the same interrupt line.

This simply imvolves returning IRQ_NONE when no timer interrupt has been
handled to allow other handlers to run, and passing IRQF_SHARED when
setting up the IRQ handler so that other handlers (with compatible
flags) can be registered.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/cevt-r4k.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index d68a678b7e4e..8044981e9399 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -81,6 +81,8 @@ irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
 		write_c0_compare(read_c0_compare());
 		cd = &per_cpu(mips_clockevent_device, cpu);
 		cd->event_handler(cd);
+	} else {
+		return IRQ_NONE;
 	}
 
 out:
@@ -89,7 +91,11 @@ out:
 
 struct irqaction c0_compare_irqaction = {
 	.handler = c0_compare_interrupt,
-	.flags = IRQF_PERCPU | IRQF_TIMER,
+	/*
+	 * IRQF_SHARED: The timer interrupt may be shared with other interrupts
+	 * such as perf counter and FDC interrupts.
+	 */
+	.flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED,
 	.name = "timer",
 };
 
-- 
2.0.5
