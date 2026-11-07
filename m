Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082373;
	b=Z1Hmm9OifFOlSN7c/uQbanYn5H70PWe0G0xUvLIwvjOY9gTag8g9rXii/sIAQN9sH9U+
	 zl7yF67NRTLcBlD8bOPaCGdFGHI1WdX59GLxuasC8V2MIV1kUyvb8zavtoUuof4myNyCp
	 xRwTszbIJRcPJgjt+/IzN6S7VDxJpSMXhYGXgV7ZKX3E6iQ86s20VpslhCfxABp5mYQAt
	 9MqQx9+NUqKQ/RPDFTWRjb6P1/MBQAiZdL0pyumOl189jG0UrWeYEmT0ka9E1D+nPu4oZ
	 6AS1fIVtLPOEH/VAZV6P7ZyGZeM4N/86kUlg/G9IpPS7vGfollKF7yRYl42ZoKfV1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
	b=pJVurDXu7YtmfhxwUIA+Tb0HAz4l9Vg1GsazEv4YkXbC98Ew0/nUu0O/OwFRtxxSf64R
	 5IJrFc0KfW/2dA8G8xc60N5S1XrHlGOWPRiLVgcHCDhGlB7g4GCBHj5mS9mRvmWP5NWYg
	 WfUN18+aSxMHCVkTSv6WIujVENvZMI6267tOoFJ+giJmWlBbkO2g20yzpTwkGgCybkN25
	 SXxd4FmF9xA4G2lRcMI3u2yEpyBedorUTj7PcXxdDgZLRzdY32FkNqcDR3SNYuXXYH3P+
	 44GbJD/HVGu/1e6JElmZ5p/F4Qup2c/re8ib8wV4X1itqyPsP/7kqxFPFBRA+KyieWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E8606A326
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48ed0b68895so6333fac.1
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082372; x=1794687172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
        b=EeNCQ7WRhlhiqTaqR1QKHAVhQLVgMAsaY/RWInp0k1fvO2QFYcaVIIxJSdBNsJA7ZH
         QMja1RLxtgRInhcmDVBTsS+6rBtUntXRtRVl02DL4Z+XT1osvN24HjJO62OME961X9/m
         uCeMToyI+6HNc6mDlYitu6bqKq5hmaksXdKV0ftb9H8HqHuRKvvTI6A3BPJq78uYKKkC
         TRkLEq2v7l9Pg68BQF30Uno/KBGlSJ8hWfCm6wKmNeG3iYqI3GMNQVi8/Y/PTOVXgfYM
         38+wnJAhMrQVJyd2aemOsbPxtvane196pn0vy+j58uVpByF+Kf/QXBZ5I0PQ0kBfBo5b
         LpXw==
X-Forwarded-Encrypted: i=1; AL+hErGblCdg6DvPELsyOMlsQTq57LIHSyOVY3mMX5nZiULUsQYSxTTdrJWkT8pHpK4/0S0/5GOLyZZejCLE@vger.kernel.org
X-Gm-Message-State: APuU4Z8GT7lcVGcLbwgDjXoUnXVS5PIwo8Ajn9YtEQv8xVyxE99g9fxI
	w9ZX+1zQDDZfmIFY+Bz4Acc7tS64/3QkBnBHCopj9oN+7hMe/g4BLGDbIXD96ovMQak=
X-Gm-Gg: AYBFou1UuXhoOdzJycSQUExfx7QYNZTomE0qkzxRDbhLP8fWQS2DiAK0CGJOX0TfVlx
	veZK0IV45zIhmEzr3JGqzOCYSb18Pm9c/CTszoHNQDHNl4FneMFb7IMLSBDW6b5eSVTxkagldFe
	mVo3pCcROESWLZLbRoiquEJlsPIdvJNQdM/M0h9ftunXbhBewL/7PgQx/uk8ORWE+DN6GhfhStR
	terS+iVT68xxSb3lmE/Md6wkxKBh8BQXRttEaALh9TgkAs9YkqYiGHG7V7RFCEqzDaeeVwemlTi
	Yf69R1yWIxv6DHk1O88NBXKlaZpKKFs4bF7sVO5HMAdmZ8UPh+nt2l9iUFjWGzFdplZTH0UDDhU
	qMSjVf1orU03ZCcKty1unXJk7WiW/04CnFPOJQLzhnTRFrG9e0hM11nFQSesMewsvejMbHXSphQ
	eNUcw/LgVYNtC4g1bOZXpS0L6q8Cw6NuJ+Hrv6lIywSQyXjWjVH+HtLhZAi54qYE3OtPQNGCO1Y
	BkHkHfxMc8NNACJwo6L4DexWiQApWNKVDPyv55QfkkMYWJzBuHBzN9emjOi9ULivDcgTIG9XUFu
	jTqJ9YdcuM3KkHZmfbdZpFmyIe6Qn/mbSIwK+vYcn2yvwMyiHfVMORMbbmSm
X-Received: by 2002:a05:6870:960b:b0:4a7:4d5f:c0a0 with SMTP id 586e51a60fabf-4ad98c4a8efmr4097388fac.38.1794082371748;
        Sat, 07 Nov 2026 12:12:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:24 -0700
Subject: [PATCH 27/58] mtd: rawnand: technologic: retain open-handle state
 on removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-27-0181ef0cc4c8@gmail.com>
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

Transfer flash-node ownership to the retained-chip helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a3294aaf43bd..a67f4d45f57b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -132,6 +132,11 @@ static const struct nand_controller_ops ts72xx_nand_ops = {
 	.exec_op = ts72xx_nand_exec_op,
 };
 
+static void ts72xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ts72xx_nand_data, controller));
+}
+
 static int ts72xx_nand_probe(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data;
@@ -139,11 +144,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, ts72xx_nand_release);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +182,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_release(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +205,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0

