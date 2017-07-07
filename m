Received: from mailapp01.imgtec.com ([195.59.15.196]:5246 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993944AbdGGQM3CgK1- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Jul 2017 18:12:29 +0200
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 1/2] MIPS: Ci20: Enable GPIO driver
Date: Fri, 7 Jul 2017 17:12:07 +0100
Message-ID: <1499443928-10620-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170707161207.jWJPzSiMY_SLeCdSeUD9rGylHksZxZsFkJ_yp_8mQoc@z>

Update the Ci20's defconfig to enable the JZ4780's GPIO driver.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mips@linux-mips.org 
Cc: linux-kernel@vger.kernel.org 
---
Ralf, both of these patches rely on Paul Cercueil's pinctrl
and gpio patches from Linus Walleij's 4.13 pinctrl pull request.

 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 43e0ba2..ce317ff 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -92,6 +92,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_JZ4780=y
 CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_INGENIC=y
 # CONFIG_HWMON is not set
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
-- 
2.7.4
