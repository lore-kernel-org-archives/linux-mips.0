Received: from mailapp01.imgtec.com ([195.59.15.196]:13752 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990924AbdGRIZvJHf9G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 10:25:51 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2] CLOCKSOURCE: Fix CLKSRC_PISTACHIO dependencies
Date: Tue, 18 Jul 2017 09:25:39 +0100
Message-ID: <1500366339-2780-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, akpm@linux-foundation.org, kbuild-all@01.org, arnd@arndb.de, abbotti@mev.co.uk, Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20170718082539.x75c_U2jP7cnk8JfhPhBsJXQOCyfJV-Ml83yuY4iAec@z>

In v4.13, CLKSRC_PISTACHIO can select TIMER_OF on architectures without
GENERIC_CLOCKEVENTS, resulting in a struct clock_event_device missing
some required features and build breakage compiling timer_of.c. One of
the symbols selecting TIMER_OF is CLKSRC_PISTACHIO, so add the
dependency on GENERIC_CLOCKEVENTS.

Thanks to kbuild test robot for finding this error
(https://lkml.org/lkml/2017/7/16/249)

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Suggested-by: Ian Abbott <abbotti@mev.co.uk>
---

Changes in v2:
Drop MIPS dependency

 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fcae5ca6ac92..54a67f8a28eb 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -262,7 +262,7 @@ config CLKSRC_LPC32XX
 
 config CLKSRC_PISTACHIO
 	bool "Clocksource for Pistachio SoC" if COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on GENERIC_CLOCKEVENTS && HAS_IOMEM
 	select TIMER_OF
 	help
 	  Enables the clocksource for the Pistachio SoC.
-- 
2.7.4
