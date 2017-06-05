Received: from mailapp01.imgtec.com ([195.59.15.196]:33924 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993892AbdFERdYP-fXR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Jun 2017 19:33:24 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v4 4/7] net: pch_gbe: Add device tree support
Date: Mon, 5 Jun 2017 10:31:33 -0700
Message-ID: <20170605173136.10795-5-paul.burton@imgtec.com>
In-Reply-To: <20170605173136.10795-1-paul.burton@imgtec.com>
References: <20170602234042.22782-1-paul.burton@imgtec.com>
 <20170605173136.10795-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: "David S . Miller" <davem@davemloft.net>, linux-mips@linux-mips.org, Eric Dumazet <edumazet@google.com>, Jarod Wilson <jarod@redhat.com>, Tobias Klauser <tklauser@distanz.ch>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170605173133.EyXLUdLf_GDxWaE2Sa2TuLlfug2IovTGBHlCCwiY45o@z>

Introduce support for retrieving the PHY reset GPIO from device tree,
which will be used on the MIPS Boston development board. This requires
support for probe deferral in order to work correctly, since the order
of device probe is not guaranteed & typically the EG20T GPIO controller
device will be probed after the ethernet MAC.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jarod Wilson <jarod@redhat.com>
Cc: Tobias Klauser <tklauser@distanz.ch>
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org
---

Changes in v4:
- Use ERR_CAST(), thanks kbuild test robot/Fengguang!

Changes in v3: None

Changes in v2:
- Tidy up handling of parsing private data, drop err_out.

 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index cb9b904786e4..b9d8504eb09c 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -23,6 +23,8 @@
 #include <linux/net_tstamp.h>
 #include <linux/ptp_classify.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of_gpio.h>
 
 #define DRV_VERSION     "1.01"
 const char pch_driver_version[] = DRV_VERSION;
@@ -2565,13 +2567,40 @@ static void pch_gbe_remove(struct pci_dev *pdev)
 	free_netdev(netdev);
 }
 
+static struct pch_gbe_privdata *
+pch_gbe_get_priv(struct pci_dev *pdev, const struct pci_device_id *pci_id)
+{
+	struct pch_gbe_privdata *pdata;
+	struct gpio_desc *gpio;
+
+	if (!IS_ENABLED(CONFIG_OF))
+		return (struct pch_gbe_privdata *)pci_id->driver_data;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	gpio = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_ASIS);
+	if (!IS_ERR(gpio))
+		pdata->phy_reset_gpio = gpio;
+	else if (PTR_ERR(gpio) != -ENOENT)
+		return ERR_CAST(gpio);
+
+	return pdata;
+}
+
 static int pch_gbe_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *pci_id)
 {
 	struct net_device *netdev;
 	struct pch_gbe_adapter *adapter;
+	struct pch_gbe_privdata *pdata;
 	int ret;
 
+	pdata = pch_gbe_get_priv(pdev, pci_id);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
 	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
@@ -2609,7 +2638,7 @@ static int pch_gbe_probe(struct pci_dev *pdev,
 	adapter->pdev = pdev;
 	adapter->hw.back = adapter;
 	adapter->hw.reg = pcim_iomap_table(pdev)[PCH_GBE_PCI_BAR];
-	adapter->pdata = (struct pch_gbe_privdata *)pci_id->driver_data;
+	adapter->pdata = pdata;
 	if (adapter->pdata && adapter->pdata->platform_init)
 		adapter->pdata->platform_init(pdev, adapter->pdata);
 
-- 
2.13.0
