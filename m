Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962466;
	b=TYk5S3kHV59QScsWTA7oQXf/FNhEeATlcVZ6kBrIOfB82PCw9IKLpJ8zfafNf5RF3ahq
	 setU8CCNOgeRrgvmZBTjuKuMuraw1qdsXG1ZpLIikssm1pcP23JQz39F1oNBXQsVCn+I5
	 RoXCmHtbGK8fsqwrGsQm+4ei1L81f2peDz68lafv+HVVDiaXXvQwGJr9xq5z463TUS1LF
	 paG9luUeLzdVsUtdRFNcPkTH9pmla1kien94LusA4AbHJDNw5lltRyvbAeSLebIzvuOSD
	 g0Cy9vHYFHyy7Naz6ADydmuiFW5KEFCHZqDt2V2ke7+KWCr1C/K6ZuWjRnvCWFlkx1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hoxUd3hRuW/M/zzqlfuVkM9AynBQyThAepuKiPfwlVg=;
	b=3UOdYLpfbrVtqCweaK/aEPRa3UYvuue8AC2YexMs3WjIXN5kjJKxttKXbF5VUTzEjBtf
	 jSboRGuVTTRb5IQfO8AvpcvBnqxhw64jJEDi1VEZlYmj99LVF+qxW8O0PNgRal33bdvFq
	 yDDf7gqCpddfixpph3d6oLjwmLIJlVTx20keh7rAdJXy4IeuBcTqA9ac6UpozCbwKrTbI
	 nPxXsWfNVNunuDw2RLRTCVvr1w4SK5e7dYnrv7eUqtCRi4nqjouFxVj2v6dhmzy89EduZ
	 ILRtoayZj8Jnz5S4cfgKW3ldqvjqh2z4p7y+j32+ArgKCsNkeNHU2tKsMLIbkF2W6Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rwiGNy97;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733E8606A32D
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 10:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733E8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rwiGNy97
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so9081495e9.1
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793962464; x=1794567264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hoxUd3hRuW/M/zzqlfuVkM9AynBQyThAepuKiPfwlVg=;
        b=rwiGNy97lrK0RWhAzbBeqmO6XNHzjmv2DUJoYpzvALL5U33ZujML5HisePUOeMqwG0
         E2rha/jAdn6t3PnLV4tYgHgn57aOBfx6RBLAmxeVEpXz7scXB9RpeafoT1YyTpZ6wuSs
         gl08dVkhTIIr7cuVLzDG8RT5iD2ZLmMFeXZokdtUgIh0thwHeBOD3qEIT4sBEiOpT9Zx
         9TEgCWOYg9gF5XKeb/JaU68mPBHMrDM+V16gQq5apCgVAlcFjiQ97w7cgr/rLCKv3vDw
         DhA90gmVhEBVco54MsrobJ4k2Ilvfde/LLu7PKGghW406y7Lk0hONV5KDwBpzxLMlBb3
         dj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962464; x=1794567264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoxUd3hRuW/M/zzqlfuVkM9AynBQyThAepuKiPfwlVg=;
        b=bDL2D0eZJcivgBBHz1uB19QHf15KBZBynZnfv/AwlR4vg1PqnvEYXY634kkNJS2pxo
         3NJCnDTtAb/vkUtb40m/Jyy1Nw85c5lGTBIO2iwouqazc7Jvw6tY15DhFQWnObuGDXrE
         rSfWkbMrJiyGdRfa5EYGLpH5aYjGQJIqWYKqsR35FqEktdUHRQWs7Lr4NgTEKXKEmFHt
         rBpTuwaAZSPHC7J051pYpaHK6+UP/0OC9POv+UZ29AfnoLD96gzJBmhodbpmJJNjfZfe
         SPBilLCHBj4hl3KmyaK/GTTVYsKLdj9WNGwDp94T1dvaIolNY7K/p3DmSrr2Qwsw1ZX2
         dKpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB5cSV/Q5qZT93hzjvfe7M3+XHm0Db9z4xr7qcQF+yUJlrPc3p2l6dElsLBwKHuhJrqWRIkKZOYaFN@vger.kernel.org
X-Gm-Message-State: APuU4Z80u7BwkbdVnRof+XaTSqvKTsq2CFQ/kjbeMg7GLl2CvSulh55N
	KOXgq/iO55PmFoeUUlDk7tRxJCEQ6fEb8katVBbrIb05FA1PQOpmapVtitiLdGER6iI=
X-Gm-Gg: AYBFou0p7d7/VYlNe+diMYrby9NZY7zTTCuRhjTQXdKGSDQNJyj5sVR3c0mQmaiMzQf
	aisutNc0ZLCcDd4v1ARzugBmBVFG5d1LkPRit2plkrea7Pb9Hqd7MewKWQgVSJAbGhrSIMFcXx8
	AmKg0Qns0PqCS0AsGlY4BG4GILlRc+dJOnKyXeBL1OzvD9JgmdmM058habPMmJJwxK396VpcVq1
	h8RlE36cAArv6fek8s7RsznOGg1odM20X807r6UYI3PuihCj1gZBICFuO1sOG/uxl92qLeSmFSR
	MG7PZg0llYSO3qXTrfrM3Z2HAJP+SV4ONW8ED1yBnZkZEIsS4AgqqAoXXdJgVi+pYBbELcbiwhK
	776J5MH++7qzQPPLlVpKlTgZ+twI+R8p2q1HnwFax0oCkdbWl6F2qirFsV50fBpUkNzowjyAN8I
	qQl2IqsUzyLL0WAgaSXvPwFbJmTedbwdy/rUjRwIJm18dc+ezpP6LTGwM+uRUFL+145SUxLZBvx
	myukgpWxveacP8QOLwbJ47gOQ9BJEnKR1nv4711rvTc5te84ac15XNXvML08IbjQYVhMjZ4obYd
	Wdu/nPriaFNNVSjcKYbfVXD0ke0UMap968iU2P/RRE9Utstyb+AQx+t6MiJgEVk=
X-Received: by 2002:a05:600c:630c:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4b6d82b1267mr31993405e9.0.1793962463806;
        Fri, 06 Nov 2026 02:54:23 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm125584065e9.5.2026.11.06.02.54.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:54:23 -0800 (PST)
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
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v6 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 11:53:56 +0100
Message-ID: <20261106105358.59616-1-olivier@mgcrea.io>
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

As in v3 and v4, this version is X1600-only. The X1830 and the X2000 have
the same register layout by their programming manuals, and a chip_info
with the channel count and the resolution can add them later, with a test
on either.

Changes in v6:
- Nikolaus's Tested-by dropped from patch 1: a binding can't be tested on
  a device (Krzysztof). It stays on patch 2, the driver he ran on the LX16.
- Krzysztof's Reviewed-by on patch 1.
- No other change; the tree is the same as v5's.

Changes in v5:
- Binding: the reference is the SADC_VREFP pin (X1600 datasheet: ball
  P12, 3.3 V typical, at most the ADC's own supply), so an optional
  vref-supply, and the description says so in Nikolaus's words. The
  driver takes the supply's voltage, and 3.3 V without one. The ADC's
  analog supply (SADC_AVDD) is left out, like the SoC's other supply
  pins (Conor's question; Nikolaus answered it).
- Binding example: reg covers the 4 KiB the programming manual's memory
  map gives the SADC (Conor; Nikolaus on the map).
- The driver's declarations in reverse xmas tree, the timeout macro in
  jiffies with an if/else on the wait, a blank line, and clamp()'s
  bounds on one line (Andy).
- The clock stays unnamed: Krzysztof (on v2) and Conor (on v1) asked for
  clock-names to go, as the block has one clock. A variant with more
  would come with a compatible of its own and could name them there
  (Andy asked for a name).
- The name stays "adc" rather than the vendor's "sadc" (Nikolaus): the
  JZ4740 datasheet calls its block the SADC too, and mainline binds it
  as ingenic,jz4740-adc.
- Andy's Reviewed-by on patch 2, and Nikolaus's Tested-by (LX16, driver
  only, given on v4) on both.
- Rebased on togreg after -rc1.

Tested on the HiBy R1 with v5: without a vref-supply, as the R1 is
described, the scale falls back to 3.3 V and the three buttons on
channel 0 work through adc-keys; with a vref-supply pointed, for the
test only, at the board's 3.3 V PMIC rail, the driver waits for the
regulator and takes its voltage. v5 is also built with W=1 with and
without CONFIG_REGULATOR.

Changes in v4:
- The Kconfig prompt, the header comment and MODULE_DESCRIPTION() are
  the same text (Andy).
- The read computes the data register's bank and half next to each
  other, and the two macros take them (Andy).
- X1600_ADC_CLK_RATE_HZ (Andy).
- Read and write helpers that add the base (Andy). Plain MMIO rather
  than regmap: nothing is cached or shared, and the only
  read-modify-writes are under the conversion mutex or in probe.
- The device clock rate is clamped before dividing (Andy); the divider
  comes out the same for every rate.
- Binding: the description's last sentence and clock-names dropped; the
  driver takes its one clock unnamed (Krzysztof on v2 and Conor on v1:
  their reviews and v3 crossed).
- Joshua's Reviewed-by on patch 2: the changes to it are the points
  above, with no change in behaviour.

Changes in v3:
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

Changes in v2 (Jonathan):
- The comparison with the JZ47xx ADCs dropped from the file header.
- No mod_devicetable.h include.
- X1600_ADC_VREF_mV.
- The status declaration split from its readl() in the interrupt
  handler.
- field_get() for the channel's result.
- fsleep(2000) instead of usleep_range().

v5: https://lore.kernel.org/all/20261105213210.87457-1-olivier@mgcrea.io/
v4: https://lore.kernel.org/all/20261102201155.10948-1-olivier@mgcrea.io/
v3: https://lore.kernel.org/all/20261026083631.48406-1-olivier@mgcrea.io/
v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023204209.48556-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  59 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 269 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.39.5

