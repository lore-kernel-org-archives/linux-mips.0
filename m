Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046609;
	b=glSle13onxRNFO3PiAnoj1WptNlMY4u70ADAT1Bc7oaiqYsADNDqswRpM88W7rtTW7hb
	 8KmRvRBbxHhDjWjObidCvq5LrWlZdf9ZJciGyUk2LGCgiE7Kdz+8FcVzX4KSGrHtgVK+H
	 RzsQEuVYMT9bA2P/i0EB3aEw/Gj/HWzFit5XnKHiupRs0TJkpk9q62DJjSIy6gNo4C2Cr
	 bE2Z7fPX1nFOVw3q+i4+AsPL4lk+M/v9kpQz1OJmiSPmMShaFy52PXr+CweAZ55kJsbUg
	 zKz6K6EiqPV1vtf+mVnramt2g4UY9IUgEzBWXsIgAPq+ToJKN3KaXi7T7MomYySUZbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
	b=n3lFAOpIDKUVYuCeYuSqFXlmAkvTAFNRS4f6iNLLwvEUWyEDvFrZKhu6LloC+7omut2s
	 i7NHQqnsUYHgvBOeqw+ePNpqGNhQTpmUl91snjLbWeh9rH/SV0oFaDWmu1d6rtjQwi0BY
	 Eb+MhJ6t9VRTEB7JZgC2aOfQBGW4DyQFSuyslDyA3eZquTF9erVO3L4KfUXdPYUg8mgNc
	 E3W+QFaHIW17Wnq7LsAGjL5znJu6d70U8KaaHBw+Z8CHZ9ZwdmFZFf9WXfOyPiWKVElui
	 ZIrHGpJUuEsRcULAIvo+IRouGkuA0nmSWcOMfMIHNH5wdHmc4HYB5ih8qf+NT8LiRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07331606D833
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07331606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85a5455bd3cso839894a34.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=a27Vni2U4vhty3zCHojWT/sjM3GihDhQuCWecmRAa+CezosijLlI6ibQxtsdw5MD3p
         AcflRduOvCCXFyIadx03kqn0gw1p5fKhRzK5uLg2x6aGDEoC0gdSmlJrdCtNHhb6DU1k
         uoHJFW/0WxgERqZ9NBv017koirznsDX09uFeboHHI0cN6zvnWaY0/R7nMP7jZKWIIENG
         PBbvpu474GVHbYwPijjL6xfyC4gggP8zn0hONQzmuQ6vCUMIu+LiqzOD5gNr/LUpI9eu
         IX0uk4EyFVH/XOrX07zaFiqgtR35V1w2cggBN07xSR7cBnRR0BlSxD68LknjJmA2Agu9
         ZASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=EqFVK/N7CV5I+s5GV7lECNzLlQfA+xA3zn495k/OOgHrzqrNAGyDG/caLpgh+XtDXU
         Ny+u9Op2OhcJo/rVafdY8IO6Re+OXjTt5Adts9R577Fcu+tq/1QGXpk7KBYoSitXQrnX
         fQi6w0pSAieUB1P+oFS7fQzDZqDiVNH0qMGhnqiClWB9GQDbBOxZpLo/8ZK+FHRMwSuj
         U+URYS9PL/dWF0GmQeEekUN657vkOHsfuQRPF0mtlQ8dHKd5OBQmeX5+knlkM5cItVI5
         E4RQ0+iAxt0kBPhN+91oF26Fy0eVSmwoeG5iBEIFfSaCjtDIzmDo8sx1J3q0IiGvu7v8
         Solw==
X-Forwarded-Encrypted: i=1; AKwUvByLQBwh37FbfvizbtluI0/61DdiAugkzOcWMv5B4sT8psgkPoZTEbPclXW5/TYWNO3qGUf7jp4PtJ0I@vger.kernel.org
X-Gm-Message-State: APuU4Z9pc4J5cYz54r1gDTMk7zG5o0Q/cs+QgnM/IxMWG3WuDMXeFmdO
	c2sLWzrp/vtVVN4P3vWCMuVhgAEPAg7cOVH75Rld1bxSXrIhIkXXjPML
X-Gm-Gg: AYBFou2L5ApVRWeDd2yQCob9dwSWulCrFmvEfX0gIVSt+ZKgx2erhFtuxrpGMu4+jks
	U4UhI1KxehZJsv37BCWcf7GNbHBuToPrHt1APAI2rKQ9C8iejyBmCglFDZgmxRsieLfEwRuQuKb
	7hrG62PkhgNGhKsiQQhk0D8X3VsTJBx5hpCIVWn2CVU7RnmFIKc6dxqeu7tZFJOCeqQTzmtOK82
	eKHVMWsqs5bds4Gnbpq//zW+4q1NP3WOEBiKUtTmRXxHlWIUQ6OlvxsL82foNvd3hL6ELzuMY6t
	j7OXghEqSQR2DDts1qddT5n0SswFi9WWG2bmRu5xJmG5NnKeO2A8d0G7nJcq0XemkDOtWZrvdmQ
	6qHKEK5eFdm7deALlmvkqKhcQ+mFkHmhDiwHsJ2YoZAZGxpYeCUbvO9Fy1tRPuMwlKRv8s9W3Kd
	kddStVy5ZvzXsyil2MW4KJDluuTp/6Ge3kOVfRuokebokPdVzjIo0wfnWLHqDxfwtSOJ1YCDQFF
	rIefLM1fw7rTdFlJ/Cw3h4U+9ZC2nvR9b0LHGhumFk/eOmBE91Bi9xNucdFG1ylxoRu5D2yl5Db
	C9B+V8z9Sc5MTZsUY+UIRs8gimoN2Al2lnBzI68/B6M8V957opQu1KnWYlKmSYdtiIgz8U4mXFG
	oX1QHsVEdOb9bunH+9s5ypGdysZLJ+p84HdUwkRl1amlnpcWKSLd5qYpm2Yb1qMqXWEF4QEoz/f
	FLfCuzQDzl4aS0/iuIPGFyID21VOu+ywx4F35OeddfYnzY+wv2ZARx
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

