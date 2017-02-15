Received: from mail-qk0-x243.google.com ([IPv6:2607:f8b0:400d:c09::243]:33440
        "EHLO mail-qk0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993875AbdBOAmIo5j4W (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Feb 2017 01:42:08 +0100
Received: by mail-qk0-x243.google.com with SMTP id 11so21308787qkl.0
        for <linux-mips@linux-mips.org>; Tue, 14 Feb 2017 16:42:08 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] soc: bcm: brcmstb: Match additional compatible strings
Date: Tue, 14 Feb 2017 16:41:57 -0800
Message-ID: <20170215004159.11096-1-florian.fainelli@broadcom.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Justin Chen <justin.chen@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20170215004157.iar3hYhqfVHu75SkJCUa17iHLM-q29NmEmAMMAOyxng@z>

From: Florian Fainelli <f.fainelli@gmail.com>

Match all known sun-top-ctrl compatible strings from our MIPS chips
counterparts. This allows us to properly report the SoC information to
user-space through our SoC driver.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Ralf, James,

I usually take patches touching this file through an ARM SoC pull request,
posting to linux-mips for people working on BMIPS STB to get a chance to review
this.

Thanks!

 drivers/soc/bcm/brcmstb/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/bcm/brcmstb/common.c b/drivers/soc/bcm/brcmstb/common.c
index 94e7335553f4..b6195fdf0d00 100644
--- a/drivers/soc/bcm/brcmstb/common.c
+++ b/drivers/soc/bcm/brcmstb/common.c
@@ -41,6 +41,15 @@ bool soc_is_brcmstb(void)
 }
 
 static const struct of_device_id sun_top_ctrl_match[] = {
+	{ .compatible = "brcm,bcm7125-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7346-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7358-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7360-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7362-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7420-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7425-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7429-sun-top-ctrl", },
+	{ .compatible = "brcm,bcm7425-sun-top-ctrl", },
 	{ .compatible = "brcm,brcmstb-sun-top-ctrl", },
 	{ }
 };
-- 
2.11.0
