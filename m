Received: from mailapp01.imgtec.com ([195.59.15.196]:15323 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026695AbbEMMSNIEVG8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 May 2015 14:18:13 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/2] MIPS: malta-time: Don't switch RTC to BCD mode
Date: Wed, 13 May 2015 13:17:52 +0100
Message-ID: <1431519473-24049-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1431519473-24049-1-git-send-email-james.hogan@imgtec.com>
References: <1431519473-24049-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150513121752.bK6cNudIWOoqJ7J_YQ7v0cRqnYQ4guhBzkedOiUdfNk@z>

On Malta, the RTC is forced into binary coded decimal (BCD) mode during
init, even if the bootloader put it into binary mode (as YAMON does).
This can result in the RTC seconds being an invalid BCD (e.g.
0x1a..0x1f) for up to 6 seconds.

In a future patch we want to take seconds into account when estimating
the frequency, however that would treat a transition from the invalid
BCD 0x1f (calculated as 25) to BCD 0x20 (20) as -5 seconds, which is
wrapped to 55 seconds and results in a very underestimated frequency.

Therefore read-modify-write the control register so that the previous
mode is preserved instead of being forced into BCD mode. This avoids the
possibility of invalid BCD values immediately afterwards.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mti-malta/malta-time.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index 185e68261f45..a030d41eb5a1 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -165,14 +165,18 @@ unsigned int get_c0_compare_int(void)
 
 static void __init init_rtc(void)
 {
+	unsigned char ctrl = CMOS_READ(RTC_CONTROL);
+
 	/* stop the clock whilst setting it up */
-	CMOS_WRITE(RTC_SET | RTC_24H, RTC_CONTROL);
+	ctrl |= RTC_24H | RTC_SET;
+	CMOS_WRITE(ctrl, RTC_CONTROL);
 
 	/* 32KHz time base */
 	CMOS_WRITE(RTC_REF_CLCK_32KHZ, RTC_FREQ_SELECT);
 
 	/* start the clock */
-	CMOS_WRITE(RTC_24H, RTC_CONTROL);
+	ctrl &= ~RTC_SET;
+	CMOS_WRITE(ctrl, RTC_CONTROL);
 }
 
 void __init plat_time_init(void)
-- 
2.3.6
