Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591260;
	b=Mt32rkZ+AhQm0i9oZcOWF21B3YfK+uYGCrZ4OO/+AE2I1CbWRa22c5tTrBsnKZJJRoyE
	 SwOtdbOGxDiuESkcTJVLlUQr0H+EU1l8fzwZbC5ae9U95/BxeU9c/FEXtZ0/KPEtc+GVk
	 K3GZcZqbKSsKQj0B4eGInCEBzQf//HNdmoLwswSEMVcn6AlF+71EaRIMyvqdiUuJoj9Fn
	 fhlRZUySoPQWxjfVSyk0vv6jC5ksF0Tz3od22H97unGjLvrBFmMnAi7oQwFfOdsSilo/C
	 oP6RwXHqT8N4K2lsqhPIwbBqtXR+NArv/eQz3oKF51Gs5Vuzk3cD+JC6xTg+3XKXiqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
	b=hJPMBPD85raIJSHKNlxGlX+TiG3euivA+pCK6HU2PpQefIiCFepM0SfrWzwn1031aNXP
	 7cOL5z51vv8O7a1eBlPa695UeDUovIVeCoA8NX78SKgPPQDdt2uoNxjjwQ9DcJ0j4ZV9G
	 EPUEVmtzqgU5kTW2wqCQkqgkGRnKYJ5SzCyQF7ZBoqAaarmXauuEfGmQGVgRHNakcmcVN
	 DA6MRlNGGDj1ZZVp1QqRqwPvIkQMwkb+CPdhfw+GR9bZh40t/7FPrj6ftEr3YKl2LiWsn
	 klkhYnbgqbc/Sb1S6zWi3r+wA7kuB+Si5Yk3l7uLF6jEcP/7zH2gkg/51kYVMIca/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wm4WkDeZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE5606A323
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CE5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wm4WkDeZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so13915752eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591259; x=1796196059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
        b=Wm4WkDeZDefN4tOjVLuBkEbw0t/Fz+QBzUU51Dyhnp/QXA7ja8WHBsXx+x0hO2rAFS
         LPCGXL6wz+1NE4bNp3mXoPuM1u1Q6S/45luyN7HNm6uZxN7L5fIvx44gc4TsmM8VJ3qG
         FMR2wHLn1VMuGsL/KPn2wm1uoki7FA+nutxJwfol04m412rdvLKE2fS2BSy4MfGqxGnl
         LN8rcZRwh5P4HuHaWl2BZ5nF7ot5eCRwKkYDwQGUUyj7Au/9yU6s7RfKynnvDnEEyzug
         2qJdkDjsf3KO2i7zqjjRYyGMpR92Rb1cwD7gdB9ToCv/jtNCO3dcai5/+UQ401LtzqOD
         xLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591259; x=1796196059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
        b=x2H3zcr92aEG7tGGHBDGINe6HS91yHVldt4f9YW8VzbTY+xcYeuo7U51d3XTSYuwj2
         PzDzUKjROJckEdfEWfg0ewTHaaL5nLbOPsCinTzjpVKLZiRZ5cUrgxrn6cjha34Mxas9
         PjKLR+5nP+2dgFtFfpa9x3zpJS8KQqf53KT++DoW1A2m2n0mhQgHg+tncU23LAFwum0Y
         H7tG0wGhXUWyPVwJ4tHgw8ZoIL8oVWWphQk7Nc3Ki2bTdAfYe3qOi2CUBa3q6QuvPZKC
         ORU24G9ThiN5nzL5ejqCHitMdBrWT0DKKhx05jCTUhH3kJTRgibbAdk4DH2U4J21t5t8
         5O2Q==
X-Forwarded-Encrypted: i=1; AL+hErHp9s/UAZ5a4io0rC1XYZBDTOFTKyYq+YXKJdMMcqUArk+OU+b+sNvQf07aTx1QgAek8phAl056X+nh@vger.kernel.org
X-Gm-Message-State: APuU4Z+0wnOBHEhV5wMaf14vkVZrFFhmQG6l6zn4SFny+xZ/aAlf6T2F
	g+R6AyRAi0nxeVekmwnH5PvHhRYtTJF/WNztzll7kLHoAX4nM1wB4RSa
X-Gm-Gg: AZFdTZeVw/aMOfU7Ps7kcvr0CSJ0SBr0Lo8/4iI27/RYmg8v95E0dZY0B8Q1QGDlUlT
	jDildXFlLHLm7ea3jxZtNv95PiISn86FcxbCjZSLh9bP/xp1I3v6uvN52ZiOY/hpbhMhjLAnxLO
	L7fWyMUa+IiGXziRbOg8uuYJnJ/+qiN53yArzZMcTLmCNo1R4536Bo7YRthcj+dl/UekfymvhFG
	VGsT/PTXOGHWEF5UD27vPac2F8Qcqw3A+Nxh3aPKqpPZrtmDdBuzgYnjI6B6PqGux5ambK3j5JD
	JbQuSYawu/zRLZ8Ugc1/FNm8PJmZZcvXfr8sI4cKDokGdSVjW6Fr2POrmmDd5ZHFAW9M6ekJ1OH
	uckG+xy3s0c/W11T+pftjPHKYepX6w/AnPpFjtz9KdNZhfjJ7rkF2uAmD50N2qE113FCbQP5HlK
	2HPlclivWj8vafss94IL6Sg1LeZWSMDu1gN691TNGA0QmO0DOu8nGnYFexVX8xR9DPYD8LM1t9A
	SAK9YfZcO9wZHjGcjhDcm0I+BY4GxM3zzqqb13lInYcdYMPZkY4BJ/nQupGlis/Uyala676Ko6z
	x1B15i1YeEXMPUcVvdYy2pbuvJ5z5c0GjMjTF4rbp0+ADC0Tl7469nEEH8SCJ19f
X-Received: by 2002:a05:7300:f68e:b0:383:d3d1:f31e with SMTP id 5a478bee46e88-3856e94760dmr17054999eec.6.1795591258774;
        Tue, 24 Nov 2026 23:20:58 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:58 -0800 (PST)
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
Subject: [PATCH 07/12] rtc: fsl-ftm-alarm: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:21 +0900
Message-Id: <20261125072026.2997493-8-prasanth.r@lineo.co.jp>
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

Fixes: 3a8ce46ce15a ("rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 5473f697d..565fd0df6 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -281,8 +281,8 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
 	rtc->rtc_dev->ops = &ftm_rtc_ops;
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	devm_device_init_wakeup(&pdev->dev);
+	ret = devm_pm_set_wake_irq(&pdev->dev, irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0

