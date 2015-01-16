Received: from mailapp01.imgtec.com ([195.59.15.196]:53024 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010648AbbAPKwn3jcnb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:43 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DFA647FE76211
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:35 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 27/70] MIPS: kernel: cevt-r4k: Add MIPS R6 to the c0_compare_interrupt handler
Date: Fri, 16 Jan 2015 10:49:06 +0000
Message-ID: <1421405389-15512-28-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104906.Gb0JvMFiOTbL3ElbwaiTd8MRV88Y37GfYBMme-F7GQg@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Just like MIPS R2, in MIPS R6 it is possible to determine if a
timer interrupt has happened or not.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cevt-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 6acaad0480af..6684b042a29a 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -40,7 +40,7 @@ int cp0_timer_irq_installed;
 
 irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
 {
-	const int r2 = cpu_has_mips_r2;
+	const int r2 = cpu_has_mips_r2 | cpu_has_mips_r6;
 	struct clock_event_device *cd;
 	int cpu = smp_processor_id();
 
-- 
2.2.1
