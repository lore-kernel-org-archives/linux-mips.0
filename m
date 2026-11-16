Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810622;
	b=hYyqIDvpVMV36bwt3SCIJ+VOfVrKLM6vhHbMWeKW1sv1++Q4JVzkdpJV0UrbUkd/3EXs
	 OhUjKo4FCpHL0TXULAfO/D1QHYqG9j+TT3f1n2J7oIdd/tE/VPlI/+n13dkRyVeekCloW
	 9uw+xKsNxcttO4pz0DfY+4Ma8mx1I6IIkHoJ/66mUTAFGeQfPgaHh+bDxQK1A/e1BlQzk
	 sHn5ONedUJPbdOTSMFCLTIEtkyybVgJDao1+iGOCMifmRc0Eek63Geb3XsoCk6WTO4Skl
	 hAcCwIwJAT14Zf+I4wCf9IdCdUZc/gCAQ31LQ4mD5x6cesPNpLBxE9LtU/gNimvXh5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
	b=I4wOxjiww46HHHZUejcUargUhgntrL/KXDgVBT8ZiGIYwFVIpM1KkAk5uIw4BoKhNb9F
	 smIodeAv8SChCxeOcRKX83UtVDTVrQWzSYN/CkgcrqxfLtgs1Xlr9KY8iMG2TI3U999t5
	 wVMlzXOt0X6JUo91dTq9TQEOlG1SUOzmhDNcJTXsmRHMJBvLj6SAGq/u/pq7uJXzFbLux
	 2kbk+h3EHK+maVIdZ+Xyjf3sL9TBatJc+cIezzk4sscBIB32ORFLHR3cDzfRHkiLzdplu
	 kvjqaGJWP8YI4+S7Jvh3GPwesK0T7xBugzLsTY2/g083zZglyekJfPQOsYU0NCwh38w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXVmQ4Ap;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE91606A8AC
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 06:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE91606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXVmQ4Ap
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71ab5e64742so2622409eaf.3
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 22:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810621; x=1795415421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=uXVmQ4ApAfAcgEHVt0ijlfUmzMggAjlkZcFJqfX9sf5gh8ylXLW6lD4fJIALwwObJs
         1bXkKgMQ8IwnOR6SpZBXQBuMIgWgZ8Tf13fTpY9y2+ItPhRWqLYcP3wX+iBuVNFStZEz
         9GFimPX21BCsZDq42lGZPXjF59CzPij8VHQiDJU7yz7cu+SS7ddGSDWi6zQvIDdaDYEu
         5BjquE02YHvbC7QFz7Zxr65lhlD/HvBmdy3Yf5iZxwuPaPGWy35bDPV/cUWTcsWXmhMn
         pUfF+2ShzVjsEFpR4A6kKgCuDjFkJnVJW2gErgcRD8CK8FL+sVahTqhvwrPpdauILgYl
         sOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810621; x=1795415421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=eRHviqdoPEx86btTtPvk72NA4gZGzd1VUrX/bQ7HNrVxgu2lk5+ZSvTs+Eu2fJPy0T
         yLjG90ItZnlkOLL+VZOLCbjz3r8aCAhpUvjr7ImB2okmS+UexRo1B7snVfpObQc/oqTt
         uH45V+jONviTDOLzlGpnO3BUORRo2imRd10m+Y6nGp0PqvTmcbDKmL37e4I3GpgPigBP
         uQx5Myxtx5GC7bnhXUmCUXUioBMLSAHHskrclFPBn/GI5Qj1uNzQNIm3nOCTp61fTjno
         K7QFOn7GqQV/bpxh8wwQQgtsU2qHnxTYEiPn30uMOHAS0R42fX/Z/T2/XjQEm7v2uDtn
         7xcg==
X-Forwarded-Encrypted: i=1; AL+hErF+QZuf3fgU7Yawm1xsKi/VrQt7FTVzl/wj9kBDHIa8FD1SzHe5xiMkizPa+ngMwZTzbWEkmz+SpXFS@vger.kernel.org
X-Gm-Message-State: APuU4Z/GHs703c+oUuZob09gKMP/6z6MFioqTe1b7+ok1jWI5g83x/g/
	mx9X4W+98VwrBmxH0RiPMMyrK5oGjgh2M1qpMlkmDapsliJlf4C4Ikp+
X-Gm-Gg: AYBFou0HBDWEX/hpK6rZCmkonAAathlhLurbrzS+xUO0nGX3fqmcqOKpzTbCLyRx2D5
	bhonQXZL7cn6k7ce2NXv5g8u4QakMpCaXYFxaLaKnIRAihoiKQXd7nGdbX4FspUI1AP9vyc66jh
	VvuliO+eVk6lOIwjgsZ1MTKADGVihia5vd62PWWHDi3T5vmZLi4W0F8h0xxjRuPzLMai8uigtFP
	exQnZKjqJqWleRXFTEGfzyF+ub3y9umwK9LFAWePoCnkL5XHmq44SJHL/Hei7dQzic09v+HGfjg
	KSvGCpcOLEzYvA3W6r2btMoAGtTgsbRO+H+jqQrOzwPXly8RtekMRQx/0uW4bUNAnovtLnFQetA
	epyeP8/Rd8C5NaAsweirc9jtSu6x3LbcHZQWlbTMKpBRfuAp6ExUIZzTY7qjcgAp6UcwA4GXaXc
	0dB0jid/mQ/BiYO7zpbrwZeW7oVsVKCsbKBZKeGR5Udjnc4NYBzBjRZrzs0ZkPE6XH9YEdxC+3b
	WZuqJ2QwJ70lwUkAoH0cfjof2hGa3c6DI/ZTnm8Flqv/VGtwkgT1FGq8iHBQ+C4usiVFo3Q+pYC
	Pq/hkILb9oHbevNEaBtqdXl0Baf1ZDFkCHdXS1RV6crg36gu18e+VeOdIAtaw+9NAMgHvV8d47N
	LXw4EdvvisG6VcrGjlrqT8IpGxZaKhMEmeG99ShkuZdG6xS69FSW/W5xmV9RwwSgCqsfVpNZoni
	ou1aonBbYILrAzKPySm2QV5yEmRddBfmYPXW08a9XReQLusYaw4io=
X-Received: by 2002:a05:6820:2206:b0:70d:7738:4089 with SMTP id 006d021491bc7-71ab4cf7a6cmr6644456eaf.12.1794810620675;
        Sun, 15 Nov 2026 22:30:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:43 -0700
Subject: [PATCH v5 28/58] mtd: rawnand: loongson: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-28-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.17-dev

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

