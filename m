Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03833D952F
	for <linux-mips@vger.kernel.org>; Fri, 17 Jul 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287596; cv=pass; b=WMWswfhytBogir5kxFN0i6Xsz2gEn6fN2nuoVzVpvHo4N20U/fEBMR0BUfdpBILsZ0EeuiPkXGN10ICop4u/n0uy4IlU6peSWO/STpduNEvya0ZIqayxwVWhFhVZWpK036h1CdcEi8OJp+A4N/7GLZAVZY+mKrReH5Eh0I9XoI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287596; c=relaxed/simple;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z19mZAfC0bn5TJgJe6o+J9Yg/E0MBPeS6qWLav4N3NhWjPXQm5uY/XBOOrv4naeC+UeNIlaBD2lLz+A+OoUJn98+U89uSW4oVlp/k56ifRuIG6uRy5ZO+HSknpEVhb3T3xFZ4uO64jwY8yYlLMVH211b5TTHuaVqaw2lLKxV8Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iTVEybfA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkPuMfAv; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTVEybfA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkPuMfAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784287581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	b=iTVEybfA+9e+icvhmFBa6y7+zqE3SyXHsfH2Vfxa8WsFr7tCrS3ZPDhsLQcAAyoDGRapsh
	vh/lDCTaYDo2Vy7YEZtnFofVPbwmzd4WkN6L2Dn36tIS/p0Q3/NU75hWVlhSag8po24BTk
	SNHI8XfNicyQ8hK97VpbGesoRdt5Q/U=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-Sx7gAguROxuarPc0_bmryw-1; Fri, 17 Jul 2026 07:26:18 -0400
X-MC-Unique: Sx7gAguROxuarPc0_bmryw-1
X-Mimecast-MFC-AGG-ID: Sx7gAguROxuarPc0_bmryw_1784287578
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-667bb944299so7194109d50.0
        for <linux-mips@vger.kernel.org>; Fri, 17 Jul 2026 04:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784287578; cv=none;
        d=google.com; s=arc-20260327;
        b=Iljm/Ea9bu3I9gjTlazUMCXwdbvhogQadUha1uIpDVchIfC/DDaXbbRMqvl3bU6DUm
         9miKUJwBne3gKryy47XLSkCS0t4175N6uhEjI5FU8vhgcW3NGCmjf6OjyHOLwjqJCd4s
         GBN9i3YGiR3h6ZPaz63M2ObyfrfN4D9/2vyB06Mh0VF6wBnmPSL/boYrqnQd/Vol1E8o
         LBJ5geIQuIyTLA9Gqsatp/dTslJPUFULDfOekmA5hClmzr08rBBMO8bsqo/3jnKScaPB
         mykWNmnW5la0s6ui/oYV2Z8N/KbkGsVo+gaXIr6GbJlQ7UQQWU5c6eQDK6yz2R5zKqCx
         sA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        fh=v6caC5M4MN/wyDyFMTtf6nfnqIGffE622yuRTQcDnAk=;
        b=kERU1t0o0DQcfj2dmSFlpVLV+tECqvsRY0GY2jQKJDMJDSqKmPB8tNIcaALEok1ydD
         m4ZmY7zVy7/iPSsb3tvDVQkZbj1edRqEhuygfI5Q6covUGRcclFVtztckSwLL+r7unR6
         9lS8YZXVpgdqrDlhKDhwxKWTnudd83D3tpwVGeTRSAvBHBE0LkjpMYb0w9RFURAn2dxQ
         jqJw52TEAcCBiDKBOeLmmh8wshYxJ2gxr4FA9pjC3mpyKzu2wUaWda3D1rdH/f4Xzr0r
         tQIuhm2GrkhwQGMDz3kUlT+UpKe1y8IBu9bzM1AJ4830KvjqgvcVkLkceUiwdIUPtN68
         7rIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784287578; x=1784892378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=dkPuMfAv+k2E9nBvXL+bKAaBa+jYrnhdMsC2bR2eUwKZ4mnbrq3tiJekZW2hxFd4xa
         6eicuVh0uCaFzJ3BDWToJPYoCo2rsWg/YOK30OwvtB/KNUuGQIpqRUIpratcRfUUb8z4
         Dzsp9jw2Y1wfsThjrVG6Vy9kRlMayacB6owIbhaAY7yV9ph2adsHO5Ostz8FNn8l6qNJ
         h91KbJB4Fx2ocuedxZ5IsMwuKs/dPvJqaX3JrTLTOwo2mEKMxytUmS/QoGngM61YghBA
         piTMMKauhYhsHa56zWIi8jBr3KuuaFcQzlP4h+UHhMWbrfGgPrgdSY8VU91HtCvduo10
         VPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287578; x=1784892378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=XgLwzSMEpsuLv/1qlAZS0CXuj/8jKQbpL7QAI7BFmOjxw0fhZWws5RPEOe4P3yL7+n
         TmQV1Vwlr9AXL68aA00y2jT9D4FInTbpV9Hm0rNgT0HvHT1oZUH6glRVY3KMw+8DJ6Xe
         lWsKI7n5EApB7N8vjFfyfQVhs/WtT2CyC/n4zBjkdROjxySAZJy+wqMKl5Uiv5vCxlfQ
         iYOP8BA76TPoObyMzuiNcKjp5tOXh7/YTrMRNZs279RCUfbfM6IUTl3XrIGiLGKKOR6B
         /yS+TsjffWOwqgxgmNcA+0mu1qeFi5hLdLLAnu6LbsT/fHh9SdtZxOIT0i9o2MQUG1Cm
         JfBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+yOhM0Ruem1P9QNX2TIKtBWH6W0xbCKhvO5OEhVP6BkjA5EZVKX49EGDsteA737qlVUkFyxZjJatK@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNMnZYNQukT0G4ugcm1kJVuGm06LI+At8EsiiY2enA77x4GzJ
	Qdim4r7gv58AJBRvOt7G0+dQ1lh/YwPft99UHiELFpR0iaJVaZjGxxjYFiVnHFFm0FDbp8dDC86
	mjFyJFBUQU8WKYa6CNX1vxsQJWhipdJf2A9lXXMIpGm2dZ3uB4N7XK9c9lQcWF+eNqP5cW4zfil
	pscLtksHwgencTd8NLRTy6u2/7UIHcp82sCwpPyg==
X-Gm-Gg: AfdE7clOQg29UAJS9lu86BM2XpkdUkbSfpoubrLSIkRjltk0DhRX9fReVlLVsn3q0Ws
	PrFrU+YeKT5syCeacTNrwzRCEyAHr80QfAqbuc03q/TCWX7a8ojb5DLgeEOwZMo9gfLvBOEgqDP
	e9Yqd8X4EUlaB8J19BiwK2Qts/mLJKHkV8nRLj1hZjHbMPrpuP4mTg3JyN
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id 956f58d0204a3-66843ce511emr36217d50.53.1784287578005;
        Fri, 17 Jul 2026 04:26:18 -0700 (PDT)
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id
 956f58d0204a3-66843ce511emr36162d50.53.1784287577611; Fri, 17 Jul 2026
 04:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com> <20260717-heavenly-peach-guan-82f0f1@houat>
In-Reply-To: <20260717-heavenly-peach-guan-82f0f1@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jul 2026 13:26:06 +0200
X-Gm-Features: AUfX_my0X2LQ6M_jKeRcxy0r6pG-sYFIFgqEmiZmXcdV57T8jjudIQuMMnSFyJg
Message-ID: <CADSE00+7=2ph4kRQLc7_MFbp_SSt3eYz-bBxWcfCj6_oFPjwFA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm: release panel reference after panel bridge creation
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:56=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Mon, Jul 13, 2026 at 01:53:08PM +0200, Albert Esteve wrote:
> > Update a second batch of drivers calling of_drm_find_panel() or
> > drm_of_find_panel_or_bridge() to release the lookup reference after
> > wrapping the panel in a bridge.
>
> I would have expected this to be squashed of patch 3, any reason it's in
> a separate patch?

My intention was to make the series easier to review. Patch 3
contained the initial set of callers mostly found via the Coccinelle
script (simpler to address generally), and patch 5 includes the rest.
Including all the changes plus the core API update in a single commit
felt like too much.

That said, I am happy to squash this for the next version (fewer
patches to track).




>
> > Also handle the cases where a panel is found but cannot be used,
> > dropping the reference immediately in those paths.

