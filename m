Received: from multi.imgtec.com ([194.200.65.239]:33559 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6816822Ab3ICO2DRVzzh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 3 Sep 2013 16:28:03 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: sead3: Select NEW_LEDS, LEDS_CLASS and I2C symbols
Date: Tue, 3 Sep 2013 15:27:00 +0100
Message-ID: <1378218420-28011-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20130903142700.PT105IqMXXT9OLl-wVVUvuwIRRcUd8EdZa9JkF87kKo@z>

Select NEW_LEDS and LEDS_CLASS since they export symbols
needed by leds-sead3.c. Fixes the following build problem:

leds-sead3.c:(.text+0xf0c): undefined
reference to `led_classdev_unregister'
leds-sead3.c:(.text+0xf18): undefined
reference to `led_classdev_unregister'

Also select I2C since it's needed by sead3-pic32-i2c-drv.c
Fixes the following build problem:
arch/mips/mti-sead3/sead3-pic32-i2c-drv.c:350:2: error:
implicit declaration of
function 'i2c_add_numbered_adapter'
[-Werror=implicit-function-declaration]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fdaf628..04bdd82 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -342,9 +342,12 @@ config MIPS_SEAD3
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
 	select DMA_NONCOHERENT
+	select I2C
 	select IRQ_CPU
 	select IRQ_GIC
+	select LEDS_CLASS
 	select MIPS_MSC
+	select NEW_LEDS
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS64_R1
-- 
1.8.3.2
