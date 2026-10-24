Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815245;
	b=MYfkSjbho9WJVn/Dh4vbfjLnHHpgXy+EntL8nWAEr/QaA55Q+bMQMvu4WLGzHuFSu/84
	 JNIHwods0kWnowll3UnQHa0ptAYQBQLecBsKq3bvNRg/xmNto5Bl2l/ZbiIpUdEGCKyDB
	 pbc+Mq5eiB1CuXNGe/1Fkbz8ygRj8nFC1raR9Jh2nvc5THIwjLwx/Dd2h4q+5SvZ15lkK
	 xmyFAydMJrSbCVHseCLg1rL64WmF3ROyNaXj00O4OdSDvg15FNXKqwriGM0+JJQ5XwVzw
	 AuEGyAJNYGF+eolnVdp2QeJfojcVkAC52tJDGR344av24Uc4oAdxKHfhPE+B6Ws8YHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
	b=wE/V6iuyYPHJv/4AVs3P1CE4kQZMwDni54S97ubk4jRWLx30Sv3D8U0PHZl3Aols1HID
	 Ih4RJd36XuQu2bxfWcL5M6jWLDFQR536jgrsJsxKdRXpOsN/4cBWzdUucuaDt2ixhnD93
	 2SU1hl9pjv6SDSMivmK6Z2mLoXPbVTrXqfbDGIC2F7cdrNPaNaVbjigAw+CrBOkm2QcrP
	 eriehR/tteHTKQA4r5NeOmyN/QyJUpTDVFXC0wU3EmnKWOQnFM5XFTBf6uQZCnLMETKyL
	 rCJejrxF8Ga5hNS+SvK9M7eODAjAuqsf4FyiZNVgoRXwOULIKt28D1wmErh/Uexi/uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Os21mwMz;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD6606A33F
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 04:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACD6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Os21mwMz
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so14879635e9.0
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 21:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792815240; x=1793420040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
        b=Os21mwMzsXCBmyGzcSB//pxKjuPPNQtlMHyV5HZEUycbuYFqplMtYiil/yIIRDD4pG
         ZMktH1avkIIZQbOBscNlCJXS3t5TwzwSKx0D0Vuf/RFdmXjn/UDizoPF8yIA5X2mayuI
         tIqo7OKFrmQ7wEzGip7I2QEQfMgwmGKZYMuzp0ktOkKyz8lL38MwKqAV6N7bwMpyh11u
         MCclCuNeyrPpw82x/LYLrCenNArl2/8gGzvUa5sz3eb/lU450+Dde5i12jvnMAOKKSms
         brtJ54qv3K27dCno6dJLsRGhttNn84om/r0VBYapQ5TZObqGQvPMnJ/c7AOAmE43axe9
         SdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815240; x=1793420040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
        b=BjvichixjS+CVv/RvW91uTCYBQWuzTWMpIzQdiZdxnzjjggBpRA86b81RGk1yNpro7
         m1kUz1MZxKtewI9hYA4/5tcYjaqaBcsWaoVLFRmgwEU+i8/42YpnWEK298ABIERFJZIX
         D1wyciivKKAT1wc4+uiUIhU8NhXcql9n0jEvdpQPDHUEqlDnwiYrL/J781ZqbDidiZ2Q
         yMjaYnxPCdJOB2hUB5G636yp3VVHLga15z5h8O749LrluCU2YPlknAgbqEJka/RwPmwE
         a28J2civ9JEQ10c7KA7c63fNwo1pXELyIIG0Y8mMQIEmxU2raROKNlBcdpT5+fGD+qK5
         GueQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7wMMgpm+wl9XRYiIsGNWSEcKBHwWpen5z57Cf57lXGR2aAyroblm1hxVN3UuhJ/GvAZfLL+w7UI45@vger.kernel.org
X-Gm-Message-State: AFq9FYLwMkvRDmq04sFZm0GfSyHt5XYXbxaYNPOq0SOtEw/Yv+IukF6U
	yH9Qv77Mc1tZCjjwyksLiQBSDrC9HbGKNy4WlIcDm7BQRCR9rSo+RDU4eImJXk8tBw8=
X-Gm-Gg: AYBFou1DL6ZqpYb3oiqgAXuvSXPnd/2JPra4aX0iUlJvdhTr0cDQfQw6DCkzqZfYbZg
	ki3Ys7Kr3ByhKNh6oFBk+dxJZw5NRgmduAC/TpkAMEsnXwKwrdmmF85ylsH8ctxW/KNWc5GDu0m
	V8Vg4NL+QLNBQ5lQqoX+IPeAnOgpEUIZTE2OUApL/DIvekZ65+o8nGZNYEJdj9sns/qnmRRU99T
	px3XF/cJiQhikmOZ/hB2j/4xv8IL3PRyJmBRF8a8mGQE0xn3XqAjBR9bOg1QFNxfvI4dPg0rMjy
	Z325lIGSXU5aSLbKjWhwi8kFoCWOWpBWeKDi++daXEErl2QtFYhl4sGczFnEK00qfkQ3kOEjqE9
	apZhsWEi2vkwhWHUvRvymhReOrxKl1KxlpSNnMzzhVBHuVAkryYCNwardpuzExuRD/0JPHlkto2
	tiAyF7E1Bzck20vWYP4nXNxY/WSWV1e0H0QizlNCFzDCWiD0K3qCUKTAnm8nBOmiVet48ppXkut
	PNOIiQxsHq6HoVQfq+fqF1xMXIaTW2ITPbxvHFUsDNYD0Rj5Qg8AyiNvU1JyWeIdsIEFTwZRVOF
	FU0ww9zLTag=
X-Received: by 2002:a05:600c:8581:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a35da23c55mr463285e9.14.1792815239806;
        Fri, 23 Oct 2026 21:13:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm26332265e9.11.2026.10.23.21.13.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 21:13:59 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Sat, 24 Oct 2026 06:13:56 +0200
Message-ID: <20261024041357.34346-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in
ingenic,adc.yaml, so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2: none, resent with 2/2.

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
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

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

