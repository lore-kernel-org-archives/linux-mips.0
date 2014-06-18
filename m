Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:56845 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6859953AbaFRMflz4nIm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 Jun 2014 14:35:41 +0200
From: <ganesanr@broadcom.com>
Subject: [PATCH 2/3] Staging: PHY address calculation fix
Date: Wed, 18 Jun 2014 18:43:57 +0530
Message-ID: <20fcbf14feaa9b27cd043a1d6af21debacacf63a.1403096668.git.ganesanr@broadcom.com>
In-Reply-To: <cover.1403096668.git.ganesanr@broadcom.com>
References: <cover.1403096668.git.ganesanr@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <ganesanr@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: kristina.martsenko@gmail.com, gregkh@linuxfoundation.org
Cc: Ganesan Ramalingam <ganesanr@broadcom.com>, jchandra@broadcom.com, linux-mips@linux-mips.org, ralf@linux-mips.org, netdev@vger.kernel.org
Message-ID: <20140618131357.WaC1SpMoG70H53beBKDvT6MBXedbKio9DBh5biCpEMo@z>

From: Ganesan Ramalingam <ganesanr@broadcom.com>

SGMII PHY address calculation should be based on phy_addr of priv data

Signed-off-by: Ganesan Ramalingam <ganesanr@broadcom.com>
---
 drivers/staging/netlogic/xlr_net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
index 69ae8b6..6d7a6a7 100644
--- a/drivers/staging/netlogic/xlr_net.c
+++ b/drivers/staging/netlogic/xlr_net.c
@@ -776,7 +776,7 @@ static void xlr_sgmii_init(struct xlr_net_priv *priv)
 	xlr_nae_wreg(priv->gpio_addr, 0x21, 0x7104);
 
 	/* enable autoneg - more magic */
-	phy = priv->port_id % 4 + 27;
+	phy = priv->phy_addr % 4 + 27;
 	xlr_phy_write(priv->pcs_addr, phy, 0, 0x1000);
 	xlr_phy_write(priv->pcs_addr, phy, 0, 0x0200);
 }
-- 
1.7.9.5
