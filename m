Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC937C433DB
	for <linux-mips@archiver.kernel.org>; Tue,  9 Feb 2021 07:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A591C64E9D
	for <linux-mips@archiver.kernel.org>; Tue,  9 Feb 2021 07:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhBIHMz (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 9 Feb 2021 02:12:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:33578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhBIHMm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 02:12:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02CDD64E9D;
        Tue,  9 Feb 2021 07:11:59 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH] irqchip/loongson-pch-msi: Use bitmap_zalloc() to allocate bitmap
Date:   Tue,  9 Feb 2021 15:10:51 +0800
Message-Id: <20210209071051.2078435-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently we use bitmap_alloc() to allocate msi bitmap which should be
initialized with zero. This is obviously wrong but it works because msi
can fallback to legacy interrupt mode. So use bitmap_zalloc() instead.

Fixes: 632dcc2c75ef6de3272aa ("irqchip: Add Loongson PCH MSI controller")
Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index 12aeeab43289..32562b7e681b 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -225,7 +225,7 @@ static int pch_msi_init(struct device_node *node,
 		goto err_priv;
 	}
 
-	priv->msi_map = bitmap_alloc(priv->num_irqs, GFP_KERNEL);
+	priv->msi_map = bitmap_zalloc(priv->num_irqs, GFP_KERNEL);
 	if (!priv->msi_map) {
 		ret = -ENOMEM;
 		goto err_priv;
-- 
2.27.0

