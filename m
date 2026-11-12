Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446964;
	b=x1MJqgjz2cNkEgCzsk+sp/KJ3VLnS2/KPtv0tIXD84x7FxrbigdrvrNByYT6J1z7ojFq
	 Ne1y2qb5lKiTTiqtJdgc7X6zrZLTCcyyDo8k19lte+l83fpWaPDck2qThozhCIC+d9S0Z
	 srVncanY73CFA5795TDGGAerBaIk6G5gEcVJKyb7MMwYYi1EoLExbQZ81fH0Ur5G6IsAa
	 Uk2udnZk+5R63MQsRFQiKpNgEMsGLWWNfjKl7BVyoBww+iqgE4uhlql9NzTMA+UdrSm+8
	 87tRckd826w8p6lSgPw4qi/CLSoXpCdD2IMfPgGC35gflI4GqDUi0AsCDv5t3vyouqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
	b=cDx7cY5QooZCV52XK3qBHmsKzDSOwJRqYV/0AMdidMz26m2eTCDl5/GsI/038wWIx9lx
	 CKutg1Uj9oq6d64O9ZjsecPvmN/lS/Gj0tA2OCRTd/l6xkhWIGWZsHvXmwqYGnh+fpbuP
	 nyaBvELJha9mlQjY43LZMpaOk1wfffpp+aagsGd9Al7nhyExtMMRIWgK17jQCr+Ki/Zgw
	 5RQseA+4OYiJJPdVe/Q3A+VVswyDyFx2a9cW1KaRfQ6v2anlCNulNS5426EI2g6AvxXLI
	 SD2mw7GlKqnKRAr/FR/xVV1jSwFq5K0oxKH1fd8uN99J6y/j1WFh4qBdKCuN6l7716w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndLvk1dP;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BCA6071AF9
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 01:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BCA6071AF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndLvk1dP
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8241a56cd70so2395380a34.3
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 17:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446963; x=1795051763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=ndLvk1dP5+Kdax7tr2C82q71sN+xzq7RRXP1rIll22YIydkroeMUenWZHxXaAAnHOu
         lyjlGgqlasMLHYxl2l+XEy/7TSYYJt1cUl1rSML0svKTaj1C+6s0Iuwbe913y1jrxTTJ
         SUb0e9nMXERgD7KOe9Ba/IaZePI9fvOL8XJtEArxQclSUNA2Wz5XTNbUKgUpAc1XnMb0
         eeVMdYEBbPzZfyBpGJyDRT+7KQnEdo1ZpAz291SV3gXivY6DvMkx6NXOGCdAYKGT0fwZ
         DjIZGOP/gXqwWKmfDwj7K9zc7X/CWqmevbgaLLqstfQ4Tv7wognGZ5JowevoruHLFkFF
         kfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446963; x=1795051763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=P3MTg9dVgYvacx9F/jxFfH7BrOATloCKSsUx1YfjScmICjXGiljkh4UMv2QAD2K1fR
         ZA2rfGfibf6lmG2oDYwFjE25tAGXOYC0vMdCGHn0kUgSJUjiHexkoqbYwpbBDfaSZWXO
         JCx+NWflOh2iNgfgVsqTX8PnF09DNJngZAK1vnjNhJ9YOIHpsKpIQJxA1eDiRQEHH+h+
         lANoDmPlCLIJVsQLXv2uuVoW+6LFjQzMeFFwwpGLjw7eBrFZqfI6nWTJHxyTAb9z+ZnY
         ShAjXmLybLrZNzh5P2sdl02yXcbeMKzHszjdX95XqvYujVIypWppF/N0V5G5lBgh9uPh
         shFw==
X-Forwarded-Encrypted: i=1; AL+hErEYVKVABRQD2yrDVsM4yPwZKaky2gtZeX/u6vYtGRC+yCvDkyuGCiYUzg6nTktUjXoKz3BErzHNXFkA@vger.kernel.org
X-Gm-Message-State: APuU4Z/T9BR88JeVURV+C8TvwFZrGXtDlD1ZaKf2sc5St7iq0QN9zZiO
	AxCSxEC0TX42bX0vyAPG79kZfxcnQEt7RKOWAKBFtyChagTNr6u/hgWB
X-Gm-Gg: AYBFou3XfArls+6jpX9zukD0xt5mYfYK5QAJSDLSlLm6WKbeYJHkm8+4yNHCsnUDzy1
	Xg513BbhS6VKlfK1r08x8mFOA8MXE1qwDCznHihlBwVE4t6QcmILeLy7/jKb0FiaNOMD/ewdOGl
	F/FY2KXOxAy+NFedGklfsxMPonEH6jBlZKETW3UxcQ/G7cd+HMaMOmpzLpfXxeQBTpTi/en3jF3
	rN1fZ5UsWY55dTsO7SKcbm01xXR9GWeOTtOQSJ+jWfWXShYQLNFBhyCUoWXZ4tFG1ceTdN9v0I6
	x/CoQiT2UTc+oBwLQchBu4KJY6WC/WK2qhLxBcunMDfr2y7iipSfkmKVAlofCNAYRmpe1Jfoyr2
	QsRkbFsdBMqH+6fNBjvc+HRkoAye9l+5UaXzYUCxZfgLzAgdIhDAU5+of5IFqyyPgtDR0vrLqzM
	DcZKKH+Q19ID74CrFdEzajf/T3WoK32AS18ZgXDCLZQJex4VAO7gPHuNx3TVr22I5FOQeJxGLof
	6q6qrnn+xldsxP8QEJIxuUTfT4fpge8bV8kxibi3YuqLlVEv1ihk9cHhtNDr/SYU9D0azW2qSbM
	45h5JQQwZvTgu2aHP9or81/zYf4OhJcxMgACVOnuQcCSaByIC1k7Zmlgq7pOb1E+/6ZIQesL+te
	uhxyxxhCIc0pO7FJTl1+ViueHph/acBHHsZE62nJm9QW5rJ9AV8IyKXUiph2eKAnrJhC5qo2awv
	jYHFnBY4BXmFOI6hJJ61xKrEo6cHIp+4JiKuaAbPQBdaY7/joXpJms
X-Received: by 2002:a05:6808:f12:b0:569:5c3:d578 with SMTP id 5614622812f47-56b93243299mr4395163b6e.9.1794446963491;
        Wed, 11 Nov 2026 17:29:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:29 -0700
Subject: [PATCH v3 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-50-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index bdda06ae0d72..2818ffe76796 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 	mtd->parent_dev = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->chip_list, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
@@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
+	ingenic_nand_cleanup_chips(nfc);
+
 	if (nfc->ecc)
 		ingenic_ecc_release(nfc->ecc);
-
-	ingenic_nand_cleanup_chips(nfc);
 }
 
 static const struct jz_soc_info jz4740_soc_info = {

-- 
2.53.0

