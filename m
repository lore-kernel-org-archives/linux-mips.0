Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793968200;
	b=EvWSY4L2LfUISRm5WoR8IeBefOMMSOBwwAlGVCCeIzA/tbHnNgQ0cMrggIWUraozWuIP
	 C35UDSNwOe8dx0rJPBsqWqUhuTdcse05XCOqMpcaM6Qq4L6suoo+LugChOuXzpCsKsb46
	 ipkpQxxkxTmGDy2HXDMpDlI1U2tLAsxqS9m/wnD0Hx1mIuzctZWsKNLjGAX1rj2XUodDF
	 g2HWVHQR2qAkOSbHfFYwNfV0SdjpgWW25KBw7plq3mG0Iam+OK/mWnxMtqkTMm2wW4B2d
	 Gr1FF6IGdTa5wTvafFhxmaHmBnyuDXCnAV6AcXq5OxO/gXr3EIaIhnSTxSsH87GbZQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968200;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=sY9IxkObF5QHGvv57BYmaIS7AhgjXyhTul2To8dMQ8Y=;
	b=dQGs8eSBWle3629AsFILXX9FxecE9E507Bymg54U9lEMYpLp7hUGiC9Dj4ZYxwCRRu1B
	 L7N6RWUpzUVTXz2P+qRwK2TVqnwnrmrOD/vtjkC2mN5tcDsEjdFHLEmR2fCQTBazf3Ib0
	 T/EA9eGbk+FiOnETInyxAjRzA3x1nGZDV6M53tRrrlEY/9qjPXu18GI71neDgFv7Efit9
	 6cGMj386yJAENEA7vcUlJfZor/ExDckoXCT7eqB99C14LWfZ5AxbYSLMHh6mnju9abI0q
	 D1WneBiLOq6uu0Eu0k14aIygrHxDQr24q0/9QYTotO0jqehi77A/nUmPsGCzCxk6h5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GLy0jVmV;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="I+yw/HsA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7086606A32C;
	Fri,  6 Nov 2026 12:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7086606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GLy0jVmV;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=I+yw/HsA
ARC-Seal: i=1; a=rsa-sha256; t=1793968150; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OJsZHe5hv7NE0Bx1FrLsota/0Ib4gujR9siCG6I57qsrjyBSjrwILvKNwx/iwlRmop
    MV/OfRELHql4UZ7tD+3gVHtmCXwcxVAFGDjuU1/lpV74eTYLy+CALkmj4LLH5fvSP3lk
    +6GQwqbXLPq8Py4g8/g9Fo86K+Xs+eo2q0d86/GMrLg3doTfukprCtWWpj7fVUi4jYrt
    E2akJGgBYTGuCsJ1LOT4xs9j5TXnafiPHsyT0hf3eWLAZDhnXN3/a1sYVTV4exEotThb
    tneFRSjfCjoRDb1CxEVpODSOgVldiJwz4QiZugUl5WI68JXgWDB3l9P5uqhHNstkLyyl
    BxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793968150;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=sY9IxkObF5QHGvv57BYmaIS7AhgjXyhTul2To8dMQ8Y=;
    b=Gpr7JH+RRjhm8M/lm7UZ4X1bWDbzZnNTrVbVs77Ueu34YvAAIzFnmI/YCvocqVhmdd
    SDLeT3GBe3BwgQGpsK0JCCQ4wcofF0nbm0Gi7Ls9T9lRaHtiCB9eFoTVWXG5i5+9dudu
    MrG0a6W8xXa6dWRbazGNbqTcpKXHwHTdPcWaiuSsjFpr7lTaFnlnxb3i+lvoXD5HWIDE
    V+S0sXYW78xmxrUaBPYHUvWqa/rjnAUyKvKYZKqVk1Lt8A3WCRjXHPyUusimP54u36J6
    7hdErx88CdrX+leNaZL+PlZZJN8sArSDPgka2GUWu3uDbTTaIoq2XbRmNbWTDAMOUfZK
    Wihw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793968150;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=sY9IxkObF5QHGvv57BYmaIS7AhgjXyhTul2To8dMQ8Y=;
    b=GLy0jVmVCzRd3ZSjPNAXaoYRrEx8UiKxE0kQAoLPvf2g9z6Tee6im8Jo3eVwo7p1UI
    btAhrm4cq238mQQz96X47dAPWRTEnoGvTHe44AMIXtzftgVP6OrJKBp7+vwlfHj0w7Zh
    WsX3Hx33pObSncORVUsLbNasVTP/W7YMda7+I+tj+agx2/gdlrEnx8bsCZOK+ZRHdT2g
    3HA0Od7D43OmGG/wJGAGCgWY/XCRfWzM4AWzrrL+O6GyI46JKxNZdTn2X8yWWChHpvwd
    5K7LEAKjbEauFKU+3RdGHUWbBwWtY8z96Gf8VnY1ExXo+I4FFbWJeyWJ0HPUce37wSwi
    VPfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793968150;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=sY9IxkObF5QHGvv57BYmaIS7AhgjXyhTul2To8dMQ8Y=;
    b=I+yw/HsAH/nifZuMnErMgS4a3Y56cfceeo7kHHREl9fpYP3bWoq743/bozm1rMfeWl
    L7txQ38uciVx6Y+BxFBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVjZoMy8iN4frnsPsBQ4l+mfK4O7kvgww6TmAq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22A6CT9nOb
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 6 Nov 2026 13:29:09 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <23f5885b4339800f24ae33fbb782f43da931be10.camel@crapouillou.net>
Date: Fri, 6 Nov 2026 13:28:38 +0100
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <80369640-E1F7-489A-B25B-69B83061C8DE@goldelico.com>
References: <20261105203517.2293404-1-f.fainelli@gmail.com>
 <5197EDEE-A739-4ADB-A1A9-08B0516735C7@goldelico.com>
 <23f5885b4339800f24ae33fbb782f43da931be10.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 06.11.2026 um 13:21 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Nikolaus:
>=20
> Le vendredi 06 novembre 2026 =C3=A0 11:59 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Hi,
>>=20
>>> Am 05.11.2026 um 21:35 schrieb Florian Fainelli =
<f.fainelli@gmail.com>:
>>>=20
>>> The LCD controller's internal bridge is embedded in an object =
allocated
>>> with drmm_encoder_alloc(). This initializes the encoder but leaves =
the
>>> bridge's reference count at zero. Since drm_bridge_attach() takes a
>>> reference, probing the CI20 display produces addition-on-zero and
>>> underflow warnings and fails to attach the HDMI bridge chain.
>>>=20
>>> Allocate the internal bridge with devm_drm_bridge_alloc() and =
register
>>> it with devm_drm_bridge_add() before attaching it. Keep the encoder =
in a
>>> separate DRM-managed allocation: encoder cleanup can drop the final
>>> bridge reference before it has finished accessing the encoder. Find
>>> the internal bridge through the encoder's bridge chain during mode
>>> setting, and use the bridge argument directly in bridge callbacks.
>>>=20
>>> Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in
>>> drm_bridge_attach/detach()")
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>> ---
>>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 31 =
+++++++++++++++--------
>>> 1 file changed, 21 insertions(+), 10 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> index 625ec76cf04d..520912f9ed0d 100644
>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> @@ -121,16 +121,15 @@ struct ingenic_drm {
>>> };
>>>=20
>>> struct ingenic_drm_bridge {
>>> - struct drm_encoder encoder;
>>> struct drm_bridge bridge, *next_bridge;
>>>=20
>>> struct drm_bus_cfg bus_cfg;
>>> };
>>>=20
>>> static inline struct ingenic_drm_bridge *
>>> -to_ingenic_drm_bridge(struct drm_encoder *encoder)
>>> +to_ingenic_drm_bridge(struct drm_bridge *bridge)
>>> {
>>> - return container_of(encoder, struct ingenic_drm_bridge, encoder);
>>> + return container_of(bridge, struct ingenic_drm_bridge, bridge);
>>> }
>>>=20
>>> static inline struct ingenic_drm_private_state *
>>> @@ -738,7 +737,9 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct
>>> drm_encoder *encoder,
>>> {
>>> struct ingenic_drm *priv =3D drm_device_get_priv(encoder->dev);
>>> struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>>> - struct ingenic_drm_bridge *bridge =3D =
to_ingenic_drm_bridge(encoder);
>>> + struct drm_bridge *first_bridge __free(drm_bridge_put) =3D
>>> + drm_bridge_chain_get_first_bridge(encoder);
>>> + struct ingenic_drm_bridge *bridge =3D =
to_ingenic_drm_bridge(first_bridge);
>>> unsigned int cfg, rgbcfg =3D 0;
>>>=20
>>> priv->panel_is_sharp =3D bridge->bus_cfg.flags & =
DRM_BUS_FLAG_SHARP_SIGNALS;
>>> @@ -799,7 +800,7 @@ static int ingenic_drm_bridge_attach(struct =
drm_bridge
>>> *bridge,
>>>     struct drm_encoder *encoder,
>>>     enum drm_bridge_attach_flags flags)
>>> {
>>> - struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(encoder);
>>> + struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge);
>>>=20
>>> return drm_bridge_attach(encoder, ib->next_bridge,
>>> &ib->bridge, flags);
>>> @@ -811,7 +812,7 @@ static int =
ingenic_drm_bridge_atomic_check(struct
>>> drm_bridge *bridge,
>>>   struct drm_connector_state *conn_state)
>>> {
>>> struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>>> - struct ingenic_drm_bridge *ib =3D =
to_ingenic_drm_bridge(bridge->encoder);
>>> + struct ingenic_drm_bridge *ib =3D to_ingenic_drm_bridge(bridge);
>>>=20
>>> ib->bus_cfg =3D bridge_state->output_bus_cfg;
>>>=20
>>> @@ -1303,22 +1304,32 @@ static int ingenic_drm_bind(struct device =
*dev, bool
>>> has_components)
>>> drm_panel_put(panel);
>>> }
>>>=20
>>> - ib =3D drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
>>> - NULL, DRM_MODE_ENCODER_DPI, NULL);
>>> + ib =3D devm_drm_bridge_alloc(dev, struct ingenic_drm_bridge, =
bridge,
>>> +   &ingenic_drm_bridge_funcs);
>>> if (IS_ERR(ib)) {
>>> ret =3D PTR_ERR(ib);
>>> + dev_err(dev, "Failed to allocate bridge: %d\n", ret);
>>> + goto err_drvdata;
>>> + }
>>> +
>>> + encoder =3D drmm_plain_encoder_alloc(drm, NULL,
>>> +   DRM_MODE_ENCODER_DPI, NULL);
>>> + if (IS_ERR(encoder)) {
>>> + ret =3D PTR_ERR(encoder);
>>> dev_err(dev, "Failed to init encoder: %d\n", ret);
>>> goto err_drvdata;
>>> }
>>>=20
>>> - encoder =3D &ib->encoder;
>>> encoder->possible_crtcs =3D drm_crtc_mask(&priv->crtc);
>>>=20
>>> drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
>>>=20
>>> - ib->bridge.funcs =3D &ingenic_drm_bridge_funcs;
>>> ib->next_bridge =3D bridge;
>>>=20
>>> + ret =3D devm_drm_bridge_add(dev, &ib->bridge);
>>> + if (ret)
>>> + goto err_drvdata;
>>> +
>>> ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> if (ret) {
>>> --=20
>>> 2.53.0
>>=20
>> Works for me on CI20 with HDMI display.
>>=20
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 V2a
>=20
> This patches basically overrides your "[PATCH v6] drm/ingenic: fix =
bridge
> allocation", correct?

Indeed.

Well, I am not sure which is the right one. Both work for me. So you can =
choose
(e.g. if struct ingenic_drm_bridge should embed an struct drm_encoder =
encoder
or not.

Best regards,
Nikolaus

