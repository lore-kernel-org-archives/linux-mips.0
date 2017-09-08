Received: from smtp3-g21.free.fr ([IPv6:2a01:e0c:1:1599::12]:8785 "EHLO
        smtp3-g21.free.fr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992800AbdIHSgMFTANf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 Sep 2017 20:36:12 +0200
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 1/3] MIPS: Ci20: Enable watchdog driver
Date: Fri,  8 Sep 2017 20:35:53 +0200
Message-ID: <20170908183558.1537-1-malat@debian.org>
Return-Path: <mathieu@macbookpro.malat.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Message-ID: <20170908183553.CQ4D48SDiqI5C-kTPxDrccXJI0tp3JPOV7DnXfy6Bfo@z>

Update the Ci20's defconfig to enable the JZ4740's watchdog driver.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index b42cfa7865f9..459b21e6278d 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -92,6 +92,8 @@ CONFIG_I2C=y
 CONFIG_I2C_JZ4780=y
 CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_JZ4740_WDT=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-- 
2.11.0
