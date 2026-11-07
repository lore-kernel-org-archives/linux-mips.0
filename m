Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082409;
	b=BKiWC6o1kNtagigy+pnzNcpaNm0r1LvqmPe7jsGnWj+TFdOGVWd5zPzZFfG7wCc1BY01
	 +mL83VQP/WwMB/FL5yPg2DmIO3xG04Z8APLUljvaZgqo5huRxBVOnLMcq2VxxEuIdEvBf
	 ps+RJlUq0eQzyh3F8yricYNj1Ww/WMA5KLR5vxg52umJSYRDBEASJLHEN/acuJBoDtBhB
	 +E1IlKKJviV1V7ikrSrJgmnRj54C9TlO3wFTT3Xqsw1BF/6hOEhqtHJR4eaAhvZ01uWVn
	 DlSyf8DQTIfyM8HZUwhNppCiTWOcx3GvzoOBmOb3+PNkb+oKeRsV7H86eglCui/TjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082409;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=;
	b=1LGqCQ6vPIdzXSqGit5Z7zbVcT8zId1qGmDfYy22rvLpdNruakjJB2SRC4clhdyyH5TD
	 by9ekmd62dXGgIz04DO7Y9a3FH/nZKgr64pZH80DCVcTJ0xZYIFjHkFBKZAWRR9OVJyp1
	 4Z+Wqh4AXY8A5aNk6ueX7X5jdVcSTwsy0jgt4B6t1ILpwYefXcySkx8RfPTriNq4BA+bx
	 XoDPrwgHuY8zQJuPlM1rYqtWVhqZcPKTh85WVYx3IiE1ABhQy4/A66lvIj6BnBaFL+HnR
	 MhcwpxI6XA4DDvWLej9Ze3o7reM3tuzg4vu6iscjrZacWnasmyqzSrxk81wlGI8WQfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40EE606A33F
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40EE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so4303fac.2
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082408; x=1794687208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=;
        b=Aq62C4meC749wzqpHJrck/rOg4oLpEjebE4LQK2zIpRlSmYXfovOL/mjX5XgepBtdM
         bzE1ZeqXrnHtmvAvZscPEbfEGMLdqVdVJlVH5ZPhQoV6vim9PJ8O2MvBOe/bJU9ZbJUe
         6NU5SSVzFZOXqFQkv7Y8BGqQ6qN3AzIa2Z2PjB79ZEe3sdrOifY5TT481jz/fUJ8pf5E
         JHWNgxy6RGllcds1gkj6H1SrUsMOnD5+TjfCjdxVjAX1QBqqSB5VT2mZ8+sGVsQOvGos
         RSlxbbeS7ilii0B0KBLZitYllDrvzSLAPHJMgsDjIOx7ZJby1QH3RaileyDsnpSy4vsB
         G76g==
X-Forwarded-Encrypted: i=1; AL+hErGXcUmOZVu46JUSsH/PgzbI9BIj1ZQ4uMi9qkkU5V/YGNRpWeiwZFnx5s3LxFRqtommGPqx/vn1PX2q@vger.kernel.org
X-Gm-Message-State: APuU4Z+k4zWjZM6RHC958kfonowkrmvbXf8bkVUQkVvD+GE89MEEPsGA
	ZPoNzXWnyqXFtSXoNQ1q67igta+4sNgRMPbpXOVL3G2iGk7BbBh3+S2nMNJrQXuPI94=
X-Gm-Gg: AYBFou1U1VDWJVvWq7KADTgSKoV7mujBmTYSuEokPwrGkCYRSQwHyvmoLNeOEy1U5BO
	g27yIuefROYV+hw/9pQyCeTjg9JD2k3ZQ3UXw5S2vZGjlBMcBsqEdCPJcDh8A1VF3xMyn+ASQ3J
	g3CKQObkYYYC/ZhI1+y1pz7DLdVzPRRURVpmaJuD0bSFJ0fTsOuczV2vJ2nYNGaukKuGDN1uLcF
	J08phoWlqa1EyClhDhyvvxy4wGPByCQnEnh3nStDEYHpMmWQzapq0e9Y/eIASPyQDm9eWPNPwbJ
	yvDjB8xn3vpRO8YAsjDjJTUaa3zscgvrciXev5YqmtCx38SRXLS4iaF4FLvCp+CnQvXp4L8kBE7
	R00wHuj5Oq6YjrxtLVSVX2iAoC4r/VslYKO0UFohxKEIH2R4Hhfx1SvimQ/LQmPzvLH5PaCXGIx
	lz92/rTRmX4C09kboJqwlVy7ou1JZIxm10yXJ035Qytatp4CdzTP04EW3pAWuXb6h72jolUTTMQ
	RsCHOPfjN+jGdNlh/lgAZx7qRhPzaDfuGXoSj0K2uMA8LPEw8aJ6W3w6fhfpHFawdnT1purmFVn
	PqZtoFDC0PZ/CR0SzTPg65DL8KzWJjgR2P4Vk/IWWLwJuDu+Tc1UjC5s7tj0JA==
X-Received: by 2002:a05:6871:2b26:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4ad98e4af21mr4151086fac.39.1794082407651;
        Sat, 07 Nov 2026 12:13:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:36 -0700
Subject: [PATCH 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Validate boot partitions before publication and unwind partial probes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 74 +++++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f812de1d776f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1900,7 +1900,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2007,6 +2006,11 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
+static void qcom_nand_host_release(struct nand_chip *chip)
+{
+	kfree(to_qcom_nand_host(chip));
+}
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2019,13 +2023,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -2050,11 +2057,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
-
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2062,10 +2065,21 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_release(chip, qcom_nand_host_release);
+	if (ret)
+		goto err;
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2077,15 +2091,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			continue;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2119,6 +2131,26 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	return 0;
 }
 
+static void qcom_nandc_chips_cleanup(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
+static void qcom_nandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct qcom_nand_controller, controller));
+}
+
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
@@ -2127,9 +2159,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, qcom_nandc_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;
@@ -2188,6 +2223,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return 0;
 
 err_setup:
+	qcom_nandc_chips_cleanup(nandc);
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
 	clk_disable_unprepare(nandc->aon_clk);
@@ -2203,16 +2239,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_chips_cleanup(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0

