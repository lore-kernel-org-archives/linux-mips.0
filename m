Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914410;
	b=L/BCta7ig6iFZw8QmMsI4wiU1bTB2YY7aoLmU9WGaNg3E2aTdduwBHvqp90c+Ww9A6Mp
	 xFPD7MhuS+noFCYhqKNtXNzPUfQc/zNmyo8q6FJa9O73Ynd0COjquPqKOncj3C6zL/g2m
	 Yez6UgrPH1YbEkDjs2Dm1Q6DsASaDHu+GDAaQpZ69R1Rrh99idlj2toOGHUk0nmVLwrr6
	 IQpB2ic9XhV2KVGL387dO8yyAS6prb1JBtJjSWTR3WblrL32fT1Hh41NgcLyPoP2QTrSv
	 Nls48gmS28sYGZapoEICyhutqKHZ8PkWUhtG8FOPmRnGwfk73/WraZ2OLQ1Xrh4yOUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=92o1r3unVdbWRpanlWf2vvjYntsWPitLGDtBwxmza24=;
	b=g/pemB8+SqLf6ZAqH7hIm1hXF11QQ4MJYgy9YvPQZY86XK542Dluobryis5/qn3ky6jY
	 3A20qS6Q8fLjenB6F8/jZ0qmo0asGpGdV4JggDL9/4lfdSiec6yyIvAM9GMSidM8Jp1RA
	 UWfQGSPXRYNwk/EFP7AadZOGhQq3d/iZPmCmpy5o0+UQPiSSXQifJAV0yHdWTkVab3vVc
	 t8Y50+orbhllKmYPHiK4zDOYcKSxBC7cd/8Ibx1gc4p23p2bHFmx2UQKgxfk+iIQJ7B6n
	 UoI8Iqr4AGwCkw+CJScwqYK9dh0xKqGigdskWGGAGp4BplfamsbP/hmdWGeqp8fxIUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C2tDiP55;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12680606D816
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 21:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12680606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C2tDiP55
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so15012575e9.3
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793914408; x=1794519208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92o1r3unVdbWRpanlWf2vvjYntsWPitLGDtBwxmza24=;
        b=C2tDiP55ntEzCyjE4ep0O7QdsCE3tAErlxQy8pD+FUet+BE6r/Xl+endo6B7ro0tlA
         OL/1Ju7mKCz/oulfSwGbpbCY0p4GqEg9uObBSTLm3MWfmCjAgeSUZRdtY7tkx2kUMWwe
         WBu3BwGrCYXkCvjfTb5kdi7fHjQwV3JyZli+czE2QWFlaqd2jQAjM0ru6Dwo5mzVt7Hu
         Nnwz/L+Xe7mWqmfgiDHAs5TpfmHSj7Sz/RY0k6kJbp4G9ewXWJ2oRcRTf3Fez01EJ1OK
         3vV1HsMuGPKvYW0/IL7VQkWX0lZShj8FsPaEeiXwgkDu6ipNfVV7X28Jjgl4acCUZyCM
         78Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914408; x=1794519208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92o1r3unVdbWRpanlWf2vvjYntsWPitLGDtBwxmza24=;
        b=M/Yp2iHaOFALCJQx6kEI4RhuzOsCtqoOWgS0ffv+PEpmmGYJ7k0xZRAU14LApvNNbR
         QiGQpfa+sO9JBbZ09ojNJI1RBS2ZTR/4POGe7tZPGpj+B6qj7DvjasEzbALPaTK/qQ7c
         hYKY1s7NSFuiH0I9WiXDtV1x0hbH9aX+yiOMvCDm4FqRGgyWVEdGhnetwpYl8B1mPQLD
         VfPAnPcxN8Tv3rIJlympEMFOPMR0yE6dluv5WQB+m/hNW59E8GUCSA41UJyAXXVp7Dww
         gKQ/5RBCimCgxEt2PGN6K2lH0RfMsCPHhf3n2O9h+QYVHHwA5wIP94budWruIf2Dkzjh
         rzDw==
X-Forwarded-Encrypted: i=1; AKwUvBwKMBfaR1ZZaTX/JJa/7uKLJ9RBXuvy/mnjfNKs9kKWPaL5OoUHEceVGO+OIQ7BMKOQCzi59fNmdONu@vger.kernel.org
X-Gm-Message-State: APuU4Z97KBK8m9GGukSl+tzKfrP6PyrGpH4/AjK8QOmzag9xcsZWiB9m
	mdyuTrdHuo1752tQbDIbCw4xxTjN6NK07fP8PzWK7wAf1VHwuIgIeVKXcTpIdB9nPGY=
X-Gm-Gg: AYBFou2hkqmZ54aC74i/vOhiNZRId58lFrKM5G0XG462nVIhhtaF4vofRBczSOe7d5S
	JQAdeURS3dGhFmbUUj0tI13uY42Ze6whRKAMQJtEypJNzy2kqHfzE6zOC/UEYg6AK/sSw7X3+b5
	3s+Laak1vQEtIoDn/d9n2zcJI0zi5whZ5DxM4QQrfMt8sAeQCMxGpIAKjY+lMcx+g4lOhMUKgND
	iXAO2dYGT/xvVDrr/x2GUGuEb/DHuSL2irVfhC6x/WL+JsTL91v8O1fstK9QZfUqR67lcUgaT8D
	kQ6CZeRvevFQBB5bTUAzHU+J4Le+Th9eFUKcgkx0NvnrGctBQqdWBl8YzBlCL44moEBu0oh/rTa
	pNnqScTyNgP0QEuUAx2r3hgH2XvjTfvzSYeqBlejDozlXSl2oCzoQovuenCGejzd7zn9YcTlviG
	YqCrzioVNeiZez/wAjxjqMmgNONLenp5lcDrVEH3xaO2UUZ50HzmjPEDr8O5YwmNkjkoTYsAV/B
	9lewxnEsv4XKQUR9ScZSdUy2nw93X63KN/BfBedKlp4Dgs83Jn8/q9sd/4ZlGfiBOPdvBPtgJtY
	pIWfjIQXR0flTzgtALBf5/jNAZNclPzFSupgfZ3pxnFr3w7JcRGN0XpgnLqYnQ==
X-Received: by 2002:a05:600c:a015:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4b6df11d637mr5657585e9.15.1793914408338;
        Thu, 05 Nov 2026 13:33:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm107798385e9.0.2026.11.05.13.33.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 13:33:27 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Thu,  5 Nov 2026 22:32:09 +0100
Message-ID: <20261105213210.87457-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105213210.87457-1-olivier@mgcrea.io>
References: <20261105213210.87457-1-olivier@mgcrea.io>
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
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # LX16 - driver only, no real world test
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 59 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f5d4726fdbae
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,59 @@
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
+  measured against an external SADC_VREFP reference (typically 3.3 V).
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
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+  vref-supply:
+    description:
+      The SADC_VREFP reference. If absent, the reference is taken as 3.3 V.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x1000>;
+
+        clocks = <&cgu 28>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        vref-supply = <&vcc_3v3>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..4ab4ae67f788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13176,6 +13176,11 @@ F:	include/linux/mfd/ingenic-tcu.h
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

