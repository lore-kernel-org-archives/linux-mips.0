Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810647;
	b=XPM72LZnIhkMqVB3mxUO+YYx8RUd/XeJ90Hz1i7RKsHPbE7zEHK+m94ua+cDmNtCdM7r
	 mQ6ipU2p+OpecteydVJ87eli2hyMyFRd8xNjjYJIJKBozedi9aYfegR6GUl5/AaQzqv0m
	 y1Mi5JxB2qCCET2fJ8rMsBD/M0juMjzV1HMmP9x33Hjh4lPfIqhhxTqJFevMs1Da/U7SB
	 WxDRF/xoXFOQxtjFturZAwCOeA+j7FOypj5nw/AiuaQGdpp1IR1BGSYckqunciT1x4JGc
	 b/OIpFjjhT7XDWqNHf2CJsqpiqGJd9wrNC0vOWnCeUskbt6aqr+yyMKSF1BFnmlYf9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
	b=z/LI3UnR8pZwYluUMSrB2p8geTS1srE9YUHZNAVKMfXVDHO7uQ0fB/x8JqadB1XQwn+f
	 Kl73HTFN1ScweyZscHMM+jEJ+pAiyQiw8zvoAano+sKqulhzP3wXCIH5MEKFaEr5TL1Hs
	 BpE8dPwi/or1XiC3T2+hWGioMgV1KMg3gvoHRs+c2Zl3oDKgh0yXyQ3UQmA2SHFMBH8MW
	 ahRVQUOBe/dCZtGSC7HjrAlfLPR1zAW9U2h4RrezElm0uOut4gQgQHHMrmkchxCHAPeKI
	 3eN2s637cFW2LsWSCW4skhcRswfvrTKs+JMBT3UlEh5PlS2VOF1rP+vV7+eNG4jhpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7gVs72E;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE5606D973
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 06:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBE5606D973
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7gVs72E
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-702fd86d674so2709011eaf.2
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 22:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810646; x=1795415446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=d7gVs72E431n5MdxVFfDKztRz31s02LZozR+CYzh06kurT1LQGlkqVtWLBwG5IDijF
         vLJg8Mk5y5qxhftuNur3PcgAzXk031ZggozEsNpDag0DPeFeqPj0brVzKrzeyci28ZAm
         3owKsg8vjWD/8V5EuLrmOkhhB8m9aVni+7ql4WWsL08pBxlElptODXlWMBfd2O+jAXLm
         Hg6FNvUc0JrfrvILZEwEjbg8MkraaozP0k++Cyznk1suXY5ovEL66KMfzMLzMbQiiJBN
         AP/sMgeYLtBqGOpm+RIwPTm28eLve9EG4qmZnAqi9PeUGjCMXXL7QS83kBPHdAjLLJea
         J71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810646; x=1795415446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=bHZvLHM9x9q3cTRDYR7TRi/1cXJq8wC+sBrpP2K4EH+Fx9AZK1rXA1vbgTuIcShPkS
         Ph/KoYq/mzTb81SIhhGhOdnbmLtz7qEN10ks04/vcCtbPjGMeVbkD9RCPI9dAl8ZX/ne
         Q9trfipFg5m2iTlVQCoVcnGncr1MSAGWWTafgL5gX2EZj62K9qp7qtVKExDlvvMgWzMF
         DBTwrXj9yMIGV3SqeBUPnY/oXK34Lm+Fo89uRj32cuSXDpPpktyJ5sSczE8UJGi0/Tdw
         D+Kw/MlkJmBY5Wy4xrZdkozv6birpoNTyr+kbQeknZwMSXMmstz+eVhEudsKl2fDuQN2
         WJGg==
X-Forwarded-Encrypted: i=1; AL+hErHBsgUdaZFGSM1HOPsoaNuqkOkvPjlgtLptu52ElYN9BljMWhMHNqcq7mt1inGxXtqpf9ncEPoKv4dV@vger.kernel.org
X-Gm-Message-State: APuU4Z/zBRD3KPJ7eyyI5Af4coNFsozzVAgxEbvjSHr2rfOYNna3xgAL
	l6XFtnSOoSv8n5k3wAUahvV/278kG/+9ZAvAhpbRHoIWYHvko+IkEwRx
X-Gm-Gg: AYBFou1ToHUEBBeEFin+wNW9pCloXiL5lGlOPDVxHrKQUPAjtSOiqleKidhpj/49wdb
	OfUvnXvUUKcfS2D2qvavV1goaD4fuxV4TusQcbbcda7W5uhRrnj55cJ/TTvn//NXECPZ/3zfa1I
	GRRq1kAqN/0QAAGrMm1s3H6yOsMDrkAwOFi8osPIiyb1OwCBj8wzy5kAqMKYihmLCxh6/uYp9tW
	4wdEVhVyHgaapdi9q6q6db/jcZ1uIX1DRkRiZz963NidzCFphST0OIqZHSTzXufuMlKPwqsthip
	EeuYX3SoJ6KniYLHqlRBssZMDKdNt9a3fbTBYRVbsVy0UbETEyqBamHFKIo6a1UuISSJRqC1380
	VXuF/F2nC8igxG+FgIPZbyLsd6Fo88CdWPdo+fcATpOKtzUmi9YlH2yGMU1Ecu4JOXrnZqhScOO
	12Ji+Hs0Lym247vUT0O2ikjkJ++OjlqsTICVmyD1S65ZTTMEkWFa1c6ZMzD/AV/BLvLxvEC125E
	8jfync6KsSaF3z8awPvEq1R45BwgyENmNc1VtOJBTPsXwXu6zudlecwgfkhk/2Jg9uCLAj/ualw
	BUBXopPJn7l9YBjSMq8hl0qTrplPzNqgBl0d8QZicsfHzLRRhpixExUxg+/8lmUQtoDPeJoaj39
	GNlGJihhwJpcOXLcdH37H/3obQXHPqJZIgVefmm6NN1H85Kz2K2Xi4R2F9L5mxWBqCwh9xczsOs
	TsXHmzFX+fCcyUsuVXwtU/TewLlvUlfGkYZ1DOKCK5mIWCD5bRiSY=
X-Received: by 2002:a05:6820:a513:10b0:71a:eb81:3bb6 with SMTP id 006d021491bc7-71aeb813ddamr1408535eaf.38.1794810646022;
        Sun, 15 Nov 2026 22:30:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:05 -0700
Subject: [PATCH v5 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-50-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.17-dev

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

