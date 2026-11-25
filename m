Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591250;
	b=xDHCUh6jvw1q+lxIhbiTc4Q6zDK11SNepwwPpFXm5g0m/KX2rcN++jz21Q7/QmNmwUFj
	 rHXYpYSAbQUtkz33370pLukFGT2v8PCvotRgfEIGR5Ed039Iz51E50nMQXgmHdDfNyNjc
	 7jZXJFmip7aXJPkKzOfHmfVve6PNXQOlFcWdn3ENzpL2ocJRBetE7y+23nIEmgJ5Wm8rb
	 EpRIlzjOpytpwR6g8o10qIdYVWa21BRRKhxWm5TQ3f0HTtDRt7J2KmoVjrfPiorihIF11
	 HTf9BKodROYOTTNmNnLpkCpUIZykyh/7iQROsI49cbEkwkn1CnvAMPyCitEa36LDJbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
	b=LeG+g9CZ6afYbT7rfJR984rEQJx7X9vodhdT9QxjJB5MfSLGAkPvq9BasH/RLfngWPxC
	 f9liJnydVdV7Q76eh9PhdZ+ZHrm6l/36z746Cc9XVbTafa6Nq8z3aPClpaWz9f140qWG6
	 DQbL1e6iosSLJynmpB6vZ2km7Wy6ZgSQoiJv8xm65EKjF4l3K/AQaWpDO+ezjr4RiXVv8
	 5Npp2Nvz669vKBfRKPtR+CLVGb8bBajLbpDHSEX3+hktA5n/D5IIHuC5exMHfWkVjDxrk
	 3IenXWt7WNN2gwzFxEo3QR1tmqnCCXPDDS4P9IMsePf5G9v0P0zQIu07sTc6pcQACBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SF01Bkeb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AFD606A323
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AFD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SF01Bkeb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so5044799eec.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591248; x=1796196048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
        b=SF01BkebU3IJFo0TqaL9nkNgkmnDBdIGpz4r+Y5J7P3jIO+44nLuC2+rf0drEgEzI6
         K5YAlj7l4L2rlG0D3pLkixkRi39OMDl8pxagHQsgK+YlG7UxMdxlLloOOc+RhwwKq3iE
         qz4SPAkgg8altB6NPEmGmXvhfGBxKUgiAC+IZsPGhMQ8pcRZUbU86bCD0RMZz7/MJHO9
         fi3YQ1DKHwchljtorTcPbyKf+FibP8NHsjknmg5CuSgdicHZavg+PZ1FptZTOtxrRQWD
         MxaKXL8jGkeEwGy8iXX39NUTc/Egh44D0PD8rGv83AWuhhRxpaaIeNgUd9oRNwZZqeVC
         l87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591248; x=1796196048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
        b=IW5nHzJsfuJDfRJ4N4QEDah8S5wndT4YQjfbUObrspbB7cj8xQz5TNYkKmakAOR7uh
         Vmz06qpU28i+IQr0frIu2zb6r5i5a0yH2c/EaTvd5fqpMz4l4hdn9lzW14wllcUgpxDy
         J2hqTYuHFTZL0TY4o8bndZ/XBev1n1vq9ATuqe9jvODDG/Fcnvwhebb/82GMaDpgLW73
         E7cX9EUCbv4XrYPX4KzIfWvwjGq3HaIjyYjCmy0DqYovDyRUqBCZQCqGRIDXsSm1RyLj
         mp99x3kExXlEVOrTv7KarDwj169FGLXynDo/PLKJ90lRZ2YE7NTynQlXZs1q0SwzNGI7
         Kt1g==
X-Forwarded-Encrypted: i=1; AL+hErHKrCQHIbfUMjIvK9wGBXGqI3uC5kSS2/QYscUFp7U5bLmYiwCMMIcU7S8BToD88p79pbz/BOrI4IBA@vger.kernel.org
X-Gm-Message-State: APuU4Z/drPdyxWe+6sAwhMvFWZk99iOHhjZkfPIJvvPSj2bKRmb369HL
	q31zpoMZ6Ae5swF0ZkhvfELmwg/PQKSTttOp7zwVGKEgxngbL/ajNz5U
X-Gm-Gg: AZFdTZeTsNMBVDAycPxxJmFRo8tDeO/rDyxL6Ku8CugTrfX2yEL17AKlKy2pRskDxkN
	aaLEYxbDeOD5clbfCN/x15Zt8TqoPADe3ZmLNzLN78kUccpEm7qvssN9SwJstZQ+pvDYqgwMpM4
	JpmT7/Ixyr/czepN394yjtor4pRWiP+xu90oemPsg2t7Vq6FlFVS2G5wpaMo5h06Az3/QrLcvCJ
	wroJPx8R5rGadJ3kj443i67S7GP4hqfuPFpvJJ2wnggzVCXERvfMGa+VxEeU7OLM5jNbq7ITi6Z
	KBthOdWxUxMwd1ZKzBRLkc+zbrvxpq6aGLjk8Ylb84wNi9jh2SfYeFzBth8c29D+pmKfdRBAq2j
	fSO4sFimUSgIAGAY5KYKI/Y/hjAPQZ+weqCWfOZJtGXoEWx0zSszl7J4DzTCeL92STOIAkatvPq
	upVc6KiigrSRFzeZ98nIuUXySwiwlS92hqInIw29AaanhAqj5N+ViaesW9hzclEp+EvSl19POE8
	5oj2tTiyxuFShXNsyAxwsXHy3pOoNjGqMmheFVBHPPs0RCowHus4qRf85hzT8Zb0N9gT4K7Huer
	crTIoMJMdDVhRN3wh9yriY8/wV++UYAJKAnUchmLh2sKW31b6V3YSrwJueA0MjIl
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr7689219eec.1.1795591247853;
        Tue, 24 Nov 2026 23:20:47 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:47 -0800 (PST)
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
Subject: [PATCH 03/12] rtc: mxc_v2: fix unbalanced clock disable on remove
Date: Wed, 25 Nov 2026 16:20:17 +0900
Message-Id: <20261125072026.2997493-4-prasanth.r@lineo.co.jp>
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

Probe leaves the clock prepared but disabled, and the RTC callbacks
enable it only around register accesses. mxc_rtc_remove() still calls
clk_disable_unprepare(), so the clock is disabled once more than it was
enabled and the clock core warns "already disabled".

Only unprepare the clock in remove, as the probe error paths after
clk_disable() already do.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 83c880f79e88 ("rtc: add mxc driver for i.MX53 SRTC")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 965170bb8..35a18b75c 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,7 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(pdata->clk);
+	clk_unprepare(pdata->clk);
 }
 
 static const struct of_device_id mxc_ids[] = {
-- 
2.43.0

