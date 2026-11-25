Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591268;
	b=WTbjr4H3fWclWBYhxF/9hroZ6NFc95mXpAdR4nqFWQtFVI2eR6JYp+BRLqx/MfMgfI6k
	 ggmLAQOJ0l7V1otsGTpP2Tf4tdxiZ1AnN0bOHDnq/bcRKbeX/YDjoHSBU7THKoiMHSjZm
	 GEmQ+nqHvsMAJoOjquBX6WaEFroLMz0xD6FrlnwCrpot8wVwISP7z8dqAbwv9sIO1G16b
	 l9xCsxgkd8mxivKjT/M1S8AFxARauSNnjzBbu1u/ed6m/e48eoZwF+aAzFykTrinn9iyK
	 ZlGt2sc89xAEkrh4dFB+cGV0lZzw77ZWPVYiskHJimhz9JBplV/KsOK99eWY2vMM3gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
	b=J4S6shJ1SKviajZrHQknyrgt+2qVSOta9fjuVfOcDpVWzBc6kf13xkpUwWn758p99GMJ
	 XnXDJmYXFw8HDyvS+mHbSJRPgJAFAjVFtVByrHrnFvsJYQJboui/blx4CtYLcPxrHaaxh
	 tt6txK/QoH6r6uE5xigTUfJi52Czb3vihJJjBhSQcDGG7WImi+1wmjWMpqPGRX1X2hBfA
	 R2LlorYbxFxfT2RmLEW4QI7paPRkncGIzJsLwtSOZWMYQw4yFyR7EzMRLyGlmVF51PAjq
	 LSX7FQnBk4o+3qxBcTuUEguXx/OLH6oYqJcYo1vdep9Rlm+xke2OS0ft0PP4SHK8RZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIn+NHvl;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9A606A326
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIn+NHvl
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7141017c88.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591267; x=1796196067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
        b=rIn+NHvlrg56h1dnMlFs6+X9dBZ02jArvhhXlygJf6mbhUs0vUPZGChcUZF7Gfuzgm
         vckkkTuy0yZKE5QZhej4Uh2SQs1dqwzcDVvxGOf0Nw8T4Tmbtk+/NqC/GmjIhnLKQouZ
         AxxnN9MjQE/G6NZh6XQDgdpa2+GBTVMWOs6G0WuWRSf5MrQiFQmB3ywz9kfYnQi2DNF3
         T5/W40rD9ilwu7OJPuvC9So/uPlgokueq30b7Q3y2Sq64kuLd5rXCb9uCGeqqtysbHfv
         /w+Z4RN69r1g7NgyLSkiITM2whZG3LeHkCHtr1e81j8q6AMRX3VR7PcW8b3idf+IN407
         8dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591267; x=1796196067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
        b=a7yTBpJrMhF5oG4/P7agHs9nTinF1FPciNqb+vsy1qGcSR9uVEvfZfwesWKSPSM+BF
         21BLirgOXi8YpXjSq8TFdMolqHEWfEIq4sSk+R8Vdr1XXnqN87MMZiZZpTMi0V3XsLUv
         o+JS5pO6VcfBMiwixea2XtoQswwplGBC9bUQJNy6oaM1zZADFdWMIEpYsORurHtxW+z1
         tZSNm/XvFsEpnUuwddRVUOYoh50VNktqwOm0UD+x96B0TlPF7otDyH7V8aaPmaWOTakQ
         zxgws1m15nP1QeqISXs0y6gtYeZp8hgB5iKQqz7ggITHiolAkfZHKNG8ju/KRVWL6xN0
         peCA==
X-Forwarded-Encrypted: i=1; AL+hErFBB2M5rf0aHuDBBmV7v8gyYGgPnELh9TqV+1sdsX5ME4O0GX3RriCwY59IgWscKGRstzAp6fYVQdPO@vger.kernel.org
X-Gm-Message-State: APuU4Z+SDIUY38BPW7ZdMUhH9N954UNhPWHuNQvLdnoaHKUrGM5dXcI1
	U5TRv9ZU87rQfFmybI37NxcBfgmMjbuxyGvipIx6hVrlOaFrYNE3fk7m
X-Gm-Gg: AZFdTZdR9JUS9zAIpo8mkQaTOiwzfaPUT1I3PPyQ+0qv1iYIRT6LaZgBCjyy5+2OyDx
	dLjYvIMtGAV+/UKtrusAQxVS1yFsiqx7LeKFxI18DlH2x0Mn2osuNjYAk6nZ4HEW5pszYnL70OF
	LNuiAJK7AtWqSmJGcSoDidCnF6sIkLRuYrSZxO8BhGLGYtRJQZK8jhwPxMwiRKarIsYXSM4833Z
	bJsMEZeNzIhcAZRZx+OHzcSm9a+YBHSd8SUoHMHwsFPG2OF0T2O/Er70aENcc2NswnNAcO2fbrm
	27EnTZwqOkUSZ9itwCOb5Onh5wmhwlKI+CT/fKVPLh6dqdt7UX7+mVaQXRKxIJZyWQ3fdF4jkwR
	aLWrbXJROg9+ezEJZrvXocX0uVYiokn8WKfBkRpa19yT8vhvTYkyFFRyoJ159xnwrHTsQU9bUZX
	E/oJa/tG7ybNonwIgGo0dCUXtE3WNUPTyasDw7DvMFIeXNU/n1dUdd6iXApm8xhPSqwdnliYvXF
	60fFaujK3dRhCGyaIws3IMcNvDoZPvI8pbUAeb+1ehXdQKauvq0+D0o+OKIMDE2kkDh2KYPY+uE
	4FJdtjvsLCfY+QjIj6iaE0CaXJLHtBYavBEgUv2xoAMGPRQFT8I9SySZY5CI8640
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr17934967eec.33.1795591267072;
        Tue, 24 Nov 2026 23:21:07 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:06 -0800 (PST)
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
Subject: [PATCH 10/12] rtc: pcf8523: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:24 +0900
Message-Id: <20261125072026.2997493-11-prasanth.r@lineo.co.jp>
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
IRQ, warns "wake irq already initialized" and returns -EEXIST.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 13e37b7fb75d ("rtc: pcf8523: add alarm support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-pcf8523.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index bbd42358a..df70a374e 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -484,12 +484,12 @@ static int pcf8523_probe(struct i2c_client *client)
 		if (err)
 			return err;
 
-		dev_pm_set_wake_irq(&client->dev, client->irq);
+		devm_pm_set_wake_irq(&client->dev, client->irq);
 	}
 
 	wakeup_source = of_property_read_bool(client->dev.of_node, "wakeup-source");
 	if (client->irq > 0 || wakeup_source)
-		device_init_wakeup(&client->dev, true);
+		devm_device_init_wakeup(&client->dev);
 
 	return devm_rtc_register_device(rtc);
 }
-- 
2.43.0

