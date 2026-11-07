Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082439;
	b=ddK8WM3naRtSxMCmnYbOomKmNuSgGGwKMqMLCieHlBhIKnTh7M0mKZxKhoQY9DYb33fC
	 OgPvcMKrQ3bgQLRQNhH/DmSxxzFG9HwRdXwtLb4X4UDDcssM0uNCX9ucI+O9lntTPunKb
	 n8cgRZS4e4jjGOrrrW+4DGbqHcT8yfwXee0b4zFbU7Us8ZMgwa9KV5CVVrej5xCrUujCd
	 +jqp153FHRFetMrqMdF92XBA52wIve6pdPt9y0dZv1T/7BYweNhNBY5zkXiA3yZd6majN
	 XF0UgBzsL3qJhRTn36KrbOBuzIk7F0ODhqdPag/EECS6FBRlsnujVOAWEGSzaDc8ZvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082439;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
	b=H2ygED1vg3P5WEH87X0Ez68KSqKUhWbEgJYPCk8saeSxuBR5wP7K7IIGv0I4QzJCE3ic
	 S1wZjiBLSg2jFqFcKITAP6UGsVuyAdosxvl+vtoyTd3gzKTlLAXDmU0lkZOgREkFkgdjV
	 3pbkc7c9ovNOJMjQu1i206v6UPBB32Vcw/K+Jn7RBzFxmPjEc+DnGD9RMbSHs9+3YTq3h
	 aYVBaGbthnGyjRgRPsNEpsaDVX9+hzFqCtGpmg54tiaPhGzzBk8vmLaH9WxNFgEIkCjcS
	 g3AvOHnWxFcbsPWHsphZJ11oFZKu0Pr7a6SD+mJ3VRzrZzS0E0smDb2uAVfqOEe0bEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36037606EEA8
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36037606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a76f63b243so494598fac.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082437; x=1794687237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=eRJj4F/xjMRKH4dzIuOq3Di5D2xAkrAdKTeLI8NhPMec/VUnR5zXZKZWGZ5+Ljzmpc
         ScBDFyLI+LhtkKnxJhi7GsAaGIZYJswBTiNM38iEmEi90ZQtK5IUi07trYHY4qP6jQBM
         3XyUIVhQ7qu9yyOlZksyA8mFpQF6GQDYlaCI9s/Lru060s/hDAySXbI2m8Dx64tNFIIL
         KFwmVpcwKDjsh8gWkqxmWbjS7eh229T3Afs7E8CRM1gOtV3yZoCcXmQQKQMBcFm25k+i
         qhFZoMqQ7k+nxP3hCdaT+4gU60M2Syy4LthvCIC4NoD7YJX+kKJQvKzrZ45Dh7CEjg04
         EuWA==
X-Forwarded-Encrypted: i=1; AL+hErEsNFQwhkn+rCk1Li5hDrLrlcasDNv6Mw3gGwOKp/eywwTduczf6t6LDcFNUiMHvtbRYp9vPNVFYPvG@vger.kernel.org
X-Gm-Message-State: APuU4Z9dV3lGP0UuykJ6QxmhGJbh6qJy6H3XpJmTOKVsDNRBSlVNEZZ8
	ZlR037bxDOmkgXkYXBYd0ffYQYgfKxQgdfPan+ok6aUp9rajdJTReTuMhfoP8IK7n3g=
X-Gm-Gg: AYBFou08v8YE+QKDT1GXDVn26wbz+MU+VXrJ3QACIvUctKWYymlUqvn4fB5M2PWlL+w
	9vsD2g7nq7I5eOCvfuPzwJHrANZSATuRKmitkqz/pNwOQn+mliRcEaRt38rOQDyaOHIHE6JUqGV
	B1PcVJ2ZiWn2gXuMYQoFmJ6RnJjFE1m6jjYxLw+xsIhHPnbK5/a2JOaziDfPJD8+fQYOiXzd9ki
	PYcbHvBDHVyjl6evPZW01Eocs8FmQcKafU3ctNIkNbmFsCegEcxPY39M6RpwwEp+bM128DgKLpx
	CVtjt2IZ6v3ZAtX5d52cg+WluaTI6HDYfKrGqr12fOpqTQR/485Q8dZ7UF/4jlf+u+4Kvp7mZax
	6pKZ0FyRlAr2xZt440M3duUj0JkvmXi6JReVgeaFIKwOJ+2asX+CYLysrWzZ45PnOYQOOWn08h0
	MmA1xWvLhV6iE2VlbrtcP2PNep1l8Ay14l2U86fHG6xZVPe27NtSzXWkjr3Bumn6/A+kpz72fdH
	m++iGjgNHI2cw9iRyPau+avVbe2Clys1dpRXeq7xH3fxfbs6cLVyKY0lH2HFqouykWROrmLtnwI
	swTHO7zD7xVtu9Ny3D/szJRvorOl8gZzPLeDAcUSbuO8if1/R7ahHYniLWoA
X-Received: by 2002:a05:6870:9f0d:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4adc11d6d6amr1203868fac.38.1794082437088;
        Sat, 07 Nov 2026 12:13:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:46 -0700
Subject: [PATCH 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-49-0181ef0cc4c8@gmail.com>
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

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9eae5002e389 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,33 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
+static void txx9ndfmc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct txx9ndfmc_drvdata, controller));
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, txx9ndfmc_release);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +322,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +376,18 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_release(chip, txx9ndfmc_chip_release);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +402,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

