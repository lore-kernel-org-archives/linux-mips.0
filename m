Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046651;
	b=q4WflReQ4HgCRhFT6NsLrnuTHY+40RILnwLT1nkDs57WkcC9EUidD2zXeDyq3bVbmDFY
	 MIJD6Zs0LtkVkisq4Ru5PhNM2/bNVJkWO40eGQmV8WCwKIO1ed80cQjLzIjw/Hula0a1B
	 s8uoQvrPJJaIJ8D/zkc/n6uCg+RsR6InjjHcpp0TAKzSC1Hc6vyP1bjh5XZQEw6hONroi
	 nEEhXIq+KJlrgG5q759WXMcVSQudrsG9sjXqJUwqi5AC0bAzX421FibiOqhs+6Oc1zvnv
	 E1qGlrbgvIapUMyMcsuMS2UrAlwIY881tWQ6IElHXAE6Oaq95Wcd+CsWs7YxqkyiSYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
	b=25LchH77GjnOA9ViZBe9IUjWbCY9wLM+JOMYNSgAd4g2eHVqgbIMY/C/VEMABIwCgTMr
	 coJ9aXhBy5iLtW8OLwPZo5fRKYXlqkK94B4bDMYvbewwMx/dHZDm18DV9rQXPoN9sqHoR
	 FsjO7/2MBlYDuZnvRQSW2HiK3NWqqrlz8Yfw1ba5GXgGkolOW8GN2a0tnhr8vRXgdVZSy
	 YZfyR8fXhLeSL6Fs2zPxzyPYYxFOC/RLrqpUIJOlGlvcsxDME0hruM/a3n3b3FtulAKzN
	 38kL0HEB0FUfiu5T1WgP8jDZXV+KTLeCquhxCWvhBIm+fv+lVkiLUAQPOG8S+SISUNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPzMA4JD;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835AC608D97B
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835AC608D97B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPzMA4JD
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f84a55e31aso1021393a34.2
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=xPzMA4JDHfPVpt3nzTwQL8PAdWdfJ5nM0l+kR+QKMn+kjijtsVxzrVwXMySszp2oAh
         pCQWKhevo3lOBJJ5fO/xTslFphOgvEsXd3ocI8c4ITLL2ntkGvFNwkJ200GSVJOcSCrj
         LJExb9VxnR/ynNGO1uiHNNNNTGBKG2rM1QEWhUWRXefcir3aqnCH/pfyOtp6wIlC0FHb
         PB73mRSS5s6MPlE54UVRuOc29Kf/g4E+kXm56xPIjwoOr9fcLIjGrjqYE83WrGszi2xF
         mvnM3DBB9G03gx2WhGPmSuWOWh3wNs4vFXMoJ34LZEHwWW8mHUw7hOoUzBSqdDn4p4Uz
         VHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=D0gVzws4Eahk8euU2zpRsV2OEGUokUZ6rhh+6l6wM3Kf0prAZWo1vc+3ojeZqLL1GX
         6azDbw9dYQ8D8mKSDGHeYcZmBwS4qqmGFMGj+h9X0un6AfXcWTzzF3CLr4fYt9d5arQA
         9cOgYEYsbskVGTbn9TKBEEeh+tNqAVKZQ3IswZJ/Js6oRsfBhcpar4CDCdFD0RmZCtxN
         isD02hE9rry0u+vlTYYomGwLjbBZzXRasbgPuv2wmFhjjlUkJvaY1XXSGHFA1vqYuSym
         xsmy2Szu4VFd8cTcHQ3Igt98KYB/+8P6OwdGGnGBxbyFvuIJdrtgFnVWAiPOBx/ByMTq
         vPAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRS+zg7F4OFYSclVU+dA57/k9e9/LWQCKYcu3boNolfCWhO3llpbCbkWp3X/O8HrEtGY3zgD2Uwub2@vger.kernel.org
X-Gm-Message-State: APuU4Z9j4tsRckMnIoieHLDbauoQ7JvBVDk5pu3m/WWnnj5JTxuDnjWf
	PsOs9Oc6aNR+uBCsBgsc1XUENM5GnSOQlWVbTV+R3G+d7y/RlQvNq5Hi
X-Gm-Gg: AYBFou256IO40olq/Q1PRnsBYhO8Tw5eymlfXtrQmqY69W8FerL7yQi37CoepL//BI2
	iTkAX1kINEMy5fvXrCgOwrGhaWTnltHXLXbLLXHRYOGDN/2KBKvN2uEPU/VQyERd3pykCldt0Ce
	OYqYjW3GyFpJSm7cSgzDnY9KIiGxRYCnZ7Ayy9kDA7H+n4X9X7d1an6qAdsU9A2+GoMy8qPAlnV
	DO1hjbQ3/L8lLo1Od3wO+nGR/DNPpZ3cn1e7Z0a6qs3vZrD3dc7uV9k5d07bRwikL4/0dz5TgHJ
	LHbpsATqGUlvRtYabQPDgSTVkgREzN5LWZdqUCCXyY9wub1bWdCaOjX+0gc56z1eVZ0wHIUv98k
	oXodZLhiAXN3fpys4xLSmKTuYLT4/ZYr+Rp5Vw6KaivQl/AMWcXhD920WcZmx9HDAivemZC0Hmu
	pTYSqawHGs8MYxxW8UpTNidGOy9BgHVUsRV75zmqmIOTJcZu0JOhMQdeAm4/UTGRIAm7bTvoCqL
	MElDmWRlJpntQQABA/ftB1TV4/o3r3gg8x6WxvWa/X/g55IVwLWyUaPmM3jUbXBdT5Tly9eEf3C
	Fy7W54nOfuy+vNEn+dAG/AMU53ox3fpAW4Bmy66tihLJRfYwqhIS+9gr3lSBNwGslCnVb6Uij09
	TVxmDPAItmUUq0+03m3FD497raPoiBPOYCKcYHqdNxqZJHNnisN+nyHhy1/B1nBc2WaBPibyyxo
	0nkWtvU0NvD2jRkH/foG1qcK29QZDbO/dUiCIf7GSVuP5vBXEuFvE7qH3TME1YSqiwk8LKgUBCh
	DE=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

