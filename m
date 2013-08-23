Received: from arrakis.dune.hu ([78.24.191.176]:41453 "EHLO arrakis.dune.hu"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817128Ab3HWGbtUv18e (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 23 Aug 2013 08:31:49 +0200
From: Gabor Juhos <juhosg@openwrt.org>
Subject: [PATCH v2 3/3] MIPS: ralink: mt7620: add spi clock definition
Date: Fri, 23 Aug 2013 08:31:32 +0200
Message-Id: <1377239492-10802-3-git-send-email-juhosg@openwrt.org>
In-Reply-To: <1377239492-10802-1-git-send-email-juhosg@openwrt.org>
References: <1377239492-10802-1-git-send-email-juhosg@openwrt.org>
Return-Path: <juhosg@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, John Crispin <blogic@openwrt.org>, Gabor Juhos <juhosg@openwrt.org>

From: John Crispin <blogic@openwrt.org>

Register a clock device for the SPI block of the
MT7620 SoC. The clock device will be used by the
SPI host controller driver to determine the base
clock of the controller.

Signed-off-by: John Crispin <blogic@openwrt.org>
Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
---
Changes since v1:
  - rebase against the mips-for-linux-next branch of the
    upstream-sfr.git tree

This makes the following patch obsolete:
  https://patchwork.linux-mips.org/patch/5672/
---
 arch/mips/ralink/mt7620.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/mt7620.c b/arch/mips/ralink/mt7620.c
index 6c37c9d..988324b 100644
--- a/arch/mips/ralink/mt7620.c
+++ b/arch/mips/ralink/mt7620.c
@@ -318,6 +318,7 @@ void __init ralink_clk_init(void)
 	ralink_clk_add("10000100.timer", periph_rate);
 	ralink_clk_add("10000120.watchdog", periph_rate);
 	ralink_clk_add("10000500.uart", periph_rate);
+	ralink_clk_add("10000b00.spi", sys_rate);
 	ralink_clk_add("10000c00.uartlite", periph_rate);
 }
 
-- 
1.7.10
