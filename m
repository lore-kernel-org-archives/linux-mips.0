Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417B39F190;
	Thu, 17 Sep 2026 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678057; cv=fail; b=iJCS/dUHwESYtmaUghDfJ44SrCdKWJf7MiocrZvCxRtdNQ/nxGRxkrfcPa68dymQe4WCr97RLZ9VPsHlJ2XlFYGNMM+Rdoy2f4/iEqJPODyvBYEXBo19IAy8RlFHr0l9N3oQI22ahLXWIHAJeBH3uA6G++Pka21iWVbQeiEiJcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678057; c=relaxed/simple;
	bh=21kow82A5NnjZ9Bn9YdovT9Fj3BZXb7hJVLfCCf3juc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nNOKC7J2KfW0skULTc2eB6H+7nhnc+UtHCJ1i4qWfPL6pqsSFsqzNXERziaCTntCAU9l6Baavg1v9Nthgdgw/NXHFTitiROA/qx3T0qrcfO0tRqmtevWHRIMTm3BZkpntms9wTwFzbbDe9GCFRit5ASoKJHbIXVKPcEkzBEad54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lTkVxHay; arc=fail smtp.client-ip=52.101.83.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lTkVxHay"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3G5Fm9OvYfRT73GAmOjnruoVx1CB11fb1tkaQlEWURwwXHDJ95JID4hhMgE8KL0MPcYTdAX5IC3BbfJ91dBH8avBw0ERWU+xaoQKL1zr3i+Ss7sQKxkUtvmrDssnzAH4J/uu/K1Z7K53Gh+sbBvzwVPIILcMAc9B6tyBczTfm5p3xbsfKWZtQfFfsXoY5zDB8dgePvUQWbcLBe1qb9P1e4luBjfh7B+VJzr1NZk2Q3WWG0yf4BhdJ6XQ3y3ZSK/6zrKlgEp+Z2W+O2Or60SZ01Tk5uhPrdllTdmcCshA3Vz4p20CKgKSj5EmMy02GE7rFD2aiKGWCgX5/RB33DeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt3D8ki/DpuDlWlAYkz48wzwmfbJA7EbuWN/j0rt/i4=;
 b=cVfBef/zrlHz4jLByC2Cm9KeQAmvmrAHK6311hKnj0nqsTlLIIvHxI/lt2GZr6xb68J6Ag2U9UmTHnYuihkxK56uqSu+M7kbaIMdOE2CbO7ywcd5uLHUfZqX+lB3+DPIXJ36KnvZgwB7NNnw6P4GSPxzBvkV7Moy9rvzjuunyGj59RV0dvxpXMVg5VvJS0PlQYckxfTm63BHfcHsTNvsfqtYIDNmx9GQXEH08ERxUA7bshFFktyCRCTIuRZ6AQArSUi0uH36xuqcoWIJLoJYK4fEbwpx+UAsB3RkP6andbVJ3mG0pH7baTbmq6MSmUaLhbDzCoWbkQSGwqCbkHnr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt3D8ki/DpuDlWlAYkz48wzwmfbJA7EbuWN/j0rt/i4=;
 b=lTkVxHay/Xd2mLmON/njJY5q+fq/w/uc9uqA+4poD4864V7NtwH5T/ANC8WgNyhlyLtlabSonoSjGXoM8fug9SdcjCaOTa9mup1gk1LwVE3DHPJ1HxtkVeGk8KaJBX3sM9HjXvz+XLXYuRMkBI6f558P7kEdg7lQztiFCaCB5s4yr+kKtvPUxClB9lB6rW2lAFx5FROUVQCx+U/hjgbrABbQiNXA25eOFzhZJ4KP+4Yt5AyP1ZisR20IZ0URtSuVGjPm06yZvawtk7VgzJUPHWT6YIXigNxr/6qx3uhPAuMsAe30MBW5gYLw3wgCT4c3Y6qxNJdUEyK9cNN8KzYqNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DB9PR04MB11511.eurprd04.prod.outlook.com (2603:10a6:10:5df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:47:31 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:47:31 +0000
From: Frank.Li@oss.nxp.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Frank Li <Frank.Li@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-mtd@lists.infradead.org (open list:HYPERBUS SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS/LOONGSON1 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] mtd: use dmaengine_get_dma_device() instead of chan->device->dev
Date: Thu, 17 Sep 2026 16:47:06 -0400
Message-ID: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::18) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DB9PR04MB11511:EE_
X-MS-Office365-Filtering-Correlation-Id: 095aa151-df94-424e-6a9f-08df14fce4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|11063799006|56012099006|10067099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	rn8eTc4yTEA2RZU3L9J3Ofkgo/zVAdDqjwmaVb16x8GuyoJ50ssgloLuu5rQNASM9niX5eIveGAAO2BV9rjdwBbh9ft7KRktIm123in9J16VkHZtubvxAPOX7Wu8ZI/6GDHwIe8VDLS5ADiY7DZuxRpy7XcluShpjG1ucV+EndZ5L5aYSSMFkdP9THmHXWKhm93uC5lodfiRb6GJNCEPvlwJxeVvaIMq8aDD/rO4sqKLwtFkgJQn0nheFGJBNdL5cbgdbL3zlHEpVEPkYMisLBfsvBl3cwuRYe3aUaFMv1ts3Talq89JFgeaskdukfb55+QWtDZJH0gi9xM48LqKSnlmKMBlqlScLU8/DI80zBsE0GLcJmSF+afFMj6LGfiL6MrWRGDCeeMu6U9wLioZFdc3MfaXlyJ9jhRXCLvmc9AYzoKyn9jSvNbq9PoiGIV1VklBYOETlYVauyANgEmdZZT778f4uGJMOI4uVg3I49q0pcdVUTkfmm7uIM3/89LL4ab1X5qvGS01BvhqtTPsa+BvXq3XbQS4oFywflHEe062Jmip3gqtnhvMiez/aUgV3WkXtd6502uYCa6W6SeOAHvTAJ8X79/YHAuDaW/1psVJjh5dmMaH0KNHkvmxj7S8HYj0qTNw2Rj2fXciLEgUhxqetlkPfVVip4aufaoNaNipDYINzTHJuDQ1oEYGoVW/BoNRdfDD3HGSwfOSPr+8rA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(11063799006)(56012099006)(10067099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oKPP9cLPKCXMuUqeTvybRa/VGYSetDi9r7kEmjwm2k1itBeBnUEHW+y+VmfP?=
 =?us-ascii?Q?+ycphQqOSr9OQJJepRIs7jwI492YH6tQV3WbsO14He5byX13NfWLuCHBd4QX?=
 =?us-ascii?Q?5D1jglJ4o5tgWKKjuDEp7KToa+vo9p7uly0rUgzgtYDXEEEEVSY52znEyyVA?=
 =?us-ascii?Q?ZQrxZxU6QZowNsSpWDVAIokP9H+/QEggIedypiKZRfUO3IXborn7XOmL3Qme?=
 =?us-ascii?Q?+kzTRc/TP/Um7kR4s45XQ6Gih0LxBRtGvHkELL/LNO3DP3EF/xsp/nKRbfzK?=
 =?us-ascii?Q?5nAwdWYWFxLbTexi6Uji94A5VHrabjjFAorjvAwYiCx6tJ3FZXC1aKuoBgYs?=
 =?us-ascii?Q?RDU6Nk+hw3hU9y8oRpmOWfEJzMcOvFs/VeP9Gwm4VBkRgnOjyuVj0GmrgU5t?=
 =?us-ascii?Q?jMTE4lU+DsT5g0eFecysiHkKd8IpZlVNYcFPHy3GHx+1Z9RKAeINRAbfPKc8?=
 =?us-ascii?Q?1Bi7M3+zIQq7KvQ8Oc3YPuj6x9cOmZR+9XtXDht/Comy6HRlas7ZT7oszseb?=
 =?us-ascii?Q?CNWhMx/sTskbRYdWNX/fRCdLOMTezX0McxL9Sox5ouMlBuVh1nR+4Y5xP8qw?=
 =?us-ascii?Q?5kuoVrhskMn23dWmjcN/baWwlLWOqdRPMW+oT4K3YlBgqQGCp9sQTtvAy2+Y?=
 =?us-ascii?Q?QnRMXWcGZkQDtl0bpt/Xeyr8cVff+gMqLaotucQLm5nxp6Bf6HrIx1pw+TL+?=
 =?us-ascii?Q?hCjlcxy7vXZbILRojh2H7MFEPU288SJBL/p29hdaNNzXLI8/mkCs3Zhygc3M?=
 =?us-ascii?Q?4msrrGyGDh7O6272zC1pFTP0XmoVl0uFrlVm3D4pASHGMBUV8V3Y7z3s9ZJh?=
 =?us-ascii?Q?1e6ZFDMGoXEmXhmP9KB5PN3dP1QUzQgT97qs7BykDY5ECW+5nvZfHTuJ+4VN?=
 =?us-ascii?Q?0Nou/mFXYWiKQXwc/DY4HjJc2pkAEwr/DHa4K3x+dlKlJ9LuOck9D9JtuwVr?=
 =?us-ascii?Q?G9+/VQZVCtUR7sSfIqAPAxTpnEvb+xrTYIhUXb/oEcibia7hZmH7HvTRImSQ?=
 =?us-ascii?Q?zHONnXSrPilQ9y2MuNSw6Ogw9J22hzeJ0VCgyvKNbEp7zqon97NfwWlOCyQ1?=
 =?us-ascii?Q?HPYFzM+ed0mnJuishhFogFotRmpquQ9o2v7k15lDLfDObc9DdPtT0C7v3nYO?=
 =?us-ascii?Q?TnfAmRdBvnReXm2xEjwAp2NT5cK+e2wcm3PKXVDNG8/M0FnmkchjgXz96NJw?=
 =?us-ascii?Q?UhefZyZ5Diimrs4TpAgWtgCMPectR3VDOr8qiQlPFgf9OEGqymf9Jc26oTd+?=
 =?us-ascii?Q?A5wAbeOVetKu91+FfO+0xGsKgMurBFE5Qe2qMxwJrzrxJlXppyjEvtVfEhoY?=
 =?us-ascii?Q?sc8rFEmRvz3hm3sjxmQZQXv7J4eoyZPB/dpV+tfotAgt1r/yQL6APiWKNZzx?=
 =?us-ascii?Q?q1VcjVXMHwbVICXrKjKlhrj7CFK3qICGB7QkYVgj+nfWveN45GJLYv/ewZgT?=
 =?us-ascii?Q?k3V7aDMCf7IE8hU8KGvVB6KEy5pjyKksVav8j36l1TdXEu2tOa7FDEMts2Fp?=
 =?us-ascii?Q?0ExjWZI2q4uxmGLXeDjre+/XzKaykhnU1ozv+5s8Jp9Hbrz3SYBlmkJMW81p?=
 =?us-ascii?Q?B+gkmlfqtQ0L50f9bW1/oY8eQR2KLssXKVggaDpp38tZYkKXhLaqzaKYVZAE?=
 =?us-ascii?Q?vU9sGOinGsD7cVA3PP2+HNu5G4loTBZCkgR1n9Szz40rj2u/L/vQ8rXXsUeJ?=
 =?us-ascii?Q?vCOtMgTowStRIo6qoyty9dt4/5/1Ji7pmwnw4UAX826YQ/R7VFFmMysBLoLL?=
 =?us-ascii?Q?1rw4PBLXbzjh36gzmLNvnYEN+Eh4dEvB6vPll02+i6wxzJBZ3mPe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095aa151-df94-424e-6a9f-08df14fce4af
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:47:31.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBDHCLyYlZrkntYV1cb1RewNWknrJs1p9AW3DLaZFv4mucv583IqOUL1jpPwTXD2ni4tStCYOE4aPSh2W/i4jMYOVS7Uu75y5v26RoyHC4pS431iwOhy+tutTBlXf7PR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11511

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_chan::device::dev access with the proper
dmaengine_get_dma_device() for consumer API.

chan->device->dev is not always the device used for DMA mapping.
Some DMA engines support per-channel IOMMU mappings, so different
channels may use different DMA devices.  dmaengine_get_dma_device()
returns the correct device for each channel.

This also prepares for making the DMA engine provider data structures
private. DMA consumers should not access DMA engine internals directly.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Cc: imx@lists.linux.dev
Cc: vkoul@kernel.org
---
 drivers/mtd/hyperbus/hbmc-am654.c               |  7 ++++---
 drivers/mtd/nand/raw/cadence-nand-controller.c  |  2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c    |  6 ++++--
 drivers/mtd/nand/raw/loongson-nand-controller.c |  4 ++--
 drivers/mtd/nand/raw/lpc32xx_mlc.c              | 10 ++++------
 drivers/mtd/nand/raw/lpc32xx_slc.c              | 10 ++++------
 drivers/mtd/nand/raw/marvell_nand.c             |  7 ++++---
 drivers/mtd/nand/raw/omap2.c                    | 10 +++++-----
 drivers/mtd/nand/raw/sh_flctl.c                 |  8 +++++---
 9 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 9d31464046b22..8a14e908d0b53 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -78,14 +78,15 @@ static int am654_hbmc_dma_read(struct am654_hbmc_device_priv *priv, void *to,
 	struct dma_chan *rx_chan = priv->rx_chan;
 	struct dma_async_tx_descriptor *tx;
 	dma_addr_t dma_dst, dma_src;
+	struct device *rx_dev = dmaengine_get_dma_device(rx_chan);
 	dma_cookie_t cookie;
 	int ret;
 
 	if (!priv->rx_chan || !virt_addr_valid(to) || object_is_on_stack(to))
 		return -EINVAL;
 
-	dma_dst = dma_map_single(rx_chan->device->dev, to, len, DMA_FROM_DEVICE);
-	if (dma_mapping_error(rx_chan->device->dev, dma_dst)) {
+	dma_dst = dma_map_single(rx_dev, to, len, DMA_FROM_DEVICE);
+	if (dma_mapping_error(rx_dev, dma_dst)) {
 		dev_dbg(priv->ctlr->dev, "DMA mapping failed\n");
 		return -EIO;
 	}
@@ -117,7 +118,7 @@ static int am654_hbmc_dma_read(struct am654_hbmc_device_priv *priv, void *to,
 	}
 
 unmap_dma:
-	dma_unmap_single(rx_chan->device->dev, dma_dst, len, DMA_FROM_DEVICE);
+	dma_unmap_single(rx_dev, dma_dst, len, DMA_FROM_DEVICE);
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 2085632631c02..4f5e6d2b128c7 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3229,7 +3229,7 @@ static void cadence_nand_remove(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	cadence_nand_chips_cleanup(cdns_ctrl);
 	if (cdns_ctrl->dmac)
-		dma_unmap_resource(cdns_ctrl->dmac->device->dev,
+		dma_unmap_resource(dmaengine_get_dma_device(cdns_ctrl->dmac),
 				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
 				   DMA_BIDIRECTIONAL, 0);
 	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 01cefdaf115d1..0a4f5ff111334 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -290,6 +290,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	struct dma_async_tx_descriptor *tx;
 	struct completion *dma_completion;
 	dma_async_tx_callback callback;
+	struct device *dma_dev;
 	struct dma_chan *chan;
 	dma_cookie_t cookie;
 	unsigned long flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
@@ -307,8 +308,9 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		callback = ebu_dma_tx_callback;
 	}
 
-	buf_dma = dma_map_single(chan->device->dev, (void *)buf, len, dir);
-	if (dma_mapping_error(chan->device->dev, buf_dma)) {
+	dma_dev = dmaengine_get_dma_device(chan);
+	buf_dma = dma_map_single(dma_dev, (void *)buf, len, dir);
+	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
 		ret = -EIO;
 		goto err_unmap;
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be19..935f66602de97 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -391,7 +391,7 @@ static void loongson_nand_dma_callback(void *data)
 {
 	struct loongson_nand_host *host = (struct loongson_nand_host *)data;
 	struct dma_chan *chan = host->dma_chan;
-	struct device *dev = chan->device->dev;
+	struct device *dev = dmaengine_get_dma_device(chan);
 	enum dma_status status;
 
 	status = dmaengine_tx_status(chan, host->dma_cookie, NULL);
@@ -407,7 +407,7 @@ static int loongson_nand_dma_transfer(struct loongson_nand_host *host, struct lo
 {
 	struct nand_chip *chip = &host->chip;
 	struct dma_chan *chan = host->dma_chan;
-	struct device *dev = chan->device->dev;
+	struct device *dev = dmaengine_get_dma_device(chan);
 	struct dma_async_tx_descriptor *desc;
 	enum dma_data_direction data_dir = op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	enum dma_transfer_direction xfer_dir = op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4f..d03486dc41150 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -392,6 +392,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
+	struct device *dma_dev = dmaengine_get_dma_device(host->dma_chan);
 	struct dma_async_tx_descriptor *desc;
 	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 	unsigned long time_left;
@@ -399,8 +400,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 
 	sg_init_one(&host->sgl, mem, len);
 
-	res = dma_map_sg(host->dma_chan->device->dev, &host->sgl, 1,
-			 DMA_BIDIRECTIONAL);
+	res = dma_map_sg(dma_dev, &host->sgl, 1, DMA_BIDIRECTIONAL);
 	if (res != 1) {
 		dev_err(mtd->dev.parent, "Failed to map sg list\n");
 		return -ENXIO;
@@ -428,12 +428,10 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 		goto out1;
 	}
 
-	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
-		     DMA_BIDIRECTIONAL);
+	dma_unmap_sg(dma_dev, &host->sgl, 1, DMA_BIDIRECTIONAL);
 	return 0;
 out1:
-	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
-		     DMA_BIDIRECTIONAL);
+	dma_unmap_sg(dma_dev, &host->sgl, 1, DMA_BIDIRECTIONAL);
 	return res;
 }
 
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa92677..638267d44360d 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -425,6 +425,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
+	struct device *dma_dev = dmaengine_get_dma_device(host->dma_chan);
 	struct dma_async_tx_descriptor *desc;
 	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 	int res;
@@ -446,8 +447,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 
 	sg_init_one(&host->sgl, mem, len);
 
-	res = dma_map_sg(host->dma_chan->device->dev, &host->sgl, 1,
-			 DMA_BIDIRECTIONAL);
+	res = dma_map_sg(dma_dev, &host->sgl, 1, DMA_BIDIRECTIONAL);
 	if (res != 1) {
 		dev_err(mtd->dev.parent, "Failed to map sg list\n");
 		return -ENXIO;
@@ -475,13 +475,11 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 		res = 0;
 	}
 
-	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
-		     DMA_BIDIRECTIONAL);
+	dma_unmap_sg(dma_dev, &host->sgl, 1, DMA_BIDIRECTIONAL);
 
 	return res;
 out1:
-	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
-		     DMA_BIDIRECTIONAL);
+	dma_unmap_sg(dma_dev, &host->sgl, 1, DMA_BIDIRECTIONAL);
 	return -ENXIO;
 }
 
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c8..e5fa5540e80a0 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -868,6 +868,7 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 				     unsigned int len)
 {
 	unsigned int dma_len = min_t(int, ALIGN(len, 32), MAX_CHUNK_SIZE);
+	struct device *dma_dev = dmaengine_get_dma_device(nfc->dma_chan);
 	struct dma_async_tx_descriptor *tx;
 	struct scatterlist sg;
 	dma_cookie_t cookie;
@@ -876,7 +877,7 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 	marvell_nfc_enable_dma(nfc);
 	/* Prepare the DMA transfer */
 	sg_init_one(&sg, nfc->dma_buf, dma_len);
-	ret = dma_map_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	ret = dma_map_sg(dma_dev, &sg, 1, direction);
 	if (!ret) {
 		dev_err(nfc->dev, "Could not map DMA S/G list\n");
 		return -ENXIO;
@@ -888,7 +889,7 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 				     DMA_PREP_INTERRUPT);
 	if (!tx) {
 		dev_err(nfc->dev, "Could not prepare DMA S/G list\n");
-		dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+		dma_unmap_sg(dma_dev, &sg, 1, direction);
 		return -ENXIO;
 	}
 
@@ -900,7 +901,7 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 
 	dma_async_issue_pending(nfc->dma_chan);
 	ret = marvell_nfc_wait_cmdd(nfc->selected_chip);
-	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	dma_unmap_sg(dma_dev, &sg, 1, direction);
 	marvell_nfc_disable_dma(nfc);
 	if (ret) {
 		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e9..4fa89aee934eb 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -380,8 +380,8 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 {
 	struct omap_nand_info *info = mtd_to_omap(nand_to_mtd(chip));
 	struct dma_async_tx_descriptor *tx;
-	enum dma_data_direction dir = is_write ? DMA_TO_DEVICE :
-							DMA_FROM_DEVICE;
+	enum dma_data_direction dir = is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	struct device *dma_dev = dmaengine_get_dma_device(info->dma);
 	struct scatterlist sg;
 	unsigned long tim, limit;
 	unsigned n;
@@ -392,7 +392,7 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 		goto out_copy;
 
 	sg_init_one(&sg, addr, len);
-	n = dma_map_sg(info->dma->device->dev, &sg, 1, dir);
+	n = dma_map_sg(dma_dev, &sg, 1, dir);
 	if (n == 0) {
 		dev_err(&info->pdev->dev,
 			"Couldn't DMA map a %d byte buffer\n", len);
@@ -434,11 +434,11 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	/* disable and stop the PFPW engine */
 	omap_prefetch_reset(info->gpmc_cs, info);
 
-	dma_unmap_sg(info->dma->device->dev, &sg, 1, dir);
+	dma_unmap_sg(dma_dev, &sg, 1, dir);
 	return 0;
 
 out_copy_unmap:
-	dma_unmap_sg(info->dma->device->dev, &sg, 1, dir);
+	dma_unmap_sg(dma_dev, &sg, 1, dir);
 out_copy:
 	is_write == 0 ? omap_nand_data_in(chip, (void *)addr, len, false)
 		      : omap_nand_data_out(chip, addr, len, false);
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ffc..0497801d7059f 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -378,6 +378,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 					int len, enum dma_data_direction dir)
 {
 	struct dma_async_tx_descriptor *desc = NULL;
+	struct device *dma_dev;
 	struct dma_chan *chan;
 	enum dma_transfer_direction tr_dir;
 	dma_addr_t dma_addr;
@@ -394,9 +395,10 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		tr_dir = DMA_MEM_TO_DEV;
 	}
 
-	dma_addr = dma_map_single(chan->device->dev, buf, len, dir);
+	dma_dev = dmaengine_get_dma_device(chan);
+	dma_addr = dma_map_single(dma_dev, buf, len, dir);
 
-	if (!dma_mapping_error(chan->device->dev, dma_addr))
+	if (!dma_mapping_error(dma_dev, dma_addr))
 		desc = dmaengine_prep_slave_single(chan, dma_addr, len,
 			tr_dir, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 
@@ -440,7 +442,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	reg &= ~DREQ0EN;
 	writel(reg, FLINTDMACR(flctl));
 
-	dma_unmap_single(chan->device->dev, dma_addr, len, dir);
+	dma_unmap_single(dma_dev, dma_addr, len, dir);
 
 	/* ret == 0 is success */
 	return ret;
-- 
2.43.0

