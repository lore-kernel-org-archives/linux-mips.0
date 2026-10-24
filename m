Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819154;
	b=rzyQZ4EDIFKx8CBeKNhao/p2MG5irhxFzVGSXAnQZ1yAw7d2cz/25QFfSGHNIH5tRuZE
	 RikXO80CBfDaQ1FkXL/H4MHtFYhP2RM0y/hcqQ5rSF9V5msGi5HOI9lvNMZnunew0oMxw
	 7aEom4YCm5u4/FDCYtqw415soxdObIWREq9wE7bSFXtpTEzbNPcCMEM4OvA47KXFfDlJG
	 GfS7moRfmgsf/Zw3RZu6bYSix78bRL3DaA91/hKTfR7bjgeeg8SeJFUDFp67xyzTZL4M7
	 EUsX8UOeEqnGAUIysoREmohiSQGjfMdzTRRSCUDlPeGJdO1U/kgJas07cRkxAWmmMqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jkumkssa/J8WgHOu5OVjv01fzxPb25j59RB9TTUY5mE=;
	b=TltPC4yxInfNl6tYUgnI6JV282pVXzCIFxpT8jxPbe6C1hOHRBX3PRGo5ueTfM8w/b92
	 fPFmusyIRjvCJrHg20z09dTWi/lQVNfzQ7mV0HTixZUvfxfk6y0U/vgNQIOdOOhkgRt2y
	 sDmozRfvzfUWbJZFVca6ljROMGDGrJ3CDDlFQLiYdrOjILOya0v3YwpS+psF6ShL+OQFB
	 0e3ww+US2gTJ/jbQAaEZxd8quLm2OoD3w4HQe1G1O1K6c4PEVmxD23fPRe2iTECvqh+6q
	 uAWSYCNF3W2M5BZOzI42Lwt0EHRumTQComEtbfGsJLJ1ZXwoaXWsr4QVfGWrajPH3qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xvPSQxzd;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C7606A31A
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 05:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xvPSQxzd
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so13638555e9.2
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 22:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792819152; x=1793423952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkumkssa/J8WgHOu5OVjv01fzxPb25j59RB9TTUY5mE=;
        b=xvPSQxzd5ymsOXziOKyIaZczaTaacysS7ToUNQA/NVwpAY9aHEBCXP2Nk8zwzDxfDi
         1EDTET4K/+UTawG78DMSzs20t9jWL9R8jWXrqoknKKxVgEj87rH7cqT15O4F5Omlz9Zu
         p2J5R5GGtfWseH8ISJBB4CWCBzsrayJMiKAH7l9yEHRrPViXuJu7YKwPyBk/uLOn/X8r
         HwYnjEtIz8Uhr9yyz6E3kHAyOxB+DxgKyRqQ4xCFcd00YPTdW7hIq5gPyEhGPBmCy+0Y
         L2PtR6LMi7BwX8WkiJ6/rtD96C7lacrEebvpfzUc1ekFVyd3cROL/DfUmLIvh+WxTVO+
         5XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819152; x=1793423952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkumkssa/J8WgHOu5OVjv01fzxPb25j59RB9TTUY5mE=;
        b=2Hp4dfighziD4D+an2TA8BpMNDi75/k7hUnaX3pUX7N1yBZg1qCFkupvG69ZsGaAxm
         rByA6yoPxQBXYakaM4zAdfmVGeSuJ7Z9L9wLSizfluGdRFyEfXgGrqQzXvtFY+KDQcfq
         ql1N5j6+atFFacmNczUFkg1GWWSyrX5GoL0iyjwKYM2VV7WTg9lHLqbYW9W4gMQPi3JG
         u4Zjj/+pCMjvNe2leoGwABr3IqCJCWQlGXltvFexgkDsco0PuGJv2hBfKKsZNy645Jf0
         qSEwdIBw5l9TByoCX1m3zBsqX+fFiXz2hw3asdZw8mWxlB5oDkaLtCZPq0V6sFg5ifpQ
         BvuQ==
X-Forwarded-Encrypted: i=1; AKwUvBx23R+iiNQtagWzjStXKtLG4ghXHXjYTv7s/16ruG59DQEaaeLLkrP31BVaC21+uV+pNzQ4dfHEq+Z+@vger.kernel.org
X-Gm-Message-State: AFq9FYIo9JUOc/ef4YUIOfidsmcMtKGQuiSYizJefP/jMSstKA+f17DJ
	0G4qGkcM3OHSIOyME3XSz48O80JsWQ2EMwGHAVRaLlI3EiBgpsND8P2J94IqRswDExo=
X-Gm-Gg: AYBFou15DuJfTNLzsnBSuHi9H4kytyXpQC8qSvNeFpXylW8NVFal497rEn0/EZrzZUD
	HErWDipiJFPEkiZSB4aFhTQYpOiwZEevzQqx32J0j2LnjBey5x0R570VWt3ofhMqM2LzKHqqqwm
	FSb37A0+6vm6EV5shi75QinC2xvIn59dmqNWLh2i6tmIhtaBNxHn9kxEEALmU2Zt4rSnPj+zhJx
	9aZjuelnivEq7hglA10j9qO7SGbMbrIrgDbi+xdmaMkQCLIO2Ts1sbQAa/dSKH8hNAYVkT98bH+
	JRyx/RKwqkAXgQnbOV97CeTFkScuJlhPp8yPlD/3T5/a3y5Pgh/Y8oFNF/nqyo5IGSyBr1XQ3sS
	8zUyo8mrQvQEupV8vs9mgHdmWDUnb4zWHzbk++i7R4C97pkDlkunXAGEwgNmA9qAfIHFdGzIyGW
	UcG1RQumIymIs5VAhX2WgQxrP9hqjiy6sZ5dSnG4+yLMTsgPppKCwnDxl6hsxDF8YcTw4W9eAOw
	pU2FYFp2gGHCE2e2pjKKB3yJqAsAij7EtLgJRzjYsiXuFtNKN+o5D3d9K1BeKFng5bxmzbvTudF
	Yv/UGKg21FcQL6UKt2SopMLhCCFBE0FhQA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a35aca186amr13037915e9.18.1792819152402;
        Fri, 23 Oct 2026 22:19:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm35997685e9.1.2026.10.23.22.19.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:19:12 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-phy@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] phy: ingenic: Don't disable the supply in exit
Date: Sat, 24 Oct 2026 07:17:56 +0200
Message-ID: <20261024051756.79342-1-olivier@mgcrea.io>
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

The supply is enabled in power_on() and disabled in power_off(); exit()
disabling it again unbalances it. dwc2 powers its PHY off before exiting
it, which warns at every probe on an Ingenic X1600:

  WARNING: ... _regulator_disable
  ...
  ingenic_usb_phy_exit
  phy_exit
  dwc2_lowlevel_hw_disable
  dwc2_driver_probe

Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Tested on v7.3 on a HiBy R1 (X1600), whose PHY supply is a dummy
regulator: without this the warning above came at every probe, with it
there is none and USB still enumerates at high speed. Build-tested with
W=1 on phy next.

 drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c b/drivers/phy/ingenic/phy-ingenic-usb.c
index 7e62d46850fd..d8e5ef302b74 100644
--- a/drivers/phy/ingenic/phy-ingenic-usb.c
+++ b/drivers/phy/ingenic/phy-ingenic-usb.c
@@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
 	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
-	regulator_disable(priv->vcc_supply);
 
 	return 0;
 }

base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
-- 
2.39.5

