Received: from szxga05-in.huawei.com ([45.249.212.191]:2246 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990490AbeIUDGL1nAoG (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 21 Sep 2018 05:06:11 +0200
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next] net: sgi: fix return type of ndo_start_xmit function
Date: Fri, 21 Sep 2018 11:05:50 +0800
Message-ID: <20180921030550.24744-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <yuehaibing@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: davem@davemloft.net, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mips@linux-mips.org, YueHaibing <yuehaibing@huawei.com>
Message-ID: <20180921030550.goeFYMfwavjtQlSEUKZBXnhPcVUAau8RzAyA7J18DDE@z>

The method ndo_start_xmit() is defined as returning an 'netdev_tx_t',
which is a typedef for an enum type, so make sure the implementation in
this driver has returns 'netdev_tx_t' value, and change the function
return type to netdev_tx_t.

Found by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 4 ++--
 drivers/net/ethernet/sgi/meth.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 18d533f..3140999 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -99,7 +99,7 @@ struct ioc3_private {
 
 static int ioc3_ioctl(struct net_device *dev, struct ifreq *rq, int cmd);
 static void ioc3_set_multicast_list(struct net_device *dev);
-static int ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev);
+static netdev_tx_t ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev);
 static void ioc3_timeout(struct net_device *dev);
 static inline unsigned int ioc3_hash(const unsigned char *addr);
 static inline void ioc3_stop(struct ioc3_private *ip);
@@ -1390,7 +1390,7 @@ static void ioc3_remove_one(struct pci_dev *pdev)
 	.remove		= ioc3_remove_one,
 };
 
-static int ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	unsigned long data;
 	struct ioc3_private *ip = netdev_priv(dev);
diff --git a/drivers/net/ethernet/sgi/meth.c b/drivers/net/ethernet/sgi/meth.c
index ea55abd..703fbbe 100644
--- a/drivers/net/ethernet/sgi/meth.c
+++ b/drivers/net/ethernet/sgi/meth.c
@@ -697,7 +697,7 @@ static void meth_add_to_tx_ring(struct meth_private *priv, struct sk_buff *skb)
 /*
  * Transmit a packet (called by the kernel)
  */
-static int meth_tx(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t meth_tx(struct sk_buff *skb, struct net_device *dev)
 {
 	struct meth_private *priv = netdev_priv(dev);
 	unsigned long flags;
-- 
1.8.3.1
