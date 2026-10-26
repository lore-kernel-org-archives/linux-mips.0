Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003869;
	b=fNrkfqFtA+2eg04eJdoQ2dXtOW6rYx7muMcFA53zpET6/ijiauEFELD0cz+ZBxKEMFHF
	 gGpylW/TVUpRPKJPbeuotGrnQ6kIfbIC24dl1xVdajIBBG3Uq9Q4/LxEcBhFMEcJXjlQ0
	 Ljk7VpTEGkQKgdExLRHoojkVJ7jWRfZprJtz9yjknry1QguBXBajnUWMHFDqnytTTWuc6
	 PWydhTW81mQDDlgS0V+B6D75GAxbvGGEt5IoW1WnVfIjIHL6vXH5V4u/CZjXGET2XC8fn
	 h0uReMnI8gzducfLimlz4tbSrZHDspCjrUTA8ol/YSvaHA30jo0FD4RW/JTdp3tttyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
	b=WDXNXF02pLueXucSPOGCdkGGVRjUn6tewW7cyv19zGLimmlzBUQorHyUGGDoOiKfVa2x
	 1eR+6Abdx3sMhl5kf/S1b7eOTYzD8XprjD2nUxati0YnmDJCpL/gXuA5pv6DjKfhYV6F+
	 eE6W1DB+oX+gWacebg7BXGwCzSi3OJ8qAkOvqrwfAHDcmARBG1nFIY4Hjhyspx0+6Q4kZ
	 kojbaAQiSo2SoPsjp8GIIGJglVn8TOTHBC5rTIdMTlyBL0HAoZtvKDIEv/bIscC8lcVQ3
	 9ze2X5yVijX6R7qy72Au75MVXStFf6R2HKMKmX2EDY02XpnfWH3hlqMdukTbWlumnfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBsIi2dB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64816606A31F
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 08:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64816606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBsIi2dB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0728so618845f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003868; x=1793608668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
        b=qBsIi2dBdH7dA6rq5ePwsw1KhbbX7/GTANSCFjSkBKYprl0XlzFBnQ813b4EXpOedd
         jHjGq2ZKDpPxVtnmckN1HCLMAVW0lbzGAjU6C74A2CGBHcA0wlKckkUo+FuA3jQ5uQh7
         d0pf8I2mcBWArLgDtcf4wB66d6IQdntMYP5jEzquTSfY7FS9uh1MlN5nvY25hSczip5F
         pZ53jHutnqOFMpQJ9niydqUe0V8uM63NCXf4pxUqo2TpyYa0dReoj301BixIa+tNg7yC
         5bDIZtFeVIP9RJLhpL8FwqnMGa73Avd6xWvlNy3q5um49If4pY3KTri+EyHkDSZ/qhJg
         VxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003868; x=1793608668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
        b=d7WK2rKHX1atUEtXiRPP1aTYtVqT+Tjgy9/hxPdzM+ph+H4QiW+mis7OtsGAU/B+RV
         vO100RWSA4+RXZ0FRCOyNMyrafWUWUkq/s4TshpQT294v0xPgl/97cqfcrbHveDZ8f7Q
         6k6SavBmWyN5ZN+wNIM8ITT/iBmI2qxqbIJALvpd54cfLPInrJaxGMXMjpiG3uOl/SdI
         FhrRdcPZNvlKqqZl7+ZshcNBBPjML8Z+HL6yb78TqJWJXXE6ASxmQYRG8PRi18OigIl6
         v44/imgVtS1Zveepr0ubJq1kxFNOnsNQCzaHTa6cUYEWzxJP+ZFObjYlIetzBz+kiJG/
         CGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwQyduFOzo6ZuaevEb9UMUXwfDRIbluqqVmsCUaO7rwQfkRc7EmfPdQOzbeP5Axxg2z4kD2I8k3N/M@vger.kernel.org
X-Gm-Message-State: AFq9FYLNjmG147genI/zDzAXtLFSoZURpanaP3fi5u4ILNltc0Ohacn6
	p8sskvbbiiB0NdWnfxqpLZE6Ex7cHrWWiI/P0lgDNRs8ir809BqJiCKPmxz+5Ihk2V8=
X-Gm-Gg: AYBFou06p8WYo5qQoXTEZflYRDRG+TyoN6R8crhyOT6M9M8xnHhZfO1Bm1ISTRd8S1g
	HzxO5TJNf3wEVnH/6YS4EwQ8kCMv3z6RTHDm6fNzWWQDdeS1pzlOG6uXjUxKUD++mL+EaiismXp
	B/UpmunEDzIXbUN2PT/TwkJmdWPdFgJQJn4q0hsN2ATEJqrNhIILvylvMWfG56fnO7ee3dySxY4
	ph+2pyx3kZC9mWUCZvSJsgj3E+1zq1AfDHvikZJrwhihMu58FULifkvecGSOcVIlaUVrmtxQ1au
	7YY+CIvjLRnUQxpcw510wixEuwL6K2jzBTIr9NXEuFnaALTBgpNtmp9EjwQcHzxbxjLi/9jC3H5
	hU1P/6Xto45wM15YTBmPMbSHR1ZVAqLQBF1myH5y999IlBsqsT7qzd0BbGzrP8YY/Nwz0T9/mVl
	a/ktcDvyQvjahjNpfCXmEEbgTB0L466EmsIH32dX/BYHsrGxCLZCKtYjU4wALGn8XLesiHdUpUB
	4vPjkTfB8uiXSYwFxa8nB5p+T3PV1iryalaoH3ScVesxUEGQlfm0P9jhSJUIHi8UTqexJCza6dj
	DZvJTF1M6F+1FA==
X-Received: by 2002:a05:600c:4f10:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a35acaa4a8mr111672015e9.27.1793003867665;
        Mon, 26 Oct 2026 01:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm15091889f8f.50.2026.10.26.01.37.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:37:47 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Mon, 26 Oct 2026 09:36:29 +0100
Message-ID: <20261026083631.48406-1-olivier@mgcrea.io>
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

A driver for the SAR ADC of the Ingenic X1600: four auxiliary channels,
12 bits, one interrupt per channel. Tested on a HiBy R1, whose keys are on
channel 0 behind adc-keys.

By their programming manuals, the X1830 (3 channels, 10 bits) and the
X2000 (5 channels, 10 bits, one more data register) have the same
register layout, two results to a data register. As Jonathan said on v2,
the X1600 name stays, and supporting them now is welcome but not
required: I have neither to test on, so this version is X1600-only, and
a chip_info with the channel count and the resolution can add them
later. Nikolaus, if Letux has either at hand, adding them on top with a
test would be welcome.

Changes since v2:
- Cover letter (Andy, Joshua).
- MAINTAINERS: no list line; the binding's path in patch 1, the driver's
  in patch 2 (Joshua).
- Includes for what the driver uses, copyright line, MODULE_AUTHOR(),
  reverse xmas tree, open-coded return, no message after
  devm_request_irq(), a blank line (Joshua; Andy on the return).
- fsleep(2 * USEC_PER_MSEC) (Andy).
- The ADC clock divider is now even, as the X1600 programming manual
  has it; v2 wrote the divider minus one, as the vendor kernel does. The
  divider fields are named as in the manual, and the two clocks only
  repeated sampling uses stay at their reset values.
- The probe comment on staying powered up no longer names the keys
  (Jonathan).

v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  60 +++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 242 ++++++++++++++++++
 5 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

