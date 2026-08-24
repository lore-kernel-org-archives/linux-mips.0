Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C97363C60
	for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575724; cv=none; b=EA6JheLJpibW5uDHyw1AbFI1hATU39iQ9TSDi4dLjq77f6pY7Kig9UZ0tSdP5FLNwg6iMdBtTnDPYFheUrGxOHT0up/B3LRNfBoGyg5V9MapoQvwTdXTngjIlt6K7lKErRbAJPTUK/n44y9vlfOqCASHl0CllmjXg6EWj8prMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575724; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J11yGSiG6oIynT9h+EDb4QS7HD9GdV3O9YhUAQpzsyfkEYQW3ssojEjYakwwl8BReNPKsPMEoJdLse9HCC1VsBb6TBbK89k3TakjsX19D/lyJDnyxNK3kTsXQ7CsNugtKu88+WV1UgpEzoGNV9EUPa4vCSP/Rqvv+m9Ut9RID5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66ce00575dcso4635332d50.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 05:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575722; x=1788180522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=hBubDj/O/jzgI21ltGwCefGp+WBSbxmrsDq/BnOIHb/IPLDcTLNbc4aaQRtlzpcCSB
         VWstbf57s6o3KP5kKWfXOj0Qqc1sBD16uIEbPj/uMtB4HbSRYUoZuyjvrA9h1gklJNNb
         wtIssIY8Bk34wdhNZMxVTWbJ7v8e8PCkLBbHa0WARRgRwbc5/4LmyIJBHZXYq4irg1WF
         nnPCY9eajZEBIFGZ37ZY9wuB3rjRd1d7wE7ttfbiGGIfk4IOkPQvUDvpKKV9eJYaITJS
         AWPFRJ5Rej2JrslysAfa4nWTwM+DHs/38rqx4Au9VyqErdxOszg505jNIagpK/HspGN6
         fdHg==
X-Forwarded-Encrypted: i=1; AHgh+RqZmJTTQa7rK3zBhixKLO7x8/pwPTu2MTVLX6mhGPul1obNSFEIEfOgU4+xrcvfaVfmXbyjRrghdqwL@vger.kernel.org
X-Gm-Message-State: AFuF++m/qkAIG5L0ftEhZOpTSISs+2Zpgw+FkFmRacqw8mS1SQ2yMqxD
	du7A1D3z3ZEs9lYCO437mz2p6nHIyN1dXwvPDvGSLlCR/s7PuODCRvF/drXP5ZfY
X-Gm-Gg: AR+sD101ZcEROI2paqAo1erGjjW3+wWHQYseLjtRw2F8uOBzmwPipTj1KwTApale6eK
	ypU8C1jyn2kKW1m1FCBj8JrX0vS/rv/qxqwhC9dth/KgfOmf1jo0eI0Aja+dC2s8NBtVa0Tx518
	4mRmW8C3YLJvIL5wByw3WAW1JAdl9jYPyNkO4CU/7VMf/a7sZsEVumWvtKFzLCWPqKm/T2d4hfE
	TJfdWAhnQQ6cv8+rAZ0hRn+l1SFCtnIOtomJJM+5imoQztZ4ONmDdUHOH74v/M9fHSd1vM/ayVc
	QwvO8uCuZqGt4ShOB1IkD3WWVp094KdNqubx/v2mf2J2B8OKOIka05NTOvb04k2ZMsgREpz2+r3
	QBBlmfuxXDN3WXw1LfKSBkUmsOu4moy2YElvkyfJYJsV6lXQQ5jmWZcxrz400zuWKMI9RYz4Yt0
	fFgCgLdszyECaKrzThb4mw/PIe/ggGPx5JCbslRnWa+zn5SDOPYnAS3HYV3/SWO2zbkLMnH85Bv
	10XdpmQ6sFx1iVErvkNoxZPeXXASg==
X-Received: by 2002:a05:690e:4089:b0:66c:c7ec:811 with SMTP id 956f58d0204a3-66d11c6e0e8mr61167d50.25.1787575721831;
        Mon, 24 Aug 2026 05:48:41 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf4a2c204sm3630310d50.16.2026.08.24.05.48.41
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:48:41 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81f64e8dfbcso48602187b3.2
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 05:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrDK2oVQhPDS3YT776qQ0zw2Uj+25/FcC6U4udk/e3OKD5lEYEVpMG1CEo55E8dzPOFPM99oY/rn6n7@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
