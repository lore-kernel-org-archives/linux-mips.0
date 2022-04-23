Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75969C433F5
	for <linux-mips@archiver.kernel.org>; Sat, 23 Apr 2022 13:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbiDWN1O (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 23 Apr 2022 09:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235624AbiDWN1L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Apr 2022 09:27:11 -0400
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA6621F8D2
        for <linux-mips@vger.kernel.org>; Sat, 23 Apr 2022 06:24:12 -0700 (PDT)
Received: from pop-os.home ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id iFk5nubP8AKwFiFk5nIyDw; Sat, 23 Apr 2022 15:24:06 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 23 Apr 2022 15:24:06 +0200
X-ME-IP: 86.243.180.246
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP27: Free some unused memory
Date:   Sat, 23 Apr 2022 15:24:03 +0200
Message-Id: <9bc24670be4b1386c9b5c60f158c6acd7b723e72.1650720222.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

platform_device_add_data() duplicates the memory it is passed. So we can
free some memory to save a few bytes that would remain unused otherwise.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/sgi-ip27/ip27-xtalk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 000ede156bdc..e762886d1dda 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -53,6 +53,8 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid)
 	}
 	platform_device_add_resources(pdev, &w1_res, 1);
 	platform_device_add_data(pdev, wd, sizeof(*wd));
+	/* platform_device_add_data() duplicates the data */
+	kfree(wd);
 	platform_device_add(pdev);
 
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
@@ -83,6 +85,8 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid)
 	bd->io_offset	= offset;
 
 	platform_device_add_data(pdev, bd, sizeof(*bd));
+	/* platform_device_add_data() duplicates the data */
+	kfree(bd);
 	platform_device_add(pdev);
 	pr_info("xtalk:n%d/%x bridge widget\n", nasid, widget);
 	return;
-- 
2.32.0

