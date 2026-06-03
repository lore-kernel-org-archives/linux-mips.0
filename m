Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66A47884E;
	Wed,  3 Jun 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488751; cv=none; b=hmTHCKl+1h+iZ+ZmdoblfGPfGwTOJ9mlm3+x+VrjuoxhBUbsfioI+oRJtYjkESR1rlejTMyfrPyBYsT5NX2Iob/CQKzZs4+pPY9+LRq2X4869dmuwlssvt0ETBC00/g2qRarp5kxGr7Pr53ZXyAw1y7afKosmzowhJANoh/bzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488751; c=relaxed/simple;
	bh=d3EykXjPdTOzofqzcPyCOaTQ0ATiB33JeyMELyx3OOM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZSLXiLP5VCE1TuBKvtSbDFNk2QKzyAAixmx4s2dVko77z/njNpyLxZ08yByhFyKtyK0aIttg0NM2Tm0+OIfNJIvg+XcdQ/D/9S0+Wwa4VlG9EeMGViThLGHu0Db1WDyBL4KjySzIjVH0k1A/hsIZQ1dQldZ4L4vp+HCm7DJrOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WqS1SiX8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WqS1SiX8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 195381A0108;
	Wed,  3 Jun 2026 12:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFA0C6073E;
	Wed,  3 Jun 2026 12:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48FB510888413;
	Wed,  3 Jun 2026 14:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780488742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=48ypl4N/Z9PEOrZi5s882vnkw+L0W6ufixnULaCX8wY=;
	b=WqS1SiX8JxgfCWjKbfGrN6L6Q3QYEVKtX9eatJz9iVzPqdb59EF2wfORgl6E1oiCCYOL6h
	61ETQH6hQR3Buc4PxFXV8xJT2J5xNuIRWeEXwCZRhaxs5XLVqNUthCgehn5gJAgDWr5D+V
	EDn8WSCnJ0fr/3eDUJx++tiwrZ5WSI35nVYVUdYn3doe/iUdJ7p9DoQU59Ef1MvT6hoBjc
	7jEjYscg5qvEtTKsFwWeeKNcZMVVM6zgOvZnXTK6b1ZDBo1eLL0VN631t+RjK9av9NXAVA
	YYmM055EJj11NnypQXGQ/iJgKGei6RU0g5MfNttmfc+5/XNEQ2JJEvOyMVoU4Q==
Date: Wed, 3 Jun 2026 14:11:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Alvin =?UTF-8?B?xaBpcHJhZ2E=?=" <alsi@bang-olufsen.dk>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, "Martin =?UTF-8?B?UG92acWhZXI=?="
 <povik+lin@cutebit.org>, "Nuno =?UTF-8?B?U8Oh?=" <nuno.sa@analog.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Bartosz
 Golaszewski <brgl@kernel.org>, Ben Bright <ben.bright@cirrus.com>, Benson
 Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Binbin
 Zhou <zhoubinbin@loongson.cn>, Bram Vlerick
 <bram.vlerick@openpixelsystems.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi
 Chiang <cychiang@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Mack
 <daniel@zonque.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck
 <groeck@chromium.org>, Guoqing Jiang <guoqing.jiang@canonical.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, HariKrishna Sagala
 <hariconscious@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Hsieh Hung-En
 <hungen3108@gmail.com>, James Ogletree <jogletre@opensource.cirrus.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kevin Cernekee <cernekee@chromium.org>,
 Kevin Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>, Kirill
 Marinushkin <k.marinushkin@gmail.com>, Kiseok Jo
 <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Mark
 Brown <broonie@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Oder
 Chiou <oder_chiou@realtek.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter
 Rosin <peda@lysator.liu.se>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Ray
 Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden
 <sbranden@broadcom.com>, Sen Wang <sen@ti.com>, Sharique Mohammad
 <sharq0406@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>, Support Opensource
 <support.opensource@diasemi.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Yixun Lan <dlan@kernel.org>, Zhang Yi
 <zhangyi@everest-semi.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 03/83] ASoC: codecs: idt821034: don't use array if
 single pattarn
Message-ID: <20260603141147.61943cf0@bootlin.com>
In-Reply-To: <87y0h7hqxo.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87y0h7hqxo.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Kuninori,

On Tue, 26 May 2026 01:58:59 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/codecs/idt821034.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
> index 39bafefa6a186..084090ccef77a 100644
> --- a/sound/soc/codecs/idt821034.c
> +++ b/sound/soc/codecs/idt821034.c
> @@ -860,18 +860,17 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> -static const u64 idt821034_dai_formats[] = {
> +static const u64 idt821034_dai_formats =
>  	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> -	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
> -};
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
>  
>  static const struct snd_soc_dai_ops idt821034_dai_ops = {
>  	.startup      = idt821034_dai_startup,
>  	.hw_params    = idt821034_dai_hw_params,
>  	.set_tdm_slot = idt821034_dai_set_tdm_slot,
>  	.set_fmt      = idt821034_dai_set_fmt,
> -	.auto_selectable_formats     = idt821034_dai_formats,
> -	.num_auto_selectable_formats = ARRAY_SIZE(idt821034_dai_formats),
> +	.auto_selectable_formats     = &idt821034_dai_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  static struct snd_soc_dai_driver idt821034_dai_driver = {

Same typo in the commit title as in patch 2:
s/pattarn/pattern/

Or even
s/pattarn/item/

With that fixed,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
