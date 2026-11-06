Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973109;
	b=Bn8BhDbBhv6sHU3SufTls6cjwbPmfl2yTeIpBq9BDfvm6d+PsGY/Zm4+w8gbowyEwttc
	 UgbdY8tndb0f4XWZ3XthdxYJu80o39IKNXtYurlpNMGnykNrswyV+ya/1fo9rYFt+SuP/
	 F5swbK1LcYGWEYLbymznFK2qSLCH6m8z3iUYqI72ZfMk0etQjjCRN+WE73TNuwSO71BRV
	 v+/v9AvKDmfUSw5Rbxfu1Ztq9ijoE8krdHNNYa3PYCnv1Lc2JfU+lz0eDepujoDbCbe8A
	 OJSeA6GnmB7fFqcWn7gucNkxsxYHsJCBaMr8G3ue1Em50WojSswCllrhSYJQVDND0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973109;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=cCB42j4uUQaazWTHguvVYIuQDyPtBSzCq0l1oIWDdA4=;
	b=atCpeHjln6hpB8/f6vWuayKoVXK8yJvUkQnk3ShkLXqC+RBHuqCtMAinr4KJ+WNNHjxh
	 j2symYalfWYJ9aIWuGovtUmip3czL+drfHXQyzn7bBItqFtuqDPVz3p+IwaFBs/tDfvxj
	 cCmo5liW0zSCdQZSwCl4Ay/ogR3k87Mo1kTQbbzAXo/ho4KhF9nIT4sT43Smecln6r2Rp
	 dithtg0wUAyM2JD2c8zN3gis9HLyLjBQqyCKnNMFyrwX4D9K2FUZswfxW430mqOPgGJrt
	 0g2PHQrLuiHMceHrqsCmA3P1hzzATfhqQgDesYoy1jWakaNl8/oXs1BT9S3ayf9dVSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awlDE23z;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDDD606A326
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 13:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDDD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awlDE23z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 373D21A1454;
	Fri,  6 Nov 2026 13:51:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2E2C5FFBC;
	Fri,  6 Nov 2026 13:51:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0A0C103291F5;
	Fri,  6 Nov 2026 14:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793973099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cCB42j4uUQaazWTHguvVYIuQDyPtBSzCq0l1oIWDdA4=;
	b=awlDE23zN6815brW6O76EzSVaIyUtC2uOEdfCdLXIce8XGeHvSgL0A9pAAuC9URQ3bxF+3
	BVMYZOD+xme1YW1lX0ngMvGK2ytXOuKMc2LvkAfBEXEnMJ25Qja3GMJhQybhsd7AoavoYB
	/XYy5fJvZEGs3lT/5W3LSBvUx93+eqt34D0iyb5j9ji1/jiy/q4rPXufG1u462SD2nhOZt
	ermhSIVhqYaAisV5JWsUzOIElEA9rNYSvYmyPt9rOKXIsqdkrW3KTgXQ4331qfENoie7vy
	g8usz7bYMo6qyMlbE+bSnvadGUkLw4h3u6H9RZPQRfUybcmi8qoIsF4miZQ0NQ==
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 14:51:33 +0100
Message-Id: <DMO6DXVL3192.142ATKP8CWVXD@bootlin.com>
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
Cc: "Florian Fainelli" <f.fainelli@gmail.com>,
 <linux-kernel@vger.kernel.org>, "Paul Boddie" <paul@boddie.org.uk>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "open list:INGENIC JZ47xx SoCs"
 <linux-mips@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "Discussions about the Letux Kernel"
 <letux-kernel@openphoenux.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, "Paul Cercueil"
 <paul@crapouillou.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261105203517.2293404-1-f.fainelli@gmail.com>
 <5197EDEE-A739-4ADB-A1A9-08B0516735C7@goldelico.com>
 <23f5885b4339800f24ae33fbb782f43da931be10.camel@crapouillou.net>
 <80369640-E1F7-489A-B25B-69B83061C8DE@goldelico.com>
In-Reply-To: <80369640-E1F7-489A-B25B-69B83061C8DE@goldelico.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello all,

On Fri Nov 6, 2026 at 1:28 PM CET, H. Nikolaus Schaller wrote:
>
>
>> Am 06.11.2026 um 13:21 schrieb Paul Cercueil <paul@crapouillou.net>:
>>
>> Nikolaus:
>>
>> Le vendredi 06 novembre 2026 =C3=A0 11:59 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>>> Hi,
>>>
>>>> Am 05.11.2026 um 21:35 schrieb Florian Fainelli <f.fainelli@gmail.com>=
:
>>>>
>>>> The LCD controller's internal bridge is embedded in an object allocate=
d
>>>> with drmm_encoder_alloc(). This initializes the encoder but leaves the
>>>> bridge's reference count at zero. Since drm_bridge_attach() takes a
>>>> reference, probing the CI20 display produces addition-on-zero and
>>>> underflow warnings and fails to attach the HDMI bridge chain.
>>>>
>>>> Allocate the internal bridge with devm_drm_bridge_alloc() and register
>>>> it with devm_drm_bridge_add() before attaching it. Keep the encoder in=
 a
>>>> separate DRM-managed allocation: encoder cleanup can drop the final
>>>> bridge reference before it has finished accessing the encoder. Find
>>>> the internal bridge through the encoder's bridge chain during mode
>>>> setting, and use the bridge argument directly in bridge callbacks.
>>>>
>>>> Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in
>>>> drm_bridge_attach/detach()")
>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> ---
>>>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 31 +++++++++++++++--------
>>>> 1 file changed, 21 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> index 625ec76cf04d..520912f9ed0d 100644
>>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> @@ -121,16 +121,15 @@ struct ingenic_drm {
>>>> };
>>>>
>>>> struct ingenic_drm_bridge {
>>>> - struct drm_encoder encoder;
>>>> struct drm_bridge bridge, *next_bridge;
>>>>
>>>> struct drm_bus_cfg bus_cfg;
>>>> };
>>>>
>>>> static inline struct ingenic_drm_bridge *
>>>> -to_ingenic_drm_bridge(struct drm_encoder *encoder)
>>>> +to_ingenic_drm_bridge(struct drm_bridge *bridge)
>>>> {
>>>> - return container_of(encoder, struct ingenic_drm_bridge, encoder);
>>>> + return container_of(bridge, struct ingenic_drm_bridge, bridge);
>>>> }
>>>>
>>>> static inline struct ingenic_drm_private_state *
>>>> @@ -738,7 +737,9 @@ static void ingenic_drm_encoder_atomic_mode_set(st=
ruct
>>>> drm_encoder *encoder,
>>>> {
>>>> struct ingenic_drm *priv =3D drm_device_get_priv(encoder->dev);
>>>> struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>>>> - struct ingenic_drm_bridge *bridge =3D to_ingenic_drm_bridge(encoder)=
;
>>>> + struct drm_bridge *first_bridge __free(drm_bridge_put) =3D
>>>> + drm_bridge_chain_get_first_bridge(encoder);
>>>> + struct ingenic_drm_bridge *bridge =3D to_ingenic_drm_bridge(first_br=
idge);
>>>> unsigned int cfg, rgbcfg =3D 0;
>>>>
>>>> priv->panel_is_sharp =3D bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SI=
GNALS;
>>>> @@ -799,7 +800,7 @@ static int ingenic_drm_bridge_attach(struct drm_br=
idge
>>>> *bridge,
>>>>     struct drm_encoder *encoder,
>>>>     enum drm_bridge_attach_flags flags)
>>>> {
>>>> - struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(encoder);
>>>> + struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge);
>>>>
>>>> return drm_bridge_attach(encoder, ib->next_bridge,
>>>> &ib->bridge, flags);
>>>> @@ -811,7 +812,7 @@ static int ingenic_drm_bridge_atomic_check(struct
>>>> drm_bridge *bridge,
>>>>   struct drm_connector_state *conn_state)
>>>> {
>>>> struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>>>> - struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge->enco=
der);
>>>> + struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge);
>>>>
>>>> ib->bus_cfg =3D bridge_state->output_bus_cfg;
>>>>
>>>> @@ -1303,22 +1304,32 @@ static int ingenic_drm_bind(struct device *dev=
, bool
>>>> has_components)
>>>> drm_panel_put(panel);
>>>> }
>>>>
>>>> - ib =3D drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
>>>> - NULL, DRM_MODE_ENCODER_DPI, NULL);
>>>> + ib =3D devm_drm_bridge_alloc(dev, struct ingenic_drm_bridge, bridge,
>>>> +   &ingenic_drm_bridge_funcs);
>>>> if (IS_ERR(ib)) {
>>>> ret =3D PTR_ERR(ib);
>>>> + dev_err(dev, "Failed to allocate bridge: %d\n", ret);
>>>> + goto err_drvdata;
>>>> + }
>>>> +
>>>> + encoder =3D drmm_plain_encoder_alloc(drm, NULL,
>>>> +   DRM_MODE_ENCODER_DPI, NULL);
>>>> + if (IS_ERR(encoder)) {
>>>> + ret =3D PTR_ERR(encoder);
>>>> dev_err(dev, "Failed to init encoder: %d\n", ret);
>>>> goto err_drvdata;
>>>> }
>>>>
>>>> - encoder =3D &ib->encoder;
>>>> encoder->possible_crtcs =3D drm_crtc_mask(&priv->crtc);
>>>>
>>>> drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
>>>>
>>>> - ib->bridge.funcs =3D &ingenic_drm_bridge_funcs;
>>>> ib->next_bridge =3D bridge;
>>>>
>>>> + ret =3D devm_drm_bridge_add(dev, &ib->bridge);
>>>> + if (ret)
>>>> + goto err_drvdata;
>>>> +
>>>> ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>> if (ret) {
>>>> --
>>>> 2.53.0
>>>
>>> Works for me on CI20 with HDMI display.
>>>
>>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 V2a
>>
>> This patches basically overrides your "[PATCH v6] drm/ingenic: fix bridg=
e
>> allocation", correct?
>
> Indeed.
>
> Well, I am not sure which is the right one. Both work for me. So you can =
choose
> (e.g. if struct ingenic_drm_bridge should embed an struct drm_encoder enc=
oder
> or not.

Sorry I hadn't seen the previous patches by Nikolaus. And I missed this
driver while converting bridge users to devm_drm_bridge_alloc().

Both patches look technically correct, but this one looks cleaner to me, so
I'd apply this one.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
