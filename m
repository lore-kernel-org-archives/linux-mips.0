Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591244;
	b=Jwj6HLlAHHSGlTMQ2SmbzzH3GHmDLPqdnVMMYO0hx98rKEjMEw03PKAmMOUj76S9/Z4i
	 qp8siJ0dlKCgPkSsvwfciBG/YnoH5mISo1xoymR2cAp8ZVDtgbqA2WmKLxliglh8kJrb0
	 vo12rYbjzoYrv35dvP/pA3IGFKv0cK7xAhLfHRvKnCW8y5ZSU07SSevsuNCAaveSvp+PU
	 4xv/vJk+xHc5FRX6VtfW1wPgtJx3djr1no6LD6KKbeyiIthGLXGBL6YMiNLreSGh4hPYW
	 S0KM+iYjfRhTzks9h/zS2Vx/dukJazbFq0WfGNIHDEEGsWXVoBbZnYUnZDDipJvlGZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
	b=0O/xUTuF75MhzcyuAvzV+cIJp8Z6yyY51PY7uo6wEnRVUdNvdgJq3T9M2ywBGvzjOrFZ
	 B6TFihe+YIlPb//aj9KI9EvImPF57KGLagGXf6OwtBxzV4Q2pxhYuyW04kMewV1WlaOi5
	 p9ZFaf7dX56fEkqhQnBFTrhhHapMUoj56mNQRnERxJGyIa+DX21cL0MTc+CJ/UHXwkjiO
	 tfdCZ0FO+C9K4dNAQzxYa58uYJMmSP7HTZqULfyX3BFuhd2R4DwN/ZJ2SDlYOh/IX11+D
	 WrXyHCaNATI7E18H3VD/RklM6AvpndVQROQksFqGCmlG66x3Y+cn10INfO/CANcLURQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zg+3opkg;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B69606A336
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B69606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zg+3opkg
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso4665562eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591242; x=1796196042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
        b=zg+3opkg5DAVMkzoSLk2Ba8hlW9lTsXsKayWkT8wdiBC+gwdUn6rV0dpNt0aZVRnSx
         9WAdXrLBZsS7cTiuMB5ogtC/gcgAcqBRebSmbp2eWcMpAV/9xOdaq6Gl9hCW6pcKxT61
         Ohr7cpf4625HgGrZt/1t9QF6YLUVcgQP0h1edyCoRga2Zm4bvLjtcz2jABpUSGixrkps
         0CX48DwkyidvfLm2nPdd5O1IIpfm55jfW9ACUWD5HobF4Hz8YQtEfFEhdajw7g6igROA
         K/dpscOSU8vCY+R8NIlMJq2JPu+1J3B7pJSLdapP62KMZ0OAQbhOBXEY5VkcdJ6ewle1
         SEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591242; x=1796196042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
        b=PriEzsVsnCtvoVC6CXAJsT7PZqAnvoRJ0n7ihLecrxd3cLfZCIxdVO1PESZuUL2vqo
         SyX65/p495ixAGpZpJxiISkX0KVpAVj/k6qsjOgvO/2pw2hZlXfrQjYhVhEpBdZtn++E
         tg5zAvocCQya3T5B13Ib9jmwAJ26bLSIPHtdrViLC9BshE5YmFym5wSEayKVrSS/aOyF
         HtuJjbNWAv2YGSv7835SOB3GWdsb2oPbKox6/iJmMaCJFyKc1ZW4f8hehBBxrv3L1DXC
         slev9uFUhSxsA5Sttg5M+wou5+eABEZrr3zjR0QTUCHRi3FyUn1u3/oEq9OExYh/yDOf
         /8Ew==
X-Forwarded-Encrypted: i=1; AL+hErE4RicJPWplNYUU2Hs9BADjlSu8DaeBg0B5l1nhIO5A2a2KRQ1EpVZqH+D4jgwFW8Zlht2SoJFmSe0V@vger.kernel.org
X-Gm-Message-State: APuU4Z+LYIjghuYxhuxE9F27vDjvjWKQ1i+OQmY4XZHYZe5+dwO2Lilj
	/oG/IirmN8Bvsnmqk1nY297ND+y4Jw0T7vn1TrjcnIQ9YCWaztDDqXf/
X-Gm-Gg: AZFdTZdibg5XAeJwlSwYMkBKAzxi/vbEFqiNgDQb6lCtEwwag65iaFglwlFGhHyViEC
	JmNd9+bD4MZ27aRnod7IP+qg3y3VhkwzlgMJqDbiAXbjPmhbX28ltFnVFHJmCOIYoKLuj+K07lz
	s5ffv9YAVqYEpsvXZwfvqYHfeuR15aH65sAkP0DE3mYh7inrRQlhAVevxVXOFpBA4QmR2dAXp9q
	wa2GttQnBr6kx93Hydnw+qhbUbLw29VLzw6OABRBt4dieTNukiuauKl/lWDdrcrCbcbqM9Fu3Bs
	VPvm7LfpgJ7BhYk1EWo5Fs8aKAbI8TWwa+4olUyJ6K6fRW6WH85cvO+G5solLfJqY06ypTLmQeu
	AddhROfec0N/mwFkMTqxbyMATQhVySiK7i61E30a2DUYTxT/S4QUEIvZMlkBEA6hpcLklNhcLDh
	HZ/M9iJadDQ1FyT84yfHWIGrLZgFsbm17b7jbY+GGukaGlCt74eHZqkQsg9Wu8MWKGObWeg6WW5
	XctemjdFebKv5e9AS6+OC7j/sbGycJPzFAnMzsihNPL5FCH5eoqNBnXlGxYk0qpsxexBnw9pQct
	dvqy7LsX85duKFTCv8XaUL8esPpPJVgmL+V+q+qLyN9uowsNH2TuHgnZUqbmL741
X-Received: by 2002:a05:7301:7309:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-384b3e788a3mr19263978eec.13.1795591242157;
        Tue, 24 Nov 2026 23:20:42 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:41 -0800 (PST)
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
Subject: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:15 +0900
Message-Id: <20261125072026.2997493-2-prasanth.r@lineo.co.jp>
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

When the driver is bound again, dev_pm_set_wake_irq() finds the old
wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
the driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
through sysfs.

I used an AI assistant (Claude) to find this and write the change.

Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-snvs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index d99a352d6..647952dcd 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, data->irq);
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
+
+	ret = devm_pm_set_wake_irq(&pdev->dev, data->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0

