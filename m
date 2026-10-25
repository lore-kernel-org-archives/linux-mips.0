Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918700;
	b=y2gw3p48r0+EcM3tEVPXhkAisSrDM2DU7mqdpBbnLMayvRxBvkI7BYS7di5HLwBse8Tz
	 OlsY4Q8qA3HXIcc94NLuDZaclxKwwjeJjXZj1dbmKEptbLUh2N3XM1VPk/BAORgaJzcor
	 yQz4yYsR7o5oCgMgZ3HdeytqUTfGlrXbPvTRb42sENeQvN0oi/d/Quu7ClaNfRmYWgUvH
	 ZSAD0Ps6AP+i6pN7v4HtpoDDWQSfgio8OQTmyZYzmG9gLzv4/3CXepnyWswPfOFEx54c9
	 NiOK8WwsI4UFy4mLp9UTbuK+5ablXcrqAmhf2+XGbYbJDCGi+raMiGRdk88gs42Ic6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
	b=Xw0HHdD7HAQGTs2mEG8/EQE/4luzaeJXdSgea1xmyMjPvsKdl8JKHqHHVJ12tjuyxUeW
	 uZkCWZOoviZRr60tAjFTF05J0yVuKfHl2bCGA9EJS/8sNWEkHTxH/tQd+xCAmXK1sNw9Q
	 YL1M2qEwe3HMq7+zylvJU8iWCpzq37dxw+xM1Gu9UTVTUT4m3hjpKoTsjGKJLO/Xv5qCH
	 QGn3/khO4IWOVsigTBvg4lykh2IgQXrNBVpbN85bRxxCQaRhxTA886Zxwna+twwqBG3wn
	 0WSZUusVgw2sgBhP3l4V3f6sOH5p86Y391FF02Bm7WmxKk+E1sbtkAjyskFI578mqIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="dLVy/XcJ";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124F606A31E
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9124F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dLVy/XcJ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1251424f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918698; x=1793523498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
        b=dLVy/XcJWb0thYquOmIcYdfzl0P1c2YSLpBRkjuSdyRJ+UUKKFPZPFsfNvJxNRvqCR
         AkSMLKuPjy58EjPt16lzhKSpXMwtLC+q7OKkH1OflLVqZz8hwzBln8NnOpuRlCyF8ezu
         sU487CxMyU6k/qahPzygle3JA9vcUmCNXZJ/6VdEm2P+99g1EpsncYOq8pA1ZYGXMfdo
         n5RmHN0LVnp1Xca/VlP7Jr8a+HWVMN+m8j0n6Ts3W/W4lrIlq0//d0dbtCzLkMctAz+9
         y8KR9BiNFoODPZ827pzXptfhmYnDV3TzjpGnE7TrsWC6nu003Ka3vLNnKkqv1kMpB1Fi
         u3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918698; x=1793523498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
        b=OELE3Qu5l53shaDUoklIO3qXoUdacRV8FOPBM/HDHe765Gx6Yr7qASvd6iwQ1Y+3F5
         77vIwMr0O0sZpaaZQZkI9TvBhbCHF4RrbyLhDBYm+c8OIAvVCG94GBelHZmijc/noHnv
         gz91qyq9B1F2zmQIuXUJd27etLZdFytIoMJmAfv/pfmLH7mNg4QBuL5M/wBaHqyuWyx4
         evObZT43MJOvtva9PEaaejEU2GBzaQ78VCZx/mcX9+A1yCEEriVPxElxbXyHRgWerYl4
         kR2aR5lv2QLB/OR7ewc85+52QTOb3xYPjHiQMgzDzM6HxYHvq6+Q5AJP7eOjV+f4kZQW
         V9tg==
X-Forwarded-Encrypted: i=1; AKwUvBxkfwvJoKX7k3W+3gttosBieXFvbbSXzVTJj4Eb3E+qZB1bPb5opMssf9v1Nv7Gn32mYlU7dk8O65aO@vger.kernel.org
X-Gm-Message-State: AFq9FYIsqmEX8GPBx9Po5xuOYcxBdMXjxC6je8Ti14fiKDuJnJYR1Ad9
	oWWqb49D8QLdlzdMoMB6ikvGxW3PKT9YhGetCdlVKFa6D2iN2Nho9aRhMzQgwu8C4w8=
X-Gm-Gg: AYBFou3vnX5tn0rJPj9qeOQdPz3nZe1toN8f1DakNj+KhXhEMrok5ZbTyXZ5oSEaAWf
	nLI8m/UNkT8xbe0jrnmKh1HfBSjccQ9xgvzDHUoix7Xuul7ucFEQbqqbrRz0H5QKcWDYWwBuqf8
	UvM0vzOm5Ovqbt5CNNB+jSwrwJVZmggo7iEFhlGjpF8NtGEpQwVWdGff15LNmsdB3YHTDpauR1W
	5EE4OEiD/hrQzx5sTwbvfVysg0RIOkEpIZVYOiObWvgp5Ciuhg1uXFuvOt0pGWmmjb6vJo8Qj/D
	rLM8F28Z4Zh0Y5C7wJ1PSwfQCQhnJhqT46Pu82hRogZ2rDkJx2Nb6C8VCm13n/pPkpUfAvWAw67
	n/fb2CnSDUFOM7D6vlfpRcFbUuIkZSJdG54JQaM1NqJ1DNDpUBzDOeZfZ20SmVf5cWHUYx38XMJ
	RWd0+aTwc1ndNkGBOY0inSsX/plBv8YAnnYIIeAzrX9k/7/ilMhmmC4CN5JjZDGyS5Lm6hcy2s0
	0S2sPagNVkZ9eeqR9YNYgGskWZc+qSPPNnw7y6K1dM9zc6qurR2fEuYw/29oaoitg0f89uq6Hl9
	oS4Rc5TfDm9K3i684/NngkkKE8mMrjHFpHhMOzbIBJ6gxm7NMUdvlQRLI2kUBTjcFTq0m4+Shjs
	ODImRGD537/e7+ALhFBs=
X-Received: by 2002:a05:6000:1626:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e4ad232f4mr1415110f8f.29.1792918697894;
        Sun, 25 Oct 2026 01:58:17 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:17 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 0/5] drm/ingenic: Add the X1600 LCD controller and the HiBy R1 panel
Date: Sun, 25 Oct 2026 09:58:11 +0100
Message-ID: <20261025085816.60405-1-olivier@mgcrea.io>
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

The display controller of the Ingenic X1600 is not the one ingenic-drm
drives: it fetches frames through descriptors and keeps its interface and
timings in register blocks of their own. It is the X2000's controller
without the composer. This series adds a binding and a driver for it,
then the panel of the HiBy R1, an X1600 audio player: 480x800 parallel
RGB, set up over a 3-wire SPI bus.

The driver covers what the R1 uses and what could be tested: parallel RGB
panels on a 24-bit bus and one full-screen RGB565 plane. The composer,
smart panels and other pixel formats are left out.

Two things come from the vendor kernel rather than the manual. A flip
also writes SRD_CHAIN_START, which the manual doesn't describe for a
running controller; flips without it were not tried. The panel's set-up
sequence is the vendor's too: HiBy calls the panel LG35583, its maker and
controller are unknown, hence the hiby prefix.

Tested on a HiBy R1: the fbdev console and a player drawing through
fbdev, blanking and unblanking, 60 page flips in 0.97 s at about 61 Hz,
and the colour order (RGB order swaps red and blue on this panel).

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately:
https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

Olivier Louvignes (5):
  dt-bindings: vendor-prefixes: Add HiBy
  dt-bindings: display: Add the Ingenic X1600 LCD controller
  drm/ingenic: Add a driver for the X1600 LCD controller
  dt-bindings: display: panel: Add the HiBy LG35583
  drm/panel: Add the HiBy LG35583

 .../bindings/display/ingenic,x1600-lcd.yaml   |  70 ++
 .../bindings/display/panel/hiby,lg35583.yaml  |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/ingenic/Kconfig               |  22 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 694 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 +++++++++
 11 files changed, 1226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.39.5

