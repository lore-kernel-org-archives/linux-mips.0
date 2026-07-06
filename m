Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8FA3DDDC1
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325225; cv=none; b=ZQYfS0g2edhAqoYaggq6p6dMRxx0j3AxD6NBeFESs/wuL8rOq9GLDOJ9CwoJPsF3Qpz0eByKUaaM/tkn3TJTPmnYGyoyg6gfbIEUEvvxDTHVVHonDnppXtuhRwSpyRzWe1MdOne0NN4IWfJRZ6O4bwBSEJiTW0xA4WJvO+xV1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325225; c=relaxed/simple;
	bh=6FRXXocn1lfRgJnxiPkpYYSBB5w4wnBEBhNnIuipX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYkO7Sxjh4nTwOpNav75K4qMwlxzKvbZAx0nOjvdJdHTwbfiAACz/S7Zo7j/uUGVgK80l2I49uFORzIzopqADYSp4rUiA6JGtBvKhY+GBUeyEP1QCcWii3y8Egv5yWYmRNOrf1oA6q/3EQCkWQXaUB7vvH/mMLqxaWfllF6G1Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-969524c1a63so800244241.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 01:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325217; x=1783930017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=UluagHCpud917mPWvdn1KnjMvyhhditsKx4QBsc5QMbq6HqmOzQS0gjVGJFRWxMMbE
         qthTID2CprMdSyMz4/BkMRkJWJHrM9XVH/4dVirMjBX7+lqcdfDJdop96sDZi36qbosk
         5yo7qmzGH8ZwNGIAq+kH18gwN8uFJE1lxSGLM9DPkI2OI0DwSJCzlOUvcsPjh0r43TNI
         HCth6UdQsMR6rOVnE7uGIJf2/8BSD/QJQpIfmXX998qL0XbmO8x5lZV5iC6G9SRxrboS
         7wWTVobPQMOaBdVGlTwZq65FxVicOOJkt9xDmPNrGzoh82KCrdhxFjHwNMNp/O/A5wVa
         SkPw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6xHiP0Ggp3UkEdToHnvRzPqKXMzAzwNYQinFV1CDx3zRH8DV+JSe5J9PhP07cHtTfU2mTe0kZ6SiI@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3OCRDJ6LF/tNcfxVT/Y/ccZtvUrvJg4aTOhsoHZc9tPk7JgS
	ExYNluVbkenTy6A6CqtoBiKnTI6yTzK+J5ATkVa2/KaVXQBeOEM0+G6dSe/XtrXB
X-Gm-Gg: AfdE7ckabYtdsaLwifyMxyzdEaJ9DrOMnoLoYB4le870497VzO3qQx5IWTezUwVuDT9
	h7sI6isFkN7rT5IANff94i+mJlGhqmIggVl/AbNnY2zmevVdIPIl0mrO/F38R9XQMtJ1JJ7veOO
	qzD1kHgCB7Q1uF69c5SIdEOmAQXmSN6CTzCAlQZsbP6iKet2SQplIN/1AKsXPs5lNlAM4dThIDR
	oYvjy6xwQo12Nv4NnEm2fM17Ge9EpDsa11JrrAl+KyKEJe2dYfCl5Ld7DWgt6lhAdru9soRTajl
	ccgeslSQA8cVh0pwWFmfOUdoAJfVyjaBBoTjVttlnyZY9uX1LmS+sicmj4FF8BDzJRl+/jcICfq
	OShgCTo2Rl+OYyzYJNylap56k4W9eL1e6eiGR4XsTd/56NM5lEWNniuLaMJ/IasaPGLdjpGQCDD
	ltQO0u5y6HH49kWlneoqaAh3lKC704rfMtCCNQcNRGjv5eVAyfUw==
X-Received: by 2002:a05:6102:808f:b0:740:127:c81b with SMTP id ada2fe7eead31-7427d244e24mr3297259137.7.1783325216822;
        Mon, 06 Jul 2026 01:06:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1a44e65asm5178132137.6.2026.07.06.01.06.56
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:06:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-73a442f7cd3so2205731137.3
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 01:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpIzPI+M733M9MwFyvf6jWsMWiqR6OR9TgxNoigPN4Gkz8Y/xdvj4eT4RGmziQJHeM7iRqR/ZI5L2d7@vger.kernel.org
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
