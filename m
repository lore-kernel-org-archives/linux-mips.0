Received: from smtpout.microchip.com ([198.175.253.82]:17846 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27033582AbcFBFWZrT6vY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Jun 2016 07:22:25 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH] MIPS: pic32mzda: fix linker error for pic32_get_pbclk().
Date: Thu, 2 Jun 2016 10:50:21 +0530
Message-ID: <1464844821-1581-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Purna.Mandal@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, Harvey Hunt <harvey.hunt@imgtec.com>, Joshua Henderson <digitalpeer@digitalpeer.com>, Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <20160602052021.h3v-0_JI9B_6QI15HfgWQ8rLW81Hf9FdXOhQxMzDHMU@z>

Early clock API pic32_get_pbclk() is defined in early_clk.c and
used by time.c and early_console.c. When CONFIG_EARLY_PRINTK isn't
set, early_clk.c isn't compiled and so a linker error is reported
while referring the API from time.c.

Fix it by compiling early_clk.c always. Also sort files in
alphabetical order.

Cc: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Joshua Henderson <digitalpeer@digitalpeer.com>

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>

---

 arch/mips/pic32/pic32mzda/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/pic32/pic32mzda/Makefile b/arch/mips/pic32/pic32mzda/Makefile
index 4a4c272..c286496 100644
--- a/arch/mips/pic32/pic32mzda/Makefile
+++ b/arch/mips/pic32/pic32mzda/Makefile
@@ -2,8 +2,7 @@
 # Joshua Henderson, <joshua.henderson@microchip.com>
 # Copyright (C) 2015 Microchip Technology, Inc.  All rights reserved.
 #
-obj-y			:= init.o time.o config.o
+obj-y			:= config.o early_clk.o init.o time.o
 
 obj-$(CONFIG_EARLY_PRINTK)	+= early_console.o      \
-				   early_pin.o		\
-				   early_clk.o
+				   early_pin.o
-- 
1.8.3.1
