Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AA2C433ED
	for <linux-mips@archiver.kernel.org>; Fri, 23 Apr 2021 08:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E8D86141C
	for <linux-mips@archiver.kernel.org>; Fri, 23 Apr 2021 08:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhDWIbL (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 23 Apr 2021 04:31:11 -0400
Received: from mail-m118208.qiye.163.com ([115.236.118.208]:31558 "EHLO
        mail-m118208.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhDWIbK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Apr 2021 04:31:10 -0400
Received: from ubuntu.localdomain (unknown [36.152.145.182])
        by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 26CBCE040D;
        Fri, 23 Apr 2021 16:30:31 +0800 (CST)
From:   zhouchuangao <zhouchuangao@vivo.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        zhouchuangao <zhouchuangao@vivo.com>, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips/bcm63xx: Use BUG_ON instead of if condition followed by BUG
Date:   Fri, 23 Apr 2021 01:30:21 -0700
Message-Id: <1619166623-70445-1-git-send-email-zhouchuangao@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0pKT1YeTEIZQxkaSxlLTU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDo6HSo4GT8KAgxKDCscAjAN
        Nj0aChlVSlVKTUpCSk1NTUhKTUNJVTMWGhIXVQETFA4YEw4aFRwaFDsNEg0UVRgUFkVZV1kSC1lB
        WUhNVUpOSVVKT05VSkNJWVdZCAFZQUlJTUo3Bg++
X-HM-Tid: 0a78fdda159d2c17kusn26cbce040d
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BUG_ON uses unlikely in if(), it can be optimized at compile time.

Usually, the condition in if() is not satisfied. In my opinion,
this can improve the efficiency of the multi-stage pipeline.

Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>
---
 arch/mips/bcm63xx/gpio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/mips/bcm63xx/gpio.c b/arch/mips/bcm63xx/gpio.c
index 16f353a..5c4a233 100644
--- a/arch/mips/bcm63xx/gpio.c
+++ b/arch/mips/bcm63xx/gpio.c
@@ -43,8 +43,7 @@ static void bcm63xx_gpio_set(struct gpio_chip *chip,
 	u32 *v;
 	unsigned long flags;
 
-	if (gpio >= chip->ngpio)
-		BUG();
+	BUG_ON(gpio >= chip->ngpio);
 
 	if (gpio < 32) {
 		reg = gpio_out_low_reg;
@@ -70,8 +69,7 @@ static int bcm63xx_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	u32 reg;
 	u32 mask;
 
-	if (gpio >= chip->ngpio)
-		BUG();
+	BUG_ON(gpio >= chip->ngpio);
 
 	if (gpio < 32) {
 		reg = gpio_out_low_reg;
@@ -92,8 +90,7 @@ static int bcm63xx_gpio_set_direction(struct gpio_chip *chip,
 	u32 tmp;
 	unsigned long flags;
 
-	if (gpio >= chip->ngpio)
-		BUG();
+	BUG_ON(gpio >= chip->ngpio);
 
 	if (gpio < 32) {
 		reg = GPIO_CTL_LO_REG;
-- 
2.7.4

