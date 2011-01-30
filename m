Received: from moutng.kundenserver.de ([212.227.126.187]:53922 "EHLO
        moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491197Ab1A3Ul5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 30 Jan 2011 21:41:57 +0100
From: Stefan Weil <weil@mail.berlios.de>
Subject: [PATCH] MIPS: Loongson: Fix potentially wrong string handling
Date: Sun, 30 Jan 2011 21:41:44 +0100
Message-ID: <1296420104-5679-1-git-send-email-weil@mail.berlios.de>
Return-Path: <stefan@weilnetz.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Stefan Weil <weil@mail.berlios.de>, Wu Zhangjin <wuzhangjin@gmail.com>, Arnaud Patard <apatard@mandriva.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20110130204144.6ZJriZscIPUD73IzwJYLwyAOhrThPQnenmUmFdVRCUg@z>

This error was reported by cppcheck:
arch/mips/loongson/common/machtype.c:56: error: Dangerous usage of 'str' (strncpy doesn't always 0-terminate it)

If strncpy copied MACHTYPE_LEN bytes, the destination string str
was not terminated.

The patch adds one more byte to str and makes sure that this byte is
always 0.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Arnaud Patard <apatard@mandriva.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 arch/mips/loongson/common/machtype.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/mips/loongson/common/machtype.c b/arch/mips/loongson/common/machtype.c
index 81fbe6b..2efd5d9 100644
--- a/arch/mips/loongson/common/machtype.c
+++ b/arch/mips/loongson/common/machtype.c
@@ -41,7 +41,7 @@ void __weak __init mach_prom_init_machtype(void)
 
 void __init prom_init_machtype(void)
 {
-	char *p, str[MACHTYPE_LEN];
+	char *p, str[MACHTYPE_LEN + 1];
 	int machtype = MACH_LEMOTE_FL2E;
 
 	mips_machtype = LOONGSON_MACHTYPE;
@@ -53,6 +53,7 @@ void __init prom_init_machtype(void)
 	}
 	p += strlen("machtype=");
 	strncpy(str, p, MACHTYPE_LEN);
+	str[MACHTYPE_LEN] = '\0';
 	p = strstr(str, " ");
 	if (p)
 		*p = '\0';
-- 
1.7.2.3
