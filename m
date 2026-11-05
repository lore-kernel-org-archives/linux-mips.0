Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871115;
	b=UMo4AxxoHfWFrhivqHKuacOXhuc1JES+D55FIjRiw6hU5byiqSiPEAz2NqRuuy0a7pRX
	 SqXhBqbwAlETTu9h7jaATkWjdFqnl/OLI23BuRth3YhDajP4RgPkXApAfhD0R24URNQUc
	 /coK08pzoKrtWdJAeufmxJ1UitjgYHcmnlBnHsbCKLXZviiXeEtToKzvvrLZZR0L3VU8T
	 X/VFqM/CEcvJuV09HTUp4Yeiu4oEjyDc342odIjf5G/pClDvhytCkUKsIBcg+xp114XH9
	 M8gSro+crLJPiyyz3vyPFHRHv+7F0fgAOJMFqP0dTFe2X9fNFCd4X5zQTpU1Hj5Ummg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871115;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZkVqtLjUqt4q2Jyn6P0EMBzcZWkIY6LjRDfUPL4Bjno=;
	b=nb+zaNTzjKzWV7BmJBtrZupL3upOnvayGHc4TDRmu0+2MxwF8YMpbs5ZS0LanQCeoOXV
	 nmCFBjTYov8Y4yeNvVbsv9SiCdsd2MBW+RaUTzfUPXjqsMDmfEcPXTK6XYwejiVjpAB6g
	 Y98MUyfiuAEbagv0v6bUHLZgybjcqXznuEH/kVihuoH1hXwaEenoRFE1DRdO1MQmYFWGr
	 Bc376xKEG90ZNZlST0Kz1sKZ7BvnlBuT4I1J+F+UtZ9M++jFaq6RP/U84czVZT+DWrFd7
	 aypI5M5r55J/nFgufnHpPngaFGHEiwsMcCyrBKfRWi4K05xeg4uVwBLPxTdMt8Or8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcGF+ZvB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637A606A329
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcGF+ZvB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41701F00A16
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871115;
	bh=ZkVqtLjUqt4q2Jyn6P0EMBzcZWkIY6LjRDfUPL4Bjno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IcGF+ZvBwwIDv6RtPf1x87ef0btHX70l7XDMWkc/ro1KTUvF05h0ToPfcRT8jesUk
	 Fhr2cO8O7EIKgzsE3HBIOFYjUT5lwPLHfGHCu3ArLld9sTb8XbdT+txyHco1od0kRH
	 DLWSapdam7sTv8Tr1UtGO0+9ZsCsweL7iRqpQ+G9kKlaONpqZ0UgnKSu4Hq1nsnqd3
	 8Mrh6MGAZcA3Z2985TXdwkJ+KOiT7FujUYG+H1JhEKShwgXLR1eNmrtkBYP6KQJ5wS
	 MxoUbm2zigts17cd8T7srBFWrIfivBxyssHH9RLutMD+sDhv84Iv1RL4n43o4vkAdt
	 vScoMcwFN79pQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bff8fc7cf2so787294e87.3
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 01:31:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzRPJEKdMvzqlCS5zQBHd2bBgHREcNx6MIoQmcVaXvQh/tHunpSLLlA8bI/WoRXHAoYC50Qm7bSpxFz@vger.kernel.org
X-Gm-Message-State: APuU4Z+oGNuj0++wPyHQIvt79Z7IT9+cTTn++2aBMehqgDZKeZ1NUtoc
	+0GW7Oo0/V40vZbPriy41hvGK9OgGzx+OjblVai92iAlhBCJqUhw2ykaZ9x1I5b0M4e4oUfn3q+
	mJGW8qWuXCWLTymtbKDJLBhQ6rKrROc4=
X-Received: by 2002:a05:6512:3f14:b0:5be:64aa:af1 with SMTP id
 2adb3069b0e04-5bfd951d51cmr6307404e87.3.1793871113805; Thu, 05 Nov 2026
 01:31:53 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev> <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
In-Reply-To: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:31:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
X-Gm-Features: AclHuK8im8p1ygqVyltdRT9NHRhFsG2j-za_UOILYFTJ-DqXIB886YYYR3EPHIs
Message-ID: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
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

thanks for your patch!

On Wed, Nov 4, 2026 at 8:21=E2=80=AFAM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:


> +static u32 sf_gpio_rd(struct sf_gpio_priv *priv, unsigned long reg)
> +{
> +       return readl_relaxed(priv->base + reg);
> +}
> +
> +static void sf_gpio_wr(struct sf_gpio_priv *priv, unsigned long reg,
> +                      u32 val)
> +{
> +       writel_relaxed(val, priv->base + reg);
> +}

Completely pointless indirection, drop these functions, just use
readl/writel directly in the code.

Yours,
Linus Walleij
