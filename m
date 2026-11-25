Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591252;
	b=rDTeIhid77+RpE5wF+niUdZPcwVb1rAOiHMmGg7ceXYh/QCV17gUsiWsSAAsrsxzugTw
	 qiGctIJxV9sOfSSXQztu8TtyaytEyHTUoeLW1EtYJsJ9yg8D61UEwM2wsNurPA8Hk+EHc
	 vPLch7FierAhQA1Gt+qDryBgXaXTPWLf0Wk92PELQ9MeYE8hsOnDHXFrrwUYUZk2poGzN
	 u4Zln3djEkdD493ey4LdozJCCq+ctCWkME0kIF7GDl7jbULWktgtbUZxKQUyJzeG1R+yD
	 bDdcW0jP6HrB3XFFZZiThDyBEmpN+8CE3OshiGBigr/4SflWt18/LMNSRdrICX8XCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
	b=IQ8ZGn+i4W87YCKICxfRuIMbSLJSYueC2m+7U8fU6O4DxFK9zfTp0zPnTs0ynVxwJhiI
	 qP3fI+4in3ez1dpUcsjqy1FWhKwyy2x3CeNCCeBcgpPy8Y1y/HUx6RDq1wUobUan+b/k0
	 y0M9jdTOco05LBpwV4X3wLSGZ0yQtCZ2PZzpPlMtMcEpAQ4xkELBeLJhWbs38LjZTamhl
	 T+YNbjLcydW/TeYYAsijqLaQd9wdjkF892QaUvr8sdstqwvoDC2OKBKpTszVc94fmbSoY
	 JpBpBMUsyAw+hCMwBCRr+Fa+bkp0T265QQkVrFH20MZbXjPVLBBXHqv2h80AheNL3Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Pslmt7/I";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050F606A329
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9050F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pslmt7/I
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so10862600eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591251; x=1796196051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
        b=Pslmt7/IwzdLTzaZBhL/ixPjHqZfMcA1cAUQ1LC2WY5SBk0IYS3ZZXHa1PQHWnLwWX
         kOBaSXb/JdrdAraGCioXtnitVHEe93RLatLdbeeueUQJqide5uukZQFihgSg9I1rzAG7
         AchpG/rQLYeNej5klYg9xnPaFXonExrqpdQ2nWwUy0O4WT5jB0tdLrXo+EJKjNGvCVs+
         l8szTEAk3Ny5nS9177eB32V4StSMMlMwENtYWEdD9w/XOk+05hQQ1JOoWkAljvTnsxlD
         OCPGOejIlFWaAeQbIsFuchvJRfxN4r5FSYcc335qfKMzcQimGst2WnD9iKAz/yc0WqHz
         KqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591251; x=1796196051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
        b=knL3In03o13vVAcktYssbxzTU8pIsY0ysFFroGsDUP3PmTrJSU0AweFuuKiwX1jmvv
         m8QxzIVbOEJAWyzNwIYAI34D8p4Ni4MdnJY9/O8o0cF2bnzQFyjbK4eWaWhsqRGZdmwB
         fj+wIiwtEFlRjEjWLJEUEuH9XTL6IjObjpUShEaQNZsAQTYzf2gmyE2THF7/F1af5V6v
         hApYR0Wt+R/zZENsZxgocYl7wZ0EdBanevJKN+96UxT2f0W4s830U4GVb+aOsA+17PIb
         YfwayYVSHNu8yRpr87OSgAEWs0VVLCRXab/5YqUtLwZdc6hvqzVYoIvzx5gyE1xtMXNN
         gCog==
X-Forwarded-Encrypted: i=1; AL+hErFiZoDYN3gDOv9NeM9H2yBVQfBL455w+7njexUNnKmjGKHI2psssXZpYhSGi3DzWKECDwCBoSvC8drc@vger.kernel.org
X-Gm-Message-State: APuU4Z/OolDtWarDK++PXL+83CzBxck0h1NE7JrEVXlDF4xpfP+IjXyJ
	St/9kTvFuTq+8M2Su09+IHOPbLZyTVQ8Y8L9NXWvaiU+iHQMhFssGuAl
X-Gm-Gg: AZFdTZd8gb+Aj9hKJvBDeMuB2OpOeyR7WXfBeMr8j0cyfJgBbnxqiDwdyc2515t9O/4
	QAdS21pt82ISTylkWbZLF4R2wkdZpYB041NuCt7pHyfcxIJFomzui9yqNz5J3fqNevq5udXXZv6
	veSwT/uybX7qrjubmCegdsu1Wa1OqM3MqTNr6iCdCJ0F0I45/2WVha0Djko9yriYPu0a/v1eo2h
	xcIU2E2zNv1shJekITcAXgowijE1FF+xYd13glVnlKfoxXa5fLKZJUxkDrNQpn2/0lPvrN95uJB
	zJxqgOqbF4Cys9E4dTZi8ql8/33239vB91faDfHWn2qDDSuns7ppJxq/X3Ajz0k33dZEkULsjIn
	CjWJeK+LP96IqRm0yt+DnT5CjzxVMiLrD6IQJhRlKzqLm4k7qOH9sc63g++LECeNKFSycpHe2Zf
	4Dhf2Jvrw3FlXBF+FBElargA2X5npVcrUfMOvbUEq1I1edymzBS+phbpTlui7P9zq/ZOoW83UxC
	PG5ycYzJeCa5n0JIfRATleqMyHys4IXTCJ5tVpnHUuMTwzJoFZTYhRdpxkvW2oK+Muiy8ViSBDq
	opoQKXGSU5mCtvUKGxzeA5bKztv5XqZJ9XtqhbvQDxYE9YWiAbbaoIcHuT4XIZsz
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16647445eec.11.1795591250594;
        Tue, 24 Nov 2026 23:20:50 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:50 -0800 (PST)
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
Subject: [PATCH 04/12] rtc: mxc_v2: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:18 +0900
Message-Id: <20261125072026.2997493-5-prasanth.r@lineo.co.jp>
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

mxc_rtc_remove() and the probe error paths do not release the wake IRQ
set with dev_pm_set_wake_irq() or the wakeup source enabled with
device_init_wakeup().

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: fbc5ee9a6955 ("rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc_v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 35a18b75c..fe3a55b00 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -301,8 +301,8 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return pdata->irq;
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	devm_device_init_wakeup(&pdev->dev);
+	ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0

