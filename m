Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082415;
	b=qK2pWxJwcpByoGe2sK9y5pWZz0Wsxkh+oY6bVVkOLT9utiemj+4geUwB/S1Rv+74rZ+c
	 jfT09CeJboBcXfQ2Pxbq9AjFUJJfB7dmSGaPJLxuF0/8zEHMB3WkST9I9qE/D2PpziOWw
	 7UhZbrxO0gZXITK79uPo4IF34L6pw6H2QcnP0U2wYCMP1qd3KfEbTx3cVzIkK10GwF+Do
	 8PRHuXrfR1/H1OWuqVhiHi+nFGyd/TrMujDnAG8l/GSDLOZJgc7YSJVJSX4eeDx7c1rV/
	 olo8ukHacNiGTCAnjwfykjcPgkq4KjexTnSAso5oHfA2PzyMgj5fT9uMh3yvV4CggEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082415;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LtCTMO6NoGllay7SWUsBqb6+joFcIMTVNySCP1lhl94=;
	b=RKX+H7/bHlnI9OAhfN8MQkWXEf+Gw5s06SULc4Ixno6/BkhLDcN20d9wNPt20Px6oYXr
	 24+4vS1lrp4FZxFBr8g+Lm62LdgyouXx4WBu1fsB8bECK6lOkHuXKL8zZ29SM4sl9uer+
	 7xhHiFLaXbbkmzVrS1Zbq8UMUzu525WaTwhtTz24TrIyI9xU47krkuTVyYBPkH0v0WgTf
	 xop70gfJ1zcngIHvqcJKAk1m04bQ9yFAY+Lej5cRqm3/ka7Z+v/TFnJ3+wuja+I0gBoVT
	 sthZnXPjzUgJylPdhWUIJqZ9q3ghmYO8UCpM7wks6lJxWkj2MHrIBk6f+k0U/9TwOPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D64606EEBE
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D64606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4af81963f35so8552b6e.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082414; x=1794687214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtCTMO6NoGllay7SWUsBqb6+joFcIMTVNySCP1lhl94=;
        b=1sKy3R6VCOGgxjdrmpl/gN5JhoI9i+3/dmyvzh2G0zEwH9oY0n/j38m+blAkY0vIeS
         105U1BALWmldr9EQHXY8yVCFLGJGuPxl8olqMnG/b97htkK1S02H3D/+P77vkHDG83N2
         J2MWtYnPG456UTV1FEMxSaFgIaYCex2rppWbSlsEVD9WrDV58+SjjQ00YN8vtTCXxqf0
         O5S2MhLHEsZfolgyq62shdAug3vJYPJsvLvHUa2hz1KJiNm58Nkv0TjzON5yrjc3KesQ
         h0Fu2+kV+5FFpZTr9DEMoZQFHraLsZW00JvXqrVOsm6zK5US0jPIecq7YP8XMsnAEsJW
         4/9w==
X-Forwarded-Encrypted: i=1; AKwUvByqDLx77mTdM9N1tGvhIN0VJmx+JonXqb7NgB2WmWfUZ+8lPoi6zn06mOKmVDsnQ25k35Ed2+9s4uzh@vger.kernel.org
X-Gm-Message-State: APuU4Z9EL27MT7TQc/Jtd4PKaIsehzTDtjMTFrdOZRRtbUNQMt3X0bJJ
	BTG8fGZNcX0zKs5Uj7pC92mOp2y5NQ30Uhr3aMjt2X0WhSVbf1E9A09LgEW+rH6NqEg=
X-Gm-Gg: AYBFou14HUCo0l0a1JUOVvp0WlfMdLjf3ElMyecQciLgWKUckmH0Kcl92uyvAF9Z7xL
	Ku7xmBY2BVgG+I46y0Humq6DuijTNqYAwmEIKoK1wD+E7kQEhJCydCKbXhPAcMY33+YlEL70hch
	WyE3F73zzaZABPlfjQeOeBbSFk34evNntdfs6PpFJa4SoWNQwu0tg+EBm4lKgGe+uQLgUq3wLjR
	cV1eLI3MFGVmbwjvApxPnD3qhhXdx2n/k/zioPDr4bGxoaxBEhULrrnJwpWprzavUN+WQyUcXis
	1BaEDPdICMEM1hFGCHCPBAXbGeQ41yO/WI89/C9G5EnFmg1fEm2h+ZpdfQWGrhVdEOBWOTSoU5u
	1gvKCPZ/Uvgc17usNLU8YfzXxxAp2GeygQUFn+QOp9AJll2rEpms7h3gEfNLIhMFiGTMt9wAgrP
	wVkRESJ87BDQMI/t1uQ5EO43OsPFVPDo7Ai18pOHXtjd/s8ZwUEmNfF9YjLsve4PMASyBTnJxte
	OQg0DLgTOTxRsUktl8U5bHmNmoq1e95sjbV+Q00iHdlX7v9vNtbAZ24Adwn8xLMkFH7XtZhZXGq
	Es+2XRfgfTVCjKpNnxDe6GN+d+g7VO2568JWby6YRKS9QdHQAljZBgKBTcv2
X-Received: by 2002:a05:6808:3097:b0:4f5:4780:582 with SMTP id 5614622812f47-567e1367a27mr5024513b6e.50.1794082413678;
        Sat, 07 Nov 2026 12:13:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:38 -0700
Subject: [PATCH 41/58] mtd: rawnand: brcmnand: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-41-0181ef0cc4c8@gmail.com>
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

Unwind previously registered chip-selects on probe failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 72 +++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 4a1f5e736a1c..eaf0279518ca 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3077,6 +3077,11 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.exec_op = brcmnand_exec_op,
 };
 
+static void brcmnand_host_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct brcmnand_host, chip));
+}
+
 static int brcmnand_init_cs(struct brcmnand_host *host,
 			    const char * const *part_probe_types)
 {
@@ -3093,8 +3098,10 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -3123,12 +3130,23 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_release(chip, brcmnand_host_release);
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
+
+	return ret;
 
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -3294,6 +3312,26 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static void brcmnand_chips_cleanup(struct brcmnand_controller *ctrl)
+{
+	struct brcmnand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &ctrl->host_list, node) {
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
+static void brcmnand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct brcmnand_controller, controller));
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3345,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, brcmnand_release);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3365,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3540,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3551,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3567,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3593,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3603,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
 void brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
-	struct brcmnand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &ctrl->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	brcmnand_chips_cleanup(ctrl);
 
 	clk_disable_unprepare(ctrl->clk);
 

-- 
2.53.0

