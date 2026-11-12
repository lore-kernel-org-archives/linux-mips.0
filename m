Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446945;
	b=Pyu6WRmMysxZ5C4JZkMIP/K7zRd8TwMuRu36+49sAMIWCR2jwtVSnl5zDA5Wf/xEmAuA
	 uPK/mAURYkAoYUFM7fxizOcDyhNRtUAY2Oe1SdhIdu9nBGiuAxUeTxkrOh4A+tXdi2TjF
	 DcYfBN6RBYA0TetubK6sJxMWQDTDBTCpImx6ArxRib2wKsPF3/JHVHCKmD0nB8Y794AYS
	 lixsHFP9ay1VlPkaB4xGVGRDUiAGgIAwMQjg2Nlj9R0Lzkqdz9/dGZbYAg6MebuE/Pt0F
	 gCaJj0jPN+bKdqOUg6f1kDwCPhM4zs0N+wKjEFZEEr1T8UKNC+qVWk324hAG46Pm+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
	b=YnfWChY///UEbn4jNdGxmW3d+I3KC7C+owjBqZP9bwgDhu0jEjTHcXRmmMjvhvLE867C
	 A0xxN55YWOzfzLih13sKzkYjQTCNzsDn9lqP4pfI5GVeZPSPNi+VJGxDxBJBkieWJykOC
	 jv8Lzru+GI1D50FsFAInf1r+uXC52smPQIJBjmnwf4bo0UlijD4pc0Tue5XBt850n5zDz
	 19xESqvkxADHGKlcjACmRnTJPjoSsu7mBj2f/P+u0gqDhnlOoLD+NEUr+aiusljfWl7Ar
	 3MlUA1Drye3mE+JAe6NgrzsJFaDqYfGJNr4AHgwdljBvwnhFQ7zrkZkH9KQzfPZ9gRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XK5PwUYs;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F7606D161
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 01:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0F7606D161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XK5PwUYs
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8479f46ecd8so1829581a34.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446944; x=1795051744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=XK5PwUYsbAYFVrXNm2riO6GUz1mLACceLabx5d7v7UWPX7qt6a3VDHESRK/H8yL+qC
         BzmvzxYQwavK+BECz15cylYMpGEw2htxhmVzSlgtngtz81VY9NP5YEuKVyUmBXhC0B9y
         5bsiu/Zzl6CD8dRuOisxOL5pExJ1wdGeruGCeI9jXFK0XTm9sJ8pjD+8CHyjZmVQRtPx
         sFAZULdMPheVzjpgbUgo3ncnxj9VRm3scZouJev1XPtp0FIknyLA2obyhZbuWGRIz8zR
         8PRSCW1i3nqKkumPm5z2pRVy6DeEoB1plcRmsI5OajdDLG+OroaeQ1hD671CG2maE0HN
         YP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446944; x=1795051744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=X6wIhWLUxh1pFVD+4obabuAdhwg0TmlobIa6NUFhIOA9Ymsl+hEGkoFs+ovrkzkkiZ
         olvWV18pGEfu61oJDkM1KwjKGw9E0y5/tNcWT/ck0XQos2ni8OclcJUaShvOnzX0YDnv
         CDOZ/YK1SNrLGFuarEXbdzT8ohkoRSGWnp4YNyreDrUHvJE3faqyQFVBcvUxqZipZihw
         /mqTnorA3SJA4FlxGIIZOd9Sw+/HGm6BafRowE61YgTWdkT0CA7atLb8KB9Ao8srImmh
         1KTtY3QyhFoXsqbvrHE4ISfssF6EyK73u3RkHUkeShkVKUoo+ii0u/Epre8KDr2O0Uov
         Gdhw==
X-Forwarded-Encrypted: i=1; AL+hErEllPFZn28gpuFzAUb3vdPdWG3ih8yZZLZafcQQOQsK4lHR0GyPk6qTUPg9yOrD3/F7ifTLrzFAhFHs@vger.kernel.org
X-Gm-Message-State: APuU4Z/KiFrRA8KPrPtqH/ObxInDxm/AdzHUf0CfpFsZD4rZBnwLdnv0
	J87vr6yceIvWV1FthzqGA2ZvNVh/H1msAOhqgsKpR7XdcBcwJNwlelKK
X-Gm-Gg: AYBFou3mMWGhOvLfpYVs0Rq1jqKxbe+mOJ/GgRQ//Z9HUFwtbHM/4hmJGpoR9UWYyd7
	38q5xX0aKChSHKzhFDaGN+6ID94BKi0HtUFtbQbP2rSVviUWUialqGQPdwrRGxd0yNtuAv0MAcZ
	VmGLqeS6LmG8OT5ZsDhJffFZO+9WKQd0nJ7OaxxMpllAUIwcUkl1Ni+kKOQtke+8RT5R//RODo9
	rE0EpaR/qqWgsHzQ5DN76BUNTaiikLO6l79eWYjS6MhXyjaKbAECvKbivOEXa4jLnj3kT5RURSX
	svF5FYmjaxR9JpkL2YrqHMHh9VAbl2paGuQTYumn0fh74trpAGxdFGdd3m3CMHhG6I25Wo64NyU
	U6k3T/C2isKREzk6ig3zBUnRxJZQayXvYq5Ko3ONjT9LQCXYr/Bd9gYIxEDNS3fdnTVfCaksBAN
	+B7mS+qq30LHpCyOTNDxNKZe1+rIwt4D5GAqauXKhoTYiA0HWN8hBhoCJUFrMzdfMpRB47Jx9aD
	WOIUlEOH9VvEUg6HH0aR5jEp32KkAkseh8rNWei7NgcnKZiPnVlYNqgUxnDpXRxOLckxbV7lK7D
	NYAotlAhZvByfz2oy3w//SkPTcymXWYkypS57HWqgvAUk2I/hOxrnYJmcV7B38u+zNZYBhWn5Qm
	1tlkqBpq5xLvtoOJWasVSJhqTetlq5DhzksSQJ0m6mgbDF8dBQ9T9g7zeHKPASZmm6LJHgLBkF0
	TdtsMxpLtjlVz213K7yu16oBh3cio6Bqj2QfKVN/ptxbRQUzbjfgBt
X-Received: by 2002:a05:6808:30a4:b0:53a:3533:10d7 with SMTP id 5614622812f47-56b96298e4bmr4442109b6e.14.1794446939678;
        Wed, 11 Nov 2026 17:28:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:07 -0700
Subject: [PATCH v3 28/58] mtd: rawnand: loongson: retain open-handle state
 on removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-28-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 741e19f351d1..7f8ea6819097 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -863,15 +863,20 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
@@ -890,9 +895,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, host);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +919,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +944,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

