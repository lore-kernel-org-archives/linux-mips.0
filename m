Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937114;
	b=bP6UZSb5fojbHZ2062tQ0P+mbMh15HAjV/aGS5lAn7hP6Kod4PfbKxBxvNeraSmchJEl
	 osQQnpY+praP2qWq4jFBMk7Kt/Iuv7LS+YDDdzZonyW5f9ETftkHP3eqiDDDPHU6MC4dA
	 s+Ibad252kHxKyTHzLaigqnTxpoE3+NezSVU7gywzYViR4utJVo+Jyenb7A9G54OOvOxq
	 +oUDTPaAqFUpfOILh1jXxi1+jdFOaBDWHMC4MtKIfeNI5R3XPJWUewC0ePw9wcApCot3+
	 CbKTj+vfMb9QHaNDGhXA572InnmeXCOExIgqkpW5GQUBz3vJ+DZM+crrxI3x3mH6sXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SSX+d+qRWkdn91G1pK7BnTwO8tnOwfNEC8664ApeNmk=;
	b=xMpTc55owAAGuQeB0+raRiBYwkBL8lK1yoJonYbw5UQhd8udP/t42y+NCu/bHr+2Bm5U
	 oI0SsZnPIPQGVaMf9SoWiOCbSVmihJhezAjqDNw23uXxObNosxdpFSxYPfS0g89i7KGuB
	 CFieDHkLZZQheCL1StOoVGJPzZ/PS15V4HPU+M0fE12OPY3m+plPEu7VmTv7vRzYeFla/
	 9pXhJmCruUYaeDsLVVg6JJ87Tq6NM9HJVySZDDBqusuH4JwZEgeQVN7nIArh/zL9gwqbw
	 oVDGMXhhXFFEZr+S9QYCftrJ1CB/CzYOsTTJPzJ11Qr/QkZ6k1yn/W11CfrAYE4pNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8lY2Afx;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE8606A32F
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 17:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CDE8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8lY2Afx
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3704d30b84fso217021eec.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 09:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937113; x=1795541913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSX+d+qRWkdn91G1pK7BnTwO8tnOwfNEC8664ApeNmk=;
        b=x8lY2AfxwiNYg7IpNbQCiyILCpiANn+42LaeNRKECLogXhMVGvCdemTyxpgGVVxq1m
         XrugsJSex2OH+YGY/0yNpu6PxKeaXRokdkaGeXtIrN+Fm5b23bR+JFGvwv4dhCTY48gX
         /+xIndzKuykcxo0voMeBfw0iqHoY51A2l9csG8sJmoEFVxV3Go+l9pxPxXH53taNjs58
         ZVLGf6fYwvR76sKUTNLWJFsCE/iuOIuZW7j46mBpdQfCruYGiGnxjdGwUKo5TZFaMB3N
         EsXqvNF+xPqHS9kuMGsLBxpWvrg+3zY/1iabuknjQXbefzeNcnplI9ClvJWXfqQGSpAL
         t/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937113; x=1795541913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSX+d+qRWkdn91G1pK7BnTwO8tnOwfNEC8664ApeNmk=;
        b=keeAcFuL6mqPofi9s2KVw7YAHn9r0/VGiNJeKBBklA3NF1JHY3hNsZVRXcfwA8VomR
         bFJzwloYKRCxiF77Ck0O4E6Ud7SwTMyibInmGlETmsfKV6GpdWeIslK48HwzBA2KBoCe
         6cAOen4U3MOG4fP+3TPgR4NVHdCltksTaKgM4IbHue9GH4cuwQVBiwuw+5lPlbEq+oVn
         ZeCCn1nYa8luYM7CK2foPWZAQ9k+maDR3O18NDenHq8q+KJsU72CZkRX0jQZ30Aapysw
         OAk3Rz1sAn8oThsWpD8Mb3nvh0Qd8CWV/0Xy1Xxk+dYzYNC1UNdSY4jAmE6mmYayVyog
         rZnA==
X-Forwarded-Encrypted: i=1; AL+hErG+l7u2g3gay929f7hxjRRD31GxRZcVmpxWY8UEaW4SsedD0mIa/z68ryCscByrHa/SIKVkxLye/Ln9@vger.kernel.org
X-Gm-Message-State: APuU4Z+tA9hwU4HERcLydKqWgWAxEmaD7qj7jrFCAxrjdJdGwuNC9+Za
	+N4Zjrg8TP8ajodP0q/fmKLH55NOup6ZB2/DyciYWLGIpDCWgWWIW4XB
X-Gm-Gg: AZFdTZfC1ljPCqOUSYhUKED6FF607SFoCjkJc7WTyjt2lrc1W1nhb5S7kUHtkUr9jhd
	u0U2ghwo58KMyoOwqkLnrzmQYwk3fQIMz+ZKTsWnk+PJUMbls1atp/K5OKlPqxYf62tTORfKGXS
	xr1UCvWJwSAv/scXF3L+BP86esMzpKj7PEcYR5Az4BBLezMP3W6V4xoqg1MIPMV66SB1wMyYXIz
	/sfPX/8g2DlV0idlCHrgSQ6qwZof6aFUIAfY9IC/h/lk49aWLEc1Z9LvLyOSsxHM7ctjzP7TGsy
	h3DlnshY2qvaZA5yEvTBcj9Ygvn8/rzYvqIaiSZqh834KtKbOgwSen1UoeOPIxrDh52Aqfx5FDT
	JHgkx0yzbxfN70fEDJiBRGZcimGsj00/t5wjKzBTF/C2FJeqo028K7qiDIjYdCk1G7FPHliBWGg
	4k6FyRgVUixadfyWzaMpUzA4fLHZOD07N/1El1zIrXCsEcb5X9sHBZKDsPvyvHwuYFS7HcfaYIA
	md20TpK/9gUbi5MaOXl2E2W6nc2fagcahMHZeP0QtkVZDV2wjG9gwkifsdSrN15Lc9Awpy9r3qC
	jjRL9gOB
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr123080eec.20.1794937112971;
        Tue, 17 Nov 2026 09:38:32 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm44098373eec.29.2026.11.17.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:38:32 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Paul Cercueil <paul@crapouillou.net>,
	stable@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-mips@vger.kernel.org (open list:INGENIC JZ47xx SoCs),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
Subject: [PATCH v2] drm/ingenic: Allocate and register the internal bridge separately
Date: Tue, 17 Nov 2026 09:38:20 -0800
Message-ID: <20261117173822.1816385-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The LCD controller's internal bridge is embedded in an object allocated
with drmm_encoder_alloc(). This initializes the encoder but leaves the
bridge's reference count at zero. Since drm_bridge_attach() takes a
reference, probing the CI20 display produces addition-on-zero and
underflow warnings and fails to attach the HDMI bridge chain.

Allocate the internal bridge with devm_drm_bridge_alloc() and register
it with devm_drm_bridge_add() before attaching it. Keep the encoder in a
separate DRM-managed allocation: encoder cleanup can drop the final
bridge reference before it has finished accessing the encoder. Find
the internal bridge through the encoder's bridge chain during mode
setting, and use the bridge argument directly in bridge callbacks.

Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 V2a
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
CC: stable@vger.kernel.org
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- collected Reviewed-by and Tested-by tags
- added CC: stable

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 31 +++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..520912f9ed0d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -121,16 +121,15 @@ struct ingenic_drm {
 };
 
 struct ingenic_drm_bridge {
-	struct drm_encoder encoder;
 	struct drm_bridge bridge, *next_bridge;
 
 	struct drm_bus_cfg bus_cfg;
 };
 
 static inline struct ingenic_drm_bridge *
-to_ingenic_drm_bridge(struct drm_encoder *encoder)
+to_ingenic_drm_bridge(struct drm_bridge *bridge)
 {
-	return container_of(encoder, struct ingenic_drm_bridge, encoder);
+	return container_of(bridge, struct ingenic_drm_bridge, bridge);
 }
 
 static inline struct ingenic_drm_private_state *
@@ -738,7 +737,9 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 {
 	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
+	struct drm_bridge *first_bridge __free(drm_bridge_put) =
+		drm_bridge_chain_get_first_bridge(encoder);
+	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(first_bridge);
 	unsigned int cfg, rgbcfg = 0;
 
 	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
@@ -799,7 +800,7 @@ static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge);
 
 	return drm_bridge_attach(encoder, ib->next_bridge,
 				 &ib->bridge, flags);
@@ -811,7 +812,7 @@ static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
 					   struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge->encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge);
 
 	ib->bus_cfg = bridge_state->output_bus_cfg;
 
@@ -1303,22 +1304,32 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			drm_panel_put(panel);
 		}
 
-		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
-					NULL, DRM_MODE_ENCODER_DPI, NULL);
+		ib = devm_drm_bridge_alloc(dev, struct ingenic_drm_bridge, bridge,
+					   &ingenic_drm_bridge_funcs);
 		if (IS_ERR(ib)) {
 			ret = PTR_ERR(ib);
+			dev_err(dev, "Failed to allocate bridge: %d\n", ret);
+			goto err_drvdata;
+		}
+
+		encoder = drmm_plain_encoder_alloc(drm, NULL,
+						   DRM_MODE_ENCODER_DPI, NULL);
+		if (IS_ERR(encoder)) {
+			ret = PTR_ERR(encoder);
 			dev_err(dev, "Failed to init encoder: %d\n", ret);
 			goto err_drvdata;
 		}
 
-		encoder = &ib->encoder;
 		encoder->possible_crtcs = drm_crtc_mask(&priv->crtc);
 
 		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
 
-		ib->bridge.funcs = &ingenic_drm_bridge_funcs;
 		ib->next_bridge = bridge;
 
+		ret = devm_drm_bridge_add(dev, &ib->bridge);
+		if (ret)
+			goto err_drvdata;
+
 		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
-- 
2.53.0

