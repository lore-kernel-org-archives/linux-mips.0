Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0937BE7D
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486323; cv=pass; b=AOq3tQ2T5o2h3S7V4IpO+RwAyb1U6SLtyOkTCxcGFhqsdH1975YH2GzoEC+TMecHkIaz4h9a8AiMTzItEx41QLohEKi022/LOTiG0g0CLoxgUz4+A2rrjmNXXF8ZsfbBXpMGcVdpSOYyQTEgDSxE3qlviw4gX1uWUV45+BG7ll0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486323; c=relaxed/simple;
	bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONSoLTMQpdITmJbZQydjbJvOM/ScVxJGvC0mNscy46d08nYuRtcvkvyGO+gWtPEYfkuJQSQMuR+1buYaLkzzQgZ5/atM7CT/ze1ZvwRdu8/yCzqLn4odwEB5l1udPiV5WJDc7qBv1XlXsbSpnwyhmO6lA9CMhJO/JhvI0e1dQeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfU9ntf5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJC0QmPf; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfU9ntf5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJC0QmPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782486316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
	b=dfU9ntf5VCw2uQpEIlX3yxWsHBXKkdctYP9boMfsXSD7lUE4lRBGTqCeh2mBRwh0nxa1Rs
	CxPrf1mw9fJDbFZAYsCrkZg4KrmeOu7oGZT9Oq3/m4anIwwWXyyubwdIAlGTcjDQAta7/D
	De8D06nLkneZ27FcIo0PQoEA73TKDyg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-FVN4WPihNiOLy9hTeBAFXw-1; Fri, 26 Jun 2026 11:05:15 -0400
X-MC-Unique: FVN4WPihNiOLy9hTeBAFXw-1
X-Mimecast-MFC-AGG-ID: FVN4WPihNiOLy9hTeBAFXw_1782486314
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-80533a7a4ebso16448437b3.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 08:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486314; cv=none;
        d=google.com; s=arc-20260327;
        b=jJbx+j9LvjDio5olh6G2J0q+3KBFR/58Hsjw/lMKT083vszPu0FdYTcJUd2tnmogH6
         AymylfXF/dXG4ksVS318qvJf/Q1p16LCrgQz5IUgFU+GRata/YbcxlFM+AXppz1kiqfd
         CA8qo1arKLxHGDoiicEtEUN9OYlA1eFBdAAz70QCtdWn8+TegXjXQczaYhwlwytPr7gF
         lcQ0HtD2YFnHn2HvcVytgLxGff6W45zOvYau8u4A24LfF9h/5KU0p/jdqR/k4F3GLVKh
         vuEYcCF8WSrecHyD81eT4jDeMQgDI/CmN0S+RCW6UWAV5/qRJSa+3gsxCNfbZZ12Qkf0
         Xolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
        fh=+HJXNxh8iRagq4uSrOD9BtA56J+TVddACtqwWBga2go=;
        b=BtqwrOxwKmJngDX6nMjeQf7v0YFAwaNHRgCibUen23yiTLQ3Yfg9GXfZsCbVsT/9/2
         BDJT1H2xZ8eMzVD7FPoEQt1V6Iq/TuarlhuC0jXPeyd5uGdbtEt8J+IenVx4f3WaRQ7n
         p8UejIAEe2dFJIjVlHw5Vx4Y5C3lk/t0CaEMEPBZdj/lJOu/rofSkK2C+sVEd7IAkjYZ
         gxCgAPR1GplSaEH1ct6v5+XIrrK77zLyMM3ZzvuhqtDTCXieiBjCPEwdtN8Ngxapfjms
         L+KxKvc9vmDXysfOsfRMS0Yjm+OUY8y2QXR/kDFogR2rNgrgPxiDroEWXcgLSOHAUplO
         l6zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782486314; x=1783091114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
        b=ZJC0QmPfKiPycIBd/ikXBnaGSCiyRW2OvqFhgsh1c/24pQKnY6i1FtV0z5gSAIlRln
         WU63sX643q0EKqypFtcTMQJ/gNeRazjO4NLyCXT4YlCXbVOfcDh9nlAW1Idxrh0mZLwD
         thSRzigLAq+mXz5FZgTd62ObnYRHV4uySPWGt7HjiZkuGIsf7r7iuGRTDX0jXIA1l336
         VnYt4YoBw8hK+4ztm9dP875mTpaqgsAbVNX0tIhf+T9gWAlZbQoHNMLc62WCjETuA5zp
         yYbwrLW6BfAggAX9AizZ/CcqP0rYWIa0VcL+lQE1d5P+gn5nqgnukShkiq2mX1o8oxEp
         3D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486314; x=1783091114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dQWoBG3cdhdrXUGK8cjuSemvsRSH2KT/hQo0wNib96o=;
        b=Q0W3mqgoqntAtCmilpK8cF2a6EOp1u00dHnuX9LdTtL0liT1hvQjk7eiA8yjDH3VaN
         LVW280/zmKwzpwfcaLwEdI7weySJhlI2svotVtcigWXvh1Y5v5c9Ms1KuDjM0ot7qIaV
         FKLGvY2MIto6u/G33YjpFa3taiyZ5QxS1FuPRoKCUujF93ir5Sv0qKeS5S/L/QIMgl2F
         9TeZn+kgGPit9ZpmY5P9vdLA46ShC2Ul+oZ9KANpp4uZbR1TXxZNmbWzod9TQR37shRT
         OOfPVkkqBEkAQrrWrK20HGw2GORQl+vjQZzi4UZ2fzlpTH9gRHARDvLqc+cf7mTvNBAE
         bN/g==
X-Forwarded-Encrypted: i=1; AHgh+RqyYm7c9uyvzH21GhDbqFl8qx/iDRbx3VZr05yQaO2w/orhbASn1j9V+VxekgB3JZUdMqAaHQdFopkU@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTHjiCJgvpG/tpBr1VmRWlxbjHpaCzJuf21nfvWci0dR7zdx+
	HanVSQfCDHuU+s7QlVA9t1NYhwhj3nXtCv2HcXQQJmeWQnq6vvIoL2CtybHueaXXW5Az7qknP5m
	5qfEFZAYuc2M2qP4jpIaJSXmm2RWdi3n+8m4uF4QarOSQVlUlu94mDhfmP6dQ/Oogv7FjGFUS7t
	hm5B1w8Zq37ZNtv8mS7EBE/mq9KMZyxMrNwXTaPQ==
X-Gm-Gg: AfdE7cmZ4WnV4SfQN7PazdPQCNUk4HMvwrNqex7lL2paYziKI4AKs0IPJnSK1Gud26R
	kiViBx5EmIDkzg5Mpipa7CxuEsoFfd7qK3MhFxVNogm8QVHo8zV9B9Csr4PNPAOGvSWcu15Er0w
	GrfxJKLb9NaxQPSJ/nuCQ/89MA2uDFePicZjaQm3HP/JRD+SH2Qc+pm2ME9c7Nkmbr
X-Received: by 2002:a05:690c:4881:b0:80c:cad:c4e6 with SMTP id 00721157ae682-80c0cadc8fbmr18142157b3.32.1782486313776;
        Fri, 26 Jun 2026 08:05:13 -0700 (PDT)
X-Received: by 2002:a05:690c:4881:b0:80c:cad:c4e6 with SMTP id
 00721157ae682-80c0cadc8fbmr18140727b3.32.1782486313097; Fri, 26 Jun 2026
 08:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com> <20260626-ivory-tarantula-of-valor-af0e2a@houat>
In-Reply-To: <20260626-ivory-tarantula-of-valor-af0e2a@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:05:00 +0200
X-Gm-Features: AVVi8CfUWw7MSpxfIbgb0qtM7cCP9XXdSgcc1xFYb1Fq3hJmdhiO9Zy5mZXSYcU
Message-ID: <CADSE00Jy9-BR9e-Dg-S4_fiLnjWjXfTq3c6OO8PxTM=gQyA7xw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: release panel reference after panel bridge creation
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

On Fri, Jun 26, 2026 at 3:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:27PM +0200, Albert Esteve wrote:
> > of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> > counted reference. In drivers that immediately wrap the panel in a
> > bridge via devm_drm_panel_bridge_add() or equivalent, the bridge
> > acquires its own reference, so the caller's lookup reference must be
> > released right afterwards.
> >
> > Also handle the cases where a panel is found but cannot be used,
> > dropping the reference immediately in those paths.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> drm_of_find_panel_or_bridge() does indeed return a refcounted pointer
> now, but afaik the doc wasn't updated to reflect that.

True, I'll fix that in the next version.

>
> More importantly, I feel like with both of_drm_find_panel and
> drm_of_find_panel_or_bridge we update a path that is considered legacy
> anyway now, and we should rather focus on providing a safe alternative.

Oh, I missed that this code path is considered legacy.

>
> But none of the functions you updated are unsafe, so it won't be more
> unsafe, or provide any illusion of safety to the caller. Idk.
>
> Either way, this should all be on its way out if Luca creates a bridge
> for every panel, and we'll consolidate on bridges only, so maybe it's
> not such a big deal to merge this patch.

I see. Given what you wrote, I think it'd make sense to correct them
while this code isn't completely dead.

BR,
Albert.

>
> Maxime

