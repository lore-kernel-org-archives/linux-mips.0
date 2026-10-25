Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955788;
	b=wmf+lmN58MvWy2MoEE/ogiWcd0TggeaMsAogb2j3F8ffQ7AgUsN3fCUcIpbkNQaMRaPj
	 VnyuJOVx/MMEkNMo0WxssVspeJ44quVHhM/ED9f4iayMLAuunDTxe5xxhmunyX3Pw/RPG
	 UnDDnTtsRNGrgF2pBWno5oIoMH2eAztmWhGTgAiamkaJMal6+o2mBSo8jDoeSU7DqiS/6
	 X6vVzUafJ8OyyTevG55go/j8OBuLkhexbsO5ZeCuatLjzc1gVGmeHt9TmqpEDHngv5kzw
	 e8wQ9oG1lIl0OwePZlwKVEZPtdTTq3isvyH4dBXy3XSk7rdWGRwWOuB6JMzA1mQGOrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
	b=o6sxe0sUuGN0mu9WsqZvXnPIe2doL5koQzqDo6+/3Mjc0qCC45QVZk7gWlOzLEYtNc3C
	 6v//hGYdClojfi7PyIDdH3IYBk8o7kHFWgdwzcsYjQsaKoaMB5+HvgX20bdlA+IPFXHVq
	 EedjPvKx64czAXIipRnt2Bmxv8a1uYDtkWimOo7ERJ+q4L2LiwwSkaD3+GpHPcd30Ckex
	 C86ubRt6EZ0CyOcdJpNKhrLfg4mptnpXV+AMMaJrbRYrvsboI4cX7Sa5sZbUv2q1EEfWC
	 UTRnnA6IGDOr15V8yMPZY/S9sIbfMKLTxSGLSHMKdqsQDaJkGinflV6w4H8u1TuSIzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VTvXvSik;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8D606A31B
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B8D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VTvXvSik
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e4831c028so731777f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955786; x=1793560586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
        b=VTvXvSikLfJGslamcvpxzCJTu9WkCqjiJqpiEmRb3NyqMiAEDAZqGiMJOtgonAhvVe
         ghVqAx1FnE16xEaww+LmUM3JTFBWGkrjBFsQlyG/IdXi2YGFwzny5206DDVamb8N1MGh
         cAfRYHnoGVF63+UjNmuJm0Sn3D99fSfvJFaUV2DjMknY2UjvCIJL4FyhRSOrznDeFOBV
         liWh36MSsxs/4AcMi2HmaxivN7SLlfqr/r5HQIp+4u0Asqk/CSyU+BluZIGLCmNB28TC
         YEoChXByW7WkhkxR9+w3vExNtNv2TtfBR9fafQblnxFRZfD7O5NPhGQo187Ak4APjsFn
         sBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955786; x=1793560586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
        b=yRg5M/OJAYM7T+oWIQWvaPCd3y/TOwczDCfCqBRdts1XgYD8jZuZ2lBMGLw0b5BfBE
         LORkVB89JcTJiuvPZPmtYMk7dinEQWB12eSYCvKStoX5j/to5sjUwGzIYN6NnyxZbyQT
         5Cj9oDnOKNf8rQPgKfIhgfDNJHxLyzH/savASeIWTRrPDJSEmSQobsQlDonsSyJwJBy8
         gPU8yfb3CYiNUz0iYuxxpi7ryafC6oBXn6rJOBDBAr5jbUVn/2lLbnoZzNZRItSxSzoD
         x3Zwwjj40S7sAl6Sq2ZGcTB9A+qOn9cWquD9YX6ILJfztjAVUxSIZzsaLJAbUwX0dSBs
         yfiA==
X-Forwarded-Encrypted: i=1; AKwUvBwQHXqUHSMnfIsXGEwFYHVE6bhXWwOy8Wy/3/Eq9Bb3UFc+jftOHD7PPz6lDMzt98WlqyQVX514AEaV@vger.kernel.org
X-Gm-Message-State: AFq9FYKQZmpmqSyWAaZuOcdbujLpGNjc7LmLzmQM978E2CMpBLR8vhZ3
	1dbnA8Dj39pP6I8E4CwNUaVzI0e+AAHJGE8lFDudwO5r6+DVm4YD3QDyLdElo0zWhxo=
X-Gm-Gg: AYBFou2lL2in/ro5EaHbpkxI+ixNdyoIVJw13SK+FwOKzx3nwlDhB2JpT5GLeTq4aL3
	jVXQDKn51VkBsnNBKHt72U9065XUQqiqSJGAt7WOAbhLC7q/dxOJeQmbNZn/j0LR59aeaOwxiEE
	kq8nDlW3nuPYfOJwKwcvZbZhyA4gKJsPcnkFWfEp9GuzlshmWfKC9+TFmVb8QK5quz2pqsNI8hY
	O9Q2vT6jaR/GLskhSP0My4AbwTlCZhWaFvDbin7ui+nVLMz0A2ENi0Z5u1E0CHaWdDxJlGLBUG3
	c9+7OF4yXY8ulipKNLtGJM0TXkRTZ+uOO11FHRSKLe6qZ8F+1CLBZZyCM2q8WKFcNf7oYYrg5NK
	0AS9aQyjn1JA9Sx2fa0Hcs7UCUrbm04GB+Zuf1S3rSqWSx0BoLwyqku29CwjItyF7jSgQJNmRzB
	XD29JJwEH70U0ny0fXfvomW9IFfyLNHFHi3uMfYHjCq3dLwGiN6YTShnardPssU+73tlhMAsn5M
	kJ/DM3YXiJD2VIe0ARTmH8h9lArSMSN1spT31KBFC+eW0/T/32N3SozZwJ1hS6MSd0i8TYp3fx8
	NRszxvWfRf9HP0QNGgzg5xUN60UV8RRu4/Q=
X-Received: by 2002:a05:6000:4b04:b0:48d:fbe1:bb17 with SMTP id ffacd0b85a97d-48e3eb7ca4emr8944736f8f.41.1792955785830;
        Sun, 25 Oct 2026 12:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:25 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:22 +0100
Message-ID: <20261025191624.9219-1-olivier@mgcrea.io>
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

The Ingenic X1600 has a PWM controller of its own, separate from the TCU
timers that pwm-jz4740 drives on the earlier Ingenic SoCs. This adds its
binding and a driver built on the waveform callbacks.

Changes in v2 (both found by the Sashiko review of v1):
- A channel that is off with both counts still loaded, as one stopped
  behind the driver's back leaves it, now reads back as disabled. v1 read
  it as running, so asking for the same waveform again didn't switch it
  on. A channel off with one count zero is how 0 and 100% are written; the
  idle level gives which.
- A clock rate of 0 is refused with -EINVAL when rounding a waveform and
  when writing one, instead of switching the channel off silently or
  dividing by zero in the update timeout.

Tested on a HiBy R1 (X1600), whose backlight is channel 0, through
pwm-backlight: brightness 1, 25, 50, 60 and 100% give the expected high and
low counts, 0 and 100% switch the channel off at the right idle level,
and an inversed 250 us of 1 ms on channel 1 reads back as INL 0, LOW
9375 then HIGH 28125 with the clock divided by 8. PWM_DEBUG stayed
silent. For v2 also: channel 1 running 250 us of 1 ms, switched off
through ENC directly, then requested again through sysfs, reads back as
disabled, and the same waveform asked again switches it back on; v1's
driver read it as enabled and left it off.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

v1: https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 +++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 280 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 00e917df050d79ac26ec700717680ad6421d2808
-- 
2.39.5

