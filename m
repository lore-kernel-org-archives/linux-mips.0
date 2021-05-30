Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2744CC47091
	for <linux-mips@archiver.kernel.org>; Sun, 30 May 2021 17:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 032CD61090
	for <linux-mips@archiver.kernel.org>; Sun, 30 May 2021 17:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhE3RUB (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 30 May 2021 13:20:01 -0400
Received: from aposti.net ([89.234.176.197]:37692 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhE3RUB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:01 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/8] MIPS: mm: XBurst CPU requires sync after DMA
Date:   Sun, 30 May 2021 18:17:55 +0100
Message-Id: <20210530171802.23649-2-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I am not sure why this is required, but if this is not enabled, reading
from a buffer in which data has been DMA'd may read incorrect values.

This used to happen for instance in mmc_app_send_scr()
(drivers/mmc/core/sd_ops.c), where data is DMA'd to a buffer then copied
by the CPU to a different location.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig              | 1 +
 arch/mips/mm/dma-noncoherent.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed51970c08e7..310ce50ad285 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -112,6 +112,7 @@ config MACH_INGENIC
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_ZBOOT
 	select DMA_NONCOHERENT
+	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select IRQ_MIPS_CPU
 	select PINCTRL
 	select GPIOLIB
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 212f3ce75a6b..3c4fc97b9f39 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -32,6 +32,7 @@ static inline bool cpu_needs_post_dma_flush(void)
 	case CPU_R12000:
 	case CPU_BMIPS5000:
 	case CPU_LOONGSON2EF:
+	case CPU_XBURST:
 		return true;
 	default:
 		/*
-- 
2.30.2

