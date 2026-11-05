Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910952;
	b=uq4Z3Ht88mYDtwwr9QlKex6DfaocZ0g525g+AK6EZpqA1yeBH66wD04fYt50EbFQO8wq
	 3FaYkBi3q7wVMzQQvpucrjRAhDWp5oxR0iGN6lcNFBlHlhnG4dGS/255c3t+EbXdqyf0z
	 MmZVyoc0PlW1UleIUiublvHHLEDEf6QuLD6MPYf/tHxPYCHLNKN2XUxlgMAELVN9uThjY
	 M0rgeDAfDUY1YJqGrf/7xdeiNZK7RGlTNz/0QDGkajUdxJZmsUjpM+VNSFXJTBd8a5+pu
	 OcS9qtjRRDgXLjOO5Dq69cICWVMhv7Bo0AXws7mE6yPq/Ctazz7lxb2IMiYyP0JpIyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sJJKjK0K6EALIuHLfHejOsTyjBZ8Ozdl83llEgi1uXM=;
	b=MXViGkjiHO7q1OGcnGBeeencclsiiFsAl9BkRM1tYOHGm27sO2zd2YVmy3oiSMHw1izr
	 lXHmCQh50Y+SNYTZ3MUsPhYKId16n+B7qxYuVRn31YWYyHIoPtSBxv8X6ve49MwPjjwRB
	 yC/XgR/Yvq+bAb1vAp+5clMESznviQGFRG1Z1vVRHHae6C7o8LvZ6fgQb76uxsGjNOEL4
	 mFTWGSy6+fk6YQsSCJzueWTrD7qiZ9uzxinFKvKMVhqAo98XNwka8/ygiCYHL7igI55fq
	 6/P7CCuTENrpiCBl2pPj/9GwYeRz6+LGXPT4ynh6b64PTGm1z/IFmR6fJQ2REme9X2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEWgQ7Ic;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4D606A329
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 20:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF4D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEWgQ7Ic
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a8cc11ac42so976c88.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910951; x=1794515751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJJKjK0K6EALIuHLfHejOsTyjBZ8Ozdl83llEgi1uXM=;
        b=sEWgQ7IccBR8y2XoZ0jYxksrEQgEAurbrwXNLDu2AJ9F1k0EOio/gJbIMRwGpCB1PH
         nfvNzqOtVmtR/+4zCPenK/g7S2MVPkjxYJLWn7Tw5Bx8S8dZh6jgWlcNKOlCkREJ5JTC
         aFVilgJfBkr6Q2EPZ/heFkP2iQlYED9D4tWg5Rc9yUPg2JYNELhxVmtsNB9A9cYt3Jpc
         gn439p6ieYPFU25PKAM34TRI3iyTro+YqHi53KpYDbNzjQRWCTI/9mfvDF3LAJuGSFI7
         sp1o9i8lZG4S/Rby8WOdtVpfi6dlgZ1fW6C/0h8wh+YA99bPrPpJ8z6SbOC609EqkDOY
         qZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910951; x=1794515751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJJKjK0K6EALIuHLfHejOsTyjBZ8Ozdl83llEgi1uXM=;
        b=ECa3NCHY1bEO+Q5Oz4aQLai++1qddjQIOY6yV6rjEwPOhsvHdHjQL5/wiqnaYzZdCZ
         g1HVnvosIgsW7qU7bAcZaRr3P5sL6UGCkLHgcNEyx3A6JL/6E2s822N6hZxqbt5DMvZH
         3CI+iFqZWv65vGXkCuvKsrV5ok1dM7fcd1BE95jsywL7n7qUAMbqbR0NXy1n6dYXdcNj
         +7ZoN7HVjvc2oyLbv3Gujxk/iaHbqPV/iFhicbd4W72CnHoxziQJl8gsHJPYqw0zp5m5
         ZYSgfddHVAs13RM+Dvj01NoTALg/PcCBub+OoD3CVYRZvvQWirYfLvMSKjAd7BUfWkBj
         0w5A==
X-Forwarded-Encrypted: i=1; AKwUvBz2bgkD5ddK6DfK3UqNOHThhKU+vUG0OUIIELdkqMr702aiSyIt2VMyNSW0JDk8iKgg9aomtUpo4rlN@vger.kernel.org
X-Gm-Message-State: APuU4Z8QrU5eEfj2z6ekg4f4kOrlvhijPFBHbaHfk/j7+rwdjLh/R42a
	exjoAEnNdM6ooEU4rdp8XCY9VVHuLbm/kfzCWV/BM87sslCSpVUoOQQa
X-Gm-Gg: AYBFou0gl78Gmm7huGN3oSou4/hMyLxQzNJ1AI9X8gCoVAXbyP2wg5zyTbO7XUQlN15
	7oPd97OPwSXiuqnv0keRWxVOHExN0ZX8vCWicgRbBWOjTEAdS9Kfw3UokQWOVaecP4s3Ud87xP/
	h/PIa+s/jpuji/33lOBkO4EhXkseuTnhuTYQnv1NCc8Qtz3CFlJAlrNxrMZD+3zswNX34mRyl/o
	S1nwmF+iemh1UDiEnMrgk+fy/a4oE+s2Osi4W0L3BAUhDsRFtL1LKj6HmD0MGkC5m0ddYmV+bul
	hYxH9Q/QFVa1zINsc0mzvLlYqgQ1Y3xLDeGCWyfnlSFF4CD9ZZ49JM8LqycAiNSaBemB1xKBXjZ
	K2vPnZNPeYy5reOvBik0dP51MhqBA+sY8WmSGZRQDav516B4BZcq0osJ77iXGRwihL/OTjwHTEl
	BC25T0YRsO36MbteVJ8DxMFwzPhsfpt7lh8suGvQy5pFXbN8q/W2xMvLgHtvfrnrkDTHmDybL4b
	pDhXh7adR8I4SWy6aDYbz6jAIsYHXUmZFOeCrpnmljuxYy/SVbTnVy9Jzgjy3tbEh3zG5FdI1V7
	AN3fLlec
X-Received: by 2002:a05:701a:c90a:b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b25d342861mr126756c88.28.1793910951382;
        Thu, 05 Nov 2026 12:35:51 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm19778365c88.1.2026.11.05.12.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:35:50 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>,
	paul@crapouillou.net,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mips@vger.kernel.org (open list:INGENIC JZ47xx SoCs),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
Subject: [PATCH] drm/ingenic: Allocate and register the internal bridge separately
Date: Thu,  5 Nov 2026 12:35:17 -0800
Message-ID: <20261105203517.2293404-1-f.fainelli@gmail.com>
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
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

