Received: from mailhub.zebra.lt ([212.59.31.77]:16132 "EHLO mh.zebra.lt")
	by ftp.linux-mips.org with ESMTP id S20032213AbYEFVc1 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 6 May 2008 22:32:27 +0100
Message-ID: <4820CE63.7050505@teltonika.lt>
Date: Wed, 07 May 2008 00:32:19 +0300
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
MIME-Version: 1.0
Subject: [PATCH] au1k_ir: use netstats in net_device structure
Content-Type: multipart/mixed;
 boundary="------------030305010008050208030004"
Return-Path: <paulius.zaleckas@teltonika.lt>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org, ppopov@mvista.com
Message-ID: <20080506213219.0CuJSJCB2IrgiQhARezncIxSfdAr6qPlX53h7FFNIZI@z>

This is a multi-part message in MIME format.
--------------030305010008050208030004
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Use net_device_stats from net_device structure instead of local.
Kill au1k_irda_stats function, because by default it is used
identical internal_stats function from net/core/dev.c

Haven't tried to compile it. Need ack from MIPS people!

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>

--------------030305010008050208030004
Content-Type: text/x-patch;
 name="au1k_ir_netstats.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="au1k_ir_netstats.patch"

diff --git a/drivers/net/irda/au1000_ircc.h b/drivers/net/irda/au1000_ircc.h
index 7a31d46..1ed665a 100644
--- a/drivers/net/irda/au1000_ircc.h
+++ b/drivers/net/irda/au1000_ircc.h
@@ -107,7 +107,6 @@ struct au1k_private {
 	iobuff_t rx_buff;
 
 	struct net_device *netdev;
-	struct net_device_stats stats;
 	
 	struct timeval stamp;
 	struct timeval now;
diff --git a/drivers/net/irda/au1k_ir.c b/drivers/net/irda/au1k_ir.c
index a1e4508..f4e639b 100644
--- a/drivers/net/irda/au1k_ir.c
+++ b/drivers/net/irda/au1k_ir.c
@@ -53,7 +53,6 @@ static int au1k_irda_hard_xmit(struct sk_buff *, struct net_device *);
 static int au1k_irda_rx(struct net_device *);
 static void au1k_irda_interrupt(int, void *);
 static void au1k_tx_timeout(struct net_device *);
-static struct net_device_stats *au1k_irda_stats(struct net_device *);
 static int au1k_irda_ioctl(struct net_device *, struct ifreq *, int);
 static int au1k_irda_set_speed(struct net_device *dev, int speed);
 
@@ -213,7 +212,6 @@ static int au1k_irda_net_init(struct net_device *dev)
 	dev->open = au1k_irda_start;
 	dev->hard_start_xmit = au1k_irda_hard_xmit;
 	dev->stop = au1k_irda_stop;
-	dev->get_stats = au1k_irda_stats;
 	dev->do_ioctl = au1k_irda_ioctl;
 	dev->tx_timeout = au1k_tx_timeout;
 
@@ -421,7 +419,7 @@ static inline void
 update_tx_stats(struct net_device *dev, u32 status, u32 pkt_len)
 {
 	struct au1k_private *aup = netdev_priv(dev);
-	struct net_device_stats *ps = &aup->stats;
+	struct net_device_stats *ps = &dev->stats;
 
 	ps->tx_packets++;
 	ps->tx_bytes += pkt_len;
@@ -557,7 +555,7 @@ static inline void
 update_rx_stats(struct net_device *dev, u32 status, u32 count)
 {
 	struct au1k_private *aup = netdev_priv(dev);
-	struct net_device_stats *ps = &aup->stats;
+	struct net_device_stats *ps = &dev->stats;
 
 	ps->rx_packets++;
 
@@ -596,7 +594,7 @@ static int au1k_irda_rx(struct net_device *dev)
 			update_rx_stats(dev, flags, count);
 			skb=alloc_skb(count+1,GFP_ATOMIC);
 			if (skb == NULL) {
-				aup->stats.rx_dropped++;
+				dev->stats.rx_dropped++;
 				continue;
 			}
 			skb_reserve(skb, 1);
@@ -833,13 +831,6 @@ au1k_irda_ioctl(struct net_device *dev, struct ifreq *ifreq, int cmd)
 	return ret;
 }
 
-
-static struct net_device_stats *au1k_irda_stats(struct net_device *dev)
-{
-	struct au1k_private *aup = netdev_priv(dev);
-	return &aup->stats;
-}
-
 MODULE_AUTHOR("Pete Popov <ppopov@mvista.com>");
 MODULE_DESCRIPTION("Au1000 IrDA Device Driver");
 

--------------030305010008050208030004--
