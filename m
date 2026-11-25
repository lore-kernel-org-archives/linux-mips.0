Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591266;
	b=XcH/JZd+tRa2/hNJNovCZR71P0Vxfg/uomKYONiundkklp27khsIcJPnq7aWqLpRCMjZ
	 IP0gVR1QFvgQ4GRjZBUCZ1huKBntMhdxA0iy207mBg7x+zUj/98Zhbjsogi6S+AAz/dgO
	 wFt7+g8KIvHC7et8rKVlKjBB6bX7AV8ml3CAs4JTkZ+DJ3wJdROTxgUaUG77KF6npNn1F
	 AmhxRkXNjeac15XiKsFcYI0bW1HZJM8RSUz/ahf0zfIyvJuAYEVS/hn284W4QI8SRTQm+
	 EUZa8Di5U66g/DWOqyWGtmRxfGp/4X+0n4Qr7vHKrs+hNWFGZZT11gULFgkyeCT9GGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
	b=FPPqJpIGuvMeiMG2463af9EuyidpYquF0OXydg1MdK9UaiSYXyCjUNIs6n3UpUKLY1rs
	 w35tFczMSI24ounu0cJBVchSyeTHLDkJdDa+Pt9sLPRXktrYPp+iXfZtl3h6hkBmcqak8
	 3JtXU/dWwrNXcTTBv9onmpaAn5C545GpPPxF7tiHUFEoqEQ0IvWl5+MSPsDhgDaWUs8LT
	 1rp/P8HX7fpJScrQ3iIMtTg7ilDNNWfnCZbRydTv6/3a6ftP2+CaQRiCDDZxyjDOobB6/
	 //Vp69n1aaugS9GkoFFyyqSCKlLzCYadXfbFdS4qWHmeF9XiPEqk7t3CqxAOP9np0Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+7wZ+uR;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5C606A331
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D5C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+7wZ+uR
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11668149eec.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591264; x=1796196064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
        b=l+7wZ+uRMU5L9Y3iw9iR0vQ56PzFuAqOTVajti9f8T0P497l3uY0X71+HyaoHNJYlj
         ysqt3L/0+JFPMTmsBmKlRs+RvJZm2a9d/Tymcfm9lP0TMCSobeI7oVrlrSnMbHAelVen
         ENqoJLFmcOqPNac5Bd1+auEf/pAGwDXNq/DOJhAitri/XoFUEZoaulRMMZYqWCd8x/uu
         hhoa7kUOPRrwrurg9g5TkSeYVCfF9pyKV8VQldFLqwrNTT9cnwagOa/ySt9Amlz3ickV
         w2QcGokSWaEbB7cmsX1oNu2Js5qW3hfv8BK2+bKCDIhfcBDhVIujIvFzKwcT2fRAJE4w
         bwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591264; x=1796196064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
        b=bmr77bBVvqWXEFkjWNbhFIkzX0SNSF1ifzcVjbQbrXfG4VdB5eXYqyUM7r/mlOISwo
         OzfWhpMR0pRo9OSyt/LyfsjDquV0aCOtK1WSONP29mXeMaf7c0Sdpx3A1u9+MevP9CUS
         a8x3zHct12o0v719KYuwl6sGevZk50B70H2x1HnZqGM97OT3FEBKie2gSBihRxsFc3R6
         kVjnZCjTimxqs0yyEIMuD8mVO2VrxjOh7idTIiGCxHdVIqCbXqXiBE9OAjjYOHR4wwmE
         Bu+kzbzX1S1dCEAxRO/6AHxsCfxx2M+fWCFj+0T/bdnwx4YAj/y2wjP/UjMaC2r2yw7p
         fjiA==
X-Forwarded-Encrypted: i=1; AL+hErHC+NKo6ZLAMXZNCtWGOgmE6nuP3GND4uDMHDrwhn+wBJotDll23izDgrk9G8tk2RT/oX6DZOoD32nV@vger.kernel.org
X-Gm-Message-State: APuU4Z8dpgNJp6o73pqqlft8CClNrC6coyBaDAe7GU2SRR0NiYHefzle
	ZlQWTotQVuKw+/v+HhUfKybnNrkNtL8T5++NdiksDZteuNk3hWh9cAYT
X-Gm-Gg: AZFdTZcoG2TIssuKFjhIT7Xa8D+oYlT0+jme3w2/IvPKZ9OKm2IidRDwWuAkcER9pG1
	zkNBhJD3ZfMwwIfWDZzcLCYtaZRmbrTYObelr4z9i5BBR/m35/poqTPc8kY7d3CyTARAxlLYbfG
	J1NDjeG5xNTHnbR0NUP+vE2IRhULJxbmdGjr+bJBC98rpsR1OwrMpHzeqFO2qOgM93uRCNxdUAi
	bEl0eFcGf6zBTnv4O5kyfswEBpnz+JPq2R9uYPPXuf+n5kh94YMNh2USFTKTQBCLEp3G76ec9dd
	YCjf9J05UmOhkxkqADG+FxNOVRHq/wHkbZZNLqo7+0BUA5ycGXaDO1HtU7Vp5oJc71VU5ULlyjw
	k2xfTOEaKHAvaX/cClgjXfRCZHsrWUpOqCwDPhncg7jqPkGvNVApsiyESu8sDP+W95CxYmdAmyN
	cb0V0Z8f54wA86wev1WBp4acGMsMv4cEQCdj4sgDZZqIw3+lkKECeyWVVPMFAocSDhZMI+3puvF
	w8harGejI2CScPjR3UqQJsLvUPSKMo4wj682pm1iTCjCZjmPvpe7FupjCckIc8uxQBrzG/hFUsK
	E2EVs6GvTrQcN2KPzV59c8Yo/hTaaTHVMuCqD1ZbA1XrPF4JsxH57L0dUYVNiTys
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id 5a478bee46e88-386a9158dcamr12709277eec.27.1795591264064;
        Tue, 24 Nov 2026 23:21:04 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:03 -0800 (PST)
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
Subject: [PATCH 09/12] rtc: atcrtc100: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:23 +0900
Message-Id: <20261125072026.2997493-10-prasanth.r@lineo.co.jp>
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
IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
fails with "Failed to set wake IRQ" and the RTC cannot be bound again.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-atcrtc100.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
index 25183331a..2c78192db 100644
--- a/drivers/rtc/rtc-atcrtc100.c
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -318,17 +318,15 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to allocate RTC device\n");
 
 	set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
-	ret = device_init_wakeup(&pdev->dev, true);
+	ret = devm_device_init_wakeup(&pdev->dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to initialize wake capability\n");
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
-	if (ret) {
-		device_init_wakeup(&pdev->dev, false);
+	ret = devm_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
+	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to set wake IRQ\n");
-	}
 
 	atcrtc_dev->rtc_dev->ops = &rtc_ops;
 
-- 
2.43.0

