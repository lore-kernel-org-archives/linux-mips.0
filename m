Received: from multi.imgtec.com ([194.200.65.239]:13398 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824793Ab3GWOlOImp-I (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 23 Jul 2013 16:41:14 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Set default CPU type for BCM47XX platforms
Date: Tue, 23 Jul 2013 15:40:37 +0100
Message-ID: <1374590437-18150-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130723144037.yCpoSAj6S_i6vUPx5FZhLgayc-k-If88GIa0YsZl9bQ@z>

If neither BCM47XX_SSD nor BCM47XX_BCMA is selected, then no
CPU type is available leading to build problems. We fix
this problem by using MIPS32r1 as the default CPU type for
the BCM47XX platform.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/Kconfig         | 1 +
 arch/mips/bcm47xx/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c3abed3..e12764c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -114,6 +114,7 @@ config BCM47XX
 	select FW_CFE
 	select HW_HAS_PCI
 	select IRQ_CPU
+	select SYS_HAS_CPU_MIPS32_R1
 	select NO_EXCEPT_FILL
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
diff --git a/arch/mips/bcm47xx/Kconfig b/arch/mips/bcm47xx/Kconfig
index ba61192..2b8b118 100644
--- a/arch/mips/bcm47xx/Kconfig
+++ b/arch/mips/bcm47xx/Kconfig
@@ -2,7 +2,6 @@ if BCM47XX
 
 config BCM47XX_SSB
 	bool "SSB Support for Broadcom BCM47XX"
-	select SYS_HAS_CPU_MIPS32_R1
 	select SSB
 	select SSB_DRIVER_MIPS
 	select SSB_DRIVER_EXTIF
-- 
1.8.3.2
