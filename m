Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591246;
	b=mwBkEx4neUCxlnDkinLKDVMR+YMe9xi5ztHOBTn4VRFDL3pb5zOYWOTjn0ORuv1dx+AI
	 jH8CguK3l30rLw9/l2HDT6SGZg7H5U5m+qsk/bLvM1dMsiTDBOtdOfrc9SyTCZmrUNTjI
	 o5qZCZDeK2HnJYWMZIhWjSVkvNEu8mTJl5ucW2SxR1KuBGLd0WQ7us7Gmdt7/Mwcm3M3z
	 YyGqZZIOrkdgSkvBkQC4DtAqnPZ3QFUsxb0aE7CIPPQ5cm6KQ49wNC+sPmMks2PDyjpjQ
	 gQNNpC8yJQtzP+9H1pQ8qK+7520TimGW38drZWEkvQsYhL2z3IYtNvlCIBkfdCG0IAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
	b=2h9VoWdgiKztijJ6cS3Z7XJQPoNVSf6Dqw4lcJZ456uvUlrj8+dv4t0beZkvC8MIEm7c
	 HcdlhnREe7q8ZQIaXi7IzgZfDpEEAPGig1sDMo1kLjLAeoH/bbTQWh98NWzE+jnRJE0O7
	 Q08M+eN0s+r2sQ0iVGNtIj/8d2Jai2YfMrc637qhzRwGP5is9RiaJbs477PAsNG5/SsHB
	 is/ULH5LiyzaTvLSpe6jkEz1pBjUKCFH5buijgtOTeTPij4TmftiywpHIYdtc97FTa6qs
	 b13kALkccXjuK0/yqSdLhkllN7XlofS+FWR193ntaBDpj/NlvuGG+1oyuhaJRdVgF1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixpso47F;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB8D606A33D
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB8D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixpso47F
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386bd881d39so3832871eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591245; x=1796196045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
        b=ixpso47FlqXrkUDpNzWr0jwnuvA8bOv/T5syTQxSy9FvAnhAzAsu/3/W9DB23pA1Dq
         Zncv0gGYhIz8LoMM4AbEBMMXsqwxadxw44I8hOFy+Nw7s1mo76lwvhKOg3X80KQWvViM
         f8WltvMqzh0IibT4bEs8SfGOKHHW3Rx/jXtzaP0Xl/ltE2NjNIW35xEXkXE9C6UZYDOs
         FWsOtQIHQp1vAP+pTbNlH7HEYXFTr5u7FORe9OyZoYIEz/uV2n5Dt3b2AO5aZoJHbmnR
         mGmQD1et1rNRB9EtH/GJDeIJqkOai8BFvDGyA8w8NLUKQj00IFU5DSsjH4PM0+EwwwZE
         IBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591245; x=1796196045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
        b=a8pC32S5LXN0Je1FvBKSQmeW54upJ2jj0RafY0Zb92hxHQ9uBSBouG6V2mLwXjY+82
         jr0WEWHhRf9q3T82JfXXzQC9o1PSAaQBnAkUbgHhdP/WRupqo6UVeAnVG/XbsBhUQNSA
         d3UrvrQEwmZceTIIoy9SdCZ5R1r/smMLufNSFqFeOWdEs+7BYneuXaa93a4lfd+K1Cgf
         WiefJ1bIwnnzDQW62Zy62d7e8x06feWgn+WWWljPLKG9w+aLYJheE9XlJ+bOFtSOIYDX
         JvJm+IrqbChBKM3/T53AiUzWSzLbCcJ3moQd38AnytPd11Exy+Van3fyoXSNtV884t3K
         Q4eQ==
X-Forwarded-Encrypted: i=1; AL+hErFJ0oy/vkY9amJXA3ENZ9NwbhS/OZr5X2lddy0Bv6bN55tOxgmadQkn7QS3SI0SGuYXTXxjJ6V6TYdp@vger.kernel.org
X-Gm-Message-State: APuU4Z9j60YkGDc/JtjV3kaXjNpUll9LoExVkSOyYbwpWtXg+jhvuOyW
	c0x6vz9gML5nHjVch4cjP2Vcrl5r2upBpzsfsrPCF+VfdlmyPcSd09qsO1FWqS+/
X-Gm-Gg: AZFdTZdDgzz5ID4IqPeJBrQIwA3mEXHfYeyAFTWs+1FIOt7G8wpGgj/ecPfbpZDAq/k
	EnCr111rjo+QyCE8nRxyPgBWkDL7SYsoDzAHjI7PIr7SkuX1A4MKAxr+VgTP5upEsZZExtZc85M
	ajraY2qtfZ+rjbHp/yyF+PxDeoawKHqoR8PW0jdIBQb+95upQhEga+Aq4W5QSQmqbLajNunsUoh
	1cXCtEBw+x+g8c+YbiQdyy+a8AzYaNTnFen1KijuvlLdbXRD+RVQa5AkPXQxJGocvC4pfo081dZ
	9jGrhKziFygMgQUuo6XISFPj8UKbT3tuJFxwDS6MdJAfTFvf8UeaHcwurBN5SACAI8INqK33Lz4
	ZF2kPZ8WYHXp8+Cn9uP1tTFvSLbwGOZ0I/M5x5d08Z+YjKb+qReLfIFy45hZf8AjdOGCa2TdrD+
	PUmuJ2MYexqwZ8PveeKanwMRBmfXEQTjn2WAX4LN6fhEicHhx3/0XzDs4iRD/RrOJbStnwvPhi8
	aLt2TfCPsFBF3F9hlZDMmodVHk13COVEPSw5iGhgaln3l0i3wQ6FG9ifUMqD4yoMbgGSPUN3bbO
	yMzuq4k6NiMt39zW6INyVJi1x7lkn7p7ebbfS9ROkchUZHwUesozRwTyOlc6tmOpaLp2a2nzozU
	RoTaa7K0Msw==
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr28249889eec.38.1795591245029;
        Tue, 24 Nov 2026 23:20:45 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:44 -0800 (PST)
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
Subject: [PATCH 02/12] rtc: mxc: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:16 +0900
Message-Id: <20261125072026.2997493-3-prasanth.r@lineo.co.jp>
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

Fixes: bc0e731fc289 ("rtc: mxc: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index f91b0994b..90b383896 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -377,8 +377,8 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->irq >= 0) {
-		device_init_wakeup(&pdev->dev, true);
-		ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+		devm_device_init_wakeup(&pdev->dev);
+		ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 		if (ret)
 			dev_err(&pdev->dev, "failed to enable irq wake\n");
 	}
-- 
2.43.0

