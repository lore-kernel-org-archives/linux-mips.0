Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955803;
	b=KmW9jcouX2wSaADDn/fzUth3VS767t0fN0LVffZxQNCwhNfL4q7wgWi82zYwn+POcF/j
	 iY+myUTv5F6DcWrtaKQVHHFktJvnR1O1LAPA9jXLOfHdQXABVQ7uE0dITr8ouR1fKWdos
	 cqpqJ7IdNV41wpaxRn60OPMHM+82jhXYHdvUB6Du0B9nTAkrOB7t6Io0taBqieZAbnKUV
	 RPuNrMNrERlZYmuq6JA/Ms8T1m4aX6CIGid/idRIpnd7CeWMQYkyGJ4Np/C/uULdJCJuk
	 P/K2CSnvajjMQCFVYW9G0IsiLdVzIASY5AGYz43yhEfBU93Z/tiS+dWg7EW3O/68l7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4nx2+DECqgeu/AGfuDB9I8gflqDb1c6vzu+N1VHtydM=;
	b=rOp0yTEBecE86a9eQsfbvx+nWiowlaB/LHuCweNSt1aPaDAk8G+ZLVeUSa6crhX8BnwH
	 eWM4w/CGGiWqH1QhluhfNZcx/qtuKsP7xAO3hCpIHDAlQxjva35QiNzt4I12f3ycDy68R
	 8Pu4qQT8mQgwb6W+wKRGlt8t9PrhYMHp2skZEj0GC2LCDs0mKPFnaVRN+InGEqNQTgZy4
	 fuZiebDaicEex19MXNIfO5w1ODz2JlIsEA3UsOhFcDzaJj6+ENNPqs4bZK+xPmeoKF0J8
	 LxwEfMB3DQB2alvmIUyOeeQisAsUNwiXtv+Kz8WxnUkCqefGPuyP7F6dhdF20T5fMNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T6ddVQ7N;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB4B606A325
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB4B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T6ddVQ7N
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so2718895e9.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955801; x=1793560601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4nx2+DECqgeu/AGfuDB9I8gflqDb1c6vzu+N1VHtydM=;
        b=T6ddVQ7N41HrejcDkSqEKiLdWbytoiYFAaZQwJEhlWF+3UF5FgRjNSqseXWi8cw/Et
         gT3TvWWwZqpgjKUlSI1ljMYSZ7gJK42IKYkn9RFzN5/mJ6hpQL5/5knbAwngdHKQo+rn
         hDmOwP4IweQNApCHVexkl4AW/vLbkiw7rjgffY9VSSQLgmRLM6Mhki6FHGzJZ6T9jvpk
         smOUxq/cvdGfmd8Ejo9l0K0NzOvqXjnFscI5Ml2HsYXWb2k0WgMMPGeAD1ReesA5TlHO
         C41r4yifaN50gxYH0X2n+MQVy1XPhaoq7DqhHBOEp/WP/uNxJCtMUQWoklpiSQd+bE1u
         XxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955801; x=1793560601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nx2+DECqgeu/AGfuDB9I8gflqDb1c6vzu+N1VHtydM=;
        b=vRmyEWJxuL5ez9iAHHGPsFg9KuaYO+7F1jMMtd48KX9rV7sz4ntR87LHH/QJZMYKmA
         vSSz3vZj5Zh2c8vO+mWOuWKtzfVz9hQ3oE4joYhc+wdtyqVyitgC/L0sJBfMYfb2/8PY
         H3axVIjoZWpXUn7wOvmhqmcsrOlXycJDdiHzePpe7b8TYYfpMnP2roGVKYN5UNoUjt57
         HafpxuZYwqyNMvIODm+sf8HJH954Dwli02zyEQ6jk2mU7jUl9V1GnxG3mEb2JbM1aneJ
         JeMo2N+ylqlO9rcScBm6i/dL1i9NbJH8rYBgkyB+wHRKoWsDjdU8xyUIsupOV4zo3bCI
         mmeQ==
X-Forwarded-Encrypted: i=1; AKwUvByi0yUwhr4wiYV/JIQ7ZcqXU2UgsvKusRJ5L4+5U/82/cAMPn7B1H7K7jauerELRQlZMzRKUEOKVfnR@vger.kernel.org
X-Gm-Message-State: AFq9FYIfm8B+dWaz4bDj0UoTsivfXAZCewuyV9KVb+1CLcvH5c+mu3/n
	yDvaVYHyiXw+/+Go6+sw6iHIzgT8TLVw8xcHMJLWRM/QBwWQrD/i5Dzz2xdbG33vGLY=
X-Gm-Gg: AYBFou3K6Zd1hp0Kfxbo5i5c8zdZryGO6Xf6rmQoDfq8919bxDkBIKapyCk8Z/5ebZ0
	BYBiSwXL2eIjN0qlRsbfA1uul+f15WY0WdCQZMpOSTPIY/iYCr8NRkq5kzvYzfD/v7Xb7pzqB98
	h8YrL0u3HJvHZIBdqvLu9eqieKNLcCTwnb4MfP9nb2Op4pTznl2rTLEi+DAEkccpjfn0ufjsSBJ
	EvDCLlv8IN75TRfvT3m1r5kYJjjxxsnHdMUtiGP50AHnr6OrY9vmCuahRa4O78PZFkSZaA1zgzg
	zENRr9f0+gqTe+XREr4usbz/yUqH3bydmQO2rwGuFqEk4nQLpJYXEJux8qgcoFHlGYyVyY5Y7NG
	orlOaqVmE4WN7/UZ5nM3xauCww5p5gDbaIxINLZ+IjbKlC3jgpTV2m3SQzIxpgMzjGSqzHrXgxR
	OaaN/M9uNrMP8wIRGQHhz7tDz7kTyo2rlpmh5YAJ4ZCMbG/gCBz+W/3oa6uWcl28UfQxJ42cAUV
	P8xkgImwfG1xrh1kvMD/gjnBoW8TI9ZjDzE9IOJIO4XC4gfuHh2Ot34V8OQpywK/F+t7Gd6fBPp
	xWIYaRUgzfHdNQ==
X-Received: by 2002:a05:600c:4e87:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a35aca7643mr101451135e9.25.1792955801092;
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:40 -0700 (PDT)
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
Subject: [PATCH v2 0/5] drm/ingenic: Add the X1600 LCD controller and the HiBy R1 panel
Date: Sun, 25 Oct 2026 20:16:35 +0100
Message-ID: <20261025191640.13592-1-olivier@mgcrea.io>
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

Changes in v2, all in 3/5 and all found by the Sashiko review of v1:
- Commits wait for flip_done instead of a vblank before the planes are
  cleaned up. A flip's event waits until the controller reports reading
  the new descriptor, which can be a frame after the vblank that v1's
  default commit_tail waited for, so the old framebuffer could be freed
  while still scanned out.
- A CRTC being enabled sends its event from atomic_enable(), once the
  controller runs; v1 sent it from atomic_flush(), which runs first.
- A plane that is not visible is rejected: the controller always scans
  out a whole frame, so v1 would have read past the end of a small
  framebuffer placed off-screen.
- atomic_disable() returns early when atomic_enable() failed to start
  the pixel clock, instead of touching an unclocked controller.

Tested on a HiBy R1: the fbdev console and a player drawing through
fbdev, blanking and unblanking, 60 page flips in 0.97 s at about 61 Hz,
and the colour order (RGB order swaps red and blue on this panel). For
v2 also: 120 fbdev pans in 1.95 s (one flip per frame, none timing out),
three blank/unblank cycles, and a 64x64 framebuffer set on the primary
plane just past the right edge through SETPLANE, which v1 accepted and
v2 refuses with -EINVAL, while a full-screen one is still accepted.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately, now at v2:
https://lore.kernel.org/r/20261025191624.9219-1-olivier@mgcrea.io

v1: https://lore.kernel.org/r/20261025085816.60405-1-olivier@mgcrea.io

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
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 ++++++++
 11 files changed, 1276 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.39.5

