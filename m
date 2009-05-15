Received: from mail-px0-f119.google.com ([209.85.216.119]:52814 "EHLO
	mail-px0-f119.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20023149AbZEOWTv (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:19:51 +0100
Subject: [PATCH 20/30] loongson: Flush RAS and BTB for CPU predictively
 execution
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:19:37 +0800
Message-ID: <1242425977.10164.163.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515221937.ktb6334bI65uCoAkq8URKdnIa5l52rahZrkjxsWSpg8@z>

From b023ba02ea5c0983ffb33ff486b3b4f8b5d972e6 Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Sat, 16 May 2009 04:32:13 +0800
Subject: [PATCH 20/30] loongson: Flush RAS and BTB for CPU predictively
execution

---
 arch/mips/include/asm/stackframe.h |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/mips/include/asm/stackframe.h
b/arch/mips/include/asm/stackframe.h
index db0fa7b..204286e 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -117,6 +117,24 @@
 		.endm
 #else
 		.macro	get_saved_sp	/* Uniprocessor variation */
+#ifdef CONFIG_CPU_LOONGSON2
+		move k0,ra
+		jal 2008f
+		nop
+		2008:
+		jal 2008f
+		nop
+		2008:
+		jal 2008f
+		nop
+		2008:
+		jal 2008f
+		nop
+		2008:
+		move ra,k0
+		li k0,3
+		mtc0 k0,$22
+#endif
 #if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
 		lui	k1, %hi(kernelsp)
 #else
-- 
1.6.2.1
