Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731474;
	b=IZOsCZJcj7rYfbthn5lKmsSxvuDPdpmeVs66FVzcQCbdyLy8BmI2u+MY+H+0qzCSQbwH
	 XA2+VAjmzyoGtUUa6+hA7nLvu1y2hUg6xF/Fk4/EIA44OPAIx18nlbmGq1S/6a86vxle4
	 QJJpaKVN8BJaRlAGWwfZx7huRwU/LrVmw1iFCeUQfTvQBP7iE5b/mx/udtAdk9SLVVLj5
	 F2jlndD52bk21Tq50v61h6/wpDGMZL0ds1XN86ug26XvYz8Vqdiy/WcsmEzVdNKPEThFu
	 o6H2trYnSMLRQRbSfJYQYDUg4PyRNkXjuqacFGfSFOfvRH07IrM0sckjoXIwgL2jgxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731474;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WjL+BboDzTnCr05d4B3GVddTa6hoTsb2Q7/tMkgbEgE=;
	b=Z8gUw28wCJD1pUJeLZY8c+qArOU3KWzfd20x9XG/gSWqR0owoROeTlxoxkASd3MD7n4e
	 CRnl5gydlWQZeWMm9ujc8e03q9q7g+Kt1qrkm6sQFjGlRIKl6xHvr9Mz0RtFZd60T80Qo
	 /jilCaQPeK5knU7ojPocN37BVdaLyDyxDv9RR5qI26CMvyrsjJLnm4nzLnycRIkc2riwc
	 w41TvBIJXAyfg3L8Afph1u/98hPcHMiJQbQGbTGM6WUq21gdWx9Uxm1f1l/JVPamNdBfE
	 CrBSeiCCkjv7fg0gYYAJBX6ro7xUnnS2S1zDLHNk5FQUg/hN/CeSmzbHD5ar57Lxwhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="k4/TTGvn";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E1A606A32C
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 18:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=k4/TTGvn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WjL+
	BboDzTnCr05d4B3GVddTa6hoTsb2Q7/tMkgbEgE=; b=k4/TTGvn6KawElXEg9Bb
	qOZDns6dw9rlO8RAcyEW+R5LtiRWK3EUb1xjy1qv5PY7vclfnx0g2zpyRZVQHBQk
	hS2cYY6dvAjl+vRiET3GcojY3mYknjggYIDCmsAOOODL5DWB24RiBNfTVe+sFXwA
	ovDhC3fDMR0XK9MmSAXBVkPFBg3Z543a0Vc/+0kETuPaPFpyl6SYJO91d3WVkD9r
	pcnEavNArnqZDMUAJXlOdMLBl2JLVqQbbmzKs9lmkKUVXbte2zMVrK+98TXCdCn4
	V6761POK1dz1bRaU6iLEQZpFTg9RwZwQW5Ad0pqtUf4KdwYhnZT7/Jhg+CIIFitj
	Ug==
Received: (qmail 389364 invoked from network); 3 Nov 2026 19:44:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2026 19:44:13 +0100
X-UD-Smtp-Session: l3s3148p1@m+AWpmNfMLbAwtcC
Date: Tue, 3 Nov 2026 20:44:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alison Wang <alison.wang@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Ondrej Jirman <megi@xff.cz>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Igor Reznichenko <igor@reznichenko.net>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	Nickolay Goppen <setotau@mainlining.org>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Markuss Broks <markuss.broks@gmail.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 07/35] drm: rcar-du: use devm_drm_panel_bridge_add()
Message-ID: <auorffiFkpqbhotm@shikoro>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-7-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-drm-panel-funcs-v1-7-5e3070a3478f@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 01:09:56PM +0200, Dmitry Baryshkov wrote:
> The connector type passed to devm_drm_panel_bridge_add_typed() has been
> ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> every drm_panel"), the bridge always has the type of the panel.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

