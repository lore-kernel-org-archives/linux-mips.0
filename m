Received: from mailapp01.imgtec.com ([195.89.28.115]:55414 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834702AbaDPM5Du2CiQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 14:57:03 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3108A89233F5
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 13:56:55 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 10/39] MIPS: allow R4K clockevent device to function regardless of GIC
Date: Wed, 16 Apr 2014 13:53:01 +0100
Message-ID: <1397652810-4336-11-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140416125301.5x-MJ4wUHvoep94MvLsLLvgaCeabUUu11rwJU5BcHlI@z>

Having the GIC clockevent driver compiled should not prevent the R4K
timer clockevent driver from functioning. One will be selected as the
CPU local timer based upon their priorities and the other may simply be
unused or in the case of the GIC timer may be used as the tick broadcast
device.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cevt-r4k.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index f3c549c..4dcd1fb 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -72,9 +72,6 @@ irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
 		/* Clear Count/Compare Interrupt */
 		write_c0_compare(read_c0_compare());
 		cd = &per_cpu(mips_clockevent_device, cpu);
-#ifdef CONFIG_CEVT_GIC
-		if (!gic_present)
-#endif
 		cd->event_handler(cd);
 	}
 
@@ -212,9 +209,6 @@ int r4k_clockevent_init(void)
 	cd->set_mode		= mips_set_clock_mode;
 	cd->event_handler	= mips_event_handler;
 
-#ifdef CONFIG_CEVT_GIC
-	if (!gic_present)
-#endif
 	clockevents_register_device(cd);
 
 	if (cp0_timer_irq_installed)
-- 
1.8.5.3
