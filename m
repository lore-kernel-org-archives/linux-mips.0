Received: from mailapp01.imgtec.com ([195.59.15.196]:9818 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993954AbdHWSVhzYfcI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:21:37 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 10/11] MIPS: Remove plat_timer_setup()
Date: Wed, 23 Aug 2017 11:17:53 -0700
Message-ID: <20170823181754.24044-11-paul.burton@imgtec.com>
In-Reply-To: <20170823181754.24044-1-paul.burton@imgtec.com>
References: <20170823181754.24044-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823181753.GeqVkgzlbBp_fwlWrnT4e1cnKJ3zNo2-wmWLIKbqH88@z>

The plat_timer_setup() function is entirely unused - nothing calls it,
and no platforms provide it. Perhaps our dummy implementation was once
useful as an aid in forward porting platforms, but its time has long
since passed so let's remove the dead code.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/time.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/mips/kernel/time.c b/arch/mips/kernel/time.c
index c036157fb891..a6ebc8135112 100644
--- a/arch/mips/kernel/time.c
+++ b/arch/mips/kernel/time.c
@@ -72,20 +72,6 @@ EXPORT_SYMBOL(perf_irq);
 unsigned int mips_hpt_frequency;
 EXPORT_SYMBOL_GPL(mips_hpt_frequency);
 
-/*
- * This function exists in order to cause an error due to a duplicate
- * definition if platform code should have its own implementation.  The hook
- * to use instead is plat_time_init.  plat_time_init does not receive the
- * irqaction pointer argument anymore.	This is because any function which
- * initializes an interrupt timer now takes care of its own request_irq rsp.
- * setup_irq calls and each clock_event_device should use its own
- * struct irqrequest.
- */
-void __init plat_timer_setup(void)
-{
-	BUG();
-}
-
 static __init int cpu_has_mfc0_count_bug(void)
 {
 	switch (current_cpu_type()) {
-- 
2.14.1
