Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918708;
	b=r1VMPgRqDempsUHzIDMT8fGN6GzawMNMjywJQBjXrqlc8B6+DroZdToU5hHQycZ2rXKo
	 YAoypwLhht5pyOo84J5+J/AFCWNlYSsk1hRgKlyeBRR47Cdi4jaMyfNgqH0mdwPq74PzG
	 Jhj9i0eCeCEBAPuZR3kiC1gDigNm0vCNa3o/ox5feLMXKayB/nFO8YCzt/1WDjPjUfuqj
	 ha0oFAufWh0lsNiCPxl6wEVotoBbBFi/jn12Ck4WrojHPwMLee7jjYLxdP7j4Vtk5wQoX
	 vtIuPMInr4VKaXybraqXohND08+WJ8iRq/NPXgchGge/+hZpDvesDXRoZs53iKnx2Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
	b=0Ta5FqNl6auenIe1gcqQ8sFRVZB2U291H5VNJlZm0zaNUyrHUE8+MJ/6WnRkT05lhmF2
	 2nnQAnbSKtS2sgAey96Bwdh2AC0yXPuM9V5H8hmCgfdZXl5MATQU8/Ix5txXZqLGNapPb
	 //E1W7HnBDQ7LujYwfAFD+QVQFKo7cGifpgkrF78ZXXHE2tn0WtW0jPDT7EW9dJHo3xZx
	 jYdNu0fG/rdn2GQvL5qm5eIO/VzJOpT8YZO6232i0eKLwceDzLLORfXMvk07Ipt0CiiQ5
	 Q+w07aw8QD72+sC+NTrE3CKntUy2CLGA6iLmcnlYZx+Kd69hg9gJBFFxGzTVx2QNJCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WCYC2F1e;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E8606A33A
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8E8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WCYC2F1e
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1247942f8f.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918701; x=1793523501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=WCYC2F1eL7PSTWTewswlPoV+s/3gV54ijZwZdUij9tzdzSwuD4nnatlbxCrf81nbEk
         oIJ1zjY9a1cDZOeow9P71jiNwROIRl+li5gpaOIiLJi0oniTVzlR9HoAFJVhtBoLb5Pn
         YpeU8U2oL+HtPzoWnIKREM1gvua4fvpBQyrRmpt3L8z4VEzp1XYixHT7My0eFUBDzCSd
         zJwa4SdBL5Z/iU6fc4CcMtp3aEBHE7K3ZBFuYbz9kIneycZGlp2nbzR3f0zV3H0VJOIf
         AKX1CdPahbGqTRh99OIi5cJ1O/owNP0wKyMT53HVMZFBd22fwXeCu26pRB1j9ehisTBh
         TFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918701; x=1793523501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=eOrM1HwpuRTjuzree35plCJovqeTaQXmQ/zlT2nrF99Lhu36f1l8KH90lzoDFKN/yd
         N6gHcRdD7w+nnsW+cXNRXHIurvzoZeFvOFf9agkMMg6tZVF+B1lI2l2pbBUs0oVf5hpq
         ps7GQptx3BuKxsGA+usHX2bcxAI0tSAZ9+fr6dfcVjt0O/YgX73dUDtyP3InEzi/iFak
         Qm8IIkfhHAs+jDFJMSOYIBOp/0OoH2hWuhdUV3NlEXT5MV/8OGDy7ROXcMKZ/gaNQjTF
         +v/irGuDnG2XDjMOgTOU8YcUWP1iGjFo1z44MPYGlug1ryzTo8pVrUDnaiJiBJKNfa1M
         SKsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdxSYfBoTfWat+pSeiOhjfXVe32t2k/bFDTzBTRyKpVel9FxeX+R45v0oW0YGcnLkaF5As+1Mju1Z7@vger.kernel.org
X-Gm-Message-State: AFq9FYJacB4sznzJevRjwyuoC6Eh35c2GLqhd3QLl/L1ebaOXghaaZDz
	mnF0JlmundMleqkeu9Ja0/sbMHhEyaALnGeKXDYksjw/qAnET8CB0lQ6oYJlNxYsueQ=
X-Gm-Gg: AYBFou3dFdpTE2FFSvgQGlRaLNJfJwRO2OY5i2dKFtSFSy+rXQAP66nNb1mv2q9cAr4
	TbdY6w4PX+7uy+2vWt1AXCRTVOVokMqB1FohF5sdnoERbA0Ea/1HzhweT+MTqEIgOqiOllC8CD/
	Q70CbN9hLJF4LKFMv/Eza1oyYG7R7N5LOmDV1ycM0bIuENTcNMYHo7VH81rwiuG9qVzRmFf4o01
	msWgLHWLegw1aa/sZJhojNYCnDUlFrOjYMHWrM3Ss/t9RfvQFdSSHaf3U42p2QG4gYhxrSz6qt6
	lAvx4OWw/URyFD6/yZTSYq/4H66uvbtLpS6+LahKBXQkL6xEoC9anRCPTZcSmw5WgdfSG2RmA5b
	TRyUmWFHeAdsGzxGDJytVOJ3k1c2cOCpD1GggViTrttSPhKBPP3iPMefJXNAXIhXf8gBgdoLc75
	PjSOdQXlJ8qJUaZw31SBZFlI5HQh3WC8oX31l3vLSzd0hH+VGvZCZKw7jLSYUm+51k+X4QTBAwV
	rcrjsCQp9QGxlt/geFheLIeU5BIGyxarJYM5btJ1ybV/sU7IBs9L+w2vmUoDqH55S1m7CvRejGK
	/+krwXnsAGmo/TTcIYFPIjJlyQqodpx7ZvmtgKbI5vttO7VLHYio0h53QqB9G1M5fLcGPXak0w=
	=
X-Received: by 2002:a05:6000:4a0a:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e3eac8e4bmr6815931f8f.0.1792918701100;
        Sun, 25 Oct 2026 01:58:21 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
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
Subject: [PATCH 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Sun, 25 Oct 2026 09:58:15 +0100
Message-ID: <20261025085816.60405-5-olivier@mgcrea.io>
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

The 480x800 parallel RGB panel of the HiBy R1, set up over a 3-wire SPI
bus with 16-bit words.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/panel/hiby,lg35583.yaml  | 71 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
new file mode 100644
index 000000000000..19498910629c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
@@ -0,0 +1,71 @@
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
+  reset-gpios: true
+  backlight: true
+  port: true
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
+                    remote-endpoint = <&lcd_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 57313163e59e..e65500a70c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8152,6 +8152,11 @@ S:	Maintained
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

