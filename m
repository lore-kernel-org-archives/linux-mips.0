Received: from mail-qt0-x244.google.com ([IPv6:2607:f8b0:400d:c0d::244]:32853
        "EHLO mail-qt0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993963AbdFZWeDZvRrt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Jun 2017 00:34:03 +0200
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/4] misc: sram: Allow ARM64 to select SRAM_EXEC
Date: Mon, 26 Jun 2017 15:32:42 -0700
Message-ID: <20170626223248.14199-3-f.fainelli@gmail.com>
In-Reply-To: <20170626223248.14199-1-f.fainelli@gmail.com>
References: <20170626223248.14199-1-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-pm@vger.kernerl.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <20170626223242.k547HAg5o6_vhgvR-y02btjDVl1M9iBV2pYR7RMy6hs@z>

Now that ARM64 also has a fncpy() implementation, allow selection
SRAM_EXEC for ARM64 as well.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/misc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 07bbd4cc1852..ac8779278c0c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -464,7 +464,7 @@ config SRAM
 	bool "Generic on-chip SRAM driver"
 	depends on HAS_IOMEM
 	select GENERIC_ALLOCATOR
-	select SRAM_EXEC if ARM
+	select SRAM_EXEC if ARM || ARM64
 	help
 	  This driver allows you to declare a memory region to be managed by
 	  the genalloc API. It is supposed to be used for small on-chip SRAM
-- 
2.9.3
