Received: from mailapp01.imgtec.com ([195.59.15.196]:64976 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011926AbbA0VqUh3IYY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Jan 2015 22:46:20 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/9] MIPS: Use CAUSEF_TI, CAUSEF_PCI constants
Date: Tue, 27 Jan 2015 21:45:48 +0000
Message-ID: <1422395155-16511-3-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20150127214548.Ln3T8sAeP2NhqAsFpJtcnDEqE1DKxWgOfoEbGznKNVk@z>

Use CAUSEF_TI and CAUSEF_PCI constants from asm/mipsregs.h rather than
the magic values (1 << 30) and (1 << 26).

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/cevt-r4k.c          | 2 +-
 arch/mips/oprofile/op_model_mipsxx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 02dd77955a6f..d68a678b7e4e 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -76,7 +76,7 @@ irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
 	 * above we now know that the reason we got here must be a timer
 	 * interrupt.  Being the paranoiacs we are we check anyway.
 	 */
-	if (!r2 || (read_c0_cause() & (1 << 30))) {
+	if (!r2 || (read_c0_cause() & CAUSEF_TI)) {
 		/* Clear Count/Compare Interrupt */
 		write_c0_compare(read_c0_compare());
 		cd = &per_cpu(mips_clockevent_device, cpu);
diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 01f721a85c5b..faf0d4ad0cc2 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -246,7 +246,7 @@ static int mipsxx_perfcount_handler(void)
 	unsigned int counter;
 	int handled = IRQ_NONE;
 
-	if (cpu_has_mips_r2 && !(read_c0_cause() & (1 << 26)))
+	if (cpu_has_mips_r2 && !(read_c0_cause() & CAUSEF_PCI))
 		return handled;
 
 	switch (counters) {
-- 
2.0.5
