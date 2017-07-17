Received: from mailapp01.imgtec.com ([195.59.15.196]:59456 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992993AbdGQJ6XW60X9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Jul 2017 11:58:23 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] CLOCKSOURCE: Fix CLKSRC_PISTACHIO dependencies
Date: Mon, 17 Jul 2017 10:58:09 +0100
Message-ID: <1500285489-31044-1-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <d5581fe0-2420-655b-3c3c-25c316f05576@mev.co.uk>
References: <d5581fe0-2420-655b-3c3c-25c316f05576@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@linux-mips.org, akpm@linux-foundation.org, kbuild-all@01.org, arnd@arndb.de, Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20170717095809.4cg3Qy8Ww0drPb-Z6-4wqJlg1P6_LBcURdmChKSvhjI@z>

In v4.13, CLKSRC_PISTACHIO can select TIMER_OF on architectures without
GENERIC_CLOCKEVENTS, resulting in a struct clock_event_device missing
some required features.
Fix this by depending on GENERIC_CLOCKEVENTS. Additionally, since
Pistachio is a MIPS based SoC, also depend on the MIPS architecture.

Thanks to kbuild test robot for finding this error
(https://lkml.org/lkml/2017/7/16/249)

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 drivers/clocksource/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fcae5ca6ac92..40ebb117709b 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -262,7 +262,8 @@ config CLKSRC_LPC32XX
 
 config CLKSRC_PISTACHIO
 	bool "Clocksource for Pistachio SoC" if COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on GENERIC_CLOCKEVENTS && HAS_IOMEM
+	depends on MIPS
 	select TIMER_OF
 	help
 	  Enables the clocksource for the Pistachio SoC.
-- 
2.7.4
