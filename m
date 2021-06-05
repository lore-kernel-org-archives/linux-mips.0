Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA7CC47082
	for <linux-mips@archiver.kernel.org>; Sat,  5 Jun 2021 07:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8348361042
	for <linux-mips@archiver.kernel.org>; Sat,  5 Jun 2021 07:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFEHxK (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 5 Jun 2021 03:53:10 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3069 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhFEHxK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Jun 2021 03:53:10 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FxsCF43pKzWqHK;
        Sat,  5 Jun 2021 15:46:33 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 15:51:20 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 5 Jun 2021
 15:51:19 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>
CC:     <tsbogend@alpha.franken.de>
Subject: [PATCH -next] MIPS: OCTEON: octeon-usb: Use devm_platform_get_and_ioremap_resource()
Date:   Sat, 5 Jun 2021 15:55:37 +0800
Message-ID: <20210605075537.2046896-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unneeded error handling on the result of a call
to platform_get_resource() when the value is passed to
devm_ioremap_resource().

And use devm_platform_get_and_ioremap_resource() to simplify
code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 arch/mips/cavium-octeon/octeon-usb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 950e6c6e8629..6e4d3619137a 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -516,20 +516,13 @@ static int __init dwc3_octeon_device_init(void)
 			if (!pdev)
 				return -ENODEV;
 
-			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-			if (res == NULL) {
-				put_device(&pdev->dev);
-				dev_err(&pdev->dev, "No memory resources\n");
-				return -ENXIO;
-			}
-
 			/*
 			 * The code below maps in the registers necessary for
 			 * setting up the clocks and reseting PHYs. We must
 			 * release the resources so the dwc3 subsystem doesn't
 			 * know the difference.
 			 */
-			base = devm_ioremap_resource(&pdev->dev, res);
+			base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 			if (IS_ERR(base)) {
 				put_device(&pdev->dev);
 				return PTR_ERR(base);
-- 
2.25.1

