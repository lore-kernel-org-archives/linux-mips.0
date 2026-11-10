Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296718;
	b=umjp4RYHeX4op2ZX+K2KNAVwUBe/DwtkchdF8CL/Sg5yTIFOgS4pTkP3wDOQ00C1fbgY
	 dw071odWc9MpbaUTqk+pjAfO3LsE8M5RM6pabcQ1zWpEQnwbeU2JadS/joeQ7SiMowJkl
	 LZ+6Cpuw+T3zPkhNkpfKCZ98+V744GGX35xsquOJX6Ay+ytSdq6+U6js1umFyEGX8XRVa
	 h1O5k0YbSGgetRoH45Pv1UoO5gyPof/jd5SChQUpqQOU1OJQImnc0razIXbiJPW6IHGE5
	 tjAV5tdOADQeCAtUNQGhI9+co2PiprW6+oZpZeJRU/1J3cjeQjA5GTe11+2tTn3Zt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
	b=WA1niC9/9laWnn9JTayuseggj2822gI+cGffDspP+6OgHavi7esso3tW2PhREKx6dX8k
	 Qm1GLHUemyAJCUJrqUmjiTbZg34H/ZinAQ8lrjVheGjisnnVhM8zzqmVd3YZCMTXP5VS2
	 xdrxiPLy72D7igkRWqetsZOMsLc67oVcwiL4PLQq0hqees8c+eROWAT0jrOrmORfQRTga
	 HHwYkBlC/Ey6gi5yIzHPt1Q71rA75Z8f/OCQN4EkB4IiOk/SrStSMxxrDmLYWxT7yRf5o
	 s34uj1zkiBkhWuUHgP91kdZTfig0Uqf4zZX8eZcwuATqpgxdUsWnw0lL6+ofK7Iu7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=igme2IZP;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF29560742C5
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 07:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF29560742C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=igme2IZP
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-486f013db83so609028fac.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296717; x=1794901517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
        b=igme2IZPDnrzZLUDBjJ7JC56FCY5L6Nz+uNSAN+WdZ9mLvhIvFixTSc9PwJIk0QeQ/
         QNapVPy4ulqMmaZbHmft7k1AGIaygIUGi4uCqXTzRaVO0hEonelP6Ngz/iyrkglp/1v6
         FxHUOmJSX5afutmj+a2Ee3X4Jg6aXQIxRVWdzuLMfKmQUKm4bjjta1NgkHtbR+qlbadJ
         827nfeQf2fAOAhyK1zd7pWWHcSGGHTvT/Ypu8/W5t+5ul8IJJefeIKsoqQKSXT3hLyYE
         sXloBtjjjwzGEX+TBAmSVshWhCYdf5098tcHiKDWQjoTrxX1kMb1ecSb3hN2tHUi73OY
         0LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296717; x=1794901517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
        b=oSk+D5eT2IJLGT2KVI6pdIlfCCN0XTyrIEbWO1MnWEa+2aIA1iROkHT2A6m0rwk0TY
         rGY67fOLfCZj1/eeZu7L0f7xFpTCWsJcFZbnOSNgsQoC6YxObLZAvkxUCiSC6Nel4pPw
         M209+5MjFtci1tM8SSb+P5XASk2m8CSuKlyJVEVc8AHVjLxS+RLMsTf3oGMdIsCjTpQd
         bIHwgmwZdXtI+z4Ffkv5ahS8mIYw2I6m3XQUoZpmf6jM0N4NGXpY38tuAxkTUUjGq9uE
         MpQpNh9EUKujuq0EVXJ050fB+Pdd3OIWrZwE5Cx5luphjQs+89lSMoLkNnAaeBm69IGV
         Ig1w==
X-Forwarded-Encrypted: i=1; AL+hErGx9sodh3ZYFmfXd+xOP4BPH/eceSmLJpvo0CwAs1s+pVQaXjPU5arGJ9ODEWfVOQoY++DDL3YBw8BD@vger.kernel.org
X-Gm-Message-State: APuU4Z+obhhVpY53ja+18BIianph5T6IYBpgXsguMyXcN92az63G7hiO
	Oz6dG4Z/Dy3YAua7nFqYVfBYBfqH2i8WiCkgEaUHjmWsYm+gVo2r9wGo
X-Gm-Gg: AYBFou0bWqaxJVMQIOZWd6LAXHFlB6hYRjcUEH+XdhN6+t515N7HN8jb2C8ziKjsJpG
	Utl+FdhHonVySOsjqNCEzw1Rjy5FarTqDcrjjvPMqON7b0V1gTq5NGF4cJ+ocBrEgydvD8sDXuu
	w8Z2zPWYRPmffU1PguRrkf/2wzIcTcp7uIZUx4mkMcfRXi+PdrVFte3nCgism7h6PPppQ+1s5Ag
	vQJHKFkJfRjvXKRKFgI5b5fU9StW1XPPSYKPPe9uyTer2XqGPftABlMxmr7P6yX35mYcAXUd4Rt
	hpF6kM5v5VYsHPFqGRc7D296A/FffyjSXFvF2NY2/Qx+7jo5WRVACL2MUqk25U2KYGWLJwLFicf
	GmAyJuMUMNZEtCTZrkFsjaNAjNE9rZCl/96F8jCSqW170BZmFTHvoN496vwFDXBdYineVQhslGk
	9cTpJZIGTbeX0hnATH/zI5imApeYdfsgB78xTreHBlG71G3UWpKMjyQ0WkBihrEUmzQdZG/GxeV
	7I3GDMMzd+7xVqjpZw6/aW88kCmijTMowV056V7YLYxq0YOTMxKejn4+5r7A4DniKoxJ0LrH9Go
	8PuOlwqEFSLtKQDMeV7D30Da1Ht0T8HY+adfjtqENdV1mjBTPcdJ1POdN/5AwZa1PI9e42FnTz8
	TzmIOIijo47yJ+d8ayjOx6xCZvRYUvP0yGAD20klpdf4F35G3vjg1f6xPvWTtgRsnHuiv1AYwof
	gpFSjeURBgpbrEhhfVNKRS0k2P7ScHRQeumI0wzBR+3FBsVFUEMMk=
X-Received: by 2002:a05:6808:13c2:b0:4f4:4de8:9376 with SMTP id 5614622812f47-5683cd9c3f7mr1680606b6e.54.1794296716679;
        Mon, 09 Nov 2026 23:45:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:53 -0700
Subject: [PATCH v2 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-50-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index f1e2c82936b3..775ebf4dd3b9 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -341,6 +341,11 @@ static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.exec_op = ingenic_nand_exec_op,
 };
 
+static void ingenic_nand_release(struct nand_chip *chip)
+{
+	kfree(to_ingenic_nand(nand_to_mtd(chip)));
+}
+
 static int ingenic_nand_init_chip(struct platform_device *pdev,
 				  struct ingenic_nfc *nfc,
 				  struct device_node *np,
@@ -368,7 +373,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +382,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +390,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
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
 	mtd->dev.parent = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +411,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ingenic_nand_release);
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
@@ -429,8 +446,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -461,6 +479,11 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 	return 0;
 }
 
+static void ingenic_nfc_release(struct nand_controller *controller)
+{
+	kfree(to_ingenic_nfc(controller));
+}
+
 static int ingenic_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -474,9 +497,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, ingenic_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +519,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +536,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
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

