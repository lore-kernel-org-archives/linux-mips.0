Received: from mailapp01.imgtec.com ([195.59.15.196]:3243 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009996AbbGIJlzkC4Dh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:55 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 5067F1ED30ED9
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:48 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 16/19] MIPS: kernel: cpu-probe: Remove cp0 hazard barrier when enabling the FTLB
Date: Thu, 9 Jul 2015 10:40:50 +0100
Message-ID: <1436434853-30001-17-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150709094050.JDnXUYIx_FmEdK8Hb3hqOdcka8stjKJQ3UcZYsYaNMQ@z>

We are so early in the boot process where we really don't want to
stall and wait for CP0 FTLB related changes become visible so just drop
the cp0 hazard barrier.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 02b75127dad3..dc057f37305b 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -385,7 +385,6 @@ static void set_ftlb_enable(struct cpuinfo_mips *c, int enable)
 		else
 			/* Disable FTLB */
 			write_c0_config6(config6 &  ~MIPS_CONF6_FTLBEN);
-		back_to_back_c0_hazard();
 		break;
 	}
 }
-- 
2.4.5
