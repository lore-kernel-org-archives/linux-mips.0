Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:40399 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994663AbeBQUOeLSFPG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:34 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 10/14] net: pch_gbe: Disable TX DMA whilst configuring descriptors
Date: Sat, 17 Feb 2018 12:10:33 -0800
Message-ID: <20180217201037.3006-11-paul.burton@mips.com>
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
Message-ID: <20180217201033.ZzpL0ssE_qW1nYmKtUFUunQt0Gj2mBq7yN6pP7NkR90@z>

The pch_gbe driver enables TX DMA the first time we call
pch_gbe_configure_tx() and never disables it again, even if we
reconfigure the device & modify the transmit descriptor ring. This seems
unsafe, since the device may continue accessing descriptors whilst they
are in an unpredictable & possibly invalid state - especially on systems
where the CPUs writes to the descriptors is not coherent with DMA.

In the RX path pch_gbe_configure_rx() disables DMA before configuring
the descriptor pointers & before we set up the descriptors, then
pch_gbe_up() calls pch_gbe_enable_dma_rx() to enable DMA again after the
descriptors have been configured. Here we copy that same scheme for the
TX path - pch_gbe_configure_tx() calls pch_gbe_disable_dma_tx() to
disable DMA, and then after the descriptors have been configured
pch_gbe_up() calls pch_gbe_enable_dma_tx() to enable DMA. This should
ensure that the device doesn't begin reading descriptors before we have
configured them.

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

 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 29 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index b6cc4a34ed89..4354842b9b7e 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -851,6 +851,24 @@ static void pch_gbe_enable_dma_rx(struct pch_gbe_hw *hw)
 	iowrite32(rxdma, &hw->reg->DMA_CTRL);
 }
 
+static void pch_gbe_disable_dma_tx(struct pch_gbe_hw *hw)
+{
+	u32 rxdma;
+
+	rxdma = ioread32(&hw->reg->DMA_CTRL);
+	rxdma &= ~PCH_GBE_TX_DMA_EN;
+	iowrite32(rxdma, &hw->reg->DMA_CTRL);
+}
+
+static void pch_gbe_enable_dma_tx(struct pch_gbe_hw *hw)
+{
+	u32 rxdma;
+
+	rxdma = ioread32(&hw->reg->DMA_CTRL);
+	rxdma |= PCH_GBE_TX_DMA_EN;
+	iowrite32(rxdma, &hw->reg->DMA_CTRL);
+}
+
 /**
  * pch_gbe_configure_tx - Configure Transmit Unit after Reset
  * @adapter:  Board private structure
@@ -858,7 +876,7 @@ static void pch_gbe_enable_dma_rx(struct pch_gbe_hw *hw)
 static void pch_gbe_configure_tx(struct pch_gbe_adapter *adapter)
 {
 	struct pch_gbe_hw *hw = &adapter->hw;
-	u32 tdba, tdlen, dctrl, tx_mode, tcpip;
+	u32 tdba, tdlen, tx_mode, tcpip;
 
 	tx_mode = PCH_GBE_TM_LONG_PKT |
 		PCH_GBE_TM_ST_AND_FD |
@@ -876,17 +894,14 @@ static void pch_gbe_configure_tx(struct pch_gbe_adapter *adapter)
 		   (unsigned long long)adapter->tx_ring->dma,
 		   adapter->tx_ring->size);
 
+	pch_gbe_disable_dma_tx(hw);
+
 	/* Setup the HW Tx Head and Tail descriptor pointers */
 	tdba = adapter->tx_ring->dma;
 	tdlen = adapter->tx_ring->size - 0x10;
 	iowrite32(tdba, &hw->reg->TX_DSC_BASE);
 	iowrite32(tdlen, &hw->reg->TX_DSC_SIZE);
 	iowrite32(tdba, &hw->reg->TX_DSC_SW_P);
-
-	/* Enables Transmission DMA */
-	dctrl = ioread32(&hw->reg->DMA_CTRL);
-	dctrl |= PCH_GBE_TX_DMA_EN;
-	iowrite32(dctrl, &hw->reg->DMA_CTRL);
 }
 
 /**
@@ -1945,6 +1960,8 @@ int pch_gbe_up(struct pch_gbe_adapter *adapter)
 	pch_gbe_alloc_tx_buffers(adapter, tx_ring);
 	pch_gbe_alloc_rx_buffers(adapter, rx_ring, rx_ring->count);
 	adapter->tx_queue_len = netdev->tx_queue_len;
+
+	pch_gbe_enable_dma_tx(&adapter->hw);
 	pch_gbe_enable_dma_rx(&adapter->hw);
 	pch_gbe_enable_mac_rx(&adapter->hw);
 
-- 
2.16.1
