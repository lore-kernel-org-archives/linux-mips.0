Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246481;
	b=bkhsg1oki8mCxmFheY1tGhEM0dTAoLzPXpxtRsKsQyGLTNrVJKpo4wBUYT79it9RIB5w
	 XGslquZ2hWScAoAUarAx6Z273gLAQdNnjV59L3EG2WzpG74pdsPTFbEpeO6/uKO3m/njB
	 AxEio2X2QGDbwoFEhbauq53s6+G/Nes6YDc0v2EEybNuEqi27QuKAh+hf8suVBe7eu00G
	 OxP9L5BfLoJmGRZfdPPpqvQCio7J9cs/9tOPPJHzeppB8MN78p2MtfAcZ9Yekj4EqG7B1
	 RXdMgDkYeauExZWpS2H36HLgUHOmQ/O53SWmtwbTZIlgVbs+7YqfWrHNKJEbWmEKLlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
	b=pQKF3xgG4JtkwyvajYwl5euFgEWrtzRNBiPAEY9qeY+40IihdxifUDRUZLW/zMpUJXnn
	 gfT63TgIF1fxwOmubJX50vws+pVdcEejTGhh7nVP8MDR2NfVzERl6Cbh5NMwL5vmsRKhH
	 ertY5l4rR7pV/KUjl0/Z8+8w5XbfZ6Fop+BfEtLWlsFbN5jzoKMRMT20Qx5vxW0lZe+md
	 wHlTWPkQm4rr1fEo0di3DS4lMVw7dUzyb8JAgzaTnxks4PljT9dhRghotuf1O7djlFJoX
	 gsTvnYJLSSKHiVS5i3Z2imaxqVoDGGrOaUccj9RgQpQiiVQRy/PIEU0NGPcCvinGNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=VyphT7RR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7360A261E
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 17:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E7360A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=VyphT7RR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9085155e9.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246480; x=1794851280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
        b=VyphT7RRWxe3Nb1j+alPv1dFVOBnnwvEQPNnZN2sFTR8QsulknKhLeTyqfbw9gW9+a
         9Xq7JqSTvF5dBdNVk3prQv9Y7ONFhmZ8B3gnBULlkZApqHaw/z9zfEc1itHBIsFQkuB1
         hf8S3ZiaT0v9xdzx8SrZprURp9Sbl4tuVF7UzubtEd2BAGQ569RQmFygxzTvNzk1G3UQ
         Km+Edbqsq0Yf0Av6+MPgPZssJmufla0V3Zq6RSF9U67PNnInd3WPyUVYg3ky59iILhcB
         kRYaoAulGxYaPwoYWLUKJZ7IURSzvgN+XcSBOIiXPt0ALFryznT8mFshQrFTDKx22jY7
         DpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246480; x=1794851280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
        b=e1j9Sow4VXndn26LjYVBSb5R+lNtoiork330rlDdKaz4yeVKAUReSw238I2fN94kQF
         xKQ5TwRTo9y/9n7EK+Jy1nfmPS+gkMmP4uOVMXObzz4da3p/6EFmkNnDc7NGA8D7EEtW
         x5rBRfDB3a031+QKcBeLIs5SPnyz9if/qR5baYcmz9vuWYbFSPKu8Vy54YifdHN9wGnt
         V0StMNAoAhbEvKeqq3+ixNL/oWQrBitzIDRWrJb7WIUSms74n6lYPH3sIs18CiPvhU2W
         p1/lkU0PLgnDN+pDA2afTsDTfnNikfQi1P85I9eDdoSY8qTVVw68BLvnj5Vlt+FkT02Q
         VdRw==
X-Forwarded-Encrypted: i=1; AL+hErF5eSG5rha4P5YT1sR65aiEjYNo7OcIShFZkFEuaWHobiLknhIM8I5bPcAHVN48EwXc2vDqE6N4b3jM@vger.kernel.org
X-Gm-Message-State: APuU4Z8LZ1Xua6W4ZBX6gPSrMerTnSTCSRUuH5389a5+50F6uxPFYm0g
	cqD+32P2DFoVn8+LKQ3JJ0abAPybDb1X6qW+dWYf9Gi+mv0ZFqT0sPV0mwDljV72pgg=
X-Gm-Gg: AYBFou25t3/YnvtUR+w6HbyznYfOfxBlUqWnplpHj6nutXaZXXFdg1/7OUhWOft5nmt
	ZGk/McvqHb0KHmZjgHX51UWo2wHsLjHQxfqVCkBaW+fY3TL0PCq5yC3NpalbAWUVHn4Rnmt3h+7
	vrawUVUWLswZ8QIzr+RvsUHHxocT+8F9PlALGV1DWkDmuT7rDC9+nPeoXY9dQIQnSiB8WdhIgqt
	UlCqlQG+nZ7Sxy46Kv0c1HXTCGT0pukH6lYww7q+sJyVgBzdfEyIVkfFRd5tGgkqNOwiPerSNs0
	dEZZ7QMn6fxa0Mo7dOnJ28AXPYWTV3tt74t2Rmg8wgeXTuzN0ONfW0jG7rehGzN+wt7O2qH1heM
	e3IMzKxQkg6Feg7na8oB9pM4BQ8DGpGlfy+ancvtNfowWLoDDCQ7miQLs5GGjl4ZkvcI3DIH2N4
	AlE6Krx6GyW2RtIC2XjrmbiyKAXIOk8KvZlAqANHrHZF62Ji02SSN8C/zxwhhDfqYYHSutFj6jI
	t5LRDHQiYV/AYbvsVx34DrqLtbYzonfeCcrGGL08DARfPKl/fc3w9mDa2X5DrMhnK6iFAElkenV
	OMVX6Rc5/Se+USOp/FsMURW/SJEeLaETvVl1pJVjhL/DYcqQ86jEUx6ImEW2zxo=
X-Received: by 2002:a05:600c:314f:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4b963c73aa2mr94357825e9.25.1794246479866;
        Mon, 09 Nov 2026 09:47:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:59 -0800 (PST)
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
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Mon,  9 Nov 2026 18:46:39 +0100
Message-ID: <20261109174640.96951-5-olivier@mgcrea.io>
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

The 480x800 parallel RGB panel of the HiBy R1, set up over a 3-wire SPI
bus with 16-bit words.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/panel/hiby,lg35583.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
new file mode 100644
index 000000000000..efdaf6241e60
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hiby,lg35583.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiBy LG35583 480x800 panel
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The 480x800 parallel RGB panel of the HiBy R1, which HiBy calls the
+  LG35583. It is set up over a 3-wire SPI bus with 16-bit words.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: hiby,lg35583
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Panel power supply
+
+  vccio-supply:
+    description: I/O power supply
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - vccio-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "hiby,lg35583";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+
+            vcc-supply = <&vcc_lcd>;
+            vccio-supply = <&vccio_lcd>;
+            reset-gpios = <&gpa 31 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dpu_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c3e8d1a55d28..ddc559cac674 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8346,6 +8346,11 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
+DRM DRIVER FOR HIBY LG35583 PANEL
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
+
 DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
 M:	Ondrej Jirman <megi@xff.cz>
 M:	Javier Martinez Canillas <javierm@redhat.com>
-- 
2.39.5

