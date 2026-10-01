Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32E2DB794
	for <linux-mips@vger.kernel.org>; Thu,  1 Oct 2026 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838042; cv=none; b=rTWIUFdgs5wjAbczM9ZAlD0S/Hhiiyb8ovmt6BGLeuWHJqHyzGUQMrRnoRNXDNI7HTMRswxhSSel335QQ5F3mqkhdCueANi5zuisx7Ip2ZVohEC6xVQALDxzOEVAExDGoGnWLV+bolewrVT7WVIUm6dHPP7X8bhUmGxp0908Ps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838042; c=relaxed/simple;
	bh=mElU9b/C7GbTRzayuEisivT56pskbTQfjgTfMpMhZqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNVbLRO4popcsYTaeGycK82BqXPiVXGv5S3LQGgs9iTPRA3wBbAfzgGjE8TZ91ClSLKz+tTW85Tcsq8GrcJ3WJhiBrSMEx+3nTEI44VYTuQAN5L6PCjTLomngFcdC75CYp1OMFogcyHnMKdGKfRGLRl/Shwy7g2IftHsl/VanbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lai8yV4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lai8yV4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5B81F008A0
	for <linux-mips@vger.kernel.org>; Thu,  1 Oct 2026 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838041;
	bh=mElU9b/C7GbTRzayuEisivT56pskbTQfjgTfMpMhZqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lai8yV4GET1ANIXcbjD6gxSIgj3Rbewk0/lu4lDjiGBK0AR2xznTwMZ8CAZDJyZ+L
	 EsvRhzhNuZuaLDciN25FVrTaHZkxP0LHlYVvFBYK0H6yACyVsrCMUX1oTjEM7jmYTY
	 Lml8J1D9V8IgUtC3M+fkAuJVWqFWPEeBj49DI/54rn0I8w7EvfJfGvHPCetwRZke+m
	 Jrb5lxpINDotFvbXQ6w5GB2OIVzR4m29U2MsAoAZdl9oH5cDwh1t9GqoAezRLL1zgD
	 8Mx7kcqUrZSvQETzlBiDJnpk2uqEDqsoQyIxANadAG7s+7/C3LEuQcMM5ylc6Q6NmT
	 FapwKDBi/znAg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a66f8bc23bso43076361fa.2
        for <linux-mips@vger.kernel.org>; Thu, 01 Oct 2026 00:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwT+sSsI+8AmgNJiS56VlT4mELxzP1gXY7qqRjQJhviOfda/P7+shZTxxMirHMeN4mjGuwUgyFLke+k@vger.kernel.org
X-Gm-Message-State: AFq9FYLFcNEQXIzr0WoWFByGrid/TtThY5WbqKj/x2icg/8GIl6u3A+9
	QP62vUQFswaWAqJbNfWHjTNM1xfbi2nEr2UnQfehu8xh5iLKAr5mauns0STr57WcF5qhSW9FkYr
	0KoiMRHrDlyxTy8HonWA5iNUockeecVE=
X-Received: by 2002:a05:651c:2212:b0:3a6:5efa:5a41 with SMTP id
 38308e7fff4ca-3a77925f62fmr11207181fa.21.1790838040414; Thu, 01 Oct 2026
 00:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-18-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-18-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:00:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=89=_vKWso6+oj08FAVUqnWbiLv-DK5tkRregOchR+7w@mail.gmail.com>
X-Gm-Features: AclHuK8HpV3tEuh3YdZ0JhZMwoz3UMRkOP0D37dSr_O7f63FhWL-xa0BlDmYi2w
Message-ID: <CAD++jL=89=_vKWso6+oj08FAVUqnWbiLv-DK5tkRregOchR+7w@mail.gmail.com>
Subject: Re: [PATCH v3 18/19] drm/tve200: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

On Wed, Sep 16, 2026 at 3:48=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
>
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
>
> And since of_drm_find_and_get_bridge() returns a refcounted bridge, take
> care of putting the bridge reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
