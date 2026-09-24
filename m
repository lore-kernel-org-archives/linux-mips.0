Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2914334AA
	for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236332; cv=none; b=kcpu+9PuMGfH+TxgVdHiBYQXc5seOvNDlcVru1srvevEtf2jAnTcUrA32TEoM/cHdkqW+bAcQo0AbHk2WuusPYigho/kObtTmpwk9f3f8C4oKOHrF/EAdQBHtNdRlWerg/w8nBVhtHcCDBgsKJd2G0cIzhA1WJT3e5eLvpTAYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236332; c=relaxed/simple;
	bh=Q2w6LF4/zIJhMqgnul1q5Ke3T8Fce4xJ7qGlNUdJ/6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUsRTbtnZxJYK+wP21B5EXLrjbxZGye3kweULT6TYK2axcEmNY6Ix+/4HjjM7LmcC66BhJCmaLmJHMJptKNKvXl+7NqZrDKs7Z2R2/k6n3J/qXA55ZsKLQdVj6a3jA4JoDOJha4B5LC69xHRolgPAivrbn+CEb2Ey4iD4dxfBqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2I/fvPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2I/fvPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DD81F00893
	for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2026 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236330;
	bh=flhXc27wZ7lq+96q79C1lo9pyNK1W5OvD7SOTlgsYQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G2I/fvPnhzBwiTSzPd3k7x4JWZsKCGb4j7VG6x2YnmbJxbyRU5tVgRqOyZ571A67J
	 puwHI17+boGxREGxd2bqTxfZ2IqP3Ra8hnxg+i9aCY+7rLtq1kah9sqYEBU7J3utDq
	 U1S5Kw/5ZeVHUnLycq5YZ0sMxUKw5BhOIW+A+XSHnY97gDLKCkkru0uZYK7P4sJrFi
	 TpZonTLVAnbMtmu0mIaIwKb0NDS8zvlFDagOw1qjPXvI1ytDW4GxpRS4MhJG7f2dSS
	 D6R1DzIL2HmpIhTNrIChM24ika2V+uJ/rBPVdk/TjTqlXGhHzWNn6nsZ1Yyte1eq55
	 jYWwdnYtNdwIw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff163f65so13288211fa.1
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2026 00:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTe4y/KUnp0tfoOzKRtaFS9f2wrlGMkDNCp090iuhoYV5ruefZul/7CdFG20EsrqWCO6s3/repLtdI@vger.kernel.org
X-Gm-Message-State: AFuF++k3PzGr6HnABQGkgNuH+BGXEMMTzart7gZftt3lFn9skoFg+jRx
	8e7wG1bTBPiPYcGya9qEmyFlqeYk8SmeKDFz4bSA2LLsAd8OAQL8rqvwZQuRlsGOQB+ZlbstPkY
	2KKP/6o5eEwbGkupptJTCya4jsQYLPHk=
X-Received: by 2002:a05:6512:6c8:b0:5b8:b419:b7b with SMTP id
 2adb3069b0e04-5b8e0a18d1cmr355916e87.49.1790236328001; Thu, 24 Sep 2026
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat> <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
In-Reply-To: <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 09:51:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
X-Gm-Features: AclHuK8rPixm6Txa-uGEDmLc8FjUZWkrHeBO_IgguNN-8bSfUZSDFWgY_JslL90
Message-ID: <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

sorry for my slowness!

On Thu, Sep 24, 2026 at 9:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
> On Tue Sep 22, 2026 at 9:09 AM CEST, Maxime Ripard wrote:

> >> -    } else if (bridge) {
> >> +    if (!bridge) {
> >> +            dev_err(dev, "no bridge\n");
> >> +            return -ENODEV;
> >> +    } else if (!drm_bridge_is_panel(bridge)) {
> >>              /* TODO: AV8100 HDMI encoder goes here for example */
> >>              dev_info(dev, "connected to non-panel bridge (unsupported=
)\n");
> >>              return -ENODEV;
> >
> > I wonder if we still need that branch. Every panel is a bridge now, and
> > it looks like we don't have any specific panel handling in this driver,
> > so I guess it supports bridges already?
> >
> > Linus, do you know why this condition was here in the first place?
>
> I had the same thought while writing the patch, but I chose to be
> conservative.
>
> Linus, unless you have more info I'm going to apply the patch as
> is. Removing this special case would be welcome as a later patch.

I'd say go ahead as-is.

I do have the idea to code up and submit the AV8100 encoder
and I have the hardware to test it, but every other user should
be using panels directly, and I would be the only non-panel
user so I can deal with it when it comes up.

Yours,
Linus Walleij
