Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11B368291
	for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2026 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943195; cv=none; b=dGGIFVo6yUNqUTyzxG1ok6EBLqiQRDA5nDdJPKp8bDUqgXsY6Q1E5dQLRjTGOEEM9Tnx0+BO7rTpe3CVsJsWg6sgYc2gW9Iudkn65YYjQ8AmIpuIE6g7BmOmijINbnZQagSYkVDaZMjgcQOPUeaTPQGr65/NL1yx0Jo6bDZ4+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943195; c=relaxed/simple;
	bh=H1RxdKnl+mgp+J5mdKqwKEcwtM2QvVr2AoIW/SdfGVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMk9R6bSGb9LNDTMeqCAzBBsGG3Rx8g2KClWf6S8dbh6/iE/mLxIqPLre3F5OjQJKlGSypcO2k30Mj5tteODdusA09AX5OCRYzJ4gz3Mtbc2dd83AWgrmHWqtj0wNIDyubOAZAySRG3v2dzCUlefXgzayNjCykFUXqjzMhCIGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um4AR4NG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um4AR4NG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD021F00903
	for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2026 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943194;
	bh=H1RxdKnl+mgp+J5mdKqwKEcwtM2QvVr2AoIW/SdfGVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Um4AR4NGybyoFBxIBGi0Xh4Y9rzD5LFCXqZCOggNLgf6RggNNbZYhHpO3Rxg/ypYh
	 1suENso0L/ow9XCf/vjSEUYP4tNWVXK5rk7NFcTO/wZ670wSc5ydX9D/1xtqJdfnos
	 dBdZ4PU2YhxZvA7xbrhPwv/P92hyGIxSlIxW1UYRTJFbBZ/K4jn8lVPL+TgfNxMojf
	 pH/e0M3qYN7jP2pASJsT/SuUSgShs7sJglrPc449J2q/D2TEVXK+SJ+aHusOvP1sFQ
	 UlTuiA3FoiQwEKVW8BB8e4DZUCKqk1oI0f7OyGn6aB0ROj6L0SThtYxSnQdDeLGC9V
	 mHmN0KGgVvstw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so1875865e87.0
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2026 15:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1lf2VyDCppcUES8o08h+9DaAfSwhb4m7VomBUxEmhs7Ry3PxS4ge6Jpo1U+RrK4BY8Kr47Em1qC7n@vger.kernel.org
X-Gm-Message-State: AFuF++mVV/3hpGlH5737khWUC3QV7ILwAFLSrXTbU48vgtYf3SmyX8HJ
	Hz/6+g3rkvm4mXGNHoQ4HKAb9h/GB5MZZN1phrxoZED9KfYnUGQUaz0O7DbdNxnGoBuZw/TeVpl
	iR//XbcrUrHAEel6mgDrECtpCMiki3LE=
X-Received: by 2002:ac2:4e14:0:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5b8c18137b6mr2715966e87.13.1789943193023; Sun, 20 Sep 2026
 15:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:26:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLk66Xj=4qTigoM6ha4G=+E5j7wOQCWEDq_x5BgoxKbqSw@mail.gmail.com>
X-Gm-Features: AcwNN1Xl2NMg3RCxeoynlYH4VMsnJTqdPMGzMe_YYek3k1zZ_YWzrrvsVntgttg
Message-ID: <CAD++jLk66Xj=4qTigoM6ha4G=+E5j7wOQCWEDq_x5BgoxKbqSw@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
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

On Wed, Sep 16, 2026 at 3:47=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
>
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_find_and_get_bridge().
>
> Also keep the "connected to non-panel bridge (unsupported)\n" error logic
> by using the drm_bridge_is_panel() function.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
