Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650395;
	b=uR9fgUG7wT1uHhm0RGDeL1vJZAFayJJwMOHzYBYLfUOZoJpZ+/NbwFcb2m2UOT0T98aN
	 d9rArizd3l4AjaLD3s9Xaqw/gOkgw7/0eJx46B+a2C9ADs/U/YM1g136MDJFD8bD39Idi
	 Rx/T6UfN8RoV/RfApLeKTm4mxQT7FVeK404AJkPljmLQ5GuBZF2swXlhw02dVMVVxtGIR
	 EEsovTcgaMc0P3ukLubXGGBqz6XV/xrkD4z9LOUkhe/nPSsly0tH3vDKxGmtPAavJhdHp
	 LD8I+muuv5HSbcYwn+jB37tqPistNVBf3ciiBBJyNc/0IqU0mPa0dpS3DzdkqqlKRdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
	b=ZYVszXMyRenQ7fnQ6PSDEUMwdz+IYQUJuPpkdcI0qBlOK1YjYrxMy0pRnVqZHIpZtCXE
	 sUGF+XCocNzPIynhcka3Dr4E9xXjNjAz5uoqAUlG6bk1jw3uRHmJ/NQrHgYVi6/cxO8Ok
	 I/krqLgmaTtY7FcMQOG+nXOKn/YTnk9csJKHkwN08nbVmGc5yJ7pVYd1T10SaLQMSAr6g
	 e+tQ0uYRWVLbPQXxEvJ02WhZOmElEZrk5nmmwkvqjjXBJpdUtSM8afilLYt0dzseXmFyZ
	 ardS2GUeWGuP0wyQyg3xIf0HZ8PB2vRxfsm+kj9CcK/UQ1viEhcEO8dew94lvw1XX7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MmSV0NDv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94AA606A32E
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94AA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MmSV0NDv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so30673895e9.1
        for <linux-mips@vger.kernel.org>; Mon, 02 Nov 2026 12:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650393; x=1794255193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
        b=MmSV0NDvusZz1hnlGyvqH9FGRNZmkYXSSPUBGZ9aWE8hBkP1gA1S84f28JHu3Q+fx4
         BbxJzw8iFTkIWHedRtb5zP/sMHHyw0rS0m4/9xpAzCKQlbrJU+XJ1RFjP7Pts+malEhH
         GfC/iGJ/b/NZWaY2nrOZr64AQPXUy6yb/miV725si3g2Zq4p5UTTGejXX8aJEhQ6RoBQ
         FSNl2DzJ4Zp09b7qEHkWTHLcvUVjibmtc/3OucJfYU12u5xUQ7Ms27ql10t70oIiJyLP
         v63o0HjQGe1M1EHsuyGHqtieBL+2hLHmv/9iqzRhPj/INNxY24a+ckyrqtbOiBuROVuR
         znRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650393; x=1794255193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
        b=ntJVesySMjQBUk9wjw8ZEtD9HoA/R34a6qZaLbGPb0Faj0Lodk0iooUOrNVs57KU0L
         YqK1LoYlVwNFmeOIkG2G1qi4bDli2q274nS9GPznrd7gGdMmUPVA9X+cD/YrbWCtW2sX
         Yd9/oqhcPuv3rB4Jjm2z14jjOhLdnhQdrSaG6ORv5rkaK0y3rFejDYiaEwr3gdK2PCxv
         FUCg+05B+B8LOMnTLMK/jecUHEjPudywyyoAN3uKiT7onAsXU5QJYBw6SCCREZKR2TpQ
         nwlm19bx6j9ZvB+dxbvLNJUbvzqv0CS5ayhdB8YA/J8PDfgFUuj5qpNonFbveJGs2cdV
         wEIg==
X-Forwarded-Encrypted: i=1; AKwUvBzpj2er561DYcmhQcBPcmXTQ0dskwyZWTDpNkZ/cqLvdXTtKLCxRnaXK5iuIjJWthHSSsi03ycYmae1@vger.kernel.org
X-Gm-Message-State: AFq9FYKt7I/Op51BubVVcrRVQet7ERA1S29L/zXHAjGmv6v65T/6/nzA
	5MKTVAk6rKqBfT/1cSvcralNca9PMB07bOKOwq0P05DzNhi81hWxQRIn/jsKKvqIqyc=
X-Gm-Gg: AYBFou0L5BYJOiUHSATg3LOSC3s7oUhS2Kzie2twH9+9lid/dnw2M3VDGJimGCkuWko
	woD1CtaeoTsvT6ICCc2M5wYUjnWx5WmaufMvFko6QaU4SDmyHDtPTjYmIIQBMl3STlwmPHuTwoT
	NwBLjewTFswxZfY3x8Zyr8x4LSLRTIAlaui0VHT0LVQYAIKz0g/IjxGe8f/Xf6LnkTXX0xSThDM
	kavyae5ybQ3kBnp9kQZNLdqqZVj/inkcqCj6pDuCoQrbZys7zIUXyaxCltRVZb01g5C74dUxsYT
	nH521QX5JSXOl7gc9+GARomr4x8Oix8iiuaE4jRPKPf7vzXtfWm6PhmR3LJHD7mZRuDdE9b0PpC
	cu6JSZZuGwbRSszfNfHKuekQ94n/80SO/uGdBpHPXnzMeIEEt+LSTtHrdft1l/0KIJMc8Z6wK5O
	tBvqFBrY1VQlm2hFNQ+sraoRrxtvLrUsfbv408CDbTZtTG61xSC+HzBRV+HauqPQMJytWCOnJdn
	OFhmA4SUhG9CI5SwLKOdG7NqSY4tJqhNHg7xoQi1NcESlwukvL2mzZavQ5oHHsQev0eh1og+aQt
	c/AFNWJOZyVrVcv+R48vMxnWEzDXfT1P5ami25IkDchqlmD6J8/0L5CHcMnn
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr286479175e9.11.1793650393215;
        Mon, 02 Nov 2026 12:13:13 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.12
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
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:54 +0100
Message-ID: <20261102201155.10948-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201155.10948-1-olivier@mgcrea.io>
References: <20261102201155.10948-1-olivier@mgcrea.io>
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
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f6356ea97980
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,53 @@
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
+  measured against a 3.3 V reference.
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
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
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
2.54.0

