Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591272;
	b=xA1jJMsYoftnmZypKf+NOYZp4cUQs72NyIZg0S66a8rPIUwfVdaSrwfllw5cKNbZXPsU
	 IITw0Pp1akAYTt2EuB/TsOetG1ACzxj8GT52AwWpdj1UyrS6AXJWe+Sv8tod/rr2off3u
	 QL7xVS69xjp13XsTRanxB+gAL/UY5PXe3cU+ycDeoUpDdNE458IXgfJnJRRLoeITyKJSk
	 /rH6nCD7Il8BlIEjyNj1oKTC7r8hqXVj3KbtKC4yAxh7pEhf5Tvz6+C7eBRGKdEkFqE57
	 dt1C9NjhZV089mmAKNBeOAyCVLT8yFU0P/SrH7kjubUqaqLzSwwsy+ukNAWloBstMiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
	b=rL1GijdSJhY7EYBRvkM3zzkCcZbWRbZovf3+6uI0VQ7yYVXza3hUB31R9wnUQCTRv0ac
	 XkyiNbG6GupT0WE231QGm7jESbFOxDjDt9o6Ib7KCyNdpDAUzGVD7DXTx65dzFS1ZTbER
	 3A/yh47n6bgodvGHsWBzQtJA6HEXeBYxFvmZRPvOGhYMDFH6f7OKZU4WFRPb5v1AVZK/+
	 sf2l/VfiAvKWS98eWKOe+fEtCudjdddB+o2OzeetWyFvPaPPbVhdnwnEXSTru0gYIL0ls
	 zEC9XrD/vLS2t7fkxywk2XfEYi5Nd/Abe8/CB2cRJMePac1mUw7WVHobSK0suhlB03A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPnHiGbX;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4904606A32A
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4904606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPnHiGbX
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so8000464eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591270; x=1796196070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
        b=FPnHiGbXxeUnyli0qXq2Pb2ib64pxHSwBmx1w371Iji39oJ19lgGKXlbXdylMK2uoR
         8VX2tcDSf3kDIu9p8XNDOwV1DC73b8MJX7OSpUpTeB/H8C+F0CZ1pK4StHU9EZzuCVdp
         terW37IC+bCzZm3C37kUUWVNjZakquNrt8+SnZlbIPozpTy1U+bnG6+gbycH46Um+6zq
         M5FgejBLhTd69GTUr36tqr77p0QsTQ23zBfX7lX0EWuhTTROG/qKGFcsG26YT0aMtGOI
         TdYgOyQkIi1+2Bm4QWPdsCeQlduU+qvwJ2qmMLSku2GdffuAN4J1uf6IhgTS4/+nTE4s
         bifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591270; x=1796196070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
        b=pntfJ/jzv/iXzuPxUkMWD/8KY2ptV4iTzWTrothad/lEO1Qp30aLOI6O0z4VY+BzVH
         OBDrxoSXkO2qVKcVZasRP/YwuDiAFQfr7Xd1RbNqwpdJP5Pb2hXtw/xrLvAbNDJ/metd
         BqAQsiyB8RdtSY1h03Px1k3QVuD4gjeVZQ6OcnEdaTZdahxDiXtREQcdfR7B9BbJOTfS
         MiswTH5pRYFJ+QFBxNfvtN8kc/kQwgJ9+OIVstoR5vGPb9xVoNB63f+0g2YXu6EIllvZ
         aaPoYgHRXpPrUrR1rfwEoUqmvfTTKgyCLTlN/Rb/0Ml2E7oYLvm+5sA0C2Np1TOkXJag
         8LPA==
X-Forwarded-Encrypted: i=1; AL+hErH455sDlHlXyZxpCRkZT2VeDemKTWXa9GWTy2LFgYEbzcitua7FsH0QAZaake8G0S3pb4thy3bq+cht@vger.kernel.org
X-Gm-Message-State: APuU4Z+9VL8xS+lEux7mdQpHT+PHmKj9lPgZScIMi0J5oStlZMYbzs5R
	dSQ4xU3XpyfASI0VUflV5sohNKM/T2elDF5f1y3Q67Npv4+ye8JCnLcU
X-Gm-Gg: AZFdTZf3D0Pc5HS0tRP9Vu2vUr3nwkSOkxxckEGLV1abmBIUXGB/DGbJzLhLKdxuaVN
	JEzAm4uecLoMNs9Y+XElNzl0rDdGfLnE4P1l/BZr6u3f6rqsHCLtfMrIZdoThXm8Q3vzdBcg8e3
	74F2YI7dY78463XhuFGwm+ZG23KeC3tg6IHKv/WMJzZHE1Tc/AFV/SikiBwGcU6luAPQrvUyEgd
	TwOhRuNkusSZuLcOHANHlKrTB4qCZuVkOP2UUDM+Z7RiUSYY0yNEfIfBdfO77PwOe/p7CTiaMGI
	Aym+KnIfAZ2oNqZPjNvbgKw/MWf5shBuAHZMKcrN09UdKD7K14//ea7okU94pgkMqHaCjdZ+aJ0
	N7oZabUnpLL4/AsIJhBiU2b2/ATZN01aspU1UeGnxh5nov1lhQ295iL6vkz/5rmCQnPCd1VH/LP
	5L+Wh8ZoQbaw67KGfhu/EdL18OSNW7QvlSbMA17b7jS6TfEvFHBWojmelbj5UK+JNZ6nt3ngPaN
	xphPtExgM+pbMfDRLhilX8o74aG038nnVCTwfBADEfxa3mcXW5MEftzVHxoYFCi48USA7BStcQs
	Qn26NypWpRqXZVEBzS5+PgzBoe3P32cwdhuS4UcABVYfeLF1GvPVlzES+qrgojvgckYm6HThQ1Y
	Tz8zsG3NQlvY=
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr18522481eec.19.1795591269843;
        Tue, 24 Nov 2026 23:21:09 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:09 -0800 (PST)
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
Subject: [PATCH 11/12] rtc: pcf85063: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:25 +0900
Message-Id: <20261125072026.2997493-12-prasanth.r@lineo.co.jp>
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
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 05cb3a56ee8c ("rtc: pcf85063: add alarm support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-pcf85063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 819648619..909c96e5e 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -704,8 +704,8 @@ static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 		} else {
 			set_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85063->rtc->features);
 			set_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
-			device_init_wakeup(dev, true);
-			err = dev_pm_set_wake_irq(dev, irq);
+			devm_device_init_wakeup(dev);
+			err = devm_pm_set_wake_irq(dev, irq);
 			if (err)
 				dev_err(&pcf85063->rtc->dev,
 					"failed to enable irq wake\n");
-- 
2.43.0

