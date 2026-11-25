Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591255;
	b=b2MVg+dGH+A6JD8nwsfcNIfYk8yon8xe/JzIw+L6kwUpzLng1HlExQBSr+CL+1bkGgbx
	 jHuhEooVFjvX41vpHyjgO2/0gbVmHJfDFFKdEZc9cww+82/uEof7/Z+ppIKUUYBuUpRNq
	 1ep1Q2bhKOWhVoBJAMQqVomEYvKbLRB4mUBAbNlzTlSO85Zj/I1PNQGUE13oI0GOKZNdl
	 jbZ9uRI5eUYqUwgsqjDjuOjj0h1r6jygMRiACGoFkFk5nOyVA6TZbcboerrpjxygrbycA
	 5fcxPH7PBKGVLmQKHL9SctcQy7+eXW12E4L63GkUQe0sEgHZ4jAjOj6/Ne67ARAxGQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
	b=O6JggWMXhdUPuMQakCq8imC38MLyozpOqZ5M/Tk4uA82ZHi7DfAaYlOakkvXtFWb7CXj
	 KuDNeuZvk3O02d/MrwT6fkx60LQcwaMY5I4BZ2dBmWtbDOAAjczx9j9LOv4++x06sGOlU
	 +eOuddywPzJYE19JNYX4WqcE/V5vRzIETS1D8UE8q40rE7nERMXQ94etY3Rco3CxhmdY5
	 lKci254L8JyzIy0OUMloIhHiGz05KZj8L5j59LbUF7wHGWFgKHNWSZMUjDDBd/xirDo3V
	 S9WjxY2Nz60MiRxmNjAc1xGqOJ1PeKdVwfVsLO77O74+5zrFl6nrRRieWYJwVRf1hJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+dT7Gce;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4569E606A321
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4569E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+dT7Gce
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so6385199eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591253; x=1796196053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
        b=Z+dT7Gcek3BaDrpZ2J1xdZYOhN6MUaO8yn+uBeXBhrpvjLQ1IcGWQq9y3MKVJaAAeP
         UninuSAJxjM2rbNeiDlNB7CRZPURpzChxqUn86ELHYo18n//4OsrrvcpWGwk//Y71Avx
         EojR4fYDx+YPRM4CZ7zjdTSRo20gROkIn7UgU1nImLthV6DjpAlrYg/b3kp0khaUkf6R
         kNpdun+tTCrrJC2TKBnCl+kujAgCEZiQ+dIUYKgbHS8Ud+dnOTHUfCojjHPFS+5guwb7
         iR4vdENBixDziY1EUk/kT1jMhWZzK49WMTHqB7PXl3X+tzYJwrOLE7ZWaH3HwIbM2PCk
         jJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591253; x=1796196053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
        b=ugP2WMyMn9mSWkxV75t81U8B+R6emHSSQMNE/LCf3d5U70TpDmM7PAEmp2f517TPqg
         uj2MVinRQDN8C6IWBY905NMar7oTPwPWKD6qYSGL5W21LkYpR75ii/vr7hBKpj4zaiK0
         32VgESkt++UoYL3SEY0FyqNZcxmzL3j5/BIhSNjn++6x1KMx61b51tDCzpAiz1zFM9Yx
         pnuEZQmPtFfDnvjS00oipUkewrTwipPedazpp3lP8Wd0+FXK0iPMTUrzgto+y7toHfVN
         1mZhBVkO41QfDcHixhnTxgZLGQtEG6SOdzPk2bpJMjlqMLlh84ZuFQd+DcH/Mjywzzzc
         gtcQ==
X-Forwarded-Encrypted: i=1; AL+hErHWTW6FNzWlXCpjnkKWI5Z4jjQbZ63ZOtvYxDo1uAijGl+Fuv+GHDwE4fA/iMBTHIJ71HjbBDP4W0Se@vger.kernel.org
X-Gm-Message-State: APuU4Z+QDso43d/WYmLzsZndbdyFdYbYZuyD3wtXKL4s4HIrPnFhT40X
	264AQdwKy9LfnRAx4KVvq31PvRqfph0IX7ZG+fIQDg4kx1B3HLSMa4xk
X-Gm-Gg: AZFdTZfNUixCjtCe3Gs6wfuJ3z9TniGFxsxDgjGoFhuTjybvZgxQFs68ir09n1AyUZ7
	7OxmFN2OpFU5bu3tcR/xecUQ16hV9G/bJeXs760Tw44tHYLCYf3YpbOgTauUEbVP/Usi0oQU9CO
	fSzwyWBtn3xDLgjw1AcbdTgqHo01y1TwcKOh2NdlusXI1KHTYdDrspmR4qZR64gsGISWhLp6cYn
	pOM2cd4yHRslYdrG7izFPGBMVioWdB+nROJq2kVAdHpyjIuw5QO9K8+lajoRkuxqcD+srVSkeqt
	sRKCCTWxF4rUW73Q7I3c0+QVnGUqmXSAayCF56O2szNe/n/YS+CCh7ZVwyP8a5ltgp1MHZ5vucA
	GhKWgLI+sN+VmRvWDZ7FPKvezAj+JIMX7YKBUl4hyWrNeyAgMMLjtElVTCVyS9J/b11jzvUWUYo
	Rt0Iw4A8f99kSWoTU+ocwZrNbGT4czGBa0pNrTbMIwxwC1T/D2WmNmb57m/cOFdIxZ0iOGvARy1
	F6Y7H165P5CTpneIqOiLLLP7spb5AaQuWiXGsBBmZI+9/8BXGS57AOqQHSxezqSbHHn79XyJTsG
	UKqmYowKVkaSfLhEDtNsFPFeklYPWWLC3qWDpl8hl/hpvYnqdraAKBqiK1VMaegt
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr16142558eec.6.1795591253408;
        Tue, 24 Nov 2026 23:20:53 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:52 -0800 (PST)
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
Subject: [PATCH 05/12] rtc: imxdi: clear the wake IRQ on removal
Date: Wed, 25 Nov 2026 16:20:19 +0900
Message-Id: <20261125072026.2997493-6-prasanth.r@lineo.co.jp>
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

dryice_rtc_remove() and the probe error path do not release the wake IRQ
set with dev_pm_set_wake_irq() or the wakeup source enabled with
device_init_wakeup().

When the module is loaded again, dev_pm_set_wake_irq() finds the old
wake IRQ and warns "wake irq already initialized".

Use the device-managed variants so both are released when the driver is
removed.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: bcae59d0d45b ("rtc: imxdi: add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-imxdi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 4066e32b5..a1afe84d6 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -812,8 +812,8 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxdi);
 
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, norm_irq);
+	devm_device_init_wakeup(&pdev->dev);
+	devm_pm_set_wake_irq(&pdev->dev, norm_irq);
 
 	imxdi->rtc->ops = &dryice_rtc_ops;
 	imxdi->rtc->range_max = U32_MAX;
-- 
2.43.0

