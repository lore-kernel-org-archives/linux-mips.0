Received: from mail-px0-f119.google.com ([209.85.216.119]:35813 "EHLO
	mail-px0-f119.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20023417AbZEOWeS (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:34:18 +0100
Subject: [PATCH 29/30] loongson: fixup undefined CONFIG_UCA_SIZE
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:34:04 +0800
Message-ID: <1242426844.10164.180.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515223404.IGOuIcRTgagE7IEcZj2zQXTOU7E-Mf76MmFIlT45y7c@z>

From 3e72233003feab86575032851dd374111d0eeaef Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Sat, 16 May 2009 05:04:19 +0800
Subject: [PATCH 29/30] loongson: fixup undefined CONFIG_UCA_SIZE

---
 arch/mips/loongson/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/loongson/Kconfig b/arch/mips/loongson/Kconfig
index 572054c..cef68a0 100644
--- a/arch/mips/loongson/Kconfig
+++ b/arch/mips/loongson/Kconfig
@@ -109,7 +109,7 @@ config CS5536_MFGPT
 
 config UCA_SIZE
  	hex "Uncache Accelerated Region size"
- 	depends on LOONGSON2F 
+	depends on CPU_LOONGSON2F
  	default 0x400000 if LEMOTE_YEELOONG2F
  	default 0x2000000 if LEMOTE_FULOONG2F
  	help
-- 
1.6.2.1
