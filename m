Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003688;
	b=xtIZMT4y+sFyR9mhN6AoxDjyseGCyjUinWQ5AKHEnEW2FqSgxzDmFMHBYF+RgoCUxII5
	 HJFekb1owaR8CvCjnAySFopKbSOED0YsG5SkrFcpZl8fW6QMFRaVqRNsyrDipndkbGpih
	 uWdA+MZKeQED8QRde6yMisLs0fSkogoQ1Wh0l8KtbXa98Hb2YRthqR/+XrFWGjKwF55Q2
	 j4DPX0O7TYBnS30hpB177oG1yQpxh97Ac0dMu+OnmWm7DhmAemiII4yhhyTbBK3meUbVy
	 98hl2W6DhCEpQ43ZowdoFctOOKZl5C+J6pWlkc1EosaOSBFOSUPquCyO9NO87VpWSeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B7dQENZy5hO1NBbTQGYEZ7DmBs04uprzORGYnKqQV5I=;
	b=IugVpCW9dOkiYDOS2z1JXVNxlwQRmTImBI+uGwtwXwRt/xINXyREAX8suU612WH76nep
	 Os8jvKXsBhlji95TFvpgIDVsCimpooIIkYVd3PBVtguqaEt+air6gTA4FAo2lUKjHY63M
	 GjmRRxPBbYCOnmjHYvr3iwE7jHiBySs2bGJ8xfd/7yb91g3fAChQRMwoRSvGdOPlmDcHW
	 WYGvLZ7Fc7R1GAjjTOtlOLL9DyCkz/ryCTc/SbkQ0CRXfbaFHg+7wUPDx65C9afQC0SpD
	 5csmUbcK+YhEkc1KzVMQEXFJKO644SuWNXJPHsyShQybCen2Y1OfyYwzAz4SRabYosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782E606A31A
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 08:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6782E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22055215e9.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003681; x=1793608481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7dQENZy5hO1NBbTQGYEZ7DmBs04uprzORGYnKqQV5I=;
        b=AhtaalZK6vN7H0we5eZfJaEtME0g9vXRsj/0PMehl3von5Nk0qkJY7j6OkShNE0q12
         odEpqW2KkQsSoLU2MXSeU4fjNORSCAlOj/4zcFAomJTW4qeF2b0QTYGZ9hVJpCgtcWEB
         VGoGGA/04A4vmKbq7JDMx4sZYK4Bk7L4j0lkjtXfJkQ7CTkTws3TX29cIixciL0LTnog
         buxKQv0j2NkRB4uUKEWYN7jpAYVnOcWhjkiJTqOOMO4u1thG4RbTKQtTec4qnenlGl88
         z/8LwfTVBuO7BhkBtB+f/s4TMchGQcsiMX3SF/dYc411q7RLtY5n4wc5pdFewf0zsG8F
         UGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003681; x=1793608481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7dQENZy5hO1NBbTQGYEZ7DmBs04uprzORGYnKqQV5I=;
        b=g/1xw/f2l5ndFAZPbKgyWb++v4msC8uPfF5o0P7+8SOu71GkbA7dWKnCpodDtdI0BB
         Vr5JvbARO1R7fZHOpvYkrNwgw9jXWvMmiyY4uVYD18LXwOOsnIUu8k5SJo4i1CVWfQKC
         i7arsZ0htFWi/AY9EJGdG80Twecsn8UjoWdlGN76cRQq3duAVEUCZjjH9K7uBOZGebae
         WGjajwg/Z+LhsA76geFdWdYlcrCpSN6m6qzKVedBr4l9soeqJe64+1/T0qfBjlKK4BtN
         CTGk34cYLvxvNT/sLkgctMspRWPEL2l59suxFpB8mLAEV9C3usrGHX19of3S5HEihGQU
         XuCg==
X-Forwarded-Encrypted: i=1; AKwUvBwXhN1Wq8UpWY1eJ/CxfZHETu/ToJlm5jHlw8fnd5Gpk4vjU6DesnLqziAYnA+/Ie7HijGkAD6ljXLp@vger.kernel.org
X-Gm-Message-State: AFq9FYJS+7psz30Mm0mCP5oDX+r5BjGoyO8aLgRrBEN/H8uuj9vLxLHq
	aEvgCA0ZThPmlp7uhEP/BSLtM4387nZX2quRyujgHeE3EV6nnXUE84YHTQ93oPc9YralZ/DBDBk
	JfN6HFqM=
X-Gm-Gg: AYBFou1gd21KT8W04vw5ebnJTORnFVj56M9pH7RyACGwLhICtwquXnOw14rx3//mnJ1
	bCbWEzbvTG3erCm8SqSzyOstzJ/adNyzaVVfYI295Cm45Fw0+0mDL+3+zYjhsHwn8Bxv2dr0i7D
	7Xo6P0fARCTKaAyWpZAj279wFT7qhZWZGuhTUGYmPFANz+j5WdUu84ou+m2f8+IEg7SYQ6NAwe2
	Sfc1/LYmZ2AGU8vnHlikNap4YijUSTE7tS47ybXjrI9LmCvKwBYndgwR5EeDAr3qT8HRiXvMif4
	C/I6vRFgQ4cI9IDniMpJ2aQsdGSd1WZHhYj+Z4z4T0Ki3u7GNFg36mnvCPiqq7fSr/p+2z6+fwL
	MTNx1fn7LNekpjAvAC/xnHinqYhT7I6I9/EU7Wck+Qnp5noKdPELDR4Ti0my6b2w+ae4CpLaT6X
	yC5VFwjgvhgTVX/5TrGewfTpZEx6NMbnCgIZrNVduOZWoYx3z/n1o7N1wPPTFslqDHapV0BNQvH
	WRo1IJ06WWeoCa4IDc+PE0zUV9TGHn33/YrdjpWO/ZXTd6QbOTs85+TrcUJSfKv7b3mNF2V0uni
	hYc2ckCfcMgTIw==
X-Received: by 2002:a05:600c:3115:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4a35ac9f6a7mr113540625e9.21.1793003680191;
        Mon, 26 Oct 2026 01:34:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm143259045e9.4.2026.10.26.01.34.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:34:39 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matt Fleming <matt@console-pimps.org>,
	linux-mmc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] mmc: jz4740: Remove the host before resetting the controller
Date: Mon, 26 Oct 2026 09:33:23 +0100
Message-ID: <20261026083323.12301-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

jz4740_mmc_remove() masks every interrupt and resets the controller
before mmc_remove_host(), which removes the card and lets the card's
driver send its last commands. Those commands then run on a controller
that was just reset, and can wait out the driver's 5 s request timeout.

With an SDIO card that cost 5 s on every unbind: on a HiBy R1 (Ingenic
X1600, a BCM43430A1 driven by brcmfmac), the CMD52 that
sdio_release_irq() sends from brcmfmac's remove waited 5.1 s. The
command had finished (END_CMD_RES set in MSC_STAT), but MSC_IMASK read
0xffffffff although the request had unmasked END_CMD_RES. MSC_STAT can
still show IS_RESETTING after jz4740_mmc_reset() returns, so the reset
most likely completed after that write and undid it.

Remove the host first, then quiesce the controller, as other host
drivers do. On the R1, unbinding the Wi-Fi's MSC now takes 0.65 s.

Fixes: 61bfbdb85687 ("MMC: Add support for the controller on JZ4740 SoCs.")
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/mmc/host/jz4740_mmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 6a3c26b7c82d..923cf1450de5 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1151,12 +1151,13 @@ static void jz4740_mmc_remove(struct platform_device *pdev)
 {
 	struct jz4740_mmc_host *host = platform_get_drvdata(pdev);
 
+	/* The card's driver may still send commands as it goes */
+	mmc_remove_host(host->mmc);
+
 	timer_delete_sync(&host->timeout_timer);
 	jz4740_mmc_set_irq_enabled(host, 0xff, false);
 	jz4740_mmc_reset(host);
 
-	mmc_remove_host(host->mmc);
-
 	free_irq(host->irq, host);
 
 	if (host->use_dma)

base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
-- 
2.39.5

