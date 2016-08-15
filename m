Received: from mail5.windriver.com ([192.103.53.11]:33306 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992579AbcHOUbw030QS (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 15 Aug 2016 22:31:52 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/4] mips: bcm47xx: make serial explicitly non-modular
Date: Mon, 15 Aug 2016 16:30:52 -0400
Message-ID: <20160815203055.20541-2-paul.gortmaker@windriver.com>
In-Reply-To: <20160815203055.20541-1-paul.gortmaker@windriver.com>
References: <20160815203055.20541-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Paul.Gortmaker@windriver.com>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20160815203052.Xd6ACvCKVwx5CpvzF95ziaVhQ-yabjc5ha61tREksko@z>

The Makefile entry controlling compilation of this code is "obj-y"
meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/bcm47xx/serial.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/mips/bcm47xx/serial.c b/arch/mips/bcm47xx/serial.c
index df761d38f7fc..e3c9872a4aa5 100644
--- a/arch/mips/bcm47xx/serial.c
+++ b/arch/mips/bcm47xx/serial.c
@@ -1,4 +1,7 @@
 /*
+ * 8250 UART probe driver for the BCM47XX platforms
+ * Author: Aurelien Jarno
+ *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
@@ -6,7 +9,6 @@
  * Copyright (C) 2007 Aurelien Jarno <aurelien@aurel32.net>
  */
 
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/serial.h>
 #include <linux/serial_8250.h>
@@ -88,9 +90,4 @@ static int __init uart8250_init(void)
 	}
 	return -EINVAL;
 }
-
-module_init(uart8250_init);
-
-MODULE_AUTHOR("Aurelien Jarno <aurelien@aurel32.net>");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("8250 UART probe driver for the BCM47XX platforms");
+device_initcall(uart8250_init);
-- 
2.8.4
