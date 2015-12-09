Received: from mailapp01.imgtec.com ([195.59.15.196]:25069 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013533AbbLIJnatu04S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Dec 2015 10:43:30 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: malta-time: Fix logic inversion waiting for RTC
Date: Wed, 9 Dec 2015 09:43:15 +0000
Message-ID: <1449654195-18034-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: james.hogan@imgtec.com
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org

When estimating the clock frequency based on the RTC, the Update In
Progress flag is used to wait one second. However, the logic waiting for
the falling edge of this signal was inverted such that any read of the
RTC registers may actually occur during the update window and be
undefined.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mti-malta/malta-time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index 67eff9ed157c..3b97cfd0cf4c 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -84,8 +84,8 @@ static void __init estimate_frequencies(void)
 	local_irq_save(flags);
 
 	/* Start counter exactly on falling edge of update flag. */
-	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
 	while (!(CMOS_READ(RTC_REG_A) & RTC_UIP));
+	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
 
 	/* Initialize counters. */
 	start = read_c0_count();
@@ -96,8 +96,8 @@ static void __init estimate_frequencies(void)
 	secs1 = CMOS_READ(RTC_SECONDS);
 
 	/* Read counter exactly on falling edge of update flag. */
-	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
 	while (!(CMOS_READ(RTC_REG_A) & RTC_UIP));
+	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
 
 	count = read_c0_count();
 	if (gic_present)
-- 
2.1.4
