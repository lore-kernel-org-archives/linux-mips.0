Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591263;
	b=nJLQAL2Ze6vDFoUd80G8HinO0vRW2AAnY7RMCqT4P2bMrJANCa3bBQhMb806V5d4G1qv
	 sR+Lcvu2RoNGTeBDNywW6j/ywBFdOTS8n0MBFUhsR9ryu8r5MxB2fcp0fiRxzrZVpe6fp
	 ZPAOj8fTZ66isk913QzjgYc4ibMe5180y63QUfz+21zZLFHXoJ6SWhd55cRJOpflYv7DQ
	 A55aHHS5qi1egQlpAtkhonOVde3gC0761k5bX4Kw9eabV259MpwyfE6Gu57V0s16JR1Yh
	 vFywQhDPI0NMQmty13K9g8Xhlr5ja4Mr9RrsNO/xfQftldmRYlBL/LJ/e8r8Bh0a3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
	b=iVto6NXYMjJs+7XXK8Yc5AZ6fHetnfP41vTr3OmYvitGm57xFYB33BhVyx6jlF2jw/aS
	 zxh+knQRxxB7ev4rNSZJpc0lrLJ9ri6LCl6E6siwCcK0DIgEZpYgSoNJiWUqu9c3DLaUn
	 uf89hPz6FD94A9/V+taoy/bkkOQ9mGpunC4udsJr2cmArlSeshJqEyoEjTrU5JT/tnh/7
	 +W7O4Sgvs0qeV0kPZt2Zc8YbqUpPayKnslFa5QE6DC7Yyhs62mMfvSVXpP3JYbvDw/3fT
	 mwh5GR8/C4gFuajrxzs15TEdSe6lNU7yMg4s/P/fYBwr6IG6bxg9GO0ALNC9D9U6GQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iy+ARhJn;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DC606A326
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863DC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iy+ARhJn
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38190551625so10862829eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591262; x=1796196062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
        b=Iy+ARhJnmfYE7tL3sQzw0P10feOOpCgboqPDl7Wg7r4INy9tTccRM2trmVkf3w30S9
         e8WFyGIq0xuS4BA1369M3FtefEHx3BbtOa3uys+535IBCXNNeE91XQ/1WLIYl3Vjo5kf
         ir2OFjcBn+rRs5j7A4iXv7MDI+XDB75gU0KQqHFnlhee3dVTcfC8ygLXM1BixPfoTXeO
         uMHpK8pjdLINIuYPinCY5qGS/LGuS45DYTZbxLtjic4z959+W3o2sJFMJuDh9E/w0bsZ
         z8AVlPQa0i7fmxK+vEYIqBWspZyfrO4W5P4/6nTcCJSFOpljLrMUaM0NpNcLy546Dk38
         B+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591262; x=1796196062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
        b=nxkt2UHi36s7uawl5KLRK2VBI4n03c4Vy3hdsIPi/MWy2nCJGDWD7pEWoZxl7WUR4H
         dzwW3s1RXbSDRmjK9AliUuTYLhQ3QZvsx1VjSty/BqfZMtcRElmhktD5PfG9maZjIdbg
         oquJTMa0TKSQOPOhZxTdVX67V/vcAb6L6SFJ32F+R5HrnuLugfMmiN7VaPMrCQhcKVMH
         JeLoNy+v7tlXAMDTvBqS5yGlD/jPwyw/nEwf0r9NrGmYzfDWIwxoBZjLJTs8DuzeYNig
         RipEZ3D19ud28zE9aH+SkJ9YrkczcfyrmiUhxWz6acO8z/brCrgPumCClgoAC7Ke+Zet
         Z1cQ==
X-Forwarded-Encrypted: i=1; AL+hErF9+8pl1hmoUk8vLUCKVXhUKFiJhsVNSpeRK4C2hwDd/Nh+Ri4gafd6Z9FmzgVAw6tvXcevt6g1D7OM@vger.kernel.org
X-Gm-Message-State: APuU4Z9pupwPLFd4Dpys9bCMgr+LjyooARSPx5M/8GIUl+nyR0DA5Dfl
	4SC4kWC52BvRQ0l7oAOWJ41WKxpEvR29UURGEHp4jgEUmjQjMQfB6A91
X-Gm-Gg: AZFdTZcRRG9E+Nl0lNeaUy8nwcLHSGUuRbm4ewahO1AYGvA9XzZcj2c+KSbu1DQ90uw
	VuqTcoGsWMzuxfGbn3Dm3118adudsGOU4K47OzpYjn2rSmk5Dg+L6V7GeISzjT03bAq5u/z5xpt
	jKAym98uVYQjFN1JTy2g5L6tyiV640/gter/CKxpE4/YI0MrESfjicwZr4OlWbFMOAbwk7fNK0k
	pDEPZL/o7T/oaMAO8p6uVqzQhIapZn6TNXRoea3iGolsWofTyEJlhq3/bHJRJ2o+0ftgidP3V7W
	S67DdEVrR7B/wBn2q1tlTHEhpJMjpIq6aeU12/7GAON0nrbkxwuiuehl0QKZ2W2Ncr6J1cDCtoB
	plB7QJtaAnnBrPmXtEa5gm4ZqTmpsFD11it81jeVisNtmcadQesY7TG0DM30iGA2e4kecSXz57x
	O7DKKHWJQ0s1PIouDPVglC0EQoEqXJu8yV5Zl/PNdb/W/W6i4uifsIuxZ21hzpTENVUI8YzRtAM
	QXuutkBMnS3ykgUozWlB8BKSDaEhwjUPGw3rKWR1D8/sN3rL0eJX51+7E5XRQXQDgxhepOKmBh/
	dBSktvVBYRZrxS0VIvkaPuq1t01D1S1oyPPcQpfzd/Zm3314ADeR8FCWRY/9iisus7WZ9Emfab5
	ckaZe0rjIvw==
X-Received: by 2002:a05:7300:f68e:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-3857015357fmr17092295eec.25.1795591261375;
        Tue, 24 Nov 2026 23:21:01 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:01 -0800 (PST)
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
Subject: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:22 +0900
Message-Id: <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
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
fails with "Failed to set wake irq" and the RTC cannot be bound again.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 3b2dc19ff9a1 ("rtc: jz4740: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-jz4740.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 32c331f3f..41501c9ed 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -367,9 +367,9 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc);
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 
-	ret = dev_pm_set_wake_irq(dev, irq);
+	ret = devm_pm_set_wake_irq(dev, irq);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set wake irq\n");
 
-- 
2.43.0

