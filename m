Received: from mailapp01.imgtec.com ([195.59.15.196]:16387 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993929AbdFBTbygiepn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 21:31:54 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 5/9] MIPS: generic: Set RTC_ALWAYS_BCD to 0
Date: Fri, 2 Jun 2017 12:29:55 -0700
Message-ID: <20170602192959.25435-6-paul.burton@imgtec.com>
In-Reply-To: <20170602192959.25435-1-paul.burton@imgtec.com>
References: <20170602192959.25435-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602192955.ak_xivUTxInmlPrEv3qFq5wBzqm7llsVPe4-qkc6fJk@z>

Drivers for the mc146818 RTC generally check control registers to
determine whether a value is encoded as binary or as a binary coded
decimal. Setting RTC_ALWAYS_BCD to 1 effectively bypasses these checks
and causes drivers to always expect binary coded decimal values,
regardless of control register values.

This does not seem like a sane default - defaulting to 0 allows the
drivers to check control registers to determine encoding type & allows
the driver to work generically with both binary & BCD encodings. Set
this in mach-generic/mc146818rtc.h such that the generic kernel, or
platforms which don't provide a custom mc146818rtc.h, can have an RTC
driver which works with both encodings.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/include/asm/mach-generic/mc146818rtc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-generic/mc146818rtc.h b/arch/mips/include/asm/mach-generic/mc146818rtc.h
index 0b9a942f079d..9c72e540ff56 100644
--- a/arch/mips/include/asm/mach-generic/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-generic/mc146818rtc.h
@@ -27,7 +27,7 @@ static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
 	outb_p(data, RTC_PORT(1));
 }
 
-#define RTC_ALWAYS_BCD	1
+#define RTC_ALWAYS_BCD	0
 
 #ifndef mc146818_decode_year
 #define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1900)
-- 
2.13.0
