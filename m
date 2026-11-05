Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914411;
	b=C8Yl4vz9IsCU9ZBcAY/6mTydFKpuUiwCBYze6k+NWa8b9/goPewY9OJj/TYXROqw6Lae
	 wUoP8CoyDdqFESBp/drzHy5VWepImEw8KzDw5umO/K71gDp/Wwv2FDpbJ4OIm3ATFFCrA
	 EMakOuP5Vynag2i042GLr+Ac2Rbg3uXdDqczrmH3z80ui6qHWi/G/u65RmrTMJGC5ZIU9
	 zBV29/PnO9lOgCIhGkPE6RyVIbWyA0nicXAeFppDZkcclPQ2Ki2VdLO3AmLt7V6Yf6qxn
	 YoBNhgVOi2T+9i5HvXKcU7PmfQCsITAt/aEREJw0ZLN2+LarXbE7Uy/QcgOofQ7GtEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r/eRVXTXK7q+1xsN0z72ZiYGhuDDpDyu+MIjU/i0HJA=;
	b=YDitledwGZgocueqdMNLQs0HwOtVpdlAZ/0wCffnPZwpbBLO8fdIrsPjvNgLxihAgc1Y
	 mRVEAM23zfT5+Q+bKVezMwi9acssq9dEX5ndAgIxtiZTm4s0ndfkkZRDdj53sGzWqpmwp
	 DQVNZLV8Z7rjyDvFWMzxF1hEJ/PYekQ1TVqpmuMLt9tpzwiceowm1qu7xTQleU54/OuXD
	 QpWCoVEC1uJS5wxQtb3qj+dhGYgXXocMBMHz08+mRXxRlFQtIwNiViVK5nVzbkJW033DC
	 QNzwIs8RY2qtcoIzELeT/7yjnt4VK+19oYihHAU3bpeye2DONC+2F11VGazj8Jbcvzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HKpISvqV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42C606D808
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 21:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC42C606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HKpISvqV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so53555e9.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793914408; x=1794519208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/eRVXTXK7q+1xsN0z72ZiYGhuDDpDyu+MIjU/i0HJA=;
        b=HKpISvqVCMdcqW4ndGKlzBdukD3Zxa88f3Nhojb/HqyF+yTJe3gpN3REw6lR4V3clk
         4d1KejipAnVKFl3kHwPzl3BbYW4FHzZERRtK/fGDniwPKtajOzbENYBjws3zzEYZrpGP
         UR7cx/AH23P6UTibJP00rEy92EvGJOJ4mJtLebYRem0JZtrO6cI4jLuyOopxfsnqD6Hx
         dgj2XeWTklA4dDml3oRy5IaoNcxIrzdJIKi0ilFefbP0EU095dMIRXGmowVIzry0pAfz
         RrgjsrACKyM56IcfDYsuHcgr8jCb24nUroiCOuFy25+WWB6W/lFWsXwIQ6uA16vzgvwx
         BCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914408; x=1794519208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/eRVXTXK7q+1xsN0z72ZiYGhuDDpDyu+MIjU/i0HJA=;
        b=VmHjYmiwA9Q4lyT5PI+Le/93yGxQgoQZQ4sK3wbZti6k6UR1UW+QzoKVxJ1NBhGVD3
         VovJoOPEGWpArTBKOMnpRFhZYbGcf/CmIu9sZ4moraK3OoVtLXZZWMLEGjEb7UIz+A6t
         54vU8QS+PG1e7Qcse4lhw1+mtYNswWUlyP4ypNCAJsURj8cnRl05xN50Rn/J6Lguw8jj
         rQyVuUoU+DLyKramPg91dZRPl2tP9Qfe3T6BY1j3wNhYa0WlN01+sQuur8jc1nywAPgs
         mNSgxuLF/qofGgDyUDRR9dOyff4ZkThMUalc18LJO4TBWwzbh29PBDjvBx8hXwXZHhId
         xnqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh80Z/J5L0/QNUGC8wKLK4w3WZCgbEJ3wRLjDUqe/848RW+TBC8xAkknMIl/YC+CN+x88WnedgvunR@vger.kernel.org
X-Gm-Message-State: APuU4Z9KaHYn+doIkjOprAM395wVeL2qOhZpUQhP3hU47dTqasTcIswQ
	Fq+MYWC39vnZxkufw8q8d9vynyCVB7Klw9MqjyPVxtgggJFMeXmuxQ+3uQzMHLTzMGo=
X-Gm-Gg: AYBFou14x2uRmO0c2W4b+xTEmxxjEccltJBgthrNO/m//ORmErcD+IUujCDvhk2QSKW
	C1Vdld8MHEumcyM7qtdr2oTN+92UPCYcKkioW7JFMtUV3dn9SD7DeutTsyLH9dZHXFAj7fph8Uf
	WJubwm6QI/7uyYMW9qRqs+Ly0uahea6oCD5XYC07gXVI7DdAGP9TUEimzzXIt263sxeTDVDUjBE
	vc+guJX8S/MEI0wxtJXESiB4VOKkPHGl4YACSi+wASDE9WOruwFOUlL0lKnmiYDYPRZpvjsCQ31
	KEbN9XvXyEY02yZPEhEskG0tuDC4grTCWDK/sa+G+YL17EDo/Lpvi8ttI3wsxsfxJ3ek0ORXvJI
	RpL914vB9MIVu2grNAArdCBbuph4BB7jxepJ23qelQCKedgRSygbyYAi1E8YBHaWfmysXLhYhfp
	e+vYeF2H07jinC88hZSefoQv29bcLQsxD2O/d1Q63ZVtWNawmYrqGmQV4O6GZps2p3m96KZs7lG
	kIPYIO85lImKb/4cMN+30gMwWUEMjFeE0bNLoi6eT+pP3uU8RTmu+IgfFKJq9JG+S8vJI3Dnwga
	2B9ojK6dFgVOYm2tre2UkglZX5JQRUW3+bivJVmFYJI608N0DzG1vhnY1Vws3Q==
X-Received: by 2002:a05:600c:c10a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4b6e5ab6ec5mr4359795e9.9.1793914407493;
        Thu, 05 Nov 2026 13:33:27 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm107798385e9.0.2026.11.05.13.33.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 13:33:26 -0800 (PST)
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
Subject: [PATCH v5 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Thu,  5 Nov 2026 22:32:08 +0100
Message-ID: <20261105213210.87457-1-olivier@mgcrea.io>
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

