Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650395;
	b=uTqHVdTlfmnQxX0anQaPCuHvF6eJIxtRmSlp/ZY9yacrzlSC7OqnAjiQz5LPSCZ/9yIM
	 5/Fq1JJq9fSTTDF5H76vNz85b+6WM9mOatV0rtgVfNx1HApQWrDmBz9H8b9t9dqBxaGe7
	 26FodI8BcrzbnHP6ynfGy1aZyEUWHLxrdD+NhUl4V2oHUUUZwl6FyIrQ40NBKn+n2wOVE
	 e1AF+C+TL75PgP9fb80asfVMDFTBVhiRnBFm8HHaryL34A/TR7kAt9U/LD+7UtnLVn/zV
	 eJvcQz2W3I20648yLpas5aw22Vx0XmhORWcDa518DLOwXd5HZJ55EHXEu32Vxu5mU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
	b=X2P/M2lK9Q2fUx6CcJ7LAFm8epNhQajd6SteMipREpxlR+tuoLz+sQcIsd7x6CzHzYx+
	 wb10pzm9SKM0avYPsZpjh0RVCjNt7TEC1otynzlEZjtajAsWvObkN7mSzu0G7jyAdPluT
	 3sbwFDSKNDcFb17HafA2KbqBp5BMNd29jBVrD0KeYcyenn4aZ8eDqVwxR/RTtC1QRtLnO
	 4tLe3nOjvsD/ufiJ7NkKMa2b3YFA6dbiS1Uixtamefno3BSQo72btaygY4TdJQ+CMOfsq
	 bOM6GpR5nc8QiLUKiN1PWcxO9Sh3Aeen/hx4SwqhCFLWd+ubBvHkY4eFs4uxZMp6FVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XsRgzODd;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA22606A324
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA22606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XsRgzODd
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so30129905e9.3
        for <linux-mips@vger.kernel.org>; Mon, 02 Nov 2026 12:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650392; x=1794255192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
        b=XsRgzODdBUT4XXjpIUPRjkJblHJube1dhFufvnWW8HeEn8qJcmxkZkk0w1uK0fhN8z
         9dbQSp1dM546uDhKZOHSl0Zm23FuoC6QRi4Ob603V/sF7oVbAadbLNyViF/0ugfhKeEX
         iKIuqUzLcP+o1oa7J65p3rfwAJ6fxWhvUeclO/ZN+anA4SbR8KcCXTnClK6DcdnULRJ3
         XuNcg3MP0neOjUw2Di4n/gW4ZtY4i7FY85TFhj6rRD8/LvxSnrWZR0CSmR6V6EGW1qWC
         ol+YLt1tYcYhIHCw7t5RazdexhSQGt5KYfcKUKqEZe4dmy7hy9kwCIO4TXxCDYjYuf3g
         towQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650392; x=1794255192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
        b=IbUBsy1xMfa0JS2wIUS0/HCegy14Fc/RLy9x4kV7hG5JnNk6bnkiMfsSrBlTF8Eqbk
         cz4PjFvaLr+/Zy8WnHc6yNkwyPTN9IsY+xNPXeP2qmBrPkgM5pdGp27vka4jLldUwz5R
         Hcv67a6T43S4u+81eR0/PZXOGGogGgYMRNHdk5N7+43ptbm9lfb/9RXzROtyWodoEolN
         CSDmcpKhajGdGk2T1Ffa2CWv8Yh4tkKS1LExsQlar82GE7l+14JSOinjtVkiSuJ/2Iyi
         bmWNDjC7r96zcbl4I4YNaDEWxo6m+99jeIn43OKM/wM3vaDxfKLXygxpKaEfkBdZfnqf
         uUpw==
X-Forwarded-Encrypted: i=1; AKwUvBw4TdpWpl6cqy34z22Mj9naF+CvzPlpT+INMZg+Xa5vkZnCggq8BC2OyKSYopibukI/NorzsydqOTvY@vger.kernel.org
X-Gm-Message-State: AFq9FYKtysE1YKa9IrjtsuokDUVkzFxNoz7+ml2XQuJohbW/K4HMxOA4
	HapR8tlLAgxpQQiij3TG1zPIJbuxXvjjGMjl9H1vnEJDjjw0tJShVLdWewMJXQg23Xk=
X-Gm-Gg: AYBFou0qfEJ9HTM/jdVAbUDQRcAdMltWs8ZxSrVoNqWxlLq0ATigwTdXjhNUHNtSxjT
	vD+I6g1ZA/EQ600LlYzb6uX+QACBZ4YcNi1nzXCQHvw74yH4Nf2bvLpLPfuBWZEDh+nuH+hozfQ
	bI6Z4+JSa1eUauN+pJTuMY7ttFh0v56EwGpaOEhCAWFKQ1XBwnfXk/Ox6x1/L96+RZ2tiB3XbnM
	HqOP9ykZUme5yz3rd11i9Ykc0W2JGocOKgBgXLrB95H/1cTTr8G5Jp4k5whX0aSU8hMVmkkD2KE
	hByiOltwCg+Jn4QdKfIu0hobdMjqX/F7AkfvY1SXSoR9Gs2spCOrOQgFcl5IET9AML2MdUgC+Tx
	4fL+UEwD17rdTSvtDbZnNh+HabPny6pRPwZEuzF92FnXK1MeGFqQNMlobANROn/M/MrGgEWzn74
	+HdgIspKpeBSUGt+KH2fh+0qK4SO6lZoqlS+bXWInsXd7ocqjMfW+1OkfVsCdUa1BLLQuK39QLo
	8UESkafX7XRVKl8i9eJXayDB7KDb9TsQ8M+Hy1fa5C/f2eZRjgU7K8sekNslo246rC2IpYhN8Ux
	ArZuUoFwYE+p/TViS6fMk6U2dVCKKute5UG0SrlPVfLITQK3DRf3SOFQ9tIL
X-Received: by 2002:a05:600c:46d2:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4ac1980118cmr242926285e9.33.1793650392480;
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
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
Subject: [PATCH v4 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:53 +0100
Message-ID: <20261102201155.10948-1-olivier@mgcrea.io>
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

As in v3, this version is X1600-only. The X1830 and the X2000 have the
same register layout by their programming manuals, and a chip_info with
the channel count and the resolution can add them later, with a test on
either.

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

v3: https://lore.kernel.org/all/20261026083631.48406-1-olivier@mgcrea.io/
v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023204209.48556-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  53 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 257 ++++++++++++++++++
 5 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.54.0

