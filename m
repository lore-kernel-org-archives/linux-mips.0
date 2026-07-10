Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB411282F35
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705562; cv=none; b=gWSERzkTwFNnip/KX59fJcJSyoujiXxyG6vYrxRqFT6JgPu1F78qezzvXcVQ85ieCLkqAiJE+oeanbweMkGcUPSbISvsWH07KDuNjY4psAKwOEBxzmccPOj0+63S9dGdLO0B6ISaiMSRorq4cpCsVrORXWaTz6hn1XmAnivREik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705562; c=relaxed/simple;
	bh=KvBYP+wl2IjCxMaSVmX25pjv+NEzDq5zeL7bHnenBoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8RDKdaXz7ufENE6zOzMHbLTmjztjB+AWj5XB42yHf2rl7aGptIpWMNunybG2uykQ/pIjZM0IumjE+GZwAjNUb34qZlNzOH77oO8eMHMlH72K+4k/aj2QuBhO12RzLvK4qxe05t529hG7FpfEB1rjCVfDvWVbIe/aXcQhyXq/lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmfKMIhN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmfKMIhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0E01F01561
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783705561;
	bh=KvBYP+wl2IjCxMaSVmX25pjv+NEzDq5zeL7bHnenBoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LmfKMIhNNv8C44AEXf9A5oXKyj1wnekLNBpv0FC5tLO9CpVpSuE1tgvMo/TO/hXai
	 PquOZ80oyklvhr1I+E1hL77bf4ojmyAQDZA11YRNl3GNTyOiJLKkfLD6zaIiL9al4W
	 XARyciEe7S/6wvwE2dJNpLwkmlCUoNZLHo5ojOd5jVcEUwISzK8AdKpHtg7hTyn6OL
	 /kDfFhxTVyW3lxSrrbU587UsqVVxMNGAflXZBDUmf70fca88msuudj54MpnWX3wygC
	 wNg7SMGtoz/l85PSE9odvcmp5yDWdN56rAi2EuHOJXi1VWkZoc7F8BKQAG1EO/7KuU
	 LQA4zNm9cHesg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b00ca000ceso1274189e87.0
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 10:46:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp4Bk2gEGAkisH0fuVbCZJLCOTZuQoYnRtwI4X1LLttvoGukBlKcT9Xy55X7+DgKNWvY/c2q7zDNUUM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Ghxw4W1UgsZpC7447y/yaDQ1xQ2YKsW9oRir4F8+p79/bMkQ
	nn8tcKs7aQxSXjumWEpobxTo6mHRBWr21oKSmGKgoc8TXHtn27BmN2ioMxjWvb/r5eZWWySRcb5
	lzlcwNMcQ8VXsiFRuWZO3wpUUKLHq/vs=
X-Received: by 2002:a05:6512:688f:10b0:5b0:12d6:4c05 with SMTP id
 2adb3069b0e04-5b02369c6e8mr17375e87.36.1783705559836; Fri, 10 Jul 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:45:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUf6j8jPJogpuo4w55EHqgt7LChOQX5JY5h4n2VOf5nQ@mail.gmail.com>
X-Gm-Features: AUfX_mz2mAY-nRqzEwN08-F9a7Mq7XiQwd_nI9Ppbf1sw-soYPlPLluIapY3fR0
Message-ID: <CAD++jLnUf6j8jPJogpuo4w55EHqgt7LChOQX5JY5h4n2VOf5nQ@mail.gmail.com>
Subject: Re: [PATCH 10/42] drm: pl111: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:43=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:

> Switch to devm_of_reserved_mem_device_init() so the reserved memory
> region is released automatically on probe failure or device removal.
> Remove the explicit of_reserved_mem_device_release() calls in the
> dev_put error path and pl111_amba_remove().
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
