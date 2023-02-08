Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE49C636CD
	for <linux-mips@archiver.kernel.org>; Wed,  8 Feb 2023 02:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjBHCqv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 7 Feb 2023 21:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBHCqu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Feb 2023 21:46:50 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7268E2713;
        Tue,  7 Feb 2023 18:46:48 -0800 (PST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PBPXR12hkz8R039;
        Wed,  8 Feb 2023 10:46:47 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
        by mse-fl2.zte.com.cn with SMTP id 3182kb3A075938;
        Wed, 8 Feb 2023 10:46:38 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Wed, 8 Feb 2023 10:46:39 +0800 (CST)
Date:   Wed, 8 Feb 2023 10:46:39 +0800 (CST)
X-Zmail-TransId: 2af963e30d0fffffffff83c06cb9
X-Mailer: Zmail v1.0
Message-ID: <202302081046390773649@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <tsbogend@alpha.franken.de>
Cc:     <dmitry.torokhov@gmail.com>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBNSVBTOiBwY2k6IGxhbnRpcTogVXNlwqBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 3182kb3A075938
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 63E30D17.001 by FangMail milter!
X-FangMail-Envelope: 1675824407/4PBPXR12hkz8R039/63E30D17.001/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E30D17.001/4PBPXR12hkz8R039
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 arch/mips/pci/pci-lantiq.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
index 8d16cd021f60..d967e4c0cf24 100644
--- a/arch/mips/pci/pci-lantiq.c
+++ b/arch/mips/pci/pci-lantiq.c
@@ -204,17 +204,13 @@ static int ltq_pci_startup(struct platform_device *pdev)

 static int ltq_pci_probe(struct platform_device *pdev)
 {
-	struct resource *res_cfg, *res_bridge;
-
 	pci_clear_flags(PCI_PROBE_ONLY);

-	res_bridge = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	ltq_pci_membase = devm_ioremap_resource(&pdev->dev, res_bridge);
+	ltq_pci_membase = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
 	if (IS_ERR(ltq_pci_membase))
 		return PTR_ERR(ltq_pci_membase);

-	res_cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ltq_pci_mapped_cfg = devm_ioremap_resource(&pdev->dev, res_cfg);
+	ltq_pci_mapped_cfg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(ltq_pci_mapped_cfg))
 		return PTR_ERR(ltq_pci_mapped_cfg);

-- 
2.25.1
