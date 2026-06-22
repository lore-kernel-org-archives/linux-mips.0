Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96F39B972;
	Mon, 22 Jun 2026 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120736; cv=none; b=q0dnVYzTuq3LQy1495BTi/R0wcYkRealsfzLDQBInjPJU73NlkNPgelt7sUKw0IdXf2cdN/Mh15xNku/O8oEYUWvbHFMyKmhqj6RWZERg2tCQ2UPc7l2a1LVZcCiu/qR6lkmq/iinPyml7ATN6ZYIrzFoQ0cR9zflz1bOAIxj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120736; c=relaxed/simple;
	bh=fHDAGh07JzB6IeRckBTfh3f4qflKw3M2BBpi5tcq9oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvazEb4VkIa6ORU3jIzrcXm7xU4RVRK8z/NuIwuJfob0tGQLnAWuubn2A3EweusdVcPNoeYIBbG9kDITt7F6RTBuddf/MEC75R8/pYxV713gXwQNomM3MEXYf4AXCYAKZo6Qx0ezSDrWa2UoTyP/utswEODct6IU4UUdBz6M+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApxzB7CQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApxzB7CQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03291F000E9;
	Mon, 22 Jun 2026 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782120735;
	bh=OjnQqx9lVjDZn9U2JChR5sHB41aObP/M6xjkucf75vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ApxzB7CQjt2Xqf3nCQt/J3NxrquiCG6Zue6KX9PMhWvInDLEgf9HrutmfGV+I4OZ7
	 zqtwEmdv+d7ZUnSxgXUf7wQ/yfKPlsiluNm8NN8XRoE2IOvsi5/jT41VryYw1ihtZF
	 kPBG2lzTF/KcN2ULGQgfha3q+Z9+hEBV2Vq3mjFX2altZoyUvtbkUgSLq6h4e9Ji/r
	 l9gSXRTlctoiIyMG62c8568RoGjele/qh6tU4+nZa3nZbYEvkeMelJsv1anaF/VS6+
	 tIwmmOBQrWGzho4Puta2c9AWjZVwme1jxFKiWokjuwuxfO9ve5v1qPEqaFd0Mxue7d
	 27zhi66H4STrA==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Liu Ying <victor.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Phong LE <ple@baylibre.com>,
	Douglas Anderson <dianders@chromium.org>,
	Inki Dae <inki.dae@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 00/78] drm/bridge: Convert all reset users to create_state
Date: Mon, 22 Jun 2026 11:32:11 +0200
Message-ID: <178212072827.575553.11508273640952121243.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 19 Jun 2026 14:24:05 +0200, Maxime Ripard wrote:
> All the bridges use reset to create a blank state only and don't use it
> to reset the hardware at all. This is what the new atomic_create_state
> is exactly supposed to be doing, so we can convert all existing bridge
> users to it, and remove the reset hook and helpers.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
