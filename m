Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811943;
	b=BadKaTTILdjdjjSmxSdaFlAJMDk/n8OxaGUttAoXsb50ZQRhqheL6XlCZd4KvzPLDiz8
	 /BjctgpT1g+ESkLxYJlWDAdEmMzC/zIjMfHFJeOeYIVeG0DZo4BMECpnrXM7DLqswFjSO
	 X1eLgTHBi41Ui1N8CzuTadfMholgAPPqdxyl9lp9UShsBVGuXwGYs9tIGzSKHAHTcpmDs
	 2eEVyoTiRUUvHYiC3gBzkcbzRIoyKhD85NAJ/AAGwy+EEH0YVYMfXeUcCM+qDTGQj/AXP
	 tpxZnL/9ceHMezNZMxQbpF+gs7bHU5a+mz7W/cYaCzAg/EY2VR0tbafmswouV85DX/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811943;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=n/WBX5OMEjuH4mmaE8wMJgQz+VwMOE+34PZVZKVuxJ0=;
	b=Cv1OxqI/RcUG96VtdsxYf7YJcj6GVInuTV1k9hW7sjDUjOrNvOuBOrVWu4l9s44CNmIQ
	 r+c1vN3nvRlEhSceQx1pJXuSaAvHCQX8oktDZXf9DBNeHYBS3DkekMyGAwbFTbDtGbAqT
	 Ohkp4OBN0NGBB7SwBYFNWB6oTavpadvNRtskeEp5p+5cjoZNUNu54pyhMl7uS+oTikXM5
	 XKhX/b+24t4tm4FLL3Ei6jdHJDS5vnHZD409c/JB5NlGAGkT9kWTsrhp4nG3KGSdPWS/B
	 ZIB6a40friASfWBDHaK17uO6zaZsj+wBspIa5ruEy1BR10NcVDpJxdh9TZKf+ITF1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cHt0rs4e;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA592606A33E
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 17:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA592606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cHt0rs4e
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B11F6C8F474;
	Wed,  4 Nov 2026 17:06:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C84160772;
	Wed,  4 Nov 2026 17:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F71C1032920A;
	Wed,  4 Nov 2026 18:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793811933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n/WBX5OMEjuH4mmaE8wMJgQz+VwMOE+34PZVZKVuxJ0=;
	b=cHt0rs4eTkbfevy+bsHYu3dOfyVDr8TlK58Uv0FQflq65mJ6uiE7Ongs5ejyePK+KEP+Qh
	52Ko1xJ7/WLjCdfQy2rIBBaIKGZHL/rQ4P4uqcBuYCMj9C+MVSZ2IgSJJ7xESJ/GNi6kz7
	w0fR6VC8gImEQgBp5UEjH05YRFD0Ap4r1d+S5WNUMpBbg4isQkJHSJM5TgirmhzI8ndFsY
	PVucwRwGjttGMK28AI6RiZR3tsKCUNgE1oN4lwmYQtjRN5zLRshP+PsmUzk6yazsr+FFvq
	FOPMHQBQNlpROMGV4AoEetfr40B0tCcV9VEbrMrKaNuP0IOyLBObIIs2Qs9MBw==
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 14/35] drm/panel: remove drm_panel.connector_type
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Igor Reznichenko <igor@reznichenko.net>, Michael Walle <mwalle@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
 Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Stefan Mavrodiev <stefan@olimex.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Alexander Koskovich <akoskovich@pm.me>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, David Heidelberg <david@ixit.cz>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20261026-drm-panel-funcs-v1-14-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-14-5e3070a3478f@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:04:54 +0100
Message-Id: <179381189476.852170.18129624398084829399.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 26 Oct 2026 13:10:03 +0200, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The connector type is stored twice, in the panel and in the bridge
> embedded into it. Keep only the bridge one, which is what the rest of
> the DRM core looks at.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

