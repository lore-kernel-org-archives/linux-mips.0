Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967669;
	b=NKx12NfqbuzY7EkT/WAtx8v8NjxzeVz5cM0yB4tvCrFE1/FyqUPM0KECAO6Ei+fpAiLt
	 7ytwwd1XLwTjH4O5ytLXqdm5VR8PrFTxX5ya2Y8zeg702RPISPjPdURFH6Lt3O9iS3AxB
	 1EB/ggzIN6AhNXyb+0i8WyV10ySHe2m2/wZSHj8L1oQ50BBC6tmt/gouQa9oe2FRQZus1
	 4ao+eTOgDZjB3hWUUFFimPeylRJWsp0QraUg/+zyKNQh16BWwnC/HF6zh+rZil9kFLMVG
	 6cdUHO/tykfn6L1lETGm9op+4+qFDWeb+TQwTy5lrZBiEwkZ2dYisnkqp/leCABp4ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967669;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=T9WNqU5tTs7XaSiMPckeFnvQQmI6WgBjRQiyEOG7jjw=;
	b=aDty2xeyYuyCvDz7+p9+j51Ht4GBAc1I2+YRSG4CFUYQAIBgmnMbaiHU8Xr6YPvJqe6t
	 tmkxMUTV/7W3748b2QFGQm4KmXDjD0xw+tzP3zVy0ZGe8mvXgp3jgfeHa2XAljmXWGuip
	 gnUMr6971e/+nw8tOSNRfD2depuQ3HTTK5qGFKxXweMN4Hp+4UlNywgv5YWdAea41GpmJ
	 n4tP07QcRJZ0AHuTtZ9+haDR/CU5qrFuCMXrIRyDkPoyWIe46CLQYu2iBcGbigKIAY1YW
	 WaVKHIvyjK5gmAan81Vn54PWLaFAKCTPmzXSmVrxovoiNGI+jufeHCHchtOOK7u9cFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15272606A326;
	Fri,  6 Nov 2026 12:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15272606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <23f5885b4339800f24ae33fbb782f43da931be10.camel@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Florian Fainelli
	 <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, "open list:INGENIC JZ47xx SoCs"	
 <linux-mips@vger.kernel.org>, "open list:DRM DRIVERS"	
 <dri-devel@lists.freedesktop.org>, Discussions about the Letux Kernel	
 <letux-kernel@openphoenux.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Nov 2026 13:21:02 +0100
In-Reply-To: <5197EDEE-A739-4ADB-A1A9-08B0516735C7@goldelico.com>
References: <20261105203517.2293404-1-f.fainelli@gmail.com>
	 <5197EDEE-A739-4ADB-A1A9-08B0516735C7@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Nikolaus:

Le vendredi 06 novembre 2026 =C3=A0 11:59 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Hi,
>=20
> > Am 05.11.2026 um 21:35 schrieb Florian Fainelli <f.fainelli@gmail.com>:
> >=20
> > The LCD controller's internal bridge is embedded in an object allocated
> > with drmm_encoder_alloc(). This initializes the encoder but leaves the
> > bridge's reference count at zero. Since drm_bridge_attach() takes a
> > reference, probing the CI20 display produces addition-on-zero and
> > underflow warnings and fails to attach the HDMI bridge chain.
> >=20
> > Allocate the internal bridge with devm_drm_bridge_alloc() and register
> > it with devm_drm_bridge_add() before attaching it. Keep the encoder in =
a
> > separate DRM-managed allocation: encoder cleanup can drop the final
> > bridge reference before it has finished accessing the encoder. Find
> > the internal bridge through the encoder's bridge chain during mode
> > setting, and use the bridge argument directly in bridge callbacks.
> >=20
> > Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in
> > drm_bridge_attach/detach()")
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > ---
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 31 +++++++++++++++--------
> > 1 file changed, 21 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > index 625ec76cf04d..520912f9ed0d 100644
> > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > @@ -121,16 +121,15 @@ struct ingenic_drm {
> > };
> >=20
> > struct ingenic_drm_bridge {
> > - struct drm_encoder encoder;
> > struct drm_bridge bridge, *next_bridge;
> >=20
> > struct drm_bus_cfg bus_cfg;
> > };
> >=20
> > static inline struct ingenic_drm_bridge *
> > -to_ingenic_drm_bridge(struct drm_encoder *encoder)
> > +to_ingenic_drm_bridge(struct drm_bridge *bridge)
> > {
> > - return container_of(encoder, struct ingenic_drm_bridge, encoder);
> > + return container_of(bridge, struct ingenic_drm_bridge, bridge);
> > }
> >=20
> > static inline struct ingenic_drm_private_state *
> > @@ -738,7 +737,9 @@ static void ingenic_drm_encoder_atomic_mode_set(str=
uct
> > drm_encoder *encoder,
> > {
> > struct ingenic_drm *priv =3D drm_device_get_priv(encoder->dev);
> > struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> > - struct ingenic_drm_bridge *bridge =3D to_ingenic_drm_bridge(encoder);
> > + struct drm_bridge *first_bridge __free(drm_bridge_put) =3D
> > + drm_bridge_chain_get_first_bridge(encoder);
> > + struct ingenic_drm_bridge *bridge =3D to_ingenic_drm_bridge(first_bri=
dge);
> > unsigned int cfg, rgbcfg =3D 0;
> >=20
> > priv->panel_is_sharp =3D bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIG=
NALS;
> > @@ -799,7 +800,7 @@ static int ingenic_drm_bridge_attach(struct drm_bri=
dge
> > *bridge,
> > =C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder,
> > =C2=A0=C2=A0=C2=A0 enum drm_bridge_attach_flags flags)
> > {
> > - struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(encoder);
> > + struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge);
> >=20
> > return drm_bridge_attach(encoder, ib->next_bridge,
> > &ib->bridge, flags);
> > @@ -811,7 +812,7 @@ static int ingenic_drm_bridge_atomic_check(struct
> > drm_bridge *bridge,
> > =C2=A0 struct drm_connector_state *conn_state)
> > {
> > struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> > - struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge->encod=
er);
> > + struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge);
> >=20
> > ib->bus_cfg =3D bridge_state->output_bus_cfg;
> >=20
> > @@ -1303,22 +1304,32 @@ static int ingenic_drm_bind(struct device *dev,=
 bool
> > has_components)
> > drm_panel_put(panel);
> > }
> >=20
> > - ib =3D drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
> > - NULL, DRM_MODE_ENCODER_DPI, NULL);
> > + ib =3D devm_drm_bridge_alloc(dev, struct ingenic_drm_bridge, bridge,
> > +=C2=A0=C2=A0 &ingenic_drm_bridge_funcs);
> > if (IS_ERR(ib)) {
> > ret =3D PTR_ERR(ib);
> > + dev_err(dev, "Failed to allocate bridge: %d\n", ret);
> > + goto err_drvdata;
> > + }
> > +
> > + encoder =3D drmm_plain_encoder_alloc(drm, NULL,
> > +=C2=A0=C2=A0 DRM_MODE_ENCODER_DPI, NULL);
> > + if (IS_ERR(encoder)) {
> > + ret =3D PTR_ERR(encoder);
> > dev_err(dev, "Failed to init encoder: %d\n", ret);
> > goto err_drvdata;
> > }
> >=20
> > - encoder =3D &ib->encoder;
> > encoder->possible_crtcs =3D drm_crtc_mask(&priv->crtc);
> >=20
> > drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
> >=20
> > - ib->bridge.funcs =3D &ingenic_drm_bridge_funcs;
> > ib->next_bridge =3D bridge;
> >=20
> > + ret =3D devm_drm_bridge_add(dev, &ib->bridge);
> > + if (ret)
> > + goto err_drvdata;
> > +
> > ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > if (ret) {
> > --=20
> > 2.53.0
>=20
> Works for me on CI20 with HDMI display.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 V2a

This patches basically overrides your "[PATCH v6] drm/ingenic: fix bridge
allocation", correct?

-Paul
