Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591257;
	b=pTPSLy6dQqMEmChj/k4KehrVxRwx31zqlvntcwGjTWmLrxwp8QYOlRItO/IiWHoDF8NF
	 pyQxLNyhFCio5sYL+bx8dfVq90D4ihwtmI0uS9qIsZuhidUUlgETshSsQvHBo2sCknVaG
	 ClLqGhMZzKGjSkeZUntUiOIMTT5wP6+oyo/fR0PLXSC0EAYeBoJRP8P/mTLjSj0KW0aA3
	 YSG9dz0rLOEn0UrpfcECVPCEBZ4SDKoKA9fs13iTCjWNngj9WJjd3uI6oYxurPzmM4kbO
	 qcTo5ef42Ck7lf1+WajE7RyfcWOfQNdgL0Ah96dL74MB1vHFv+e5xqL/6ibCYAhae3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
	b=5h8vhNnYutOCg0faonC5Tp8fjH1GhAir7P2iXYwwA/trms2Q4LTwCJ3CT3ElTIBNrhq8
	 W640c1Hq6p5X77z0zUedkZ4gvTffx7jZTYgcwOdYFe+Dq38LnNSlZ10t4Wv41GMnLgZQV
	 aBVjcAeZwbTvzAujQKRebSEvvPVGdAVZcPYLlU9l7V9oiMZylvZls0eZuvC5gqcJSFxhR
	 1ZOXjT1vfRDBJPfZOktvmf7ZQ97u4NZQ+xqTsVyHwcsdxHKgsLp56194OzhZwss9aU//6
	 wZUgDrBjm9iol9xAkVBIpM5HcqY+ElD0GFqVxzb+nJ22xpgR+ofXFW9mDP73AYzmRxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ahpok24z;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA3C606A326
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA3C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ahpok24z
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38699cf08dfso6316338eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591256; x=1796196056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
        b=Ahpok24zDsEbOXQNlKYHt4yBPV5GdRQ85vl6VNMfx/o9L6WxDsTTxJB+jcDM/wOE5O
         9nGCTbsDrHtVeElZCf5yRibej2DJPipcwK0NWJqsjRZeck8kDNTAqRZguAP7KTVPeT0v
         3B5dgdECX0KZUdcDavgnn7KSfLZ6l31HeMWPOjuoaSdnlFYXl6/ay3EHkPuggXSy6WKv
         qfrdcYvt3zpc5FVAV8JHOooOuIx1V+iMxfThLJODz7zZfBX7rGBzFs/zy0Jbu8kxdCjp
         svXrRF4yLEkdJwUVfOMo9Qhg2gNcPH9RcyJsbBiGZj23SSM0Avu4oegJGIcoaT/O6BCa
         6dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591256; x=1796196056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
        b=koDEsC5RklvoubkoSW1rIi5lasPqsDZk/IcOEyZP0MKTKaJMvuOTKC6xBPyoYqAX3+
         FhsgLF1Iq5QQnIuJEr4OxbgZ6b2TkcMb7ep333fifo9drih0JYlzl2fbOnH0vuJMY94i
         DXk9fTT59sFsIQTUEGWeE0HnUoVaBfX53IcBhRZC8ZA+FipxjMVu0J1s35WYO1scDZZI
         rREXJ2aYY97EuWrg4FnAkMTGxQ8BqjLFGtbGRMQpYlUzHKsvsc44DgkwxBGtqgNLa+PG
         Aq2KUw4q8zvgx6piwFS6ovkRERXEZOaG3Lq9Uq4PvEhGd4bIRsIGh5ax2P2EZzgqUM1e
         fvRQ==
X-Forwarded-Encrypted: i=1; AL+hErHnxkL27lUi7OWSbezP020+A0gbrhjGZdjg7U6n5cQezVdJ61PhRTF3YhyLQzZDPsJ0td/AyORv4R/x@vger.kernel.org
X-Gm-Message-State: APuU4Z+qimMlSisWZUSv639rq0s4HBFAf8Z52Ff8mdl8hMgE+Vt95/qX
	n8nbyGaRmf00SB6CYQ4daKHb91iailxIOxi0gkCD4Ih4X9Dm29mKfBb3
X-Gm-Gg: AZFdTZearhRmh9q3oCsabn+XAFFDtBEEDfUUJ4OXjsuUF3bbmzt5zxLqKV+zlacPpfT
	yk3SvmuAlzHjwihKCS33/v1ejFZdZC4sXEtpdXBBy8gwrKvOz4ieeKtUrUa/rzldwL+ERdfL36U
	4l0if/fP5ndkGTkhiJHUXjpp+MqbD7baIpoevKSPR3xWL0qNMf7SR6XZ4Fc7gdIMJSIk4Uxq99d
	TwS4UbxTtxfeuYyJRz5Yt6hz0SFKts8cTkJyThklYAZlb33cLjNzopEEzF9sdIPSTfh3eFEv0Tq
	DGpcyXOMMcbEg74JfmwqydJlpm4F6B0GTptIGl3iVyOwfc24x5VsVbnySaeUb8HOBwVl5BeDfs0
	598SOdKDQtwNTcBhOofciKezUV3yk0XUJqqIcR+p1m4yYXLzzUMCnjj70JEZa6V1Hsk0uILFbKG
	6fqwz28WomUeRPSW0C6OvtBNB0m1E0lUTeKbzaEt4hVlGVuHK8c8XKilruJrA29nqyYPcnibmEN
	c6X1j2QppMa3t/AGS2/diGgzO3scyV3nG1O/vZBCyukJJ5PKzKSixsxNj6r9WxR3HLcMH5JHp2p
	/aie0o5d03Hi/6dm1Qso5iU2PwMLDy//mEuQGB+3WJePm8Q6WZBFbwOPAnIsp82J
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id 5a478bee46e88-386a3fe48d9mr12442112eec.4.1795591256101;
        Tue, 24 Nov 2026 23:20:56 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:55 -0800 (PST)
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
Subject: [PATCH 06/12] rtc: da9063: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:20 +0900
Message-Id: <20261125072026.2997493-7-prasanth.r@lineo.co.jp>
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
driver warns that it failed to set the wake IRQ.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: ed17a2bcbb75 ("rtc: da9063: Mark the alarm IRQ as a wake IRQ")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-da9063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index b56b9d9cb..2bb32156d 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -466,13 +466,13 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 				"Failed to request ALARM IRQ %d: %d\n",
 				irq_alarm, ret);
 
-		ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
+		ret = devm_pm_set_wake_irq(&pdev->dev, irq_alarm);
 		if (ret)
 			dev_warn(&pdev->dev,
 				 "Failed to set IRQ %d as a wake IRQ: %d\n",
 				 irq_alarm, ret);
 
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 	}  else if (irq_alarm != -ENXIO) {
 		return irq_alarm;
 	} else {
-- 
2.43.0

