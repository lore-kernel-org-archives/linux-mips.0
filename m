Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792862265;
	b=PWyBzFvqM0B4tGuGXhXoa/VYQ8sgeJ8FFeITDiUp/g0jfH6CFLvL30dGYDxzB6Z+PfGk
	 SVY2Xo1Vt4lNoxEB5LtJ9aPMvq6yC/zIZ4xWdfbHrNM+I+53gvuy5tIsCtMioR/jvej6f
	 XTtcmd9M8F2Xj4t8rTVPROidJ+zT1ha2zqvfuK4ZnT+jnstO0YpW3tfKSN5rY8uXNq9Pz
	 2MNGOVWj7YbfMq750IZeUxHhp3U2KcCtxRho2yCdNHU2vGaayHmN6kTiF5QZ/wvvPcyCc
	 YGZ5Oq4FzdJYjy8lGIgMJrK/Ljn/Ar0TjqDt7YYDQHNe5P8nI5kp24dY16tnZmZSdRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862265;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=Jz4Cnd/nhouONlfQ/xSLSuMu4e8PJl5vjZF5FfVC+vg=;
	b=0qDC+vObn7ScqBv896Gu6yEQoLpk92I/zu6WoryHuN2csBCTQb6vOuS6vPDnW5rIgrUi
	 ybwnqjnE2JD8KARhR0Ol7uP1MxUgLWAjg4hEc92Xh2YzHEtcxKRcvWunLWrdF1R0QJ/k/
	 DsP9pq6rQbu/xXnV3KyP1naB+b/NFSNCXk5DWzUmTTy2moDIVTGZhoAXTPaq3hxg02Nz8
	 NpFysp/p1QqaIQ0vBojyQ8ydJIbEAmM7wiHZdb/Bu4ab6vwtKh9MW8SdLf3QuwHCzy+oG
	 wsM9jY2m2Q6FYG1uxrYbFQvTQs/Y0ZHzaS7uDYyRwUclLFej6T3tHnPRWrmcERVbsvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UUV6Y4Mv;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uyj2KSsT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316AD606A31A;
	Sat, 24 Oct 2026 17:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UUV6Y4Mv;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uyj2KSsT
ARC-Seal: i=1; a=rsa-sha256; t=1792862239; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SB8XZZrpIG6SFwH3MSks5cx+xyGlUX+Ypfd81+KKHWb9sU9b6EJdBNtKEl6ZrwG5wK
    Q/Vvfu8FkcZZu3mWx51VrL565uoSpO7ofaTYo6c40SA6n9xCIe2iTluY/CX5H/2R1DMA
    qmSYWut+aquMMSQTTN9AXfwcOst0f8ROoV/YvBvUmWzzxZDKYmMDxVwGWEB/kEUtOLM8
    1gvBgILllwhAEe8niw8fkr/04Vq3YSJ6fptfWHvU/DXfN/Jbg/E9FpLFZY17BOHzCGep
    KkbouDZyHqx9nHldSaphlqgL+3LfzKmCFgsWQBUvvNE+3NKTxJp/NnU+N/loYqCP3ZLQ
    nxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862239;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Jz4Cnd/nhouONlfQ/xSLSuMu4e8PJl5vjZF5FfVC+vg=;
    b=Jra9sXop+q5fbObrshwSaLYfc6YRGDps6bJiX0fmfWBRJEuTzaBu1nWmWwAXKdE9/z
    w6f+F26YvoqHB8wzkTNYohgpTruuVb7DpNrc8IudBS182KFHV4+h9hI/dzu/N67eVw6X
    uD5HrO2UnQlIPAS0y5aWNYYl9cG0PX7+oVdt7rc9OyG2To9Ea2kyBDqqeaCVoqlwu3UA
    9TEbKLV9RqC21AoMSC7NnjlSsPdVM5MhDpfPGjBvgYZ5ZnuismPWBQoKmN54BOdYcoVi
    9VFJievmln/hBHU9z6emWySunVnqKgXZc2t38ACYXnkdwcbx1uCe84zvxDBdqa1+qHl7
    U5nA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862239;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Jz4Cnd/nhouONlfQ/xSLSuMu4e8PJl5vjZF5FfVC+vg=;
    b=UUV6Y4Mv3ZMOQXx5JatK0g6hTe7VfU+r5qCKo3oYR9olahyEChj6Hh1avQBBNY8mLh
    HNUEcVzOBgc9+piFEYkd37vfZT9MUp6e+CKig/pAkd4EzTc2nitdpAOsguPfCTFcO5z1
    P3q7W3MQ9DqOtroJz+11pbcMBEE0ox+cOFVj6v+IM/FnfmnPxV/1UQT221tJ+TvLo1lA
    Dxi7bgK1lY10Qs1tH/BWtIUHoMHdvGt0HXx6SWQtd3VlCGM4yEOWGUwttQ1Hr7ggw1r5
    pwdHoc3PlW9ohYasKFAoyvPIs0iF3QMBeZee2jOlxPko1yNTPcFujC7N1Wm6NnNEl3RH
    /QSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792862239;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Jz4Cnd/nhouONlfQ/xSLSuMu4e8PJl5vjZF5FfVC+vg=;
    b=uyj2KSsTvIPS4h1wX672U5aKGxQ1SUEA0IRBbemK8ZTZoeMmGVoodWKCFjigT7vsfT
    ickwUHL3WbHQy/Jt2WCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKzsiNzptYNlV1C1yk7253raiyx+O3Hxli"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229OHHIwpn
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 24 Oct 2026 19:17:18 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH v2 2/2] ASoC: jz4740-i2s: Add support for the X1600
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261023152011.85407-2-olivier@mgcrea.io>
Date: Sat, 24 Oct 2026 19:16:47 +0200
Cc: Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <396AA4F3-A78E-47E5-83E0-546A813D6738@goldelico.com>
References: <20261023152011.85407-1-olivier@mgcrea.io>
 <20261023152011.85407-2-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 23.10.2026 um 17:20 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> The X1600's AIC is the X1000's, with two differences.
>=20
> Its I2SDIV register holds the bit clock divider itself, not the =
divider
> minus one, and drops the lowest bit of what is written. The driver =
writes
> div - 1 and, from a 22.5792 MHz clock, asks for 44.1 kHz with 7: the
> register keeps 6, and the stream plays at 58.8 kHz (measured on a HiBy =
R1
> from the PCM hardware pointer: 44,100 expected, 58,700 observed).

In addition compared to the x1000 there are separate TX and RX dividers
(RDIV and TDIV).

x2000 has no comparable AIC.

The x2600 has again a different divider setup in the I2SDIV register
(5 bit MDIV and 9 bit TDIV) but shares the bus address with the x1000
while the x1600 has a different one.

>=20
> Its AICCR has a channel count in bits 27:24 that the driver never =
wrote.

x2600 has the same AICCR, but in programming manual of both, bit 27 is a
Reserved bit? Bit 24:26 indeed define the number of channels and there =
is
mono (0x0) and stereo (0x1).

> It held 1 (two channels) in every stream I saw, and with it a mono
> stream is taken two samples per frame, as left and right, so it plays =
an
> octave high and ends in half the time even with MONO_TO_STEREO set.
> Write the number of channels minus one, as for stereo, and mono plays =
at
> the right speed (a 6 s mono stream took 3 s before, and 8 s took 7 s
> once the field was cleared after one second).
>=20
> Add an X1600 entry that picks even dividers, writes them as they are =
and
> sets the channel field.
>=20
> Tested on a HiBy R1 (Ingenic X1600) with a CS43131 DAC, on v7.3: 44.1
> and 48 kHz run at the right rate.

I can't test because our board has no audio codec.

>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> Changes in v2:
> - Also write the number of channels, minus one, into AICCR bits 27:24
>   (X1600 only). I found after v1 that the driver never wrote that =
field:
>   it held 1 in every stream I saw, and with it a mono stream is taken =
two
>   samples per frame, so it plays an octave high and finishes in half =
the
>   time. Measured on the R1 with silence: 6 s of mono took 3 s before =
and
>   6 s with this, at 44.1 and 48 kHz; mono and stereo now have the same
>   pitch by ear. That the field is a channel count is my inference from
>   this, there is no datasheet here: if one of you knows the register,
>   please say so.
>=20
> sound/soc/jz4740/jz4740-i2s.c | 44 +++++++++++++++++++++++++++++------
> 1 file changed, 37 insertions(+), 7 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c =
b/sound/soc/jz4740/jz4740-i2s.c
> index d36bbc820618..5153fedc5978 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -38,6 +38,7 @@
> #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
> #define JZ_AIC_CONF_ENABLE BIT(0)
>=20
> +#define JZ_AIC_CTRL_CHANNEL GENMASK(27, 24)

should be 26, 24

> #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
> #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
> #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
> @@ -71,6 +72,16 @@ struct i2s_soc_info {
> struct reg_field field_i2sdiv_playback;
>=20
> bool shared_fifo_flush;
> + /*
> + * I2SDIV holds the bit clock divider itself rather than the divider
> + * minus one, and only keeps even values (X1600).
> + */
> + bool i2sdiv_even;
> + /*
> + * AICCR has the number of channels, minus one, in bits 27:24, which
> + * the AIC uses to size a frame in the FIFO (X1600).
> + */
> + bool channel_field;
> };
>=20
> struct jz4740_i2s {
> @@ -218,16 +229,17 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai =
*dai, unsigned int fmt)
> }
>=20
> static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long =
rate,
> - unsigned long i2sdiv_max)
> + unsigned long i2sdiv_max, unsigned int step)
> {
> unsigned long div, rate1, rate2, err1, err2;
>=20
> div =3D mclk / (64 * rate);
> + div -=3D div % step;
> if (div =3D=3D 0)
> - div =3D 1;
> + div =3D step;
>=20
> rate1 =3D mclk / (64 * div);
> - rate2 =3D mclk / (64 * (div + 1));
> + rate2 =3D mclk / (64 * (div + step));
>=20
> err1 =3D abs(rate1 - rate);
> err2 =3D abs(rate2 - rate);
> @@ -241,8 +253,8 @@ static int jz4740_i2s_get_i2sdiv(unsigned long =
mclk, unsigned long rate,
> */
> if (div <=3D i2sdiv_max && err1 <=3D err2 && err1 < rate/20)
> return div;
> - if (div < i2sdiv_max && err2 < rate/20)
> - return div + 1;
> + if (div + step <=3D i2sdiv_max && err2 < rate / 20)
> + return div + step;
>=20
> return -EINVAL;
> }
> @@ -281,6 +293,12 @@ static int jz4740_i2s_hw_params(struct =
snd_pcm_substream *substream,
> ctrl &=3D ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
> ctrl |=3D FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
>=20
> + if (i2s->soc_info->channel_field) {
> + ctrl &=3D ~JZ_AIC_CTRL_CHANNEL;
> + ctrl |=3D FIELD_PREP(JZ_AIC_CTRL_CHANNEL,
> +   params_channels(params) - 1);
> + }

looks ok.

> +
> if (params_channels(params) =3D=3D 1)
> ctrl |=3D JZ_AIC_CTRL_MONO_TO_STEREO;

Hm. doesn't this logic contradict the above logic of having 1 channel?
It should not be changed for the x1600 since this bit is x1000 only.

Here the x1600 PM contradicts itself and talks about mono to stereo =
expansion
feature, but the MS bit is missing and "reserved"). Note: the x2600 also =
lacks
this feature.

> else
> @@ -305,13 +323,14 @@ static int jz4740_i2s_hw_params(struct =
snd_pcm_substream *substream,
> */
> if (conf & (JZ_AIC_CONF_BIT_CLK_MASTER | JZ_AIC_CONF_SYNC_CLK_MASTER)) =
{
> div =3D jz4740_i2s_get_i2sdiv(clk_get_rate(i2s->clk_i2s),
> -    params_rate(params), i2sdiv_max);
> +    params_rate(params), i2sdiv_max,
> +    i2s->soc_info->i2sdiv_even ? 2 : 1);
> if (div < 0)
> return div;
> }
>=20
> regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
> - regmap_field_write(div_field, div - 1);
> + regmap_field_write(div_field, i2s->soc_info->i2sdiv_even ? div : div =
- 1);

>=20
> return 0;
> }
> @@ -382,6 +401,16 @@ static const struct i2s_soc_info =
x1000_i2s_soc_info =3D {
> .field_i2sdiv_playback =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
> };
>=20
> +static const struct i2s_soc_info x1600_i2s_soc_info =3D {
> + .dai =3D &jz4740_i2s_dai,
> + .field_rx_fifo_thresh =3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
> + .field_tx_fifo_thresh =3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> + .field_i2sdiv_capture =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
> + .field_i2sdiv_playback =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
> + .i2sdiv_even =3D true,
> + .channel_field =3D true,
> +};
> +
> static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
> .playback =3D {
> .channels_min =3D 1,
> @@ -493,6 +522,7 @@ static const struct of_device_id =
jz4740_of_matches[] =3D {
> { .compatible =3D "ingenic,jz4770-i2s", .data =3D &jz4770_i2s_soc_info =
},
> { .compatible =3D "ingenic,jz4780-i2s", .data =3D &jz4780_i2s_soc_info =
},
> { .compatible =3D "ingenic,x1000-i2s", .data =3D &x1000_i2s_soc_info =
},
> + { .compatible =3D "ingenic,x1600-i2s", .data =3D &x1600_i2s_soc_info =
},
> { /* sentinel */ }
> };
> MODULE_DEVICE_TABLE(of, jz4740_of_matches);
> --=20
> 2.39.5
>=20

Otherwise this looks reasonable and it might need some x2600 adjustments
in the future.

BR, H. Nikolaus Schaller <hns@goldelico.com>

