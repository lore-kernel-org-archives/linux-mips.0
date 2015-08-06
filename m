Received: from mail-pd0-f178.google.com ([209.85.192.178]:35380 "EHLO
        mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011498AbbHFI4Pc2Dgm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 10:56:15 +0200
Received: by pdrg1 with SMTP id g1so30074741pdr.2
        for <linux-mips@linux-mips.org>; Thu, 06 Aug 2015 01:56:09 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] MIPS:loongson64:hpet: Drop the dangling 'set_mode' assignment
Date: Thu,  6 Aug 2015 14:25:50 +0530
Message-ID: <45d35e38970b9c7196faa3a6892d2b5e4e6f40aa.1438851213.git.viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: linaro-kernel@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Hongliang Tao <taohl@lemote.com>, Huacai Chen <chenhc@lemote.com>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@linux-mips.org>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Valentin Rothberg <valentinrothberg@gmail.com>
Message-ID: <20150806085550.S2aBQ02013rPBOggZ-yzkXvS7_LAF7-hDnVmnSYMqsg@z>

This should have been removed by: 604cbe1de254 ("MIPS: loongson64/timer:
Migrate to new 'set-state' interface") commit, but it wasn't.

Remove it now.

Fixes: 604cbe1de254 ("MIPS: loongson64/timer: Migrate to new 'set-state' interface")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Ralf:

Not sure how it was left out in my series, but I thought it should have
been caught by the compilers as the function hpet_set_mode doesn't exist
today.

Either merge it with the offending commit or keep it separate.

 arch/mips/loongson64/loongson-3/hpet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/loongson64/loongson-3/hpet.c b/arch/mips/loongson64/loongson-3/hpet.c
index 950096e8d7cd..bf9f1a77f0e5 100644
--- a/arch/mips/loongson64/loongson-3/hpet.c
+++ b/arch/mips/loongson64/loongson-3/hpet.c
@@ -228,7 +228,6 @@ void __init setup_hpet_timer(void)
 	cd->name = "hpet";
 	cd->rating = 320;
 	cd->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
-	cd->set_mode = hpet_set_mode;
 	cd->set_state_shutdown = hpet_set_state_shutdown;
 	cd->set_state_periodic = hpet_set_state_periodic;
 	cd->set_state_oneshot = hpet_set_state_oneshot;
-- 
2.4.0
