Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918701;
	b=K+qQsTDkJvHgiwLXbrTV7PQNDfnOE1csAl/YyGw2qQts9g1t5Lxt3Rm3eaUpRihfJcfe
	 0ojDcBxybRHz13SHgClhNfnKSZycDc7mo7YYrGKlsjqgszCM+i2uLa8eVoMXwLmg8VzMR
	 83aRkFouo1k5kvwodnUo0HBinAEm6BY35PiMyd8xvqR4gDo/JZfZIIFEEMioeN4/BXXdY
	 ANRSb6C1TNHSiy653BHjMFguDo/ojTSuHavGg1YFbpGefQibPzeDTuYksVwSVYNNUWnlD
	 Qj6wgLvL59XcMOIHCQfZzCzbb62to57LJnoQ7o+d2ZaggYJ2yW5HJv+R8jj5Z5LThaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
	b=1DUfIkO4CGKLA+Al8PDg9qsrl6uM6iG2i9D3OOejb0LZwUSAdw7T733k/Zgw4PgOgf0Z
	 Z21uu4PA3VcweuXpN4mHWkAo7ITgRWMGBAzs3XBaKp3MHonKC54/gqajoAeWiya+OcZRa
	 ckBCnz81rxD5+Kw4OwJGJ6KFMnxOEM1ikzhtVjDAXF+DIJDU1Xe3N7JYTmc8D6sORs56w
	 fWi4K3eKCzERH6qILja6ba7BFlIGnjddn8gEnr8bynqIB6vLvqmhsPbtwNNCUM3tmoXgK
	 fk7BxBs1E5gr+t4my2WBIC88s72ECdaXyhWXArg66zYGbB3yefKWQb28l256wb0w3jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SpVtkEgL;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EDB606A32E
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26EDB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SpVtkEgL
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21723315e9.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918699; x=1793523499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=SpVtkEgLwsKWjd8xlLQt5CauSzkH6wiHgZrnTUaPZZvxNrIukHFF9mWlTN+AcpV2rx
         FBF8XdhUzRnsqg6nPtI4Zp3Khdpo+dIxseGUovNb+waniNlPSHjjJtaVEZXCm5Y7J/az
         d1z6NgLk2aglswfdYPdUegKgUC/54DeK3Za72zSZAauo5cTSKhUIvBbwi/UIQX6f85Oe
         R6NLDVdyyYO1I1+sJPUav74rPpNiUwXCmcY9ClJxIKO8caRu5+n0/WgaaWgJai+9oFiI
         fxbpqjHveQOnEeQirp9SQrw0BOFjZYU1ZKW4zqXjz1Ia5zFmvf72Q46iOP5Ulxpl7VJN
         737Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918699; x=1793523499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=xFu3CRDRVo8OAmXxVuLP7LbFcI8MDrHRXbgsVZQgPwL1pljJbrZoLXsRR6qggXmZx9
         bI/k0TeKu2PxD1FAhD5j9XdVQe4iE+IBjxW0Wp4dZGx8+LCnHgEaHM7T7xGcE+9vTZR4
         z6vFU/34ZF2I/qzE4LtaJ1KOR20Q898oH0C8C/46v+Moql7CdSRXVMQXziQuAD4DivfA
         3TMnLtlQGc4T02PqnPX7joIi7xH/0RgYishbMdWZAqouB+EuoMuWvXPfOSrgTZ4cVsbv
         DLYs0Zz015QpPFRKBLsfPIeqIUodZltO264/MGMR9dpOgc5ocVCbYCHEGHoo50ylnO1A
         4/9Q==
X-Forwarded-Encrypted: i=1; AKwUvByRfZ7s7TZve0ADE1+oGPKp9iO3xQtIokjoEO9qJ2at2pS4VMnr1nHyXw3Vu8YEF/yGQsRxXoT8hbG5@vger.kernel.org
X-Gm-Message-State: AFq9FYInBeFBDbi0yjm8VbJbA0LFq1VcmMx1szpJvYzj+UaFl6v0hYEm
	+/dSii11+3RdG9HBA+amF6eGlFV6QuOASLkCzutd1bhKyrAnPQ0ybSpE4HyBlq+oDLw=
X-Gm-Gg: AYBFou2vTX/gBgNDAhhPumXcYGOzlC6VJ+2yw5My7S8ywOAOJa9DyZGIrEr50QlqkUp
	0+kMkv4T5uqXh7PWepKmDhag8thZcDWN2qHHuGTm6UESr8Z458O6Nx3nU9nKRir0qabRIDz4Snt
	YhT9uWE5Z8PuDBtjhuZrA+Cof/1hzHPVefZFfbOLUSWkEcoecmD1221IN2MvKvxi9AzrASOOsAh
	V1tTs0gH5OQVVdmOPN3P3/N3BbnQW4lI7SeJuLUUYZB/wGb6Uo+eLAESOcl7VZah8HHZD8RCCLn
	FN1jDhYH1lnBaKUkvswX6uWxpDHTFtCUS466xdlt66cdchLwu4l3WxzE/FRjYhttKpkO+1etO8O
	9x3FCWtmMk0AttFx9jMMk8z6gUe/vMJn5f9tytuVLGBiVjg0wjK6/eHtgiwGK+5jctQnMMk+fuA
	hOGDxTCDfQOVgmtYskjQAyNYoXaJ7HnUnRwAUVcBnMLiRZW6CJkB61blIEtSz9Ukz1r5Ikz64AT
	s5otCAD7zq2tXC1EsIQeTDtAJiK7R43QtsT3V+cMZhJqBGNn7M5o/XtAz2nyQBbiBIg8OX0bARv
	gesmluDqU0KxIFwYE5Dt/HKWxsNx+hIJU56cwiYxTQbr+p5xrmc/P5FLm9IxH4YLnJcqEm3xdA=
	=
X-Received: by 2002:a05:600d:c:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4a373be2a9emr37807865e9.16.1792918699556;
        Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Sun, 25 Oct 2026 09:58:13 +0100
Message-ID: <20261025085816.60405-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
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
X2000's display controller without the composer.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/ingenic,x1600-lcd.yaml   | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
new file mode 100644
index 000000000000..171536c78f4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 LCD controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC. It fetches frames through
+  descriptors in memory and drives a parallel RGB panel or a smart panel;
+  its registers have nothing in common with the controllers described in
+  ingenic,lcd.yaml.
+
+properties:
+  $nodename:
+    pattern: "^lcd-controller@[0-9a-f]+$"
+
+  compatible:
+    const: ingenic,x1600-lcd
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
+  clock-names:
+    items:
+      - const: lcd
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
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    lcd-controller@13050000 {
+        compatible = "ingenic,x1600-lcd";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+        clock-names = "lcd";
+
+        port {
+            lcd_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..98d46b1cc029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12927,6 +12927,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

