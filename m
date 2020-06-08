Return-Path: <SRS0=zohb=7W=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6B2C433E1
	for <linux-mips@archiver.kernel.org>; Tue,  9 Jun 2020 00:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E07CE20775
	for <linux-mips@archiver.kernel.org>; Tue,  9 Jun 2020 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591662213;
	bh=UxLFJSi2vnUJFRKmV691Uu4lf4Mr1Wmc8LbfMJiz7KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=A1i8XNJyJKD+x9llINjZ+/Kff2LWKSTGJv5YAAZT31PWUXaNUkgZG2mGl4iBqZD/W
	 GbwIuT/GVD1qlfcdtAZtor2iMixekGKA73Wd/VJg89wy1WMlzvTRJn1DVfiVOrpElp
	 ncsCMxUCfTjicD37oUtGtr3gNi0egD+1zw3vd+RA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgFIAXS (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 8 Jun 2020 20:23:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729148AbgFHXRP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Jun 2020 19:17:15 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 780CB2083E;
        Mon,  8 Jun 2020 23:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658235;
        bh=UxLFJSi2vnUJFRKmV691Uu4lf4Mr1Wmc8LbfMJiz7KI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o/PYnR28aUUEshZruVU+htmWXhxxUT4Emg6Vw1Ygee4KoefXr9F6B385lCCbNxbea
         kLxn88Pj170BjC+GXaVODDS5V2QrVl/sEBd1dwiJ/YKDCED5uVdoOdcWxa7Y5zG43E
         z4uAOw+cPZ/wO+pKJNvdU25EkCGewUFtttQkP1es=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 247/606] net: sgi: ioc3-eth: Fix return value check in ioc3eth_probe()
Date:   Mon,  8 Jun 2020 19:06:12 -0400
Message-Id: <20200608231211.3363633-247-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tang Bin <tangbin@cmss.chinamobile.com>

commit a7654211d0ffeaa8eb0545ea00f8445242cbce05 upstream.

In the function devm_platform_ioremap_resource(), if get resource
failed, the return value is ERR_PTR() not NULL. Thus it must be
replaced by IS_ERR(), or else it may result in crashes if a critical
error path is encountered.

Fixes: 0ce5ebd24d25 ("mfd: ioc3: Add driver for SGI IOC3 chip")
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index db6b2988e632..f4895777f5e3 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -865,14 +865,14 @@ static int ioc3eth_probe(struct platform_device *pdev)
 	ip = netdev_priv(dev);
 	ip->dma_dev = pdev->dev.parent;
 	ip->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (!ip->regs) {
-		err = -ENOMEM;
+	if (IS_ERR(ip->regs)) {
+		err = PTR_ERR(ip->regs);
 		goto out_free;
 	}
 
 	ip->ssram = devm_platform_ioremap_resource(pdev, 1);
-	if (!ip->ssram) {
-		err = -ENOMEM;
+	if (IS_ERR(ip->ssram)) {
+		err = PTR_ERR(ip->ssram);
 		goto out_free;
 	}
 
-- 
2.25.1

