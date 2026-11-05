Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894194;
	b=IamIONC+NAXVf32XoCz/0qbyFfzDTrwrbQ+Ou8EVF/CEJeknUUJEDGV0PvvErKSQaMo6
	 GKQv0/uolBPgHE2qwDm9AZETwWeWS2oqi8k4qD2fRtmXQCFwRSDbNwnKQCeNTQRZApc0m
	 W2trsvll1KBsx6aw3ADZxPAtUS8wkvBsD5b1d33UieyjCfol2LH3YW7MFjo0pmQnvS4VE
	 Vqnwko8O59wUxNOjPvvI3BQfWJx3N4XzpDsSdmPoZfmTTqUFpOhfU8441reJJHn47/syi
	 UDAiKNHw0to0BGReG5ykXQCuw6vhpAKf2buAkNoMhqQJ06/IcVqOzcjgguf+oxR7AVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894194;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=8Iox7NAPaqGf7NrTaIiGesEBgoGc56bzMRgUxarbxT4=;
	b=spsKHb5T66X+xBG+dJTAoFvXxMLXBftpm93jZ7fD6HSb9lMUIITWWTrf9vZ0vbbhZDwo
	 ZARcsaNuYnbzuHFulv/YUFJc4omEyWDwELZnY7M6kEMYbjl2kmCda8g7P+SbIPZboA/Gv
	 MWOHQmK7PYR8mmySrS8F+ay3xU5aV9GqH7q0swoxXZwUyDkn5Neg9hO4EppWUvmU5cWnI
	 BnLH3BT+n333uXAJsjxFOxglCfnetYJ+l39coakkWTwfbpKJHKDLMO7/Qs/lIA6olNPNq
	 RLoFY7ebL2VMWG1SftbwWRoMcUFf2kVx4PuDhO6/EbTSi8+ssvhUQLmLrnCLO45vgpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2680060720CD
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 15:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2680060720CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <2d31acc5153863872ef0574748860670972fe311.camel@crapouillou.net>
Subject: Re: [PATCH RESEND 20/83] drm/ingenic: Switch to
 drm_mode_config_create_initial_state
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann	 <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Date: Thu, 05 Nov 2026 16:56:21 +0100
In-Reply-To: <20261105-drm-no-more-config-reset-v1-20-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
	 <20261105-drm-no-more-config-reset-v1-20-1f58d1e33380@kernel.org>
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

Hi Maxime,

Le jeudi 05 novembre 2026 =C3=A0 16:29 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles.
>=20
> Since the two roles need different behaviors (notably for objects like
> drm_private_obj that must persist across suspend/resume),
> drm_mode_config_create_initial_state() was introduced to handle only
> the initial state creation at probe time.
>=20
> Switch to drm_mode_config_create_initial_state().
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 625ec76cf04d..63198fd59498 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1355,5 +1355,7 @@ static int ingenic_drm_bind(struct device *dev, boo=
l
> has_components)
> =C2=A0	}
> =C2=A0
> -	drm_mode_config_reset(drm);
> +	ret =3D drm_mode_config_create_initial_state(drm);
> +	if (ret)
> +		goto err_drvdata;
> =C2=A0
> =C2=A0	ret =3D clk_prepare_enable(priv->pix_clk);
