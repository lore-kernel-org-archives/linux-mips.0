Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580498;
	b=QUPPwPLD9qnmKZggaIy7m6DcrSTsPpwYzEU8Xv32aDUzIheu5knZydxfnWdrpMgkFv69
	 HetotK6OsX5ukBhOcIav2KiCqqMItQPS3GzAkFPybBPr/N66RK+ivUc5Q4xyyv0X2zUsg
	 tqNh7NdDj2kYLi/36R2uHdI8LwgailpB51YgvNyB2rbVrrPcBPhDE7jLQf/gVBQThy4+p
	 ZQFVWNJ2SnfpVby4CnYOMxIvmbpC/ezMXbEF8Hu/tGHqGEJu+dMSn+H1RHwYFNkRX3XzZ
	 6SgGRzeN0nUVCvPJrgrZ9xZ4zvTD4Emo5Bz1vJpw+0WBdAyYaHkNQxcBOf2Yh8lf2CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580498;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PF7x+WHFDlFjFzclJMmi7Uvb2yYXpjZa21XSXBNN68Y=;
	b=4yfYIqdFk7wqDupm8iQwPD7UIILu8v1ML3Y825+I25YGFXqFYpi89ymESL5Xsj4QkAZZ
	 ZdWOvsXhJzjJTjbM3JbODML4PJBYwJk+w491EZAas/E0v0zLKRxdcNR/hgjZ8pNCjszjh
	 HUZfVQerFGfPujQ6FTZBSdJhbvKBknXG1oul2ZGTNR/v8uFWUEDeJUk+xRXtI10cCsaKf
	 GDkhb7jgN+AsVQvgwrmpMjhdK9Yaeqbz+2oOKK5Cjxl/UuYdCcMbyolwnL3pDkQLz/fqc
	 Xv4oHxLPImq7INDeRm1ZbFfgHRo+WDpVdUg11IntIvM8dGSEJWli1M/zzUf+ANmYC1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEbwZqSL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F39606A32E
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEbwZqSL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA381F000C7
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580498;
	bh=PF7x+WHFDlFjFzclJMmi7Uvb2yYXpjZa21XSXBNN68Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YEbwZqSLLzVinIsev4uKzk7/4/PPLE2z76q/tnaQKkNHy2+uG64yeJ+XPQVFtQ5F3
	 XKDJUgECbz60DbFqOXDNzQiCBXKsSMeeSnOKYVnQAc9ZS7TGcfyg74OpT7h27BZwH3
	 s3Et4sWD3624q9DsfNuId2DVbvHUXWQQ+EpH5EMfptNuOXN/ULPBt6+YGOH88da7+Q
	 TAQ/39NJTT4S61c80HWAKREkgWrfreUsFeZT9K1DBfkCHMMvjsjWQGmz26uBz+fZZx
	 76TD5Pjilo2YIcAv5sxnBKOOUygXM6xH95tiqfoG2sfOQbOdXVyLaRI8JUlLqVt8my
	 wtW+k3C0LzpLg==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6de2f213b7aso375760eaf.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 06:34:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEvOY5cBlc/h/9TWhk3sVNN1I/gQ0zuWC5m9TAN+ZDZpgBdkkoISP+Fi30Xl0PHiYARl3JdOuiQuqv2@vger.kernel.org
X-Gm-Message-State: APuU4Z/L/3hX6KCsM6EuEN2z7jm4uCUTtLvqbS3cBj8Hg1u16lcdZ9xv
	Is5hzkcsxG6/j8mPlpUn0d6Dkcy2K3r4lPmykTNfdCaowCm/ckyid0kp6fkey55zTkgK9A8f3Tb
	XcICHt5IEKTxMaVuA+t+ee7BFo+0OI0U=
X-Received: by 2002:a05:6820:238b:b0:6f4:d9d4:3948 with SMTP id
 006d021491bc7-71ab50535a7mr1136848eaf.45.1794580497611; Fri, 13 Nov 2026
 06:34:57 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 15:34:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmME3b35ipG0N9agoe+5P1J6dsDiy3hoT9MJ9vyRwBA7A@mail.gmail.com>
X-Gm-Features: AclHuK879_MUVY4wh3-oLFktJApN7IrvQSuSi80dujOkyN3zJSTWDVcOyRF70LI
Message-ID: <CAD++jLmME3b35ipG0N9agoe+5P1J6dsDiy3hoT9MJ9vyRwBA7A@mail.gmail.com>
Subject: Re: [PATCH 22/35] drm/panel: drop the orientation workaround from get_modes()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 12:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Setting the orientation from get_modes() was a stopgap for the display
> drivers not calling drm_connector_set_orientation_from_panel(). It is
> also too late: by then the connector is registered and the property can
> no longer be attached properly.
>
> drm_bridge_connector and the panel bridge set the orientation on their
> own, and the drivers using a panel directly do it when creating the
> connector now. The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra
> DSI, which get the panel only after the DRM device has been registered.
> None of the in-tree boards using them has a rotated panel.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Makes sense.
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
