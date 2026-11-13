Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593752;
	b=BMC9OFzuYRXvEXQSPkrx3f5ENBplV682JK85Al3A1wXIYv36XwqQqQv6YDjTsCI7VFlL
	 3IqCUOoYNGtUlluzs08yFLIlSa1XauyH692mKYusmOFZq2QGz8RzArJqHWiOPz3zAPM9N
	 deblwAiYtNuZ2gj3f+v/0xD1TbaZdcyz4p9y5Hrw3mcrX/ugn+iTGzrDNYfJYY5Z0Kqvk
	 iJJK2zwJdOwaMPEp2Ki0XMWn5uz5bfVxcsmV0DER9vbwQ1iuc9UYvNhhr9Rwg/fRzbudO
	 wzHKd27nBtQQuKNLxT/wLApw2YX6w7E9VjHwkzkGeXipCHnGvjnEq0tIX4pFgx/jZrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
	b=xaVh7sJVcMbPbH0k6ZFpgvQXbdLL5wb1omNoWeo1qsPA/XAc0Uu5EbbpnchcIP1AQLCe
	 XZ7uLve5YVUN0s40CtR0j61fdikbpoukefqvLrgH/wTZUex2OeQ8uuhLSkZj9HSPAlWYR
	 scLWCZVZeplk5GnaDwib3JuCc8PE0DJaCagBejk3ONaXGerMulbONXJ8boE5PX/dGhTr/
	 eVHk2djIP5MZNd7aRvkZXXcDDB2MjmToFADU7JnBCf8hNdn1eZJpFHr0+5NLVAtMhCHm0
	 w+/QAUK9m3pgEde+5nYZu47BkP7vyvwxEGVM5a+Qtm6SOLvD4tEGP1zIEcVc5mwoKfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BX0KNpZX;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D6C606A33E
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D6C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BX0KNpZX
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-84e513874f8so1712443a34.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593751; x=1795198551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=BX0KNpZXu5gvFyIqHEONdiBMO3i5LnsepwB+T4fCOFBBeON4ATe5MMlyPc+XiYG8Rj
         y56+Zk9uDemaqhxzugpKR+WX+0ypkfmSpCqEOk48ceXFpSVFzCP+7JZfSJAmZl0fHC4F
         bW1SYrrS6rPhNbfaVgPKya4zUDmPbP73+Ur1or+pGCA39nRwbaVBFH7hDrnW5ZkTlz8l
         LzzKDNp2N7bdQrSqoMmwcl2Q0nvrgzw1dbh5Hb6c3DN/QJRYPl0/qiILfiU5TE1MJEDB
         7y/P3CUi6F3FXg7nYF9At6D6S+TPiOQ6RYf/3Gx1C3Yu5isarqjQXNN1ZBReJdDF1O3o
         osTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593751; x=1795198551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=m384ankv+0AGoUJA49bvX2tzWDo+31u0QF6CJSJ52Y2d1Wq6s23wR7WpSjZALYFXTY
         87tDj6wxLv/jBTIJM2I2YJsJq1+s3BcIKG0R2GJUSXPzgdsgJ+ofPUwHypwUheC0DBRF
         GzUfbLUpvBSsMzw4NtuwZ8zC4GugMZSPtqyJ07vfxM4tNs4R7KsFw2k1uah5YXac6v6B
         cAx64zW686yOsPEeD9iGWEVUjZYR5NOjjFXAvWU2RoMKo/y/tfhffXcmqDlhXUZyT7B4
         LcEvMUnuvuUNmgiWIS+VNoFTqt9mt4i3yazd6vYFnXd94J6Hk5URk/IAoRg6zYKN30/U
         Ry1A==
X-Forwarded-Encrypted: i=1; AL+hErGOBbZQJjzRj46/EtA+ONrTEU04HcVebvTCAioydBNLYLwQaY10JAvsonHsIhBhODavMSK0oNx4u3nI@vger.kernel.org
X-Gm-Message-State: APuU4Z/SJBEYId7m/RiGLYWDjq2DsU8sTO7l5NvoBq+FTxeng9Qlb/V5
	ZUVWmBntrenLR27Wug0boZRR6efPyNqYOJVgKgx42aZhfKyoW3DzBC4t
X-Gm-Gg: AYBFou3+W/QFu6SYgJ93VvzDqZwuzzpiiQZCYk9+9pLBNd/QbpkuBPEFtPPkIgIoRqS
	019xoJNH+6sZzfbCuqk3amyajTjqTxcC/ElEEQM2UXq8yEBGyWTt89eiLhaA1ng6jOg0VQXZyUP
	bGIFmnUUBpABKX6uMLxzJc8OEiXjhdewerslDxSNHjVwvk3HrelsuFKWKAU3f3ORU5YgTq4kyh5
	isX2SOMDVyl+ZH8zOMQAp4IFnh7xH9cLr+o8QTQlAfrMOdw5OgZlBU3JBlaJZDNFnNpLUj15j5z
	VwApEsPzd7QtRFJceaa1c1f4Igk497ZDTM+kECy6os2KvoRMgUoFlq14t7R3zb8KPCwX5bp9hNr
	ajo+TKl+K7+L/h/go2rZnCePNRqogWZbYVVn3buL31HEpurQoZbbjZBzurFyiHT7XS/etkFyGfy
	kgObI6TTYjALyY5vT/ADFjvOxUco8KPtOlFUbSheGb/YCyNtF7rQsUpGD86tVbvvSegPeupKGrE
	sYtQWnHPZo/jz2epkTQo9J3JeIAjM8lf1eaTINFbvsNRSk+3+nvSAE1+uPX44HFzXUmgfaPUtqH
	eTOLBubjAXjRxQWDXXkEiHagT9RYRwDdLuQ17xOvaP3n/eNRI/+NXBXkGAK50o4ZlqMhf4d6iN5
	grbCpeJFX9aQ95cZNgUcyIIweeeCAp9/hovwsToT44Yyx6KYTCQ0rNrW1Hz06UWXwWIxHJt6YQ7
	HrUS/M26IccINWjDuQYkcAB/XnFohtnjbB4fuoiu+pmN1CvNAoSns=
X-Received: by 2002:a05:6830:91e:b0:80c:d30f:97a with SMTP id 46e09a7af769-862899671f6mr3587981a34.27.1794593750625;
        Fri, 13 Nov 2026 10:15:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:44 -0700
Subject: [PATCH v4 28/58] mtd: rawnand: loongson: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-28-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

