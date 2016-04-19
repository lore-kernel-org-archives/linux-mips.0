Received: from mailapp01.imgtec.com ([195.59.15.196]:38634 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007106AbcDSOrJBjAQv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Apr 2016 16:47:09 +0200
From: James Hartley <james.hartley@imgtec.com>
Subject: [PATCH V2] mips: pistachio: Determine SoC revision during boot
Date: Tue, 19 Apr 2016 15:46:55 +0100
Message-ID: <1461077215-1884-1-git-send-email-james.hartley@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hartley@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Jonas Gorski <jogo@openwrt.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ionela Voinescu <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>
Message-ID: <20160419144655.GmngndVsU6KbWRwdwBlQ2KLfNMkTdqko7vQYNh00Pss@z>

Now that there are different revisions of the Pistachio SoC
in circulation, add this information to the boot log to make
it easier for users to determine which hardware they have.

Signed-off-by: James Hartley <james.hartley@imgtec.com>
Signed-off-by: Ionela Voinescu <ionela.voinescu@imgtec.com>
---
 arch/mips/pistachio/init.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
index 96ba2cc..956c92e 100644
--- a/arch/mips/pistachio/init.c
+++ b/arch/mips/pistachio/init.c
@@ -2,6 +2,7 @@
  * Pistachio platform setup
  *
  * Copyright (C) 2014 Google, Inc.
+ * Copyright (C) 2016 Imagination Technologies
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -9,6 +10,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/of_fdt.h>
@@ -24,9 +26,38 @@
 #include <asm/smp-ops.h>
 #include <asm/traps.h>
 
+/*
+ * Core revision register decoding
+ * Bits 23 to 20: Major rev
+ * Bits 15 to 8: Minor rev
+ * Bits 7 to 0: Maintenance rev
+ */
+#define PISTACHIO_CORE_REV_REG	0xB81483D0
+#define PISTACHIO_CORE_REV_A1	0x00100006
+#define PISTACHIO_CORE_REV_B0	0x00100106
+
 const char *get_system_type(void)
 {
-	return "IMG Pistachio SoC";
+	u32 core_rev;
+	const char *sys_type;
+
+	core_rev = __raw_readl((const void *)PISTACHIO_CORE_REV_REG);
+
+	switch (core_rev) {
+	case PISTACHIO_CORE_REV_B0:
+		sys_type = "IMG Pistachio SoC (B0)";
+		break;
+
+	case PISTACHIO_CORE_REV_A1:
+		sys_type = "IMG Pistachio SoC (A1)";
+		break;
+
+	default:
+		sys_type = "IMG Pistachio SoC";
+		break;
+	}
+
+	return sys_type;
 }
 
 static void __init plat_setup_iocoherency(void)
@@ -109,6 +140,8 @@ void __init prom_init(void)
 	mips_cm_probe();
 	mips_cpc_probe();
 	register_cps_smp_ops();
+
+	pr_info("SoC Type: %s\n", get_system_type());
 }
 
 void __init prom_free_prom_memory(void)
-- 
2.5.0
