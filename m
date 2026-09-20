Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133A3ED13B
	for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943176; cv=none; b=FkRdev0VTDCtd1iOsIE5yBjtyuNA1XavGAA2LNpMcFZrFTNayL5mC+hIMlnu1Aa3LKL1QDyPf0W/U22QJVfJJO7Q1YR7hZXMGa7wNbHGE4aE/i2nttvznMj/6ATJqGSm7gAlA7qgB6fJSXU+932kz+2ZHZfL/k3e+q4YGeq2r6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943176; c=relaxed/simple;
	bh=OZ0jYotdh7ql4qVQopBl9OhnmROuW0b1nFBPITg46xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nrr5nbaUHv5X7aZ3geIoAE5arkIh6dMos2NiKmBPgI80uxHSAB07QWObHx8OHv+Bxe6P5b48Tbu8ES8uTgGateGJ5ipLtYW4mNt/XUXwhzXkMFWwYjbHUBeNPJQsz4dpHjQ5PNBf/C50SjRicRvd1yE746WxWcbh2kBuZcYaXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcHgpT1x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcHgpT1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636D11F0089E
	for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943175;
	bh=OZ0jYotdh7ql4qVQopBl9OhnmROuW0b1nFBPITg46xA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OcHgpT1xwIO6XWROQZZtX0pP7rtvLkq5r+4C9tDUCySI/aHerQeHmuoGb280LlR7k
	 kFhNUn+GqhwuRliePOfHEBYyn7A1//D2+tB41XNUVXh8fVuQJNgDDpOfzagYu7lTeS
	 vTmTNWBIwMt61BJSLWQJ2F3TAkuAQ4/QUOU8MTxm8x+uS7KL+YfwjMsf02PjLHE5TE
	 zHjXQDvyHm9RemWH9GeXYHwPrZ3I+Er3ID5hNWumjVobOl5SNWq+3ROOk7f0eqweOC
	 yvedHq1a3zS00PZfnmfBlJv+8Y56bRJschNdI1KFW2dqtDkPS3UU3dTmtSLndujkca
	 /eIM6LOzE+ybA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so2451823e87.2
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2026 15:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVy9y9xWjYRW09NQoS6aMA3lxQFF66f5bcsLmTEfiv7PTL9BwPbqsae9qtJ1/yDjABuz8KyzDPgZbc@vger.kernel.org
X-Gm-Message-State: AFuF++ml5VJgzvnOlmLFbX5VcssW6mxwVCSHmKqlpMa22Z4TaO9XvJcC
	/egiKeHRyzo5Ufkl32hK8wgrGrzfMKfph5LDBrM8qmVdC20nCIcd0ql/AjoH12pjtna0eEEO8KB
	2wKodq6Jdzgd7/iFwUEqdgp8pWhjDD/w=
X-Received: by 2002:a05:6512:1293:b0:5b8:9ee1:10fd with SMTP id
 2adb3069b0e04-5b8c195b2a3mr2597654e87.32.1789943174146; Sun, 20 Sep 2026
 15:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-11-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-11-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:26:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Hu4XDUoBK5RfaQ9K3Jh4NfPkGFfoxa2tL_zSekPEUBA@mail.gmail.com>
X-Gm-Features: AcwNN1UOMCqRmdLLuJ0tewhusvy6SfVdZOwl8-NuoTCzIELTWmTcNqdeLCv7gec
Message-ID: <CAD++jL=Hu4XDUoBK5RfaQ9K3Jh4NfPkGFfoxa2tL_zSekPEUBA@mail.gmail.com>
Subject: Re: [PATCH v3 11/19] drm/mcde: dsi: remove unused includes
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

> The helpers are included but unused.
>
> However symbols from drm_atomic_helper.h are used, and were previously
> available as a side effect of drm_atomic_helper.h including
> drm_atomic_state_helper.h. Add drm_atomic_state_helper.h.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
