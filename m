Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:55422 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994656AbeBQUOWTvhWG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:22 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 07/14] net: pch_gbe: Fix handling of TX padding
Date: Sat, 17 Feb 2018 12:10:30 -0800
Message-ID: <20180217201037.3006-8-paul.burton@mips.com>
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
Message-ID: <20180217201030.GJmT6TgVVY553QeJDgZYYX_mLjOW27CkqfDmUtXpzh8@z>

The ethernet controller found in the Intel EG20T Platform Controller
Hub requires that we place 2 bytes of padding between the ethernet
header & the packet payload. Our pch_gbe driver handles this by copying
packets to be transmitted to a temporary struct skb with the padding
bytes inserted, however it sets the length of this temporary skb to
equal that of the original, without the 2 padding bytes, and then uses
this length as that of the memory to map for DMA.

This is problematic on systems that don't have cache-coherent DMA, since
if the length of the original buffer is either a multiple of the
system's cache line size or one less than such a multiple then the size
we provide to dma_map_single() will not cover the last byte or two of
the data when rounded up to a cache line boundary. This may result in us
transmitting corrupt data in the last one or two bytes of the packet,
depending upon its length.

Fix this by setting the length of tmp_skb to include the 2 padding
bytes, which is actually the length of the data it holds. This is then
assigned to buffer_info->length & provided to dma_map_single() which
will operate on all of the data as desired. The EG20T datasheet
specifies that the padding bytes should not be included in the length
stored in the TX descriptor, so we switch that to use the length of the
original skb.

Whilst modifying this code we switch to using PCH_GBE_DMA_PADDING rather
than the magic number 2 to specify the size of the padding, making it
clearer what the code is doing, and fix a typo in the comment indicating
that padding is inserted.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 77f7fbd98e8f..60e91c0fc98b 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -1223,13 +1223,12 @@ static void pch_gbe_tx_queue(struct pch_gbe_adapter *adapter,
 	buffer_info = &tx_ring->buffer_info[ring_num];
 	tmp_skb = buffer_info->skb;
 
-	/* [Header:14][payload] ---> [Header:14][paddong:2][payload]    */
+	/* [Header:14][payload] ---> [Header:14][padding:2][payload] */
 	memcpy(tmp_skb->data, skb->data, ETH_HLEN);
-	tmp_skb->data[ETH_HLEN] = 0x00;
-	tmp_skb->data[ETH_HLEN + 1] = 0x00;
-	tmp_skb->len = skb->len;
-	memcpy(&tmp_skb->data[ETH_HLEN + 2], &skb->data[ETH_HLEN],
-	       (skb->len - ETH_HLEN));
+	memset(&tmp_skb->data[ETH_HLEN], 0, PCH_GBE_DMA_PADDING);
+	memcpy(&tmp_skb->data[ETH_HLEN + PCH_GBE_DMA_PADDING],
+	       &skb->data[ETH_HLEN], skb->len - ETH_HLEN);
+	tmp_skb->len = skb->len + PCH_GBE_DMA_PADDING;
 	/*-- Set Buffer information --*/
 	buffer_info->length = tmp_skb->len;
 	buffer_info->dma = dma_map_single(&adapter->pdev->dev, tmp_skb->data,
@@ -1248,8 +1247,8 @@ static void pch_gbe_tx_queue(struct pch_gbe_adapter *adapter,
 	/*-- Set Tx descriptor --*/
 	tx_desc = PCH_GBE_TX_DESC(*tx_ring, ring_num);
 	tx_desc->buffer_addr = (buffer_info->dma);
-	tx_desc->length = (tmp_skb->len);
-	tx_desc->tx_words_eob = ((tmp_skb->len + 3));
+	tx_desc->length = (skb->len);
+	tx_desc->tx_words_eob = ((skb->len + 3));
 	tx_desc->tx_frame_ctrl = (frame_ctrl);
 	tx_desc->gbec_status = (DSC_INIT16);
 
-- 
2.16.1
