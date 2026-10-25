Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955804;
	b=uHLfe0bgp7sdQ9ZSTjTtt+EHu+cGBygfjLJMDH69lNlcA9KFwJPAYrar8GGG0F6SpU+O
	 uAtdy7cCVu3ArdVzH0wBv7qYNP27uzHQNtegPt+ofj+DIv51o7UUxVB6RP/USAPLX24QY
	 IdAJvR3gaqwQZazIAW0c3TZHfTIec4vED9rArUKk6id/oZvGsF8tXoVIBdZFdS8XnZy2c
	 91X+hTKs1aKDG5Ha37ABf2Mmg4RtnMqrQi+gtIMZXGgzL97e1Km5lMVoQsMzLkeiwZIdw
	 IKqN62TW6jMgMMeKeeYmZwsq6jzjCdJLht2JoPeRNJ2+QixoJXQy1pSB8Do8Rv47FOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
	b=lD/Cq62twIZKlFIWB2cu1ij7nSzkeNAi3qzmA7YlZ8790ebrZCPgONjhS6TpjdCNMABw
	 VKltOd8Tnk24RlcCNnN2CxyglQgxadrQAi4GgEX1cma3vFaSABaGGNnx12iKhWCQzE7u7
	 Xh1aceTQxj9rmV2FH6zcvAYhIDzmXMdU/IA6XcFyvVO8uGrHeTzHVc86m5h9tXkG1F24R
	 1WGBdzpugcV96kdBWJzMdcitmK0Yten6RAOnb3ldpmucYpdDLWGNiTxi1xV8dnpr7TQWe
	 aIHE0heTMDLOqh+MZ1acrydwrb0eyEwBhvO2LNTYco1d2WKtZD87OnarTYNvkqCXB7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qH+MjWg0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2378A606A323
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2378A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qH+MjWg0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so13572515e9.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955802; x=1793560602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=qH+MjWg00AIBXFcs2mMg4P273/BxhHXAGYqkwUn/B3fqqyhCQ/ydPM0Oayoyqlf+Xs
         54A6f+6oWNGqf03RnsnctANOIVNt94e/Xj3CDu8IDNH7a3sGuuzTy4dXIXETNv1qWJIc
         wLlhwEnZi6+gSH25z4YF1ROobcT5i1q/jHIXdZGob2o4OI8140ZcdmnM+21JtAb2HDqZ
         H+bC4vBB8YswKNqQrJBu0hEl1t829aRLyFm9ZuFLG4O+nFKUzAGBgPbp5jsT8NdEzeK+
         XPoOj2eT36dJklXS3bKGFFzvk7SzeiGdd6bNv+x8vcHwA2NQSi+2RCxo7RfQFqtKAcqt
         JsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955802; x=1793560602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=ZFeCbe2YEvA8SU9pam04xgyhkzCkEoansUHDjJZwExWJFvMFI6XBEZb5OrbT/5mftE
         jv8xeHzGBQdb62Nunb3a+s7JTZALa5oRkJw9MjjxhJ7AU//qQGiO9yNc1ihNRYR4IogM
         9uPQsCqi19ENLJSn4QloUZsno7QNWWIt0E7+EEZhKdrgsN7topqfOIflV7aBTGhOJW7E
         6ozhn0YLejU+QXpEO6GgvDbW96Bd0kVXhQYZC2579ZQdt7RAQNig3Af7AV3tFPaM5EB3
         gyB+HCGY95u73ig3dsRh1D7jenaKA2X/TIQaLZpqlcmbtPrfRs0ejmU6o3RGKM6xiVi+
         ugbw==
X-Forwarded-Encrypted: i=1; AKwUvBxzXzX/DF/RFPN0sDS81rV7fJ71ld55gxAC+ibagO4/JH8mJBToHAa79AOZ2Owc2Zk/FCwjqOEDyn2P@vger.kernel.org
X-Gm-Message-State: AFq9FYJXcGTykLz2Oo54ALUuxrQXBinLmXU55XyDIRk3WgWloJUwBro7
	/RyrBhX8d+O7wigfwGTB1Ym5AsiM571QE6IilfL07Y/qvDVkHH6HANcx+YnmIKD8qOg=
X-Gm-Gg: AYBFou19yqBItYCQESTpeVTAUy0d1vOUwjYonYrD8uHxuCV9uc3DSXQ8147UNVV7Tq0
	k87gs9nIrmpw1FjeWF+3/9G0zGJxrheeqSLw0Aix7KKlxleaNGuizZeGcyd44hFozP+6llq+MZO
	R1W/b6FeUx5H/j2iFxeEIuJUfNsmrVO1FDzLaG6vaNnLNF3jwiJBQtRh8aBBANxlKJLw0Yd/UDO
	VekCVvL+nrW5fB2p/f7WFoCS14brqqVnEzeuHl9HLH2PRh0RufLvI/QUWytejO8rDLBo1eikl+M
	3q40M8xp1V7XGwxLswYLmWr+zM5a/fZxE3+sXQpylaqOW6QfQD3g5NGUCDtMXRAaVWQY6RxC/sU
	3YJ80kcdxdbA2mJDrkw/xj7b86U/cWOsaUghfPPacU8gMQc4tRfbkd6yB+DvNIaYGoXGhoUYzi5
	0J+9SuYFqFtHrDhDOKXGEuM9GCRYCZssuOOicvQ75007yx3brS/9CRmtTzRN+CmIReVrYvCl1pb
	Tutbd/fFPIN0XIgffdEptu7UCgoGRFZ0MI1RJ+yKTLPDKuP//VcAQngfnZuYtawCQtQwwn7l8h6
	wz3YGc61QCh45AM=
X-Received: by 2002:a05:600c:3e8c:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a35acbcc9cmr72896635e9.25.1792955802524;
        Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Sun, 25 Oct 2026 20:16:37 +0100
Message-ID: <20261025191640.13592-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

