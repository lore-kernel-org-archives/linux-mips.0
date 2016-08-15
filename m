Received: from mail1.windriver.com ([147.11.146.13]:42347 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992263AbcHOUbdyPjuS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 15 Aug 2016 22:31:33 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/4] mips: lantiq: make vmmc explicitly non-modular
Date: Mon, 15 Aug 2016 16:30:54 -0400
Message-ID: <20160815203055.20541-4-paul.gortmaker@windriver.com>
In-Reply-To: <20160815203055.20541-1-paul.gortmaker@windriver.com>
References: <20160815203055.20541-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160815203054.q6P1fqrX0x-avjG2qyFOI4-EakRg5hdrxQFEN5i2aj8@z>

The Makefile entry controlling compilation of this code is:

arch/mips/lantiq/xway/vmmc.o
   ---> arch/mips/lantiq/xway/Makefile:obj-y += vmmc.o

...meaning that it currently is not being built as a module by anyone.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We replace module.h with export.h since the file does actually use
EXPORT_SYMBOL.

Cc: John Crispin <john@phrozen.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/lantiq/xway/vmmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/lantiq/xway/vmmc.c b/arch/mips/lantiq/xway/vmmc.c
index 4625495f9230..577ec81b557d 100644
--- a/arch/mips/lantiq/xway/vmmc.c
+++ b/arch/mips/lantiq/xway/vmmc.c
@@ -6,7 +6,7 @@
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
 
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/dma-mapping.h>
@@ -55,7 +55,6 @@ static const struct of_device_id vmmc_match[] = {
 	{ .compatible = "lantiq,vmmc-xway" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, vmmc_match);
 
 static struct platform_driver vmmc_driver = {
 	.probe = vmmc_probe,
@@ -64,5 +63,4 @@ static struct platform_driver vmmc_driver = {
 		.of_match_table = vmmc_match,
 	},
 };
-
-module_platform_driver(vmmc_driver);
+builtin_platform_driver(vmmc_driver);
-- 
2.8.4
