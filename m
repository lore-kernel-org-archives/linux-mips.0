Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B287C47091
	for <linux-mips@archiver.kernel.org>; Sun, 30 May 2021 17:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE59F611EE
	for <linux-mips@archiver.kernel.org>; Sun, 30 May 2021 17:18:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhE3RUJ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 30 May 2021 13:20:09 -0400
Received: from aposti.net ([89.234.176.197]:37722 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhE3RUI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:08 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/8] MIPS: boot: Support specifying UART port on Ingenic SoCs
Date:   Sun, 30 May 2021 18:17:56 +0100
Message-Id: <20210530171802.23649-3-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow specifying from the config the UART to use on Ingenic SoCs when
compressed kernel debugging is enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig.debug                | 8 ++++++++
 arch/mips/boot/compressed/uart-16550.c | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index f5832a49a881..43dbf5930796 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -102,6 +102,14 @@ config DEBUG_ZBOOT
 	  to reduce the kernel image size and speed up the booting procedure a
 	  little.
 
+config ZBOOT_INGENIC_UART
+	int "UART to use for compressed kernel debugging"
+	depends on DEBUG_ZBOOT && MACH_INGENIC_SOC
+	default 0
+	range 0 4
+	help
+	  Specify the UART that should be used for compressed kernel debugging.
+
 config SPINLOCK_TEST
 	bool "Enable spinlock timing tests in debugfs"
 	depends on DEBUG_FS
diff --git a/arch/mips/boot/compressed/uart-16550.c b/arch/mips/boot/compressed/uart-16550.c
index aee8d7b8f091..c18d7f72d9d9 100644
--- a/arch/mips/boot/compressed/uart-16550.c
+++ b/arch/mips/boot/compressed/uart-16550.c
@@ -19,8 +19,8 @@
 #endif
 
 #ifdef CONFIG_MACH_INGENIC
-#define INGENIC_UART0_BASE_ADDR	0x10030000
-#define PORT(offset) (CKSEG1ADDR(INGENIC_UART0_BASE_ADDR) + (4 * offset))
+#define INGENIC_UART_BASE_ADDR	(0x10030000 + 0x1000 * CONFIG_ZBOOT_INGENIC_UART)
+#define PORT(offset) (CKSEG1ADDR(INGENIC_UART_BASE_ADDR) + (4 * offset))
 #endif
 
 #ifdef CONFIG_CPU_XLR
-- 
2.30.2

