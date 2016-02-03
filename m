Received: from mailapp01.imgtec.com ([195.59.15.196]:65086 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012181AbcBCLdYbdPgM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 12:33:24 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 09/15] PCI: xilinx: Allow build on MIPS platforms
Date: Wed, 3 Feb 2016 11:30:39 +0000
Message-ID: <1454499045-5020-10-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
References: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Ley Foon Tan <lftan@altera.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Phil Edworthy <phil.edworthy@renesas.com>, Scott Branden <sbranden@broadcom.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-kernel@vger.kernel.org, Duc Dang <dhdang@apm.com>, linux-pci@vger.kernel.org, Gabriele Paoloni <gabriele.paoloni@huawei.com>, Marc Zyngier <marc.zyngier@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Ray Jui <rjui@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Richard Cochran <richardcochran@gmail.com>
Message-ID: <20160203113039.4j3tgD-MD3GYwB4_FpeAxJgyKpT2AndSRRWh3ZmmZAU@z>

Allow the xilinx-pcie driver to be built on MIPS platforms. This will be
used on the MIPS Boston board.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 drivers/pci/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
index 75a6054..0aee193 100644
--- a/drivers/pci/host/Kconfig
+++ b/drivers/pci/host/Kconfig
@@ -81,7 +81,7 @@ config PCI_KEYSTONE
 
 config PCIE_XILINX
 	bool "Xilinx AXI PCIe host bridge support"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || MIPS
 	help
 	  Say 'Y' here if you want kernel to support the Xilinx AXI PCIe
 	  Host Bridge driver.
-- 
2.7.0
