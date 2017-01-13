Received: from mail-lf0-x22e.google.com ([IPv6:2a00:1450:4010:c07::22e]:34301
        "EHLO mail-lf0-x22e.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993940AbdAMNOweS7O8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Jan 2017 14:14:52 +0100
Received: by mail-lf0-x22e.google.com with SMTP id v186so37163815lfa.1
        for <linux-mips@linux-mips.org>; Fri, 13 Jan 2017 05:14:52 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 04/15] MIPS: Alchemy: Don't rely on public mmc header to include interrupt.h
Date: Fri, 13 Jan 2017 14:14:05 +0100
Message-ID: <1484313256-25993-5-git-send-email-ulf.hansson@linaro.org>
In-Reply-To: <1484313256-25993-1-git-send-email-ulf.hansson@linaro.org>
References: <1484313256-25993-1-git-send-email-ulf.hansson@linaro.org>
Return-Path: <ulf.hansson@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Adrian Hunter <adrian.hunter@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20170113131405.d3v-dqgVshu3ShfnnL3FPJI_1CfvJjoZJCZEhsyKAqM@z>

The MIPS Alchemy db1300 dev board depends on interrupt.h. Explicitly
include it instead of relying on the public mmc header host.h.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: <linux-mips@linux-mips.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

I am seeking an ack for this change as following changes for mmc in the
series, has build-dependencies to it.

---
 arch/mips/alchemy/devboards/db1300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index d3c087f..a5504f5 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/leds.h>
+#include <linux/interrupt.h>
 #include <linux/ata_platform.h>
 #include <linux/mmc/host.h>
 #include <linux/module.h>
-- 
1.9.1
