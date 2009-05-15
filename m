Received: from wf-out-1314.google.com ([209.85.200.175]:16889 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20023321AbZEOWAN (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 15 May 2009 23:00:13 +0100
Subject: [PATCH 03/30] fix error: incompatiable argument type of clear_user
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Content-Type: text/plain
Date: Sat, 16 May 2009 06:00:04 +0800
Message-ID: <1242424804.10164.142.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090515220004.yi5eUv96ZyclEAAuqF7ExVpcHFF3QRGFS0vSAoZwDJk@z>

From c007d5f66af1b0134699644576f2d8994216057e Mon Sep 17 00:00:00 2001
From: Wu Zhangjin <wuzhangjin@gmail.com>
Date: Fri, 15 May 2009 20:36:20 +0800
Subject: [PATCH 03/30] fix error: incompatiable argument type of
clear_user

there are lots of warnings about the macro: clear_user in linux-mips.
in linux-2.6.29.3, it will come with errors, so, must be fixed.

the type of the second argument of access_ok should be (void __user *),
but there is an un-needed (unsigned long) conversion before __cl_addr,
so, remove the (unsigned long) will fix this problem.
---
 arch/mips/include/asm/uaccess.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h
b/arch/mips/include/asm/uaccess.h
index 42b9cec..cd32e9f 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -936,7 +936,7 @@ __clear_user(void __user *addr, __kernel_size_t
size)
 	void __user * __cl_addr = (addr);				\
 	unsigned long __cl_size = (n);					\
 	if (__cl_size && access_ok(VERIFY_WRITE,			\
-		((unsigned long)(__cl_addr)), __cl_size))		\
+					__cl_addr, __cl_size))		\
 		__cl_size = __clear_user(__cl_addr, __cl_size);		\
 	__cl_size;							\
 })
-- 
1.6.2.1
