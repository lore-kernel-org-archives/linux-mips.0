Received: from mailapp01.imgtec.com ([195.59.15.196]:15637 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992257AbcHaQhKPEabq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 18:37:10 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [Patch v3 09/11] net: ethernet: xilinx: Enable emaclite for MIPS
Date: Wed, 31 Aug 2016 17:35:50 +0100
Message-ID: <1472661352-11983-10-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1472661352-11983-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1472661352-11983-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: soren.brinkmann@xilinx.com, Zubair.Kakakhel@imgtec.com, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, michal.simek@xilinx.com, netdev@vger.kernel.org
Message-ID: <20160831163550.N0oy4nA2I6px7Wt0Z7HM8nWaF1pS_Ct-xDMqVXRDnbA@z>

The MIPS based xilfpga platform uses this driver.
Enable it for MIPS

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V2 -> V3
No change

V1 -> V2

No change
---
 drivers/net/ethernet/xilinx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/Kconfig b/drivers/net/ethernet/xilinx/Kconfig
index 4f5c024..ae5c404 100644
--- a/drivers/net/ethernet/xilinx/Kconfig
+++ b/drivers/net/ethernet/xilinx/Kconfig
@@ -5,7 +5,7 @@
 config NET_VENDOR_XILINX
 	bool "Xilinx devices"
 	default y
-	depends on PPC || PPC32 || MICROBLAZE || ARCH_ZYNQ
+	depends on PPC || PPC32 || MICROBLAZE || ARCH_ZYNQ || MIPS
 	---help---
 	  If you have a network (Ethernet) card belonging to this class, say Y.
 
@@ -18,7 +18,7 @@ if NET_VENDOR_XILINX
 
 config XILINX_EMACLITE
 	tristate "Xilinx 10/100 Ethernet Lite support"
-	depends on (PPC32 || MICROBLAZE || ARCH_ZYNQ)
+	depends on (PPC32 || MICROBLAZE || ARCH_ZYNQ || MIPS)
 	select PHYLIB
 	---help---
 	  This driver supports the 10/100 Ethernet Lite from Xilinx.
-- 
1.9.1
