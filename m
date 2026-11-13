Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594380;
	b=hICh9VmWbwVAKEMZ+4CW1SrP3fskR+gmPcCF5Ut99bLQ4R96/3A391lMgIkUUvow/UeH
	 eTMxMqVX2J+WQL/yEmmbl2fbIhVjJqLzz9B8kIl46oHRuy1jp0t0diNwCV7HuN5YrNYvR
	 5CcX2ID3wiBbgpnudR6k4jbiOTreqLll5Usnpc0QqiNu0130uj31Lu5/x64TGcOhjaHfz
	 KconGV1tSxElqCxGShkpB7F/mTPADDZ5XNcnVPMecUBED/LmjYESbm/eQBhGgdzILLNmT
	 2ziTr1V9vyC6ua9MlFOe46+BECQe7/EE3j2UiSN8J2yqUj9wXzs5N38Wmnj6QbbUZbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
	b=kNJniLMNWbL23s14YIy1zAlqLmdcp+H2752yM8sZ8eNRLujEOjdSATDMelSJFwfsuSkD
	 DVDKYztcBAqYDYFPzsXcJ0vzEMCyiTFYo50Xle1LY0MI1IqQxZOiLm7uzRTH6m0lm+j0F
	 FehF+UYvkMruXCr6LF6e2rmrOV89brwRMhSm86Q4rFR+S0dHHetHrhDoI00fHmFa6cFYb
	 OfBz0GhrQgkFP0al1ccb3NCfm4+7mKEx+kpi4MReDX7y5rW3CWgeSBlkP9EXvuK/p0PNN
	 tPTJW6mt8cVHXfhGSmu3Blu3sfH0skKpUA5oOMkxK2zMteYzm7zRgKqZxs3jFeNvt/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5xz7HG6;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0CA60A5BE6
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0CA60A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5xz7HG6
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so1113813fac.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594378; x=1795199178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=o5xz7HG6WgXf14fqxfpm8jNhX/AYdR51ZrstH8VL31atsFYeLXRwvrqswQml5n5P9x
         K2WP301LAxjxpdXD8trfn5cXZ7GOPV4wvepIBEcUYrSkTEPN5Vsp1rOOvokfsRiv8n0/
         2Ia9sJuM+Q/xA/j+Tz1E9+m9wiKFzJ5fCIXeX294S+jrPS3RpAWazVCt0riKUDgLM2zP
         Lk5cqOh9CzS32NamHUaS3VOPiuBTGjCMMyt9Ix9NoWuH6LIhDLOXvSzMvz3MApTsoLVF
         5dQlc7tjHHYqClrpUZrAvChsykMp7FhmkjuL/8RPMVx4C9pWq3/+4pOwHp2RU2SxXX0W
         vutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594378; x=1795199178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=ON4tG8eMPahZt3gj27605AcpOdR4oj6PFMF+xcoRwzbSHE7PQtHBXuDnrCcC6LHis4
         972rbZA4KwXz7TfgRNQMUat3pWC1K8Ue+u52/l3q4EeUiK1xhrYO7PIjTqJyr0CrtNwz
         TwTjvBzs0o97VZbxZC7vC090OqqJc3HYExk36QtBUPfxX3a6pYrldvNpFGasCg7/G9B0
         UM14zo8H0IQ3XEGsMsQ7q+vMzZFmADoRsEXpqiLUGptrHdimVg485ZvOplC7DDeJb5ZD
         nJ5rz8Og4lqAbwBhplq7Kswzy8vYjoxCmpxUqAMif3MhD6dSq532qJALsnS14ywV43A+
         BmPA==
X-Forwarded-Encrypted: i=1; AL+hErE41XIbiBK+BBxRqE+6a6vZaizXURkffQfafsBD8efX1+GLJBILYAKs2OJNVGgqUkfSiamgHV7SF5k/@vger.kernel.org
X-Gm-Message-State: APuU4Z9BI8+LOw2V109zRlXwn6p9dUmu+1UYD7NfXnOlUuLl8ZP3wsrP
	86NwG5A6UkSH5G9lX/8WXEWrxxWM0i9tR6c7yfkTzenI34FQrGE280SKPPmT5HNv
X-Gm-Gg: AYBFou2TtZqc8hTlKumEtjFyUeEtuNoivyBjatsaX+RjGbb6Y9CbWr9eJR5vPov+MCR
	E1yk5fIY9dxrm8HVvX+TbkQjETaJ5y0C+SBX/D0IrK0Sy7rpnK6Ii2/bvF4k0DoGoHPvlfDGs/G
	06ehEsjCnZqYNdZHuNoUAyfdlFfvUHmyhkY91A7P6kUQrKPe37H2ir2HK6tYKM6tnnzRkJFhXdz
	od24m20nxHjK5RoqekC2pYfwVm6DTRvu4T6e0/1x7Wt0+vBEqMxpLBfEwd4J9ar8/CdbHQKd6jD
	H3/sb/y6mHNfJe2q1rSMxDURPxI1TrNL1ZHz3pDHqaXdR1dV1bRYNuxsSOohkySsndFJaFid8K6
	+7yC1e55KbOEbFTnDyIn68ezXBSc2oZqLtyv78UkeRTmMi9vATdcLBjOwWYiJTx+4QurZ5L7pIC
	vi8keXL3jIeKdDBA7SiqDIsHaFVfMsHpq4HFERCD66teeEBqfYg1urTbeXdz+hupM/fwsv0NMCb
	Ltg2giiurXguJ6S4nIt9+mQ5g+4wtVjvueGRvVZLvhQzgtdK0eteRyNpcjS/YShsHJLylFA47or
	L5hZEX0rCJ/0JQWvgvyPwbxizdoUM4Gx04QL4GMTe2I4h1y20yukxFCqJIvSgZlUVjnpGoQg1K4
	tlqXxhvQYSkQ9fz73byuMr73mKTtCpwRB/jjOwg+W93PdqVemj5B9qE2aSWSCy3q08dvvkKwbG+
	8/HNVXfBT82ff8bE7nreCrS2ytzrmHLc6hL5nJSdBGCX6r9I//eIY=
X-Received: by 2002:a05:6870:c459:10b0:48f:e0e5:a1f6 with SMTP id 586e51a60fabf-4afdf948d70mr2365773fac.42.1794594378235;
        Fri, 13 Nov 2026 10:26:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:06 -0700
Subject: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

