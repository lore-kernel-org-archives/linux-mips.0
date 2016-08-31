Received: from mailapp01.imgtec.com ([195.59.15.196]:21861 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992247AbcHaQhJ2Pdgq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 18:37:09 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [Patch v3 08/11] net: ethernet: xilinx: Generate random mac if none found
Date: Wed, 31 Aug 2016 17:35:49 +0100
Message-ID: <1472661352-11983-9-git-send-email-Zubair.Kakakhel@imgtec.com>
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
Message-ID: <20160831163549.Egz1dgQrpLZCPLDrqjgcx_5BDNIdyZCZzYSqAr4hfq0@z>

At the moment, if the emaclite device doesn't find a mac address
from any source, it simply uses 0x0 with a warning printed.

Instead of using a 0x0 mac address, use a randomly generated one.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V2 -> V3
No change

V1 -> V2
New patch
---
 drivers/net/ethernet/xilinx/xilinx_emaclite.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
index 3cee84a..22e5a5a 100644
--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
@@ -1134,8 +1134,10 @@ static int xemaclite_of_probe(struct platform_device *ofdev)
 	if (mac_address)
 		/* Set the MAC address. */
 		memcpy(ndev->dev_addr, mac_address, ETH_ALEN);
-	else
-		dev_warn(dev, "No MAC address found\n");
+	else {
+		dev_warn(dev, "No MAC address found. Generating Random one\n");
+		eth_hw_addr_random(ndev);
+	}
 
 	/* Clear the Tx CSR's in case this is a restart */
 	__raw_writel(0, lp->base_addr + XEL_TSR_OFFSET);
-- 
1.9.1
