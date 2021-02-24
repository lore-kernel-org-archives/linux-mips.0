Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE34CC433E0
	for <linux-mips@archiver.kernel.org>; Wed, 24 Feb 2021 08:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B1B464EDB
	for <linux-mips@archiver.kernel.org>; Wed, 24 Feb 2021 08:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhBXIK5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 24 Feb 2021 03:10:57 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:37539 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231439AbhBXIK4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 03:10:56 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPRTSGl_1614154211;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPRTSGl_1614154211)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 16:10:12 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] mips: cavium: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Wed, 24 Feb 2021 16:10:06 +0800
Message-Id: <1614154206-19069-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following coccicheck warning:
./arch/mips/cavium-octeon/oct_ilm.c:65:0-23: WARNING:
reset_statistics_ops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/mips/cavium-octeon/oct_ilm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/oct_ilm.c b/arch/mips/cavium-octeon/oct_ilm.c
index 99e2715..6a46945 100644
--- a/arch/mips/cavium-octeon/oct_ilm.c
+++ b/arch/mips/cavium-octeon/oct_ilm.c
@@ -62,7 +62,7 @@ static int reset_statistics(void *data, u64 value)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(reset_statistics_ops, NULL, reset_statistics, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(reset_statistics_ops, NULL, reset_statistics, "%llu\n");
 
 static void init_debugfs(void)
 {
-- 
1.8.3.1

