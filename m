Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046612;
	b=AMVDhR+0KoV7pRRZ/mO6AEM9Ye24pu9ogWVDhNsvJvscxuP8ft2SaG2kSLo1IZe3RiOw
	 oXgBB1kpx73ozPCE73Qw203R9wgyclNFRmh/fbvm8A6HWDNGBTOHgRWnd+/U2XUDKABzF
	 mmDYJh21k8Fr2oohqVgGGiJttCNAJ/WxoqbN2KD3+LPWYbs4DpnDussZMQRQwJpEztCu9
	 GyaGqbrpbd8K9Dr8FqN7h+I39zeS6WY6EGe97BQitux32XVSC6INNR08TgBEQIT35WdaZ
	 USzts6s9ElCwqZl/F/kSj7SnDnHpB3W0+KZwz7rxQed1pPd2Nv9I/QWLeuhdWqNcfEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
	b=TLmp01APRJP6UHQqa230mo8uXlgBy7gwerfawLT573t16nEnlFr9BFuYfoy0KGLZnQRe
	 zE9TaaLinRFwiQTLzEhio8hJcCgR6j9MTq6LJ5toXvt13rn+XDRL5ytc10j2xxjlv2SE6
	 LYXRgIIp+hodR9F+KPvZ4tp0GaGIhkTGW/KXFqUTTArCyUmNV0td52tiB2ISYvMShOPQs
	 bd3PDJkc5SrauinA69o23aRqoRI8/YAJsVdoSueVE+5gv2E2Yjn5wOy92rFFP0uoUDqbu
	 MJi4kz/cbZfQD/vrDvtay/0Nm+ZLtdj/dqXJmI/i4nN57IxwFKXEaHW0OYN73Ezf+kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGXtLhLY;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A96083610
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6A96083610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGXtLhLY
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-847ac7ccd85so904686a34.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046611; x=1794651411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=KGXtLhLY4/Y9dF950dN43n4TeFvCnD3q/hYowhMCzMuob6nih1BChoNV05vj2XYuCS
         B08M43QBn+KPN9O0miEQ6HdflDVIgT7IbN5AB9x+9i0se1jH0rCwvfAbBPkwpj8mNg/P
         zCvFJKoPoX4KfY9sosN80pS7W0peF91H2z8PWbQpLtOZRg60HG3UGLIa446OBOBy6KI7
         3hwLqP4xaYSLiMI3VyAYh8XqdipLKqaVvToQkdMVrBYOfWdf7tGz/54oPjNqzEoS2h/O
         YKBP8Eec4x+uApYBgFZ08C0QYd/aehU/4lfFdQZDVLf/YFM3ooG/H2Udd/TQFvTyxR9V
         2Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046611; x=1794651411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=COtbBjDWn/gjUhprEFsIYA1eNW1F2it+T2GMrs+DkIO5hlYqN1qMxarksD8r3IHBED
         N++Ijd0WEqTD1oExvvwdjDMNtgEnh9KjBquc5xSL3kbdVnDGLg+rQh3rRkQroNEGPWVN
         oFTxT0pP1PQtS1Od1HgqW2aPpbMdbkSsUeTs0pyq8agY/6BsgGM8wVOsEoJX2qRMHF1H
         Pdc54pRMk9Llr95BJeuj0JHawia9INrAtzSBFklEGHj7FSE0JKidJQeTW19UuBm1B1Uw
         WTDorfV/SBhswDoaD0uhJ/xgNDabNlsGna5bWk0Xdri2HhZhYtQjOt3fYaNT5XEz049T
         5gvA==
X-Forwarded-Encrypted: i=1; AKwUvBxLj/0J5pBBtg3UWOHStHLxw39kMKFHvMKLaGjYdnxAf8k8bxOHpdGB1TLnU0nOi8qDiHGJ+PF1ZTVO@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gu6Ds0ReQpCKFA8h2W7ddWuVTl8vGn2jERQJlHF+F0ZxUnU2G
	kWyINNeDrhCrau6416GXMIjzjk9UcQO35j62x7srh9YYrhJ1Z+4Avaco
X-Gm-Gg: AYBFou06HAlI3U89iN4V8Uow3UwSk1Y50y2WxMNSLKxppLvy4UnOJMj88V+UDPqIufX
	C6LuKCXLl27t3HV/rRx94lq3yd1jvX3z+ZIbeuxfOIEPxu8eSOeNBTDLKZA5HycHkiUm6LoNM7d
	C2mZ4pAkGTjuAyRLC1p7umQx6lJ2zGxklOj93inw7Vyep9aktWqpqRKXs+ST71XSDzQN22z3lit
	QT1CgUZeAtN9dPo1vRXpv18cTGko5oG0RyLaj8zZxkymYVHPCNZa87JL0Ok4GJP/Ur1TqfnW6D5
	m8FrFrnAHkBvJujK13tkTxZx768ExoDa41HeYnvvKHwET8+JBYobsHtB4GTmY7tEwbkkDSXTbNc
	PKKEwbkPscYduFqZwuFanu4UNJzDvDz5sBwzYd4b3Tp7EA85cpWqm+vR5R9OWsu+ql1wArg2urL
	cb4XjSe/WO+yR+Jz4onCmxdLEqR3CIDbv2R8Ma9FzR6rD0U6aR5IVq5ReIkvaWqgzOd6hSzbiAN
	IYdEGF2cJRrdP349zABdCZjEWSPBCYVTRX8YrcwguScbsLVVHKu5u5zMJKOLErWd4iZPzY6OPtW
	mKWFG1LTiqy3sBbDBjxs/j1952Y4j/j0lRpl2GoO+51vUqIF5cnlABPgtKKpRaSMthZUOOLEXYB
	Th7aLqmVmd7vMFwbPIbIdZyXh+Xc4324PVuUcULm4ICkjO3498Nhe4eXRk8l76kVczHf0959JMV
	JpEhnhzDS7MnbAIDAZEGckmMx6/pXQchtCyjqEKnZ79eVsNo2eXT3VKpOpcvDKsfD9SrTFOQGp6
	Q==
X-Received: by 2002:a05:6830:82ee:b0:828:d647:332c with SMTP id 46e09a7af769-85f1d0facf2mr4771818a34.25.1794046610805;
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:06 -0700
Subject: [PATCH 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-9-0181ef0cc4c8@gmail.com>
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

