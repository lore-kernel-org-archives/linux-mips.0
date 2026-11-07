Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082214;
	b=mbTAQzUSWiDa6kWcM4OEtRxpQP8MBMTCaNKRD4qXSldY5Fs/85O4I5ZAZ/qMn62JV2o8
	 mvkmzAYf/BE4Rqw7dJkkMe4CIkQ5y+0+T+xYAwkoYA+zE8gZVrUJnI3idUwzd1YA6aD+Q
	 uflmgL4VrMnM8VghYWKlPsoXobDN1eZWcgECBK+5uUYtq4G/epuXHr4Yd/lS1TRrGBNJJ
	 uQ1YHZZdxQyhdiVRVCNGE3SdtFMBXOAMQSBtI6cM4OG23RTrjYkX1ShPB01DB64HwZDfj
	 Z4VGWnAyvmUBbij9vSkhzdrqf9KBfejn+LwXXYTbYjIfY7PFRJ85IV6FB+Smd7LT1LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=OOvduOzHd2qdKy/jmFHm+ndRhnjwAMc0iHu9kKZf8Qv2Qr6tfCt9jerxNdPapouPZSkm
	 /0UYfECkEOpJro0JBB7d+GMMue5Bt1lfhzFBuknWYVjZgEF4MKMkeEpF/4BhZpr4pZMlv
	 WgE3ffHHnnrAwrBt1mZRxXbZYN6JNQ78QONtpuyL6OD+v5xVGgIGemxELOiPJ8rLZ+9zi
	 XGiHG8wHPia6yEgTJoOtFU4PqQ28YwXeTSQi6A8K+LoIq8uTvQzZOAEkFsAYD1PV0xD6F
	 YsiuXv/TVFa/HglkBR9f8Lpy0hbaFcjmHnZX3srzK5xf0J4kbbUMB7ax/wepG7+gUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808E1606D823
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808E1606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48ed0b68895so5540fac.1
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082213; x=1794687013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=pUqhbq27u7p2Iqk0X5XGR4H2A/upSyjPAIaShwrBnRlYze3Fbtvllm/tRNBdBkLMxU
         NJieqtZ2lwpnytp65PVr2qaoB78yvr9Tw2LVuKztC/SqODtJ5lz9lrcZR0/TMUSfGLxy
         +1d9VhAH+UboT0GRZ7rUu3JJWyYD6S+qQ+y/jLcLj1m1TJS9OeEfGf0Z3atCPKmzAkyO
         R1CkfHueTOHnCRYkGAPlzUWQXcqsA1uLuo5J4jeQGHoG2T/tq7VirqybjBfXxDKoS+FX
         mjfh+UKNftP+hcgKysJOdpYdrwwWaGfk7X034Zz8mwTqvEoCZaeSlaVh0dxEFz+0VTLh
         1HvQ==
X-Forwarded-Encrypted: i=1; AL+hErEZgtaFwuXN6n9YDQ9CtmIv8UQi495eJ/83SHaKHnGGWnX2XNl/SJ1UoM097p5GfEamVLEakQN0z2P9@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vy/H9bT05/n3r2hYsDL0wNRmXrpt2bZ6biDrOuxLARfff66TA
	+D5mt/wHiIvoC5DvV7/37PhNjX4YdoTNGKYgobEopo006BOlBbfkY5HYAkRZfoSLZwY=
X-Gm-Gg: AYBFou08cjxwajJjCXvObokvdsaW3RgmAvjkenyunCCTOG4iffnMfDwUKsLHSu7wsgM
	y3cdzsTjkadFj1WYXYnM2ZRCQGSANNsk1cU+8GBNA4R4RhRlPye3optO4RDPit2o734RjR/cddL
	7FuBtF7CdAtC62Yy+fQbkm3P+8VcWpSw45Zw3x4myrFsxA87sCRx47WOUkWmcdYxs/5LWBg5wOx
	bZ4BfhTdJzA54kj1amcz1krI9QQO1bCUCEAId8NUccg0pPHY3rF06ONwvo8/ckQQoI/il0TyryX
	i2OkYE7dNeWclrnzvsiIX+sduBigXm+2Qpf+/q7uO1b2T/HT5c6hy86eAoaW90uoOJrTOTbLpJX
	nFzToqvn4XayW8D3LAqBCcAXvQcazGZNNjRnDBSnBxaDMs2+nURR+QphzJfzy+QT1azdlbeitiW
	L0dHEw99Cbof3bsjJthK1uirJFqnTtT8jCdCyWUVgD5sFM4US2zTIp6gwUHaWTt+l0NvRl/QuQ5
	5zHd9Xd5JY3/qriqCa0mxp8Zo1gPdgsboGNDkLAGTu1FUYqKUoXTeUI+HDEW6gYjJ/LJSUTwQr+
	NOEXVDkICAvLZB8kUJPlHRpfU2ko3Xxb77EXYHV6C85emeVFBIQE6NyPwh8=
X-Received: by 2002:a05:6870:4507:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4ad98b59767mr3847741fac.24.1794082213294;
        Sat, 07 Nov 2026 12:10:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm212708fac.15.2026.11.07.12.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:10:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 19:33:39 +0000
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on removal
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
Message-ID: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-4311be01fa4f@gmail.com>
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

