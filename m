Received: from mailapp01.imgtec.com ([195.59.15.196]:52986 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010088AbbGQOzETv1Hw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Jul 2015 16:55:04 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2] MIPS: malta-time: Don't reinitialise RTC
Date: Fri, 17 Jul 2015 15:54:41 +0100
Message-ID: <1437144881-26431-1-git-send-email-james.hogan@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, stable@vger.kernel.org
Message-ID: <20150717145441.IMgZFDUIGCViItJIROrXNchXql-y9JPwvXLlDeTfYis@z>

On Malta, since commit a87ea88d8f6c ("MIPS: Malta: initialise the RTC at
boot"), the RTC is reinitialised and forced into binary coded decimal
(BCD) mode during init, even if the bootloader has already initialised
it, and may even have already put it into binary mode (as YAMON does).
This corrupts the current time, can result in the RTC seconds being an
invalid BCD (e.g. 0x1a..0x1f) for up to 6 seconds, as well as confusing
YAMON for a while after reset, enough for it to report timeouts when
attempting to load from TFTP (it actually uses the RTC in that code).

Therefore only initialise the RTC to the extent that is necessary so
that Linux avoids interfering with the bootloader setup, while also
allowing it to estimate the CPU frequency without hanging, without a
bootloader necessarily having done anything with the RTC (for example
when the kernel is loaded via EJTAG).

The divider control is configured for a 32KHZ reference clock if
necessary, and the SET bit of the RTC_CONTROL register is cleared if
necessary without changing any other bits (this bit will be set when
coming out of reset if the battery has been disconnected).

Fixes: a87ea88d8f6c ("MIPS: Malta: initialise the RTC at boot")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.14+
---
 arch/mips/mti-malta/malta-time.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index 5625b190edc0..c1dc730471e0 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -171,14 +171,17 @@ unsigned int get_c0_compare_int(void)
 
 static void __init init_rtc(void)
 {
-	/* stop the clock whilst setting it up */
-	CMOS_WRITE(RTC_SET | RTC_24H, RTC_CONTROL);
+	unsigned char freq, ctrl;
 
-	/* 32KHz time base */
-	CMOS_WRITE(RTC_REF_CLCK_32KHZ, RTC_FREQ_SELECT);
+	/* Set 32KHz time base if not already set */
+	freq = CMOS_READ(RTC_FREQ_SELECT);
+	if ((freq & RTC_DIV_CTL) != RTC_REF_CLCK_32KHZ)
+		CMOS_WRITE(RTC_REF_CLCK_32KHZ, RTC_FREQ_SELECT);
 
-	/* start the clock */
-	CMOS_WRITE(RTC_24H, RTC_CONTROL);
+	/* Ensure SET bit is clear so RTC can run */
+	ctrl = CMOS_READ(RTC_CONTROL);
+	if (ctrl & RTC_SET)
+		CMOS_WRITE(ctrl & ~RTC_SET, RTC_CONTROL);
 }
 
 void __init plat_time_init(void)
-- 
2.3.6
