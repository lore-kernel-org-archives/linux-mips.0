Received: from szxga01-in.huawei.com ([119.145.14.64]:17742 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-FAIL-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6827452Ab3EOBfo69GwV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 May 2013 03:35:44 +0200
Message-ID: <5192E650.3070303@huawei.com>
Date: Wed, 15 May 2013 09:35:12 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
Subject: [PATCH] usb: omap2430: fix memleak in err case
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <libo.chen@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: grant.likely@linaro.org, rob.herring@calxeda.com
Cc: linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20130515013512.WxiiXlz2cA-CLeaM5Ewt3bZ9vzytiphi83OxsQEfenI@z>


when omap_get_control_dev fail, we should release relational platform_device

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/usb/musb/omap2430.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index 3551f1a..b626f19 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -549,7 +549,8 @@ static int omap2430_probe(struct platform_device *pdev)
 		glue->control_otghs = omap_get_control_dev();
 		if (IS_ERR(glue->control_otghs)) {
 			dev_vdbg(&pdev->dev, "Failed to get control device\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err2;
 		}
 	} else {
 		glue->control_otghs = ERR_PTR(-ENODEV);
-- 
1.7.1
