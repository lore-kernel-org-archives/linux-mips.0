Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:35540 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994662AbeBQUOcSuq9G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:32 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 11/14] net: pch_gbe: Ensure DMA is ordered with descriptor writes
Date: Sat, 17 Feb 2018 12:10:34 -0800
Message-ID: <20180217201037.3006-12-paul.burton@mips.com>
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
Message-ID: <20180217201034.m2ePsTP3xdzPlbnr9whqkaitUXA9-ZG2AwHlWbDz5Js@z>

On weakly ordered systems writes to the RX or TX descriptors may be
reordered with the write to the DMA control register that enables DMA.
If this happens then the device may see descriptors in an intermediate
& invalid state, leading to incorrect behaviour. Add barriers to ensure
that DMA is enabled only after all writes to the descriptors.

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

 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 4354842b9b7e..8e3ad7dcef0b 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -1260,6 +1260,9 @@ static void pch_gbe_tx_queue(struct pch_gbe_adapter *adapter,
 	tx_desc->tx_frame_ctrl = (frame_ctrl);
 	tx_desc->gbec_status = (DSC_INIT16);
 
+	/* Ensure writes to descriptors complete before DMA begins */
+	mmiowb();
+
 	if (unlikely(++ring_num == tx_ring->count))
 		ring_num = 0;
 
@@ -1961,6 +1964,9 @@ int pch_gbe_up(struct pch_gbe_adapter *adapter)
 	pch_gbe_alloc_rx_buffers(adapter, rx_ring, rx_ring->count);
 	adapter->tx_queue_len = netdev->tx_queue_len;
 
+	/* Ensure writes to descriptors complete before DMA begins */
+	mmiowb();
+
 	pch_gbe_enable_dma_tx(&adapter->hw);
 	pch_gbe_enable_dma_rx(&adapter->hw);
 	pch_gbe_enable_mac_rx(&adapter->hw);
-- 
2.16.1
