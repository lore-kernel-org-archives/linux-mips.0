Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964079;
	b=fpn1M0SL7SsHyiZz7/EPmuwlmclKrg8SB0eSw6cNsuNQoIHqP3szpghl3Ubgraf8Vkva
	 IQJPXY6Mbi/CbktZKqRNDYDq8l820SzuuyGL+C6ea1YemaBIV9uG59cGYm1Fn5ff4jlL/
	 +yAWsFCRFMMZfM3bT4NkfPwzPGYAlkQckzU9sPXpB5AAsn7/+f0VT7Nm+GbaAQCEJEeCp
	 zsQGMPpNU2LQVsyR0ezljMYETYa7MbsITGuLmTGEQOJCU+Ig21qo/ZtjWTrnTJjeGXQ6Y
	 5mTEWe1S8jjjJFWf2e7AjO29BsES068Lv5xIzQJj3cw0E2bSjI72ICf8UsUH8Rvudwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YbS7SiekKOpCPQzFzLejVy7uNAuDQrZb4aNVnuN+e7A=;
	b=F1i5rqYuFiZHboiNXC3wmKurv+rWGM5j45sxxLFIqLuTrXeLbMQUwussvTETA/ZSfdZB
	 LGMB3keU8dBbZxRu8hLO2LtmtNITt9wSrCdp3f26qbyNIy9V+Qsm3iQMsku20crUZOS7p
	 7uUVejs49uF0pb4Er9UoSJ1pcuZ+NerS3DINXHFkVNOGmcibOqja81SepeFaZkrY0ejUG
	 CoG27aW6Dolh27ChzaHU8jvbYvFzyijZgD8U9unysyalb/SeDeQsjDqJaWGm05pMJBRe8
	 K62W2IiYdGXXKbCY4GRdEKfEnevhZ90hs6wnq6TYgvUQyw2SkSeE/VDdC2HRMBB2Tmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WCtHerU8;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6EE606A32C
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 11:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WCtHerU8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4655925e9.1
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 03:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964077; x=1794568877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbS7SiekKOpCPQzFzLejVy7uNAuDQrZb4aNVnuN+e7A=;
        b=WCtHerU8FixV2pyNL7qSvB96nCGn0xqWKjMGu+wuMUTbAjYSnEXBA96VxrqVwKlYof
         33DUlPY5C1wy0JyB1ACrL7ljF2VqRJdMqcs93Bg4fhUZ1IH/zZ2o5xRqArF97nEvRB7h
         r7cp0uoXx8UmkRFqPWuC6XAH2z2aRkiqarsCF/MHwSkZTxjq6z6ou9jPxGaCUeLzTuRd
         1eD1NMJzf3dqnzn7WyTd3yTSMSzTHcjrDMCzMfCyZNtZbDUgscX6JR26FDbVLlYN0+o7
         qg8su5XCNfjJBmv/MIMe3+M6wa6TNBijQl64NyEUJuL0oz8WdNMQw9cy2a4jgwPL42k3
         kVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964077; x=1794568877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbS7SiekKOpCPQzFzLejVy7uNAuDQrZb4aNVnuN+e7A=;
        b=d83md010O0CoRKaq0p0PPYhgi+9fWhgMcu0fjq8qvf2cthmll0mtbXaNDTkOUDZ81p
         2ZlhINtfXz9nWH0PFhskMcoFlCotR2WMUO+tVabDTTOWWZ4CHfqxo576RYjjTL6pzkFA
         Oa9pWzESa50fZ+JeilKRZBz163t++HcYfkhGCtPfw8kr4wQhFnk7A49l1r8LaLGBXemr
         2yuVC4ZxuA0iPKX4DdrX1gRkpzeKOcZU0PHQaHj/6DUX+fGanv2vWo22xixHDc4jyuV1
         BGj2s7yEW5LnGl3Y+KGKSb2VrIN+Dxb0MhHI7DrYxfjbXl33mts1hzG7NxR/AgbG/BEr
         Wg8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmKlxjle8CInqp56/sQMXys30uRt7PMSZSvZ1jMLgiM+sylHDDfr5fVUPXlQMWzDnn14loFSJZbCH3@vger.kernel.org
X-Gm-Message-State: APuU4Z/cXUTsDRNRGn2yWgCivv/xpG5HvSQ6aP+lEz0Rj6GI04JE442G
	bSoX3C3FwA+DsFY1Sn0nuJkUyh2vZ5BqGR3F2MefzWb8sle8az1WY4Nw7mUqrLSNjK8=
X-Gm-Gg: AYBFou0PR/QP07QSthJZe5BYyqdRgmXVd8ert1/eu04lpwAMt2TPTcHkC0WIUFSe9Gn
	IGH4IlsGz4DwZsSc1ggp6UxypRpU/zyy0MyvVFkcOVcW/XzniOsVCR/Cqvw62DqMtiSpXZCXiwZ
	ww71Z2lAka6xE8TeSJa/uAVTpWe3rMHS76lOFz8O/PqomPbu0gdoCmy2LuxkfLxVXzSathOrAO9
	Fl8GZCPHP5zVdEVIqDwhFUktAPsIqQrYO6yLyRsiLQfSHX/qBMokisOcxoXjNpLehQ1SA2Odl/F
	rrc13flUFJnNWfmnAuD5MKf70efJ58VYMyhdFLD+6dyAPPJ5mzqwASBc5egjUiNR90O3hYDkmX6
	MntYE0Cwt+/Egp8BcHwH2P7lKQv7u9ev7RstnfA3gThykr0Goth8frL35viyy/qY+oLZyUa16sL
	b1SqRKH5BIcaCNHM0TYxsnblQEAtm9llKZSFQPaotxgrt6+TL276Toq8pkb3ou4Ug/7+1Jl/xO+
	F6BfwIoZrtRJ7VggXUXoPdpCG/x7+Hc11wimKPOznxWCXKK3IdPMNX7jPRWS+bcPMHEwwJN7wp9
	QEZLDYHT1jBiPU6WEXnuBbXTb5IpTJ/N4QPSlrZ6l3AUUUIarYpAxOpNZbS7nNM=
X-Received: by 2002:a05:600c:a013:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b6e091ed5amr31326985e9.16.1793964077287;
        Fri, 06 Nov 2026 03:21:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:16 -0800 (PST)
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
Subject: [PATCH v3 0/5] drm/ingenic: Add the X1600 display controller and the HiBy R1 panel
Date: Fri,  6 Nov 2026 12:19:55 +0100
Message-ID: <20261106112000.1612-1-olivier@mgcrea.io>
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
timings in register blocks of their own. It is the X2000's DPU without
the composer. This series adds a binding and a driver for it, then the
panel of the HiBy R1, an X1600 audio player: 480x800 parallel RGB, set up
over a 3-wire SPI bus.

The driver covers what the R1 uses and what could be tested: parallel RGB
panels on a 24-bit bus and one full-screen RGB565 plane. The composer,
smart panels and other pixel formats are left out.

Two things come from the vendor kernel rather than the manual. A flip
also writes SRD_CHAIN_START, which the manual doesn't describe for a
running controller; flips without it were not tried. The panel's set-up
sequence is the vendor's too: HiBy calls the panel LG35583, its maker and
controller are unknown, hence the hiby prefix.

Changes in v3:
- The compatible is ingenic,x1600-dpu, and the binding and the driver say
  "display controller" rather than "LCD controller" (Nikolaus). The X2000
  and X2600 manuals call this block the DPU, and the X1600 manual does too
  in its register and clock names. There is no generic ingenic,dpu
  fallback, as writing-bindings.rst asks for SoC compatibles: an X2000
  binding can fall back to the X1600's. The driver keeps its file name;
  splitting it for the X2000's composer and interfaces belongs with
  X2000 support.
- 2/5: no $nodename and no clock-names; the driver takes its one clock
  unnamed (Krzysztof). The example's node is display-controller@.
- 2/5: there is no IPU in front of this controller (Krzysztof asked on v2,
  Paul answered): it fetches its own frames, so the output port is its
  only link.
- 4/5: reset-gpios, backlight and port dropped, panel-common has them
  (Krzysztof). The example's endpoint points at the controller's new
  label.
- Krzysztof's Acked-by on 1/5 and Reviewed-by on 4/5.
- Rebased on drm-misc-next after -rc1.

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
v2 refuses with -EINVAL, while a full-screen one is still accepted. v3
was run on the R1 with its node changed to match: the driver binds to
ingenic,x1600-dpu with its clock unnamed, and the player draws.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately, now at v3:
https://lore.kernel.org/r/20261102201325.29507-1-olivier@mgcrea.io

v2: https://lore.kernel.org/r/20261025191640.13592-1-olivier@mgcrea.io
v1: https://lore.kernel.org/r/20261025085816.60405-1-olivier@mgcrea.io

Olivier Louvignes (5):
  dt-bindings: vendor-prefixes: Add HiBy
  dt-bindings: display: Add the Ingenic X1600 display controller
  drm/ingenic: Add a driver for the X1600 display controller
  dt-bindings: display: panel: Add the HiBy LG35583
  drm/panel: Add the HiBy LG35583

 .../bindings/display/ingenic,x1600-dpu.yaml   |  61 ++
 .../bindings/display/panel/hiby,lg35583.yaml  |  67 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/ingenic/Kconfig               |  22 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 ++++++++
 11 files changed, 1263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: 41ecf852c07391687beb129e12a231760b5d783f
-- 
2.39.5

