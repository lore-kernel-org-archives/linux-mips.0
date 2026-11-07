Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082400;
	b=GG3YaFBW2HLl4fv0Y7lg3HeM6MY8tASgWboCgqzU4BCd5+oVeFRXLq1Zu9aJXqendEYj
	 vF+9TYc8r9g40bPivS6w9tVvskA8wqpjvzo+xJobJreAncsBz2nFLAMMr5ysI/O+emvrY
	 izF4TqtOH5A5i9XdgGEPzaLXnh56yXXmbUg+ahSKyjt4u52vDu7bmmerywlpe+NnzkEIK
	 fyiJgCtFucnX/h5C3SxJRlIYeKx5ZrV122/DP8dPsklTFxMEuKIz0vbydrWGD+Wi33o1E
	 xZngdKc1viGECXnSItdwBF5H5me/f1eqlaWuL/q8HPRrcxCpBLDg0LIflEr8zTVSqyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082400;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=;
	b=bDxvSaWOA6AJ/ZVAh4sbJx33z9dvUobIsuQhrdc++2/WVGQOyTYu6nlcOalKc5tcPKSH
	 jmwks3Qog8rwC1K+9UDZsoqiJYB/uCOdj/Rxoo38m9NMn3QBw1k+xs6j4Is4BSkf3YwMp
	 r+29SWztkFLxy5WL8uLwqv7rlW0s5IO+TKhg1W25J7M9wyIOwO3KaGMkJEC3XqZG8H8AZ
	 Fgptf0Zw80mKfQuvh6BiiwIsVkqUNop20V7zwxCHyC0OwoB42F12oUPivPJMLEOw9KD8s
	 W9zap+7zL2sDX6LfyvowkqaKKv6RC1CfJCFlgHJ3/QY4HKw4IQjc4Ljs4uyKWXX2xXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE3606EE8B
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAE3606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-486f013db83so2079fac.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082399; x=1794687199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=;
        b=OFdmpr9HqJNt3NoNqspi9Lw/7Bc8QVNlUdLcHqy0faUwrXnIsRRMrNwX27FxrsPNyl
         1ZyWmAPvwJJRczHxbsc3cpLVB9aWnfOQdbQCLkeeO/ZaueHdvCxUctZQyS0xATbFb4c4
         mRZ7VFmktUVrR+YmNlTaymttjEKAAECm1OuFZODUlb0UdBJHRfo6r4fL7A6q0f6VrG5F
         3ejMo87AkHGWSUkYUIHvQ4XX/6jkWPhEFnre9q1peZo1Ef70HxXTt9P3UvT2QR3rCPLw
         3DwxDgN/p4gdudD5IJDF5bv+nBQ/CsuLMq1fh0IBxedu8ByCZ2vPMYkOH/2kvNGihGkx
         43Kw==
X-Forwarded-Encrypted: i=1; AL+hErEFrtZhkyGdiZzpYyL1V/M8YDjhVaxDRT2tfRsYS3B/zGB/I2F52MH8uTRSB2egokhNlwK8b9CUUm7O@vger.kernel.org
X-Gm-Message-State: APuU4Z/jLrFzQI36rR21LIHoDI4zOZV2BMPbz8EFtsJNfB7bOglULUA6
	pctCQJyCYaYjLHmenHxmwY3ZCuFJ26fLDu+lJfC8f+tIc+I5/oGWaLXGLkFGQAWhNjQ=
X-Gm-Gg: AYBFou1JUK7hZL1xFN6AxChU2/GVMh+gSYpXU8qOv+zXQlYHv6AcKLXU4kcOtGTNym2
	lEknd3FKHti6L7Yj3i/pIXoSxzmXlvxZjru9daOt5QGMweyYaI6EJuaXG9sQMdadI7st5AyusBe
	vzCLo8o+/ppCk8kZmSsreCAltk5eDbGg05iXdELKwtZJxXmTXjjqSfBDQ4YAVaTReSFsQOOWJut
	gAynS5vmadnwYWJpCyLzNgER6SsKeIg1WeFwKs3iZzEXj4PAwXB4xZk06MUdZClAZHAJG7nRhSO
	YY40pD/TL10f/hSnFv8nC0xCA7StS6S1LZS6tjZDnMNsSBSIgDD5S8EJIWsDEQgCpgruiBoJ+Q9
	Se+ZLMQaD/o/LbpdbMz74ngKjjKJFKh5qaQvdoR1EEWEMW3ag01iZ/u9sQaQnOqIeiL6eRjF/FL
	eTYkZCdIVRIwq1uke3ssDGkUck2GCrHXFiW7ocs2Ou1qkbW6RLFqjYQiyIjfI+eNHQVdBiIYmXS
	QMv+y5xAn53CebScivBBYsLBWzKyOYZ/qJW9Ddp7PRFHpeLQeij2IjP4l++bhwV59FwBuUQFQa0
	35MizPASxGVUsV22ZMT6Ow8RJgRB0m6awII0mX2Kj0CcirhqEGBmbybs0OXJByxErhpQpVjMvs+
	ofmxF8w==
X-Received: by 2002:a05:6870:ed93:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4ad9859e590mr4444729fac.1.1794082398830;
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:33 -0700
Subject: [PATCH 36/58] mtd: rawnand: renesas: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-36-0181ef0cc4c8@gmail.com>
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

Disconnect all chips before dropping runtime PM and transfer buffers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_release(chip, rnandc_chip_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

