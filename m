Received: from mailapp01.imgtec.com ([195.59.15.196]:15625 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011951AbbA0VqY3db3z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Jan 2015 22:46:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 8/9] MIPS: OProfile: Allow sharing IRQ with timer
Date: Tue, 27 Jan 2015 21:45:54 +0000
Message-ID: <1422395155-16511-9-git-send-email-james.hogan@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Robert Richter <rric@kernel.org>, oprofile-list@lists.sf.net
Message-ID: <20150127214554.56hUBtvyS7dXqPYfeh6e4zN9hM057Jpjr0bABfIgVqE@z>

When requesting the performance counter overflow interrupt, pass flags
which are compatible with the cevt-r4k driver, in particular
IRQF_SHARED so that the two handlers can share the same IRQ. This is
possible since release 2 of the architecture where there are separate
pending interrupt bits for the timer interrupt and the performance
counter interrupt.

This will be necessary since the FDC interrupt can also be arbitrarily
routed to a CPU interrupt, possibly sharing with the timer, the
performance counters, or both, and it isn't scalable to have all the
handlers able to call other handlers that may be on the same IRQ line.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Robert Richter <rric@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: oprofile-list@lists.sf.net
---
 arch/mips/oprofile/op_model_mipsxx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 24729f023d93..d6b9e69e7c69 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -442,7 +442,10 @@ static int __init mipsxx_init(void)
 
 	if (perfcount_irq >= 0)
 		return request_irq(perfcount_irq, mipsxx_perfcount_int,
-			0, "Perfcounter", save_perf_irq);
+				   IRQF_PERCPU | IRQF_NOBALANCING |
+				   IRQF_NO_THREAD | IRQF_NO_SUSPEND |
+				   IRQF_SHARED,
+				   "Perfcounter", save_perf_irq);
 
 	return 0;
 }
-- 
2.0.5
