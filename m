Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003871;
	b=URJ19ZlXnQgvFR/bQRPY4Sd/GaLF6KdTzODy/tylzmqC2ci+us3MNHs7wypp42wcYERV
	 BSLCnvZOAUgvkih7+Xm8eiYmr2SFkC3Ihpy/Y5mzQ5X2hQmvJTaWYMKPvtVk437EIPFB0
	 twtEpg+LtTi+qsC836iSFurab1G3ME0rWmipxsVj//6D5f9qfuJ1OYiPbRS1csCAg8f2W
	 RA28dHyB0TA6SE0dMzuxobdeeAl8Yfxuo7+8DMqx90oqgHBOO1f42YrjzE1x+09D6Qnni
	 qWAXtTFdLs7wY/RKHIjsz2qv5SWCmSromroyvkPyUm/HkJhqyVc6u3Qb9JoWjaTcA/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PVzvJsl7BLFlmP5S+Z1OR1o7F1Ju7Lk49SqRaWPcnEc=;
	b=kHvWxZCT00klwDCOtyUrWoURWVQF15sWoeSVmIKSeAh/nfN+MlAXUFsI5KLyMbgmILho
	 xGtFS4Z3yZyDU0AUmUY/SdHSIlHIC0eadE1uwdco3bcGBWJAAFftZLGToYu+yLeC6OSuZ
	 T3sNSZeAWflYfCXQtoyEguvCtymhQ9FF0zRgqY2yeQjfUmt7BfwrXt9LjL8pUP//1eBVq
	 A+BLX8ryw2+pMk29JUU1jdmUQXJ+T3oVjx+hj2GJ7thOeEE1tdBWbbu5tDYhAOlAcb1eI
	 wmbSj9C1fyQSSM2d+fnANDvJ6LvS4d1x9Z3Y0YyyFJfn2mFAofYJEUKf19KQYwhHVlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=z4ezabx1;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43836606A31F
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 08:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43836606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=z4ezabx1
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so15986085e9.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003869; x=1793608669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVzvJsl7BLFlmP5S+Z1OR1o7F1Ju7Lk49SqRaWPcnEc=;
        b=z4ezabx18eIoRMVxS9bqcLmnphuqgDGaaiWYxtzP88EJ2F29LetBPN7fnpWCuSn/vX
         yzjil+XS5a8aE9zYNqRgMUxOJ+JRBo6HjOIxMNpVzyisutWN2q3x0JaJkJsZxNqop6/l
         aaE2sB2YKvg16xm/qsEVt+bmeZUKtOTA8DPfDmTFjVYFNXJEMNXw8MR9WEDWLT0UO+b+
         kekA0ZaSA0baZV28NQCUi1dWUw4/LMv4aLD3POZkPIFYoE57NoiZb4rHOxOj6kHFhZo0
         I3kPzkYqHLJMl5edGXuDjJeVxyvIcbyJPzM7SAHStDAJKXWlZepZteHwfw2R7oEeHZL4
         U8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003869; x=1793608669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVzvJsl7BLFlmP5S+Z1OR1o7F1Ju7Lk49SqRaWPcnEc=;
        b=Z+7Sb/IlppcWlRFg6Ur9zJBWCRj/KOu2wMVi1BRHfHxpt7Q9CLklYRVPUTcD0uLxZI
         A02Samnx/GKRic02D94zZ1Co7P/HGo503KGfR9/6zWLw5MfBEepq9jnggskKUtDDNZlp
         KlOkjfPnVBDcKfW3GaTmkQkKMMBLYhfxMA1GWK2FLgkbCRvnHGRT3rovkXtJvznrfn57
         r/R3QcdIL/YwrbxhXrw8gWdtor+eXDBqXnCth5fSl+61b709psALsxDV9hM6sfi+lD82
         N64DDGLWSQ1kUQk3rx4b/EHPhBvynwXSd6FaZH0ovICN6eFRcxILbvMTEHjn/7KHrlsb
         Ju6w==
X-Forwarded-Encrypted: i=1; AKwUvByjP6TW0JH5vWuXB6T66PJhZfQyyraTe22Dfj7tNQ/HXYiUmC2e8xuDIK/li/u/pSIutE6tezb4/s8J@vger.kernel.org
X-Gm-Message-State: AFq9FYIOp3s3JvE39dvE1MpymO86HFP5NuEzLY/AgPSUQbK++dw5fVtB
	HsNkvTJoM0nLnTQu1aMlsg35h18oCpgqTtJPdHxUUoHaP85zIVILCAsK6XHOy7XOwFU=
X-Gm-Gg: AYBFou0ehmhyGmy90DGQG2S66EL0P6hAW9vJm31dwjpM+7n5+K+yD5n19uMm33Uy8rP
	ptI84AdeoRUjw/1N3KaPVa3yZiKszQMKDzUy+2Kf9RqQroFfHrN9OyZvNuxh/MVryZsBQlt2t7c
	pVmCd6G3wdM7Ax0axEe90Q/crqqenI2xdYMAuW8jzgKO7+KMeMq3b2c3OCXu0/H5WFYE4AEHoFu
	vukl5amOOfaxILlR0bLnWWVqrg26Kg5BrHkQgeM4PDeMsZwvT82Cy4x5XLrDLLEkfvEJbN/tjrs
	WjcL68eGOA74Bh5G2Y09tQv/PCfmkoyfFDH01BncfLO6NfKg5pJO0fKbPUoF2vDdb/GV0rgEyut
	nsJxRmXsrh67dagKTOea873e09TlqYrGExxw4SmJ3LUSID/6UlqLMJw1qbiymjz7DItRSmFWr+B
	T34W62CzPzKBx15/tpTmhj4/Y5T61mwtOeQHloaNIFpxr5L8G3c1x9FED7Lc6Z+qh2ZIJyty6M8
	i4C0F59xwlLgv7oZbYmtVe7HBWQvBBgJduBviOc9t9sHIv4dtVCe+w+BTZ/K43zPunKvWohQNGb
	yyl93qsoiQFMag==
X-Received: by 2002:a05:600c:3541:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a35acc76eemr102904505e9.34.1793003868610;
        Mon, 26 Oct 2026 01:37:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm15091889f8f.50.2026.10.26.01.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:37:48 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Mon, 26 Oct 2026 09:36:30 +0100
Message-ID: <20261026083631.48406-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026083631.48406-1-olivier@mgcrea.io>
References: <20261026083631.48406-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in ingenic,adc.yaml,
so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..7886836b10c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference. Its clients select a channel by index
+  through "io-channels".
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: adc
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+        clock-names = "adc";
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..fd4bb5c6bf16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

