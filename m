Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:43455 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994661AbeBQUOcgYE2G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:32 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 09/14] net: pch_gbe: Use pch_gbe_disable_dma_rx() in pch_gbe_configure_rx()
Date: Sat, 17 Feb 2018 12:10:32 -0800
Message-ID: <20180217201037.3006-10-paul.burton@mips.com>
In-Reply-To: <20180217201037.3006-1-paul.burton@mips.com>
References: <20180217201037.3006-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: netdev@vger.kernel.org
Cc: Hassan Naveed <hassan.naveed@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, "David S . Miller" <davem@davemloft.net>, linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20180217201032.wHl6hXBCtmb0eRiext1sROdxLVmsUyK0f3Q7OT67CR0@z>

The pch_gbe_configure_rx() function open-codes the equivalent of
pch_gbe_disable_dma_rx(). Remove the duplication by moving
pch_gbe_disable_dma_rx(), and pch_gbe_enable_dma_rx() for consistency,
to be defined earlier than pch_gbe_configure_rx() and have
pch_gbe_configure_rx() call pch_gbe_disable_dma_rx() rather than
duplicate its functionality.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org

---

Changes in v5:
- New patch.

Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 48 ++++++++++------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 2d6980603ee4..b6cc4a34ed89 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -831,6 +831,26 @@ static void pch_gbe_irq_enable(struct pch_gbe_adapter *adapter)
 		   ioread32(&hw->reg->INT_EN));
 }
 
+static void pch_gbe_disable_dma_rx(struct pch_gbe_hw *hw)
+{
+	u32 rxdma;
+
+	/* Disable Receive DMA */
+	rxdma = ioread32(&hw->reg->DMA_CTRL);
+	rxdma &= ~PCH_GBE_RX_DMA_EN;
+	iowrite32(rxdma, &hw->reg->DMA_CTRL);
+}
+
+static void pch_gbe_enable_dma_rx(struct pch_gbe_hw *hw)
+{
+	u32 rxdma;
+
+	/* Enables Receive DMA */
+	rxdma = ioread32(&hw->reg->DMA_CTRL);
+	rxdma |= PCH_GBE_RX_DMA_EN;
+	iowrite32(rxdma, &hw->reg->DMA_CTRL);
+}
+
 /**
  * pch_gbe_configure_tx - Configure Transmit Unit after Reset
  * @adapter:  Board private structure
@@ -876,7 +896,7 @@ static void pch_gbe_configure_tx(struct pch_gbe_adapter *adapter)
 static void pch_gbe_configure_rx(struct pch_gbe_adapter *adapter)
 {
 	struct pch_gbe_hw *hw = &adapter->hw;
-	u32 rdba, rdlen, rxdma, rx_mode, tcpip;
+	u32 rdba, rdlen, rx_mode, tcpip;
 
 	rx_mode = PCH_GBE_ADD_FIL_EN |
 		  PCH_GBE_MLT_FIL_EN |
@@ -897,11 +917,7 @@ static void pch_gbe_configure_rx(struct pch_gbe_adapter *adapter)
 	pch_gbe_mac_force_mac_fc(hw);
 
 	pch_gbe_disable_mac_rx(hw);
-
-	/* Disables Receive DMA */
-	rxdma = ioread32(&hw->reg->DMA_CTRL);
-	rxdma &= ~PCH_GBE_RX_DMA_EN;
-	iowrite32(rxdma, &hw->reg->DMA_CTRL);
+	pch_gbe_disable_dma_rx(hw);
 
 	netdev_dbg(adapter->netdev,
 		   "MAC_RX_EN reg = 0x%08x  DMA_CTRL reg = 0x%08x\n",
@@ -1290,26 +1306,6 @@ void pch_gbe_update_stats(struct pch_gbe_adapter *adapter)
 	spin_unlock_irqrestore(&adapter->stats_lock, flags);
 }
 
-static void pch_gbe_disable_dma_rx(struct pch_gbe_hw *hw)
-{
-	u32 rxdma;
-
-	/* Disable Receive DMA */
-	rxdma = ioread32(&hw->reg->DMA_CTRL);
-	rxdma &= ~PCH_GBE_RX_DMA_EN;
-	iowrite32(rxdma, &hw->reg->DMA_CTRL);
-}
-
-static void pch_gbe_enable_dma_rx(struct pch_gbe_hw *hw)
-{
-	u32 rxdma;
-
-	/* Enables Receive DMA */
-	rxdma = ioread32(&hw->reg->DMA_CTRL);
-	rxdma |= PCH_GBE_RX_DMA_EN;
-	iowrite32(rxdma, &hw->reg->DMA_CTRL);
-}
-
 /**
  * pch_gbe_intr - Interrupt Handler
  * @irq:   Interrupt number
-- 
2.16.1
