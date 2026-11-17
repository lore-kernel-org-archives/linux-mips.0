Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911947;
	b=A3Er/ycx11vzISJl+Q86KhaQceHFhI1bdv+TEUI1cILPWK8rtxv3Uo1KPpb6E5kWCtuf
	 FM4n4BS+vGferVgT6DI4lwavH3Y536Io1EvzBg/PgAn/b1lEBmlc7dBGUqjDsmlPHM/oz
	 FtoyntFZ64VY1ymuNFnnJAcXzkZMOoq8GtdwrBKcIvfwi/FrI18M71hu7tFlNVYd/Ynyz
	 t2hdO8zqQo9s2LBP7p6xPIjh1SAsZmK9eZnHACXjBgsZhW6Zg5iB3DvDcLQF5BQy1EaoT
	 TtQqZYPXsGBg/Qi+jNTbVOadLDuI29PIEu5Y2joMRw6UPNz6A1urZd9GCGKKEuRXb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911947;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NuyW+LPkABdZOmh3sBu4i9JSnfftHozPE5xHuZU3CeI=;
	b=Xgz8t/894OEBw798LTvbO1KACoqRj0kC1tkvo6m1CkUy9tjk9RoU48rHiYycrPL63TXb
	 7m8zuRG+KgEYOFJdSPY7N+hrWDknhER6mgpbU4GpXwC6AaxNtapUryWXvVaZ8JTsXzUzm
	 TIieDsgd3IUoSNX1Kem8u0pRru74IxoT0cJ1IXTYHtIn5w/dREHuLPCE+tcWa4Oavwp+g
	 3aoRV0OQGVwvNO0/6TiyN7T4VBeP1JvBiwBWWh4+nn9Wnblcs45pdj8FFjC6QFmCqctv/
	 SdSJwzio4tPDD6UCx84fZ2DwODtPhmOeNA32/DQfWkTcECrALwtYXQbwdT8FZgQAiew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCMXh3Ru;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58FC606A32A
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCMXh3Ru
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524151F000CB
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794911947;
	bh=NuyW+LPkABdZOmh3sBu4i9JSnfftHozPE5xHuZU3CeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kCMXh3RuzFG0Ug/pEgPdThQxr6c4ceYwJwzJCgsccTaPx/IE81y5TbFtll09nr0Y4
	 aqTBrPQVPxGZj56gp2+Qkp9bYLjjgaXtDBCrUpkj1sBEcodwqDBgHzf6+u9wbHDXQS
	 N7KTYTmzj7EERVsE3wGws0Ur05cqGWBQ46VMs0oB+pEhhO0UY+IIa2WZDwH9bb9D7L
	 d1sP3YHz4HOa9L6VKpc+AUSz4a0pIfATu90CQd53LCHolba+sJnvw6omsnBLrV2uBs
	 7nJMUA22b4KI9eCp9bh5AMNk9KDDz4YDkngfaD1FPorh9JjZMzmAjxwqfFJJQYp7lv
	 41nTwTwaGbcWQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3886878e87.2
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 02:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3jylVMmxcd1Y7V5a96+IleD82EetKOoCEAWIYMHYpRdv9ASJu5Tz1/17LaXVFSneN+XjIi3c4UNjM@vger.kernel.org
X-Gm-Message-State: APuU4Z8X4x0/gtsbQox9qoftNohTZpIA3bYXQBSBSlZdl3CUepMCqA2v
	PRHD2bbweWxZBqi/4f1bgU7aZz7aybXmJCTAgbleu8vTroN9DiFXEHOUVkaLp5qjWAtIMFQWNJW
	MsIj6ydl7bKH2vCSVz0WgJLm40WH9hvY=
X-Received: by 2002:a05:6512:1317:b0:5c1:57ee:1887 with SMTP id
 2adb3069b0e04-5c1709991c9mr5809743e87.13.1794911946039; Tue, 17 Nov 2026
 02:39:06 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev> <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
In-Reply-To: <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:38:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
X-Gm-Features: Aa3M54ppfeS06feOaViTWRV8zuTIrQ_dO7MWlQDFZO4SKHToSwYpGEh5iS9tAzY
Message-ID: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
To: joseph@telaak.dev
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

On Mon, Nov 9, 2026 at 9:09=E2=80=AFPM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:

> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>
> Add a driver for the GPIO controller on Siflower SoCs.
> This controller is found on all current Siflower MIPS and RISC-V
> chips including SF19A2890, SF21A6826 and SF21H8898.
>
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from Chuanhong's siflower-7.1 branch
>   - depend on MACH_SIFLOWER_MIPS instead of OF_GPIO, longer Kconfig help
>   - get the reset with devm_reset_control_get_exclusive_deasserted(),
>     so it is asserted again only after the GPIO chip is removed, not in
>     a .remove that ran first
>   - drop .owner and the unused drvdata, and get priv with
>     gpiochip_get_data()
>   - drop the irq_set_affinity callback, which reached the parent
>     through irq_to_desc(), not exported with SPARSE_IRQ
>   - call gpiochip_disable_irq() and gpiochip_enable_irq() from mask
>     and unmask, as an immutable irqchip must
>   - find the group by its parent IRQ instead of assuming consecutive
>     numbers
>   - return 0 or 1 from .get
>   - use readl() and writel() directly, without wrapper functions
>   - take the number of lines from the match data, not from an
>     ngpios property
>   - include linux/math64.h, drop the unused linux/pinctrl/consumer.h,
>     sort the includes, spell it "Siflower"
>   - subject]
> Co-developed-by: Joseph Telaak <joseph@telaak.dev>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
(...)

> +static int sf_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       return !!readl(priv->base + GPIO_IR(offset));
> +}
> +
> +static int sf_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
> +                            int value)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       writel(value, priv->base + GPIO_OR(offset));
> +       return 0;
> +}
> +
> +static int sf_gpio_get_direction(struct gpio_chip *gc, unsigned int offs=
et)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       if (readl(priv->base + GPIO_OEN(offset)))
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int sf_gpio_direction_input(struct gpio_chip *gc, unsigned int of=
fset)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       writel(1, priv->base + GPIO_OEN(offset));
> +       return 0;
> +}
> +
> +static int sf_gpio_direction_output(struct gpio_chip *gc, unsigned int o=
ffset,
> +                                   int value)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       writel(value, priv->base + GPIO_OR(offset));
> +       writel(0, priv->base + GPIO_OEN(offset));
> +       return 0;
> +}

So this has one register per setting per GPIO line?

This is ideally handled with select GPIO_REGMAP
for gpio-regmap.c using regmap-mmio, see for example
see for example gpio-mvebu.c that does this elegantly.

Yours,
Linus Walleij
