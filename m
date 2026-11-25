Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591273;
	b=r/SkdxlW5VaKZxaviTrD5LGAzPaAcxpPytIeJOxjRS16JUac7zC0BgaOTo0jsENrGxG8
	 M+vdZ5EiZ5Tw6XvUidnNlKlpDXVizGDB2s0M55uvsQ4vR6czdW4Ua/PrgpFwYo/WQBvVb
	 IX0DJOkgX2I0Fs2IFfYdMGgaSla7O/JmDFchzX23nVZjafTe+oxWF/b/ReQCf2A9rZ5Aj
	 wu0OXctcAoIKpx7WYutquldxd17KsOG21emrKZo2yGerfDmWsvctJuz5jhRmO4FEQXdRD
	 4wSfd/PIAO0ymccaLgB8szI66kxDtHYedw2UK2h0IjMnWufDTVrAvu6xD4V5tac4Sig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
	b=WGTZPfZGiRj7vxCLQ3hVyr87noWvlzxMS0RSuHbMyP4Af8TA/lA5Imq77I9Fh1z85sCR
	 vxsqTACeWICt/uFAaWt5F4w1DXv/g8yClsaFdtrmK0Wvob4EM6Q2xil86bexZZp5RFcnS
	 T7xNWnOnoM5djjnZZb32KR4pRYzEBK8PKnjvVGHMXj97+cJzDTJyuLx/2ZzriOh14eHjs
	 DuivCURuhfpDBdBP+m0vD1Zc3raf0Na9vLywkYSlqpkAVluEfRQ83VdlRK9qHRjgy9oh8
	 H/qVk7u7F+QZelV7VX9EQORB85PnEoJ79bCgThoh6Jz26pGfHQDPMhcDN6Bz8x7JmIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvlzmq0J;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF2606A329
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAF2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvlzmq0J
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38644aedba1so8322071eec.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591273; x=1796196073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
        b=zvlzmq0JNRMXODOQ6bRMsc1ufObKLRC6fNoaiRRx17W/nAwJ8ADIQ0uKyr6gvX9JFz
         m6gr1/uYcXgDGvUckNyp9lBTJzAWaidG0ZC6dMzAKqfwI4V3m3vztqALvmEWtVxVr0rg
         TYVA/PKiXaRL4uAwh3b6Kx3wq7pKq37/UYCIulPnhPymM+wdD7jUTIWEFkXFarYe+LVa
         +3HR+JmEEy0q7fp0a0caTsjfERsEoXcUc9ogr5Nt9vzJh6tZHkA49CMrOUS1hMshNiVB
         H325aAxrN77sQ3lDk74FDht/k98on8uKDEGh0gfxA7hWH1U+Jvi0UGFjeXgbj5cE23QY
         h7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591273; x=1796196073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
        b=x3WtHaPdBMVJc9Wx39RW6wm/ue46iLmMvBSheR7HXZZXXHvaRWNzUT0ItMIGVfLKW5
         1QKLuJb2uVzq1uyAVTtIiDfhTupxpG7OF9NF68f8IPOL0YWe+m2jP2OpCyWgXczFWyC2
         0nwBGG/0JJw/JHD/Z/359plYZizUhkzZwsLIFIfvkN5uTg6rwlzfIdKfePOMVOWP5L4I
         vMPFtkRsPwcEFFccvegoZOgb3rz0psHmW/6/5H8Jgf48yIk4eJjcs7OFTToIrtZwTtjr
         bgYV75siyZbTlQlneZi/eEMJIGCyL60RYg55v807rBwYRsHErA4ej8YgOWOi+TLU06rn
         1rYQ==
X-Forwarded-Encrypted: i=1; AL+hErHEJEn8nguRCt2V4t2vbHzR29G+vGsAqp/E8abZxzoBZ779HM1NQNM4cjGO3Ut0smU+RwKUJ4Tiwke/@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ycX9bO0mfNXleIkE1W1JxMypC2bmJWGIdobTVQyZ3wgYjSiz
	IvGx/7qy8oj7iUvwzUyMC20XTt13CpUjnBL2vLE4orMI9IaY0LUKpfw9
X-Gm-Gg: AZFdTZfrkPfiNu6Y2hV3/JSI5gDi8F7J/7D63b75TeAQR0h3qK3Op7EMZsEcS4NWneH
	2J3oRiL8+Fmu/MveuAP5VHxH/5I2uA7uAIsRfFme/6w38zLzrff3eiccY5fU0LjcM6ktqfor0Hs
	W4h6o8poqZtnzx4jFtbHD1WUoLzUymqgagDB03Pwvec8qvSU4bHFQjPkaFV4OQ6EEYp0URGKmGG
	hGG0CJL5jrzu51dZLeC1NyJQGrh2bmCzQcCHIE/ORtcel1CtZ03bMQQjHA6ZUaA4CWPoDRtT9qZ
	blSTJj2ywYm6suxSSUIX4uGSkUx2Pyzvd6Mh7nCzya4V+tkX8lF+bQ4ZvmGkCWg0ZQ0gFnX0X8T
	IeAxItWpgpnQIbNiaG0LIG5l8eXktjIQqrPlzR9QAWVMmWDcXh0G69J2i9YlMn9romr1BdK19RY
	62vAvFZkmPtzmVpGktQXzx7L+Fk5KdiN4HkRgNunm4+k2k9ukC7YpBg7AEs8k+3Z9vmaAYCv34+
	mWrpGBFCzTQrm6StirZCcPUcl/eDv7lsOnouxJ/kOPJvdKQQAmls8APfgyTQzWIUeE/MXL7fblP
	3qX9BV9+Yd0+Jl3qpK7pR+zk0ZW2Os9uGWp4X7ccmE05XNtVgN6VN6708/i/Yx2c
X-Received: by 2002:a05:7300:fb97:b0:381:6ac8:ef2e with SMTP id 5a478bee46e88-3856ff5db0bmr24055433eec.25.1795591272607;
        Tue, 24 Nov 2026 23:21:12 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:12 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 12/12] rtc: rv8803: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:26 +0900
Message-Id: <20261125072026.2997493-13-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver prints "failed to set wake IRQ".

Use the device-managed variants so both are released on unbind, also for
the wakeup-source case without an IRQ.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 2f80de657f83 ("rtc: rv8803: Add power management support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-rv8803.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 7445c8151..9dbbaffcd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -700,14 +700,14 @@ static int rv8803_probe(struct i2c_client *client)
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
 		} else {
-			device_init_wakeup(&client->dev, true);
-			err = dev_pm_set_wake_irq(&client->dev, client->irq);
+			devm_device_init_wakeup(&client->dev);
+			err = devm_pm_set_wake_irq(&client->dev, client->irq);
 			if (err)
 				dev_err(&client->dev, "failed to set wake IRQ\n");
 		}
 	} else {
 		if (device_property_read_bool(&client->dev, "wakeup-source"))
-			device_init_wakeup(&client->dev, true);
+			devm_device_init_wakeup(&client->dev);
 		else
 			clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 	}
-- 
2.43.0

