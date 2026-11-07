Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082406;
	b=Z4cMDADBqeJTXfUwGBRMDlrCdZrcAAOp8UYjYShrNUCV9A1sIwwyK8+0CieqUWEdUdWY
	 J1TwyBVZlLucYECOQLHichAFNYmwXAVd1lXRqlXAOzYqfNfZ1k8VbNKnBezZn5o/kRhzZ
	 sFI5G2IJKBvNOCBXpe+TSAXUIHfIIC4O/lIYWpIiRRuiVR0HdEBr0r6rNLQRPOnnDKGq2
	 Blp82fBQKsIv2asPxbCi2Q02OXZ7cnY7ettiyYjQbU8URivya4/I7ZAL6lSvR1Cfw4uIs
	 6hTXv0gJAbUfNg44wHfvP6bQRSxXN2rNbcd8BaxTZPoJdfQWnblWQgP8mwEsj8JaIJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082406;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
	b=4Og+25pygs/wbmfiWFNuG2u8Jr0p3+wAdN/309ajM0D5NwaPJbgUj51jVCEMBMZWWCwT
	 IVowNkTdNRi1VdKVoFDVoRpnsyuFsYxHvVg3eeWvplphmrzJnDJFX29NtNmlGj6UA4/MM
	 H9hqLJHA8TnVJ8SeWGPy6CWxKCrThLI/PQXV63McACmMJLc559vxaCcOo8fPeZFKYkAcZ
	 NihKyInO1Yx1K5xJEsOR7z6nUs4i2mFOIYwX/54rb0j1q16nx61pG7Re0Axk2xQbg6WmL
	 2J300HBGdrL2nL1DTkqlc7NuqJXhU8GV4cVNZTTRMwzGzKMaUJEuo3tGxsuWqIffonA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36C606D837
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE36C606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-85ac281604dso269a34.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082405; x=1794687205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=GNRdutIYJbiL+14UV6HFnYgITgJNPE7ajX8WmnYYp9qJZr61KUfxwQNZZCX4wv+1xc
         AdEuws4VfYp4emngw5qnlf5Cuz/B0I4z/u1C0od1sEgeenkJNsCe4UclZgTZBHVjrEeM
         csCekBooN3orvl5olWQGUoT7WeJxahiAJ/zlIv3aUDiOArmJtbeKa3cmqZa7YQo8IaDi
         /lqtubY2xMMGhNT+U26zQGAh966qU1K6cO4feOVEVLOKgBv0rYfXddxgmqWBfsjF8HpM
         pmCBWfXymnzsCiB6CGE33PyuHPErQ+3AfGqbKgIhD1iaiYCt/2Vt5/H+mV3GtER45pIN
         rBLA==
X-Forwarded-Encrypted: i=1; AKwUvBzD+x5zknEpYfd9OIVT5z5/U5SLJN1cWr2WETrLgo1Kiynkl/1lPH9C6+tT8qiym1oia165CoTHsM5c@vger.kernel.org
X-Gm-Message-State: APuU4Z918yquc8Nvm3An3lVgctKye8dcJJicYXIKjp8HO1t1JoCdZbEV
	cXIt1F5UBlWTsUs1g5+AMexVCDfpuPkpT43aKHZYBLd/ejNykyMW1DXe90zXX1XOZ5o=
X-Gm-Gg: AYBFou1WUXuiF9S3DdrmUwu5UKB558Y2APzkOAyEFsu0542u38Bd6CLr9cscPDgC2yT
	Gkr+FJqRSFKq4s80orzNTYe+VdxqhzNupOpRbOuaxk5UlVxp4Aaf5AJMVUJk+RYXCeHboPSAYy5
	w8UcC7wOvOflMCaPBZGcrMBp9zZ4rTfnHhxUmmEZZVAr/yAwNc8Yf93wuKkIqI9voNppIEC5Rmq
	8p2z3iHIDdofUnJFXQQWE0hS7FX6dEEEJGpncpGHtOadcrwF1VaJtrQAZc3YDicsNoYoTwRfeYn
	YFaeZJdKOYtAvsQ98wD+sGSNRjDQeTO5BKHqtZzbI+pXPV6CWrolJKhWlDlOg1hzfeiTRYKfSsL
	T52W+gKNAv4zyodgHlyA/z5eiVLS/Dxb2xBArvidMHQgpRpJSKPWLAuZ+UkQdmgkPMHCLTgbjaL
	edH3LKl2z3fqlkSyrz3Aqjw8U9Vx+xQqOMgJeeCTKuPWm+XesUPAZ8WQlCeHg5w8uSDLMFwwb3I
	5CbwIrCFLsOF2UBhNp26KM5dwD/XJY0WmLTW6o59KKNL6/Vn4uwJRoedkjSI7xDVoCtEp/l7WeP
	5SxLZdEmjPbxFYhJWJeQ9dpc6CaLX54OBcHmb1L9Lqy3rVVU3FmMg8bu7cQf
X-Received: by 2002:a05:6808:1202:b0:4c1:5614:acab with SMTP id 5614622812f47-567e10c6cd6mr4431450b6e.37.1794082404730;
        Sat, 07 Nov 2026 12:13:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:35 -0700
Subject: [PATCH 38/58] mtd: rawnand: cadence: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-38-0181ef0cc4c8@gmail.com>
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

Allocate the final shared buffer before publishing any chip.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 60 +++++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index d53b35a8b3cb..65c4eab600af 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -2991,6 +2992,11 @@ static const struct nand_controller_ops cadence_nand_controller_ops = {
 	.setup_interface = cadence_nand_setup_interface,
 };
 
+static void cadence_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(to_cdns_nand_chip(chip));
+}
+
 static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 				  struct device_node *np)
 {
@@ -3007,9 +3013,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3028,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3065,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, cadence_nand_chip_release);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3091,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3138,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3193,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3212,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3260,6 +3279,11 @@ static const struct of_device_id cadence_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, cadence_nand_dt_ids);
 
+static void cadence_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cadence_nand_dt, cdns_ctrl.controller));
+}
+
 static int cadence_nand_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *res;
@@ -3275,11 +3299,15 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller,
+					cadence_nand_release);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0

