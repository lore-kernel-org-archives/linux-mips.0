Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:5250 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6870578AbaAJUf2sszqK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jan 2014 21:35:28 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 3/3] MIPS: BCM63XX: select correct MIPS_L1_CACHE_SHIFT value
Date: Fri, 10 Jan 2014 12:35:14 -0800
Message-ID: <1389386114-31834-4-git-send-email-florian@openwrt.org>
In-Reply-To: <1389386114-31834-1-git-send-email-florian@openwrt.org>
References: <1389386114-31834-1-git-send-email-florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <florian@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org, blogic@openwrt.org, jogo@openwrt.org, mbizon@freebox.fr, cernekee@gmail.com, dgcbueu@gmail.com, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140110203514.f5c-_sZ-rNJxpU7I7KuUpsAa2q5fhcArPnx-Xi0davc@z>

Broadcom BCM63xx DSL SoCs have a L1-cache line size of 16 bytes (shift
value of 4) instead of the currently configured 32 bytes L1-cache line
size.

Reported-by: Daniel Gonzalez <dgcbueu@gmail.com>
Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 123f7c0..a3fec87 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -139,6 +139,7 @@ config BCM63XX
 	select SWAP_IO_SPACE
 	select ARCH_REQUIRE_GPIOLIB
 	select HAVE_CLK
+	select MIPS_L1_CACHE_SHIFT_4
 	help
 	 Support for BCM63XX based boards
 
-- 
1.8.3.2
