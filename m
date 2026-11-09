Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246480;
	b=T+L3b7DbngQ9JsG5pFN0IA/ND1nQjzyA3+nqJefsUdAMKH5OEbv45pwkWslffVp3xGt6
	 G192JzDPGXRSZUm8Q9odFuLwqQ+adYS1+oN6lsmbsNvDCWnFL/TmllpOtMiOOC5EGnXTZ
	 5Z7y04f+IJrhmvt8fJRYpHlW3s3qbpNPBiwqXZ2oioROO0HsE0SJ99EzjsIBNGDc7GJav
	 XSBXrNT3/mxGCV75ny9XONZa/z5ljV+0uE4EUNeuQscUVxbRrCtblY8lgUruaO7mMQRNx
	 X2MyMupv00v6HCrioYUhvCL4GJ1qQUKh0cHizo9LnfvokJ5rR9f2YAW6UB/gyolgO9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
	b=0sgnQ70kMrDYkJ2rIPCFlgzOcDPEQHMkBbm0Ur/iEdCN+vGhBdFNUefOQyujl99ZZ+hF
	 qtew2MPrMXIJHIK/7XLKhnE8I4S9oKBKtxGv91nK1+28GXe/DwUCaR2A+B18x8feP8KrL
	 Xxgv6xK7LN1c2vE6RC0dU7wlAr8ZNbM6aAfwj6vTFbwYp3Pq9r0eAcgtyCO14l15EbRHD
	 YDvlAHnp1ubrYKWYB4AxAuSfb28CHJkosIg+4wFf4uKZDJp8sdYWKtJA6m5yWVMraJ4HJ
	 NJcPcWwsHVxHrpE/u7MXa0s9K92unI6ZeEiVIem7866yN1PdfcKfSqG7WZ/y2uHXdNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b="Lkus6vZ/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFF0606A337
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 17:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFF0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Lkus6vZ/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12717085e9.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 09:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246478; x=1794851278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
        b=Lkus6vZ/PEW5s/E5sett25uDWAFCHeq199L2QKvptiDfvqImhdPNi81hCSE+NGbwFC
         3RLkM0dI2rwntuKSisFIEGQ0qXBg2S85ZS7HJY3bY8WG8s22NZ/eSmbhkhhab5z6WC4Z
         7l1z0jGTTADnpXP/56YtGk51e31DxQYJYd1R/TYrAM46sxskGSDsbyPeh42opCk2cAej
         z1HlIFi0YWh54hWy7tj6d3MCRpmbx/HBawHxOjcnBm6TU+Ob7NFdEWN6CBRBu6n2T2B1
         G1aErT/W3snaseiTZx5oTL4I/crEkVmCarFOwp7PckxGxGoG440QxcaV0sPU0qqhHsKv
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246478; x=1794851278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
        b=HZZQSqJhTb3yV6HbeREmgOfYRwlr/lizIfynD/AFqvcMtP6bJyiIn1c5CqSFfWDdf5
         JCzFS82Rn8ZpMpwuUOu/QsqOzYXJjP43xcdB1u8wN13OrZajAaCfasaS8yMA7JRdCDah
         S1sq30zdZZIwZg7DJ3okPgnF7d9npNziaHlbQrVtNGeW6NvqeyP71U8a9ECrU0Y1ncAT
         qE5/7q4foOiSxRFxY7HjycavFeNb+6wp7QFln9SFHE+QRiypCB0D5ak/OjubPG0ZTetV
         RJl+E+MDUAKV0Rcc9agnzMwNdzH9swI91ZCVE197xgl/jBnLnpBc5n2++IsOUjfQGyzN
         4SCg==
X-Forwarded-Encrypted: i=1; AL+hErFTyjms2/i1dXjoRPlogP79WkSgQg4Kh4SOjqxQKekXDq3Cofv/1akY4Y0X3AgAqYOE0UBIU/3gU1do@vger.kernel.org
X-Gm-Message-State: APuU4Z+pgOAApEaPcXT/anAubMm2M2Zg5B9WQukeKSkNvH61QVAi1Xpw
	WTNDafoNv7/LMc7FHLLBz+V2QlcU4hbptQrHxULGxV8wvm9K38hvjw61jkl06I7k2Pw=
X-Gm-Gg: AYBFou0W9mhqnUYy4kUe6Rd8TxXmpwxV9NCLuUrv045cfVccO2zXNi0hhDeJo1Dgtwi
	BI9UYpEYn6VUNMjIr3/tkTrnD+9HkDS7V2EsOsjr6wdcovPfTQZUDQ/BRhZNLbs3DBvkzRO9QE8
	gxYVuFhxmD5sVkxUNRj9rh3Q4QID+1pRaOZNheeUdA8vbMqcInjMqIQ4uE3H9aSL5f8HKbGWZWF
	dwC9DfWK+DDelzBcLuXAfca+WnAwI62uoHz70kX1lGe/PRgLO1kFolqwvfzKvc7M08z1mwnCLqV
	Wu60/ZGDAtyd5SHLI1Fr9BBzY/qbLY30Uucf/yX/6QbbzrsSTGaOKilv3CNd2Z74JKED0EvllfN
	6p1lHMzzEY7J30QZiWLfO39Xb3xVCpWp7/651KEo2tVmuklGA07SxNSBZjiVMEfxas11f6Ho9bC
	LpKu5VmM2tZ7qfz5kzT2GVCg6k2kfzPzoBk8XaGpw3CvP0OGoZnHqy8ABNHrLgsM84VAfdwJzmg
	zeeYoKM0bpOjNe1TK838PEX6xeX7vJelRPu4vwX1w2V+wzQepPV+ETsANf03HA3W5FfjII6CciB
	Gxs6Jrn40y/frmv2agdsx+ZwBIw7JNhUa3R3R0Ou9RYPZxLezDgP9OK/j2tWbgYerVnrmizwh9L
	lxf6AvKfG
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr134995e9.4.1794246478209;
        Mon, 09 Nov 2026 09:47:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 2/5] dt-bindings: display: Add the Ingenic X1600 display controller
Date: Mon,  9 Nov 2026 18:46:37 +0100
Message-ID: <20261109174640.96951-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer, which the X2000 and
X2600 manuals call the DPU, as the X1600 manual does in its register and
clock names: hence ingenic,x1600-dpu, which an X2000 binding can extend.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/ingenic,x1600-dpu.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
new file mode 100644
index 000000000000..0e9f4442e4b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 display controller (DPU)
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC, the DPU of the X2000
+  without its composer. It fetches frames through descriptors in memory
+  and drives a parallel RGB panel or a smart panel; its registers have
+  nothing in common with the controllers described in ingenic,lcd.yaml.
+
+properties:
+  compatible:
+    const: ingenic,x1600-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The pixel clock, whose gate also gates the controller
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: The output, to the panel or bridge.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@13050000 {
+        compatible = "ingenic,x1600-dpu";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+
+        port {
+            dpu_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3aec082b0a..ca3f1a4bbd3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13182,6 +13182,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

