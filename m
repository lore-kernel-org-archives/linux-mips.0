Received: from szxga06-in.huawei.com ([45.249.212.32]:33145 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992759AbeITMsTYY0rp (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 20 Sep 2018 14:48:19 +0200
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 03/22] net: seeq: fix return type of ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:32:47 +0800
Message-ID: <20180920123306.14772-4-yuehaibing@huawei.com>
In-Reply-To: <20180920123306.14772-1-yuehaibing@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
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
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org, YueHaibing <yuehaibing@huawei.com>
Message-ID: <20180920123247.60L8SPJfc0vcj9VYE1NDpJ0JU3Z7fFN9PhVDvNDApfo@z>

The method ndo_start_xmit() is defined as returning an 'netdev_tx_t',
which is a typedef for an enum type, so make sure the implementation in
this driver has returns 'netdev_tx_t' value, and change the function
return type to netdev_tx_t.

Found by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/seeq/ether3.c  | 5 +++--
 drivers/net/ethernet/seeq/sgiseeq.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/seeq/ether3.c b/drivers/net/ethernet/seeq/ether3.c
index c5bc124..d1bb73b 100644
--- a/drivers/net/ethernet/seeq/ether3.c
+++ b/drivers/net/ethernet/seeq/ether3.c
@@ -77,7 +77,8 @@
 static int	ether3_rx(struct net_device *dev, unsigned int maxcnt);
 static void	ether3_tx(struct net_device *dev);
 static int	ether3_open (struct net_device *dev);
-static int	ether3_sendpacket (struct sk_buff *skb, struct net_device *dev);
+static netdev_tx_t	ether3_sendpacket(struct sk_buff *skb,
+					  struct net_device *dev);
 static irqreturn_t ether3_interrupt (int irq, void *dev_id);
 static int	ether3_close (struct net_device *dev);
 static void	ether3_setmulticastlist (struct net_device *dev);
@@ -481,7 +482,7 @@ static void ether3_timeout(struct net_device *dev)
 /*
  * Transmit a packet
  */
-static int
+static netdev_tx_t
 ether3_sendpacket(struct sk_buff *skb, struct net_device *dev)
 {
 	unsigned long flags;
diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
index 573691b..70cce63 100644
--- a/drivers/net/ethernet/seeq/sgiseeq.c
+++ b/drivers/net/ethernet/seeq/sgiseeq.c
@@ -578,7 +578,8 @@ static inline int sgiseeq_reset(struct net_device *dev)
 	return 0;
 }
 
-static int sgiseeq_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t
+sgiseeq_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct sgiseeq_private *sp = netdev_priv(dev);
 	struct hpc3_ethregs *hregs = sp->hregs;
-- 
1.8.3.1
