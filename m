Received: from mailapp01.imgtec.com ([195.59.15.196]:51362 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007995AbbK3QYb21u0I (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Nov 2015 17:24:31 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 09/28] PCI: xilinx: allow build on MIPS platforms
Date: Mon, 30 Nov 2015 16:21:34 +0000
Message-ID: <1448900513-20856-10-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Ley Foon Tan <lftan@altera.com>, Jayachandran C <jchandra@broadcom.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Zhou Wang <wangzhou1@hisilicon.com>, Duc Dang <dhdang@apm.com>, Marc Zyngier <marc.zyngier@arm.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Ray Jui <rjui@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <20151130162134.PWYD1Kx90FZikUoS0ZRTS6n6uCMvEMweKsLyyFXwqfY@z>

Allow the xilinx-pcie driver to be built on MIPS platforms. This will be
used on the MIPS Boston board.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/pci/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
index f131ba9..a22e6c7 100644
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
2.6.2
