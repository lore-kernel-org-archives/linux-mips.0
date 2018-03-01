Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:44196 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992615AbeCAKNMX1unn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Mar 2018 11:13:12 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v2] bcma: Prevent build of PCI host features in module
Date: Thu, 1 Mar 2018 09:58:12 +0000
Message-ID: <1519898292-12155-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: kvalo@codeaurora.org
Cc: zajec5@gmail.com, linux-wireless@vger.kernel.org, linux-mips@linux-mips.org, jhogan@kernel.org, Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <20180301095812.oDexUAtVByQNggvgkGOnBWxOlZmqbK3aSVgLbhWhyvk@z>

Attempting to build bcma.ko with BCMA_DRIVER_PCI_HOSTMODE=y results in
a build error due to use of symbols not exported from vmlinux:

ERROR: "pcibios_enable_device" [drivers/bcma/bcma.ko] undefined!
ERROR: "register_pci_controller" [drivers/bcma/bcma.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1

To prevent this, don't allow the host mode feature to be built if
CONFIG_BCMA=m

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

---

Changes in v2:
Rebase on v4.16-rc1

 drivers/bcma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bcma/Kconfig b/drivers/bcma/Kconfig
index ba8acca036df..cb0f1aad20b7 100644
--- a/drivers/bcma/Kconfig
+++ b/drivers/bcma/Kconfig
@@ -55,7 +55,7 @@ config BCMA_DRIVER_PCI
 
 config BCMA_DRIVER_PCI_HOSTMODE
 	bool "Driver for PCI core working in hostmode"
-	depends on MIPS && BCMA_DRIVER_PCI && PCI_DRIVERS_LEGACY
+	depends on MIPS && BCMA_DRIVER_PCI && PCI_DRIVERS_LEGACY && BCMA = y
 	help
 	  PCI core hostmode operation (external PCI bus).
 
-- 
2.7.4
