Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296692;
	b=q6BNfUXy580vb3T6pZ4hywQLcUQa+NePGn0g8qqjc9n4J1CmgLhPdpWqnY8mHHflLcgL
	 sp9m3u3E2BlpjBvt10NPWkgKQSDj4vcc7gPHuewEpNKzHIS23M3Ot+QlMNPgEhZkYdB5i
	 ndi6x96luZqFGKHCl9q2IzO62YxElXQzr8LGdhmAjZYOADMcg389D1Jb1mr6+cVavp8F8
	 kd+66noixWSmTBpbB8gFBUeuPSZzSpT6gOMATpdqblA9e1EV+ChmUU3Ou4/nIiUcmXSlV
	 vOFdTyamhyH/Q6OHqQSINGTIdd3G+JzKtQ91qoP3LqGBUUyC6OY0htfw2vhs4p1azSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
	b=y8MRKzNukaXR3KwyGjPIxf5gHilWgCrrc8mDihJliShfjbRDJ7QLij4rgO8l5+PgSwxn
	 q8a+maWH+uUvhP95jpwJZbdf25OFgMxhh8nZXY73BeeRwXY1cDReaJYe6LvoRtgUMsGG3
	 LoPJANFbnYv6vFf4Fw0/pNEDjjhV0umMzLyOt0AT+OTRILI54ulqzNdmZVOq/c8+DNToy
	 OQFV3bVeXqC0Xv1Ku2iFe8dj4IYaexNN2IDXSQa+rHvUlk2bTlTXm63RmwjAD8FRvjy8S
	 Y5SQjX+/TeIfWj+vRK7A+II9DcezpwEDwy1cu6rMUzZnWig+8LdKAeDAzfpHU+9j3QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omrms+AZ;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FD606C61F
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543FD606C61F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omrms+AZ
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1392988b6e.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 23:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296691; x=1794901491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
        b=Omrms+AZUV6FVhb/wSHXJ6p0IGxEiqkzAXZu+LW5Xf57h1bEkTnQP58Do3WSfEdFqi
         pKGg4Vj2PCyJThCKx6MXeokDA1YaNQxMHu8ESWQFwiJifezWfVfIwbPGEss+hjlQPUie
         Nm5h5arqGKfHqNNeS2EnES3MAddApX0QkXGEKmM2XxeZv0sAtnrfWA2f2X9sO8ZUTyjw
         /8qmhSv/T0skd51e0gW8DSAtCZeZVLFV6aYqfqR69lxWgFKkprKXAbiwiVmdjK5BrkPP
         8TNT2xeYC9EVBJJpDgHwbpvJVEsCN+e/lSk6IpTDk3e5FcFLmXou7O627f74fhk22k9n
         zk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296691; x=1794901491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
        b=ipzJf7OkCKZBz4R49D1sUVmUDcNE+rUs7S8ztaljaogWO0z/hBOzwdZX3vXIGsi0yn
         FHug+z2ETchUmcjwRchiFtvd1ip+OHSNf0QQm9Cdn1Wfnr9te/79o6KYUcYdqrozBRKZ
         Rkt74HzQzJfyWuqZa6U0pR5zywEHmbb5tojVu6m7rJOpvTHAtEYm6itKXrTEGltccTyk
         oiCzEg+wj/26Pa37dR3zCo9Ur0JtItJifyXQOkgK+WmrNpOAEssgS5fjQxap7qfSYEM+
         KfZWjTclwItnT7+zu7u+r6wnncT3ov0DC8xQ1tftQ+Fr8xkgsmEFMaIlaUGFmYOagYg2
         C99g==
X-Forwarded-Encrypted: i=1; AL+hErEmJ7ejC3KFQbxZ86gxvUO29g/FMjRUn65BJDA7OozndqwtflcsCmn3fhi30okpAmT9qF2/8/HJq5Bm@vger.kernel.org
X-Gm-Message-State: APuU4Z+rtMG99vh4ZwXo6NLD8Wb5h6JNPO0rrt428xWHa6joyJXFj/ck
	vAiyz29zNSLbe3bfHKzo4c0cJtx3HLdGXVj30HOdoo64yf0oBgC1IGGT
X-Gm-Gg: AYBFou3L138o9A/UPLf9smmD/C9Yrtf8WsMgdiFYvu+6l7CI9hbHcHLezYKpWTWAQx2
	gtAqgPh+qtTePVNxGS+joewRRIgNnZHrFYrJbCNsUjH3rKTp8ZNbL1w8jwX8z3wJMB8uTloQWg0
	cjq5RT4qq9+ODOdkF5YQPSye3PG7NA74/FizlX7pBSMAxGUIbEfYqhpxZs5l/k2ozZHlw1SLePb
	EEIKNAwmU5amwxDPLpm+nJC3zwZgWxyZCjuCj2EWF/QQmeiTx+rzDmEcMH5Ns9dTJ2YYPSr3nMl
	VeGp2ZcxActhHOhMkcLqjK/JwvSsPCaNHYaojs9jYVd5EoB5+NHl3nLtQNIkC+ngpk6QpUCFByO
	nq+IjxibXzxJWOTz7JidSBgHWb0R8rWqPZ1xamRtZlMSbCL8tZte2LVAdhP/SCRjLOQQFJZi03T
	+8bderc1oxiBHs2ysQ8wHbMmcxaN1LB+tRKssLjb+lBYgUrtYJHFtRNCtZbuj+AZ5SGWo7zUaVf
	rKi6E7Hd6oifViCgWNBQKFU4udT+Da7oepdzdOxbuMumIslJylnYGDhO1c1idjxme+f1JbtxSg7
	Rt+alNXTwoSsHItExtuV4iY2+T0avG304wfyVbQxA5cwwlQO+puVARr5yrEjrCTrPPyvHgDGouu
	+TOQM95b4ebomPQZhcctH/fK2CQgX5Af61DbGn656rvUNA1jR7aqEhxXEoEzKAg8TzfFHHgh7OG
	C5y7Iqz6ela+SoXDnXCVQQlJ1Asy5DJGEChdiH59n+h81XWWXMIGDDJwLbqNJDEdElO2sxZaGB
X-Received: by 2002:a05:6808:1822:b0:496:976:acad with SMTP id 5614622812f47-56872834d04mr830298b6e.1.1794296691244;
        Mon, 09 Nov 2026 23:44:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:31 -0700
Subject: [PATCH v2 28/58] mtd: rawnand: loongson: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-28-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..49938c7b9453 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -869,15 +869,26 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
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
 
 	return 0;
 }
 
+static void loongson_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct loongson_nand_host, controller));
+}
+
 static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,9 +901,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, loongson_nand_release);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +925,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +950,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
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

