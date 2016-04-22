Received: from mailapp01.imgtec.com ([195.59.15.196]:48396 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026343AbcDVRThHiVwU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 19:19:37 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/4] MIPS: malta-time: Start GIC count before syncing to RTC
Date: Fri, 22 Apr 2016 18:19:14 +0100
Message-ID: <1461345557-2763-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1461345557-2763-1-git-send-email-james.hogan@imgtec.com>
References: <1461345557-2763-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160422171914.yHOBXirKVCIan0_GYoV7nsPQuVa_-tXi9iZ3ALcx1cY@z>

The sampling of the GIC counter on Malta after observing a rising edge
of the RTC update flag differs slightly between the first and second
sample, with the first sample also calling gic_start_count(). The two
samples should really be taken as similarly as possible to get the most
accurate figure, so move the gic_start_count() call before detecting the
rising edge.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mti-malta/malta-time.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index b7bf721eabf5..2539687b77f6 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -81,16 +81,16 @@ static void __init estimate_frequencies(void)
 
 	local_irq_save(flags);
 
-	/* Start counter exactly on falling edge of update flag. */
-	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
-	while (!(CMOS_READ(RTC_REG_A) & RTC_UIP));
-
-	/* Initialize counters. */
-	start = read_c0_count();
-	if (gic_present) {
+	if (gic_present)
 		gic_start_count();
+
+	/* Read counter exactly on falling edge of update flag. */
+	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
+	while (!(CMOS_READ(RTC_REG_A) & RTC_UIP));
+
+	start = read_c0_count();
+	if (gic_present)
 		gicstart = gic_read_count();
-	}
 
 	/* Read counter exactly on falling edge of update flag. */
 	while (CMOS_READ(RTC_REG_A) & RTC_UIP);
-- 
2.4.10
