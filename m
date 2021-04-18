Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F17C43470
	for <linux-mips@archiver.kernel.org>; Sun, 18 Apr 2021 22:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A7D961026
	for <linux-mips@archiver.kernel.org>; Sun, 18 Apr 2021 22:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhDRWU2 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 18 Apr 2021 18:20:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:38286 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232880AbhDRWUW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 18 Apr 2021 18:20:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 63E5BB13B;
        Sun, 18 Apr 2021 22:19:52 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v6 net-next 04/10] net: korina: Remove nested helpers
Date:   Mon, 19 Apr 2021 00:19:42 +0200
Message-Id: <20210418221949.130779-5-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210418221949.130779-1-tsbogend@alpha.franken.de>
References: <20210418221949.130779-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove helpers, which are only used in one call site.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/net/ethernet/korina.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index c7abb4a8dd37..955fe3d3da06 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -142,12 +142,6 @@ struct korina_private {
 
 extern unsigned int idt_cpu_freq;
 
-static inline void korina_start_dma(struct dma_reg *ch, u32 dma_addr)
-{
-	writel(0, &ch->dmandptr);
-	writel(dma_addr, &ch->dmadptr);
-}
-
 static inline void korina_abort_dma(struct net_device *dev,
 					struct dma_reg *ch)
 {
@@ -164,11 +158,6 @@ static inline void korina_abort_dma(struct net_device *dev,
 	writel(0, &ch->dmandptr);
 }
 
-static inline void korina_chain_dma(struct dma_reg *ch, u32 dma_addr)
-{
-	writel(dma_addr, &ch->dmandptr);
-}
-
 static void korina_abort_tx(struct net_device *dev)
 {
 	struct korina_private *lp = netdev_priv(dev);
@@ -183,18 +172,6 @@ static void korina_abort_rx(struct net_device *dev)
 	korina_abort_dma(dev, lp->rx_dma_regs);
 }
 
-static void korina_start_rx(struct korina_private *lp,
-					struct dma_desc *rd)
-{
-	korina_start_dma(lp->rx_dma_regs, CPHYSADDR(rd));
-}
-
-static void korina_chain_rx(struct korina_private *lp,
-					struct dma_desc *rd)
-{
-	korina_chain_dma(lp->rx_dma_regs, CPHYSADDR(rd));
-}
-
 /* transmit packet */
 static int korina_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
@@ -463,7 +440,7 @@ static int korina_rx(struct net_device *dev, int limit)
 		rd->devcs = 0;
 		skb = lp->rx_skb[lp->rx_next_done];
 		rd->ca = CPHYSADDR(skb->data);
-		korina_chain_rx(lp, rd);
+		writel(CPHYSADDR(rd), &lp->rx_dma_regs->dmandptr);
 	}
 
 	return count;
@@ -840,7 +817,8 @@ static int korina_init(struct net_device *dev)
 
 	writel(0, &lp->rx_dma_regs->dmas);
 	/* Start Rx DMA */
-	korina_start_rx(lp, &lp->rd_ring[0]);
+	writel(0, &lp->rx_dma_regs->dmandptr);
+	writel(CPHYSADDR(&lp->rd_ring[0]), &lp->rx_dma_regs->dmadptr);
 
 	writel(readl(&lp->tx_dma_regs->dmasm) &
 			~(DMA_STAT_FINI | DMA_STAT_ERR),
-- 
2.29.2

