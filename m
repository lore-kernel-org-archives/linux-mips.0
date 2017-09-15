Received: from smtp3-g21.free.fr ([IPv6:2a01:e0c:1:1599::12]:18926 "EHLO
        smtp3-g21.free.fr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991500AbdIOTSFlCWg5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Sep 2017 21:18:05 +0200
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH v2 1/5] MIPS: Ci20: Enable watchdog driver
Date: Fri, 15 Sep 2017 21:17:54 +0200
Message-ID: <20170915191756.27413-1-malat@debian.org>
In-Reply-To: <20170908183558.1537-1-malat@debian.org>
References: <20170908183558.1537-1-malat@debian.org>
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
Cc: Mathieu Malaterre <malat@debian.org>, Ralf Baechle <ralf@linux-mips.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170915191754.0BVMcLgvlnVzPmKH_KlFF6y5xeiGMf0-sWhLrXpsgY0@z>

Update the Ci20's defconfig to enable the JZ4740's watchdog driver.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
Changes in v2:
* none

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 19a8ebd1d374..ed8d3d2f63cf 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -100,6 +100,8 @@ CONFIG_I2C_JZ4780=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_INGENIC=y
 # CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_JZ4740_WDT=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-- 
2.11.0
