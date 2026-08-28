Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8F37E5DB;
	Fri, 28 Aug 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933693; cv=none; b=iR2R3eQHIHNqRekeRLCAzJJrexPCjv0Mr+xbcBtTb/7dUPxr+KZtQrmfkjbZWH+yPaJRb9gdzImjD3qiwKcz9GS4+oLWOxQU6MLlX6ocE6asgdbjTfZLOg+4I2gK6dEcG9ORgJQeMv7nd+23YKMMyuVeDpxZN+aYICCJiqzHFzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933693; c=relaxed/simple;
	bh=kE54F3Lbt3A8eautvIO0KDgVXR+u+uk0pH0/T6kgIcw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YuXrRZvwFct2GaCByqXemdphuVHwfLSdHyOsPFwma50jTx2tpD5iqYjx1tzdWgwrggFnRIY78Ahqsx1tG/ZLrDWLZXuMENn0rnyNxMw4PvnFQpeTZ2/aBl1VgzQ784aJWiL57vIRATw0eAZSOPJYeHN1mCJ2DteDe4e8b+SG/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=wvzAwGxm; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="wvzAwGxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1787933682;
	bh=kE54F3Lbt3A8eautvIO0KDgVXR+u+uk0pH0/T6kgIcw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=wvzAwGxmK3yxYmt/Dva4AWzw5nITFr2+ZGKoQIkkpA7N9TSijSljClAqh6T3c0RAP
	 ehi6oWonB/5M8RouaOzAe4KmCiRJfTqa8t8wEswzD0D4FMlf5onC/Ey+I3ckFJiB+U
	 O4XWmEyXEBssaW0V0+hUcyDh3Hyl2r/Yi39EUmG8=
Message-ID: <a47a41fad88026d9f2eea3f01102948e5f44c926.camel@crapouillou.net>
Subject: Re: [PATCH 06/20] ASoC: jz4740: Propagate codec wake-up errors
From: Paul Cercueil <paul@crapouillou.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
 linux-sound@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 18:14:38 +0200
In-Reply-To: <20260828113416.47061-7-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
	 <20260828113416.47061-7-pengpeng@iscas.ac.cn>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pengpeng Hou,

Le vendredi 28 ao=C3=BBt 2026 =C3=A0 19:34 +0800, Pengpeng Hou a =C3=A9crit=
=C2=A0:
> The JZ4740 codec can only leave its suspend state through
> jz4740_codec_wakeup().=C2=A0 The helper ignores failures while asserting
> reset, clearing suspend/reset and replaying the dirty register cache,
> then the bias callback continues with later register writes.
>=20
> Return the first error from all three operations and stop the
> OFF-to-STANDBY transition when wake-up restoration fails.
>=20
> The issue was identified via static analysis and manually reviewed.
>=20
> Fixes: 3b097d64eafa ("ASoC: Add JZ4740 codec driver")
>=20
> Assisted-by: LLM
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

I'll leave it to Mark to decide, but IMHO the code is fine without the
patch. We're using regmap-mmio here, with settings so basic that these
calls will never fail, and that's why there was no error-checking.

Cheers,
-Paul

> ---
> =C2=A0sound/soc/codecs/jz4740.c | 25 ++++++++++++++++++-------
> =C2=A01 file changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/sound/soc/codecs/jz4740.c b/sound/soc/codecs/jz4740.c
> index d3d801d850a1..efb3f8295e98 100644
> --- a/sound/soc/codecs/jz4740.c
> +++ b/sound/soc/codecs/jz4740.c
> @@ -217,15 +217,22 @@ static struct snd_soc_dai_driver
> jz4740_codec_dai =3D {
> =C2=A0	.symmetric_rate =3D 1,
> =C2=A0};
> =C2=A0
> -static void jz4740_codec_wakeup(struct regmap *regmap)
> +static int jz4740_codec_wakeup(struct regmap *regmap)
> =C2=A0{
> -	regmap_set_bits(regmap, JZ4740_REG_CODEC_1,
> JZ4740_CODEC_1_RESET);
> +	int ret;
> +
> +	ret =3D regmap_set_bits(regmap, JZ4740_REG_CODEC_1,
> JZ4740_CODEC_1_RESET);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	udelay(2);
> =C2=A0
> -	regmap_clear_bits(regmap, JZ4740_REG_CODEC_1,
> -			=C2=A0 JZ4740_CODEC_1_SUSPEND |
> JZ4740_CODEC_1_RESET);
> +	ret =3D regmap_clear_bits(regmap, JZ4740_REG_CODEC_1,
> +				JZ4740_CODEC_1_SUSPEND |
> JZ4740_CODEC_1_RESET);
> +	if (ret)
> +		return ret;
> =C2=A0
> -	regcache_sync(regmap);
> +	return regcache_sync(regmap);
> =C2=A0}
> =C2=A0
> =C2=A0static int jz4740_codec_set_bias_level(struct snd_soc_component
> *component,
> @@ -235,6 +242,7 @@ static int jz4740_codec_set_bias_level(struct
> snd_soc_component *component,
> =C2=A0	struct jz4740_codec *jz4740_codec =3D
> snd_soc_component_get_drvdata(component);
> =C2=A0	struct regmap *regmap =3D jz4740_codec->regmap;
> =C2=A0	unsigned int mask;
> +	int ret;
> =C2=A0
> =C2=A0	switch (level) {
> =C2=A0	case SND_SOC_BIAS_ON:
> @@ -248,8 +256,11 @@ static int jz4740_codec_set_bias_level(struct
> snd_soc_component *component,
> =C2=A0		break;
> =C2=A0	case SND_SOC_BIAS_STANDBY:
> =C2=A0		/* The only way to clear the suspend flag is to
> reset the codec */
> -		if (snd_soc_dapm_get_bias_level(dapm) =3D=3D
> SND_SOC_BIAS_OFF)
> -			jz4740_codec_wakeup(regmap);
> +		if (snd_soc_dapm_get_bias_level(dapm) =3D=3D
> SND_SOC_BIAS_OFF) {
> +			ret =3D jz4740_codec_wakeup(regmap);
> +			if (ret)
> +				return ret;
> +		}
> =C2=A0
> =C2=A0		mask =3D JZ4740_CODEC_1_VREF_DISABLE |
> =C2=A0			JZ4740_CODEC_1_VREF_AMP_DISABLE |
